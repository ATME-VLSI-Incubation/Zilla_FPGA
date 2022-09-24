#ifndef TESTCORDIC_H
#define TESTCORDIC_H


////////////////////////////////////////////////////////////////////////
////////////         Sin and cos values displayed           ////////////
///////////////////////////////////////////////////////////////////////

#define ATAN_TAB_N 16
static unsigned int atantable[ATAN_TAB_N] = {  0x4000,   //atan(2^0) = 45 degrees
                                0x25C8,   //atan(2^-1) = 26.5651
                                0x13F6,   //atan(2^-2) = 14.0362
                                0x0A22,   //7.12502
                                0x0516,   //3.57633
                                0x028B,   //1.78981     //0x028C
                                0x0145,   //0.895174    //0x0146
                                0x00A2,   //0.447614    //0x00A3
                                0x0051,   //0.223808
                                0x0029,   //0.111904
                                0x0014,   //0.05595
                                0x000A,   //0.0279765
                                0x0005,   //0.0139882
                                0x0003,   //0.0069941
                                0x0002,   //0.0035013    //0x0001
                                0x0001    //0.0017485
};


 
/*************************************CORDIC SIN & COS VALUES**********************************/
  
void CORDIC_SIN_COS_TEST_C(int mb,int inp_angle,int iterations,int testnumber,int *sin_result,int *cos_result,int k)
                        { 
int sigma, s, x1, x2, y, i, quadAdj, shift;
  int *atanptr = atantable;

  int theta;
  int l=inp_angle;
  theta=inp_angle;
  int sins, coss;
  //Limit iterations to number of atan values in our table
  iterations = (iterations > ATAN_TAB_N) ? ATAN_TAB_N : iterations;

  //Shift angle to be in range -180 to 180
  while(theta < -180) theta += 360;
  while(theta > 180) theta -= 360;
  //while(theta==180) theta +=180;
  
  //Shift angle to be in range -90 to 90
  if (theta < -90){
    theta = theta + 180;
    quadAdj = -1;
  } else if (theta > 90){
    theta = theta - 180;
    quadAdj = -1;
  } 
   else{
    quadAdj = 1;
  }
  
  //Shift angle to be in range -45 to 45
  if (theta < -45){
    theta = theta + 90;
    shift = -1;
  } else if (theta > 45){
    theta = theta - 90;
    shift = 1;
  } else{
    shift = 0;
  }
  
  //convert angle to decimal representation N = ((2^16)*angle_deg) / 180
  if(theta < 0){
    theta = -theta;
    theta = ((unsigned int)theta<<16)/180;   //Convert to decimal representation of angle
       theta = -theta;
    } 
    else
    {
    theta = ((unsigned int)theta<<16)/180;   //Convert to decimal representation of angle
        }
  
  //Initial values
    
  x1 = 0x4DBA;    //this will be the cosine result, 
                  //initially the magic number 0.60725293
  y = 0;          //y will contain the sine result
  s = 0;          //s will contain the final angle
  sigma = 1;      //direction from target angle
  
  for (i=0; i<iterations; i++){
    sigma = (theta - s) > 0 ? 1 : -1;
    if(sigma < 0){
      x2 = x1 + (y >> i);
      y = y - (x1 >> i);
      x1 = x2;
      s -= *atanptr++;
    } 
    else{
      x2 = x1 - (y >> i);
      y = y + (x1 >> i);
      x1 = x2;
      s += *atanptr++;
    }
  }
  
  //Correct for possible overflow in cosine result
  if(x1 < 0) x1 = -x1;
  
  //Push final values to appropriate registers
  if(shift > 0){
    *sin_result = x1;
    *cos_result = -y;
  } else if (shift < 0){
    *sin_result = -x1;
    *cos_result = y;
  } else {
    *sin_result = y;
    *cos_result = x1;
  }
  
  //Adjust for sign change if angle was in quadrant 3 or 4
    *sin_result = quadAdj * *sin_result;
    *cos_result = quadAdj * *cos_result;

   // sins=(*sin_result*10000); //pre-scaling
   sins=( (*sin_result *10000)/pow(2,15));
   coss=( (*cos_result *10000)/pow(2,15));

   actual_result[(l*3)] = inp_angle;
   actual_result[(l*3)+1] = sins;
   actual_result[(l*3)+2] = coss;
   
   return 0;
   }


