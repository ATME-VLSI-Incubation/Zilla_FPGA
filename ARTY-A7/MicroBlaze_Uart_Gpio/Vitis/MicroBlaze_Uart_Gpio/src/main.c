#include "xparameters.h"
#include "xuartlite.h"
#include "xintc.h"
#include "xil_exception.h"
#include "xil_printf.h"
#include "xgpio.h"


#define UARTLITE_DEVICE_ID      XPAR_UARTLITE_0_DEVICE_ID
#define INTC_DEVICE_ID          XPAR_INTC_0_DEVICE_ID
#define UARTLITE_INT_IRQ_ID     XPAR_INTC_0_UARTLITE_0_VEC_ID
#define LED 0x01
#define GPIO_EXAMPLE_DEVICE_ID  XPAR_GPIO_0_DEVICE_ID
#define LED_CHANNEL 1

#define TEST_BUFFER_SIZE        1

int UartLiteIntrExample(u16 DeviceId);

int SetupInterruptSystem(XUartLite *UartLitePtr);

void RecvHandler(void *CallBackRef, unsigned int EventData);

 XUartLite UartLite;

 XIntc InterruptController;

u16 ReceiveBuffer[TEST_BUFFER_SIZE];

static volatile int TotalReceivedCount;

XGpio Gpio;

int main(void)
{

	print("Press a to turn on LED\n\r");

	UartLiteIntrExample(UARTLITE_DEVICE_ID);

    xil_printf("Data Entered : %s \n\r",ReceiveBuffer);

	XGpio_Initialize(&Gpio, GPIO_EXAMPLE_DEVICE_ID);
	XGpio_SetDataDirection(&Gpio, LED_CHANNEL, ~LED);
    if (ReceiveBuffer[0] == 'a')
    {
	    XGpio_DiscreteWrite(&Gpio, LED_CHANNEL, 1);
    }
    else
    {
    	XGpio_DiscreteWrite(&Gpio, LED_CHANNEL, 0);
    	print("Invalid Data Entered\n\r");
    }

}


int UartLiteIntrExample(u16 DeviceId)
{
	int Status;

	Status = XUartLite_Initialize(&UartLite, DeviceId);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Status = XUartLite_SelfTest(&UartLite);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Status = SetupInterruptSystem(&UartLite);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XUartLite_SetRecvHandler(&UartLite, RecvHandler, &UartLite);

	XUartLite_EnableInterrupt(&UartLite);

	XUartLite_Recv(&UartLite, ReceiveBuffer, TEST_BUFFER_SIZE);

	while (TotalReceivedCount != TEST_BUFFER_SIZE) {
	}

	return XST_SUCCESS;
}

void RecvHandler(void *CallBackRef, unsigned int EventData)
{
	TotalReceivedCount = EventData;
}

int SetupInterruptSystem(XUartLite *UartLitePtr)
{

	int Status;

	Status = XIntc_Initialize(&InterruptController, INTC_DEVICE_ID);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Status = XIntc_Connect(&InterruptController, UARTLITE_INT_IRQ_ID,
			   (XInterruptHandler)XUartLite_InterruptHandler,
			   (void *)UartLitePtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Status = XIntc_Start(&InterruptController, XIN_REAL_MODE);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XIntc_Enable(&InterruptController, UARTLITE_INT_IRQ_ID);

	Xil_ExceptionInit();

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			 (Xil_ExceptionHandler)XIntc_InterruptHandler,
			 &InterruptController);

	Xil_ExceptionEnable();

	return XST_SUCCESS;
}
