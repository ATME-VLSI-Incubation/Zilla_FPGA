/***** Header for fibonacci. 64 bit fibonacci series is generate.*****/

#ifndef FIBTST_H
#define FIBTST_H
                

            

#define PRINT_RESULT_FIBINOCCI(len,rslt_tb,rslt_full,tn) \
                               uint8_t len=rslt_tb[0];\
                               printf("Number of va.ues calculated is %15d\n", len-1);\
                               for(int i=0;i<len+1;i++)\
                               {   \
                                 if(rslt_tb[i] == rslt_full[i])\
                                   printf("Test/>   Fibinocci Series: E-result = %lu, A-result = %lu : Status = [PASS] \n", rslt_full[i], rslt_tb[i]);\
                                 else\
   	                               printf("Test/>   Fibinocci Series: E-result = %lu, A-result = %lu : Status = [FAIL] \n", rslt_full[i], rslt_tb[i]);\
                               }\


#define FIBINOCCI_C(mb,len,rslt_full,tn)\
                    z_printf("CALCULATING FIBINOACCI VALUES IN CORE...");\
                    uint8_t len=94;\
                    actual_result[(tn-1)]=len;\
                    uint64_t n1=0,n2=1,n;\
                    uint8_t index;\
                    if(tn==1)\
                    {\
                      index=0;\
                    }\
                    else \
                    {\
                      uint8_t index =(uint8_t) (index+ actual_result[(tn-2)]);\
                    }\
                    uint64_t rslt_full[len+1];\
                    rslt_full[0]=len;\
                    if(len==1)\
                      rslt_full[1]=n1;\
                    else if(len==2)\
                    {\
                      rslt_full[1]=n1;\
                      rslt_full[2]=n2;\
                    }\
                    else\
                   {\
                     rslt_full[1]=n1;\
                     rslt_full[2]=n2;\
                     for(int i=3;i<len+1;i++)\
                     { n=n1+n2;\
                       rslt_full[i]=n;\
                       n1=n2;\
                       n2=n;}\
                    }\
                    for(int i=1;i<len+1;i++)\
                    {  \
                      actual_result[(index) +i+2]=(uint64_t)rslt_full[i];\
                    }\

 


#define FIBINOCCI_SPIKE_C(len1,rslt_spike,rslt_full,rslt_tb,tn)\
                         uint8_t len1;\
                         len1=data[(tn-1)];\
                         uint8_t index;\
                         if(tn==1)\
                         {\
                           index=0;\
                         }\
                         else\
                         {\
                           index = index+data[(tn-2)]; \
                         }\
                         uint64_t x1=0,x2=1,x;\
                         uint64_t rslt_full[len1+1];\
                         uint64_t rslt_tb[len1+1];\
                         uint64_t rslt_spike[len1+1];\
                         for(int i=0;i<len1+1;i++)\
                         {\
                           if(i==0)\
                           {\
                             rslt_tb[i]=len1;\
                           }\
                           else\
                           rslt_tb[i]=(uint64_t)data[(index)+i+2];      }\
                           rslt_spike[0]=len1;\
                          if(len1==1)\
                            rslt_spike[1]=x1;\
                          else if(len1==2)\
                          {\
                            rslt_spike[1]=x1;\
                            rslt_spike[2]=x2;\
                          }\
                          else\
                          {\
                            rslt_spike[1]=x1;\
                            rslt_spike[2]=x2;\
                            for(int i=3;i<len1+1;i++)\
                            {  x=x1+x2;\
                               rslt_spike[i]=x;\
                               x1=x2;\
                               x2=x;}\
                          }\
                         for(int i=0;i<len1+1;i++)\
                         {  \
                           rslt_full[i]=rslt_spike[i];\
                         }\




					

#endif /* FIBTST_H */