void CORDIC_SIN_COS_TEST_SPIKE_C(int theta_inp,int iterations,int testnumber,int *sin_result,int *cos_result,int input_angle,int k,int rslt_full_cos_arr[361],int rslt_full_sin_arr[361],int rslt_tb_cos_arr[361],int rslt_tb_sin_arr[361])
                                {
  iterations = 16;
  int l=theta_inp;
  int i;  
  int theta;
  theta=data[(l*3)];
                            
  printf("input angle is %d\n",theta);

                            
  rslt_tb_sin_arr[l] =data[(l*3)+1];
  rslt_tb_cos_arr[l] =data[(l*3)+2];

                             
  int sigma, s, x1, x2, y,  quadAdj, shift;
  int *atanptr = atantable;
  int sins, coss;

  //Limit iterations to number of atan values in our table
  iterations = (iterations > ATAN_TAB_N) ? ATAN_TAB_N : iterations;

  //Shift angle to be in range -180 to 180
  while(theta < -180) theta += 360;
  while(theta > 180) theta -= 360;
  //while(theta==180) theta +=180;
  
  //Shift angle to be in range -90 to 90
  if (theta < -90){
    theta = theta + 180;
    quadAdj = -1;
  } else if (theta > 90){
    theta = theta - 180;
    quadAdj = -1;
  } 
  else{
    quadAdj = 1;
  }
  
  //Shift angle to be in range -45 to 45
  if (theta < -45){
    theta = theta + 90;
    shift = -1;
  } else if (theta > 45){
    theta = theta - 90;
    shift = 1;
  } else{
    shift = 0;
  }
  
  //convert angle to decimal representation N = ((2^16)*angle_deg) / 180
  if(theta < 0){
    theta = -theta;
    theta = ((unsigned int)theta<<16)/180;   //Convert to decimal representation of angle
       theta = -theta;
    } 
    else
    {
    theta = ((unsigned int)theta<<16)/180;   //Convert to decimal representation of angle
    }
  
  //Initial values
    
  x1 = 0x4DBA;    //this will be the cosine result, 
                  //initially the magic number 0.60725293
  y = 0;          //y will contain the sine result
  s = 0;          //s will contain the final angle
  sigma = 1;      //direction from target angle
  
  for (i=0; i<iterations; i++){
    sigma = (theta - s) > 0 ? 1 : -1;
    if(sigma < 0){
      x2 = x1 + (y >> i);
      y = y - (x1 >> i);
      x1 = x2;
      s -= *atanptr++;
      } 
     else{
      x2 = x1 - (y >> i);
      y = y + (x1 >> i);
      x1 = x2;
      s += *atanptr++;
      } 
     }
  
  //Correct for possible overflow in cosine result
  if(x1 < 0) x1 = -x1;
  
  //Push final values to appropriate registers
  if(shift > 0){
    *sin_result = x1;
    *cos_result = -y;
  } else if (shift < 0){
    *sin_result = -x1;
    *cos_result = y;
  } else {
    *sin_result = y;
    *cos_result = x1;
  }
  
  //Adjust for sign change if angle was in quadrant 3 or 4
    *sin_result = quadAdj * *sin_result;
    *cos_result = quadAdj * *cos_result;

    sins=( (*sin_result *10000)/pow(2,15));
    coss=( (*cos_result *10000)/pow(2,15));

    rslt_full_cos_arr[l]=coss;
    rslt_full_sin_arr[l]=sins;
    
  }


////////////////////////////////////////////////////////////////////////
////////////         Sin and cos values displayed           ////////////
///////////////////////////////////////////////////////////////////////


void PRINT_RESULT_CORDIC(int iterations,int rslt_tb_cos_arr[361],int rslt_tb_sin_arr[361],int rslt_full_cos_arr[361],int rslt_full_sin_arr[361],int testnumber)
        {  int sine,cosine;   
        for(int i=0;i<361;i++)
        { 
        if(rslt_tb_sin_arr[i] == rslt_full_sin_arr[i])
        {
        printf("Test/>  Cordic : Theta angle = %15u,E sin-result = %15d,A sin-result = %15d,  Status = [PASS] \n",i, rslt_full_sin_arr[i], rslt_tb_sin_arr[i]);
        }
        else
        printf("Test/>  Cordic : Theta angle = %15u,E sin-result = %15d,A sin-result = %15d,  Status = [FAIL] \n",i, rslt_full_sin_arr[i], rslt_tb_sin_arr[i]);
        if(rslt_tb_cos_arr[i] == rslt_full_cos_arr[i])
        {
        printf("Test/>  Cordic : Theta angle = %15u,E cos-result = %15d,A cos-result = %15d,  Status = [PASS] \n",i, rslt_full_cos_arr[i], rslt_tb_cos_arr[i]);
        }
        else
        printf("Test/>  Cordic : Theta angle = %15u,E cos-result = %15d,A cos-result = %15d,  Status = [FAIL] \n",i, rslt_full_cos_arr[i], rslt_tb_cos_arr[i]);
        }

        for(int i = 0;i<361;i++){
            sine = rslt_tb_sin_arr[i];
        int sin = rslt_tb_sin_arr[i]/10000;
        int srm = rslt_tb_sin_arr[i]%10000;
        if (sin ==1)
        {
        printf(" FINAL RESULT  sine(%d) value = %d \n ", i, sin);
        }
        else if(sine < 0)
        {
        srm = srm * (-1);
        sin = sin * (-1);
     	if(srm >= 1000 && srm <= 9999)
        {
        printf(" FINAL RESULT  sine(%d) value = -%d.%d  \n ", i, sin,srm);
        }
        else if(srm >= 100 && srm <= 999)
        {
        printf(" FINAL RESULT  sine(%d) value = -%d.0%d  \n ", i, sin,srm);
        }
        else if(srm >= 10 && srm <= 99)
        {
         printf(" FINAL RESULT  sine(%d) value = -%d.00%d  \n ", i, sin,srm);
	    }
        else if(srm >= 0 && srm <= 9)
        {
         printf(" FINAL RESULT  sine(%d) value = -%d.000%d  \n ", i, sin,srm);
      	}
        else
        {
         printf(" FINAL RESULT  sine(%d) value = %d  \n ", i,srm);
     	}
        }
        else
        {
     	if(srm >= 1000 && srm <= 9999)
        {
        printf(" FINAL RESULT  sine(%d) value = %d.%d  \n ", i, sin,srm);
        }
        else if(srm >= 100 && srm <= 999)
        {
        printf(" FINAL RESULT  sine(%d) value = %d.0%d  \n ", i, sin,srm);
	    }
        else if(srm >= 10 && srm <= 99)
        {
         printf(" FINAL RESULT  sine(%d) value = %d.00%d  \n ", i, sin,srm);
		}
        else if(srm >= 0 && srm <= 9)
        {
         printf(" FINAL RESULT  sine(%d) value = %d.000%d  \n ", i, sin,srm);
	    }
        else
        {
        printf(" FINAL RESULT  sine(%d) value = %d  \n ", i,srm);
     	}
        }
        cosine = rslt_tb_cos_arr[i];
        int cos = rslt_tb_cos_arr[i]/10000;
        int crm = rslt_tb_cos_arr[i]%10000;
        if (cos ==1)
        {
        printf(" FINAL RESULT  cosine(%d) value = %d \n ", i, cos);
        }
        else if(cosine < 0)
        {
        crm = crm * (-1);
        cos = cos * (-1);
        if(crm >= 1000 && crm <= 9999)
        {
        printf(" FINAL RESULT  cosine(%d) value = -%d.%d  \n ", i, cos,crm);
        }
        else if(crm >= 100 && crm <= 999)
        {
        printf(" FINAL RESULT  cosine(%d) value = -%d.0%d  \n ", i, cos,crm);
	    }
        else if(crm >= 10 && crm <= 99)
        {
        printf(" FINAL RESULT cosine(%d) value = -%d.00%d  \n ", i, cos,crm);
	    }
        else if(crm >= 0 && crm <= 9)
        {
        printf(" FINAL RESULT  cosine(%d) value = -%d.000%d  \n ", i, cos,crm);
	    }
        else
        {
        printf(" FINAL RESULT  cosine(%d) value = %d  \n ", i,crm);
	    }
        }
        else
        if(crm >= 1000 && crm <= 9999)
        {
        printf(" FINAL RESULT  cosine(%d) value = %d.%d  \n ", i, cos,crm);
        }
        else if(crm >= 100 && crm <= 999)
        {
        printf(" FINAL RESULT  cosine(%d) value = %d.0%d  \n ", i, cos,crm);
	    }
        else if(crm >= 10 && crm <= 99)
        {
        printf(" FINAL RESULT cosine(%d) value = %d.00%d  \n ", i, cos,crm);
        }
        else if(crm >= 0 && crm <= 9)
        {
        printf(" FINAL RESULT  cosine(%d) value = %d.000%d  \n ", i, cos,crm);
	    }
        else
        {
        printf(" FINAL RESULT  cosine(%d) value = %d  \n ", i,crm);
        }
        }
        return 0;
        }

#endif
