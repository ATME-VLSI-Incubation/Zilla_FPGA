

#ifndef AESTST_H
#define AESTST_H


#define PRINT_AES_KEY(keyrsltspike,keyspikeround,Nk,tn,Nr)\
        for(int i=0;i<4*Nk;i++)\
        {\
           printf("PASS round %15u from spike: %15u input to spike %15u \n",Nr,keyrsltspike[i]);\
        }\


#define PRINT_AES_DATA(Nk,tn,rslt_c_encrypt,rslt_c_decrypt,spike_encrypt,spike_decrypt,L,itn,spike_in)\
        printf("value of L is %15u: , iterations is %15u:",L,itn);\
        for(int m=0;m<(16);m++)\
        {\
           printf("input data are: %15u spike input :%15u \n",input[m],spike_in[m]);\
           if(rslt_c_encrypt[m]==spike_encrypt[m])\
             printf("PASS c encrypt are: %15u spike encrypt :%15u \n",rslt_c_encrypt[m],spike_encrypt[m]);\
           else\
             printf("FAIL c encrypt are: %15u spike encrypt :%15u \n",rslt_c_encrypt[m],spike_encrypt[m]);\
           if(rslt_c_decrypt[m]==spike_decrypt[m])\
             printf("PASS c decrypt are: %15u spike decrypt :%15u \n\n",rslt_c_decrypt[m],spike_decrypt[m]);\
           else\
             printf("FAIL  c decrypt are: %15u spike decrypt :%15u \n\n",rslt_c_decrypt[m],spike_decrypt[m]);\
        }\




#define RAND_ARR_AES_KEY(mb,Nk,tn,Nr,keyin,inputdata,Nd,itn)\
        uint8_t inputdata[Nd];\
        uint16_t y=0;\
        uint64_t datain[187];\
        uint8_t keyin[4*Nk];\
        for(int i=0;i<4*Nk;i++)\
        {\
            keyin[i]=(uint8_t)generate_random_num(mb);\
        }\
        for(int i=0;i<187;i++)\
        {\
            datain[i]=generate_random_num(mb);\
        }\
        for(int i=0;i<187;i++)\
        {\
           if(i==186)\
           {\
              for(int j=3;j>=0;j--)\
              {\
                 inputdata[y]=(uint8_t)(datain[i]>>(j*8));\
                 y++;\
              }\
           }\
           else\
           {\
              for(int j=7;j>=0;j--)\
              {\
                 inputdata[y]=(uint8_t)(datain[i]>>(j*8));\
                 y++;\
              }\
           }\
        }\
        uint8_t keyround[4][Nk];\
        for(int i=0;i<4*Nk;i++)\
        {\
            actual_result[(tn-1)*(4*Nk)+i]=(uint8_t)keyin[i];\
        }\
        uint8_t z=0;\
        for(int i=0;i<Nk;i++)\
        {\
           for(int j=0;j<4;j++)\
           {\
              keyround[j][i]=keyin[z];\
              z++;\
           }\
        }\


#define RAND_ARR_AES_DATA(mb,Nk,tn,Nr,Nd,input,L,itn)\
        uint8_t input[16];\
        uint16_t dl;\
        dl=L;\
        for(int i=0;i<16;i++)\
        {\
            if(dl<Nd)\
            {\
                input[i]=(uint8_t)inputdata[i+L];\
            }\
            else\
            {\
                input[i]=0;\
            }\
            dl++;\
            actual_result[(tn-1)*16+i+((4*Nk))+(itn*16*3)]=(uint8_t)input[i];\
        }\

#define AES_KEY_C(keyin,keyarrin,keyarr1,keyarr,Nk,tn,Nr,keyround)\
        uint8_t keyarrin[4][Nk];\
        uint8_t keyarr[4][Nk];\
        uint8_t keyarr1[4][Nk];\
        uint8_t k=0;\
        for(int i=0;i<Nk;i++)\
        {\
           for(int j=0;j<4;j++)\
           {\
              keyin[k]=keyround[j][i];\
              keyarr[j][i]=keyin[k];\
              keyarr1[j][i]=keyin[k];\
              keyarrin[j][i]=keyin[k];\
              k++;\
           }\
        }\


#define AES_KEY_ARRAYUP_C(Nk,keyarr)\
        uint8_t keyarrups[4][Nk];\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<Nk;j++)\
           {\
               if(j==(Nk-1))\
              {\
                  keyarrups[i][Nk-1]=(uint8_t)keyarr[i+1][Nk-1];\
              }\
              else\
              {\
                 keyarrups[i][j]=(uint8_t)(keyarr[i][j]);\
              }\
           }\
           if(i==3)\
           {\
              keyarrups[3][Nk-1]=(uint8_t)keyarr[0][Nk-1];\
           }\
        }\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<Nk;j++)\
           {\
              keyarr[i][j]=(uint8_t)keyarrups[i][j];\
           }\
        }\

 
#define sboxkey_C(Nk,keyarr)\
        int m1,m,l;\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<Nk;j++)\
           {\
              if(j==(Nk-1))\
              {\
                 m1=(keyarr[i][j]) & (0xF0);\
                 m=m1>> 4;\
                 l=(keyarr[i][j]) & (0x0F);\
                 keyarr[i][j]=s[m][l];\
              }\
              else\
              {\
                 keyarr[i][j]=keyarr[i][j];\
              }\
           }\
        }\


#define addrcon_C(Nk,keyarr,Nr)\
        uint8_t keyarrrcon[4][Nk];\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<Nk;j++)\
           {\
              keyarrrcon[i][j]=keyarr[i][j];\
              if((i==0) & (j==(Nk-1)))\
              {\
                 keyarrrcon[i][j]=keyarr[i][j]^rcon[i+Nr][0];\
              }\
           }\
        }\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<Nk;j++)\
           {\
              keyarr[i][j]=keyarrrcon[i][j];\
           }\
        }\

#define finalkeys_C(Nk,keyarr,keyarr1,keyarrin,Nr,keyin)\
        uint8_t keyfarr[4][Nk];\
        uint8_t keyfirst[4][Nk];\
        uint8_t keysub[4][Nk];\
        uint8_t keyin[4*Nk];\
        if(Nr==0 & Nk==4)\
        {\
           for(int i=0;i<4;i++)\
           {\
              for(int j=0;j<4;j++)\
              {\
                 keyfirst[i][j]=keyarr1[i][j];\
                 keyfinalarray[i][j]=keyarr1[i][j];\
              }\
           }\
        }\
        else if(Nr==0 & Nk !=4)\
        {\
           for(int i=0;i<4;i++)\
           {\
              for(int j=0;j<4;j++)\
              {\
                 keyfirst[i][j]=keyarr1[i][j];\
                 keyfinalarray[i][j]=keyarr1[i][j];\
              }\
           }\
           for(int i=0;i<4;i++)\
           {\
              for(int j=4;j<Nk;j++)\
              {\
                 keyfinalarray[i+4][j-4]=keyarr1[i][j];\
              }\
           }\
        }\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<Nk;j++)\
           {\
              if(j==0)\
              {\
                 keyfarr[i][j]=keyarr1[i][j] ^ keyarr[i][j+(Nk-1)];\
                 keysub[i][j]=keyfarr[i][j];\
              }\
              else\
              {\
                 if(j==3 & Nk==8)\
                 {\
                    int k1,k2,k3;\
                    keyfarr[i][j]=keyfarr[i][j-1] ^ keyarr1[i][j]; \
                    keysub[i][j]=keyfarr[i][j];\
                    k1=(keysub[i][j]) & (0xF0);\
                    k2=k1>> 4;\
                    k3=(keysub[i][j]) & (0x0F);\
                    keysub[i][j]=s[k2][k3];\
                 }\
                 else  if(Nk==8 & j==4)\
                 {\
                    keyfarr[i][j]=keysub[i][j-1] ^ keyarr1[i][j];\
                    keysub[i][j]=keyfarr[i][j];\
                 }\
                 else\
                 {\
                    keyfarr[i][j]=keyfarr[i][j-1] ^ keyarr1[i][j]; \
                    keysub[i][j]=keyfarr[i][j];\
                 }\
              }\
           }\
        }\
        for(int i=0+4*Nr;i<4+4*Nr;i++)\
        {\
           for(int j=0;j<Nk;j++) \
           {\
              keyarr[i-(4*Nr)][j]=keyfarr[i-(4*Nr)][j];\
              keyarr1[i-(4*Nr)][j]=keyarr[i-(4*Nr)][j];\
              keyround[i-(4*Nr)][j]=keyfarr[i-(4*Nr)][j];\
           }\
        }\
        if(Nk==4)\
        {\
           for(int i=0+4*Nr;i<4+4*Nr;i++)\
           {\
              for(int j=0;j<Nk;j++) \
              {\
                 keyfinalarray[i+4][j]=keyfarr[i-(4*Nr)][j];\
              }\
           }\
        }\
        else if(Nk==6)\
        {\
           if(Nr%2==0)\
           {\
              for(int i=0;i<4;i++)\
              {\
                 for(int j=0;j<2;j++)\
                 {\
                    keyfinalarray[i+4+6*Nr][j+2]=keyfarr[i][j];\
                 }\
              }\
              for(int i=0;i<4;i++)\
              {\
                 for(int j=0;j<4;j++)\
                 {\
                    keyfinalarray[i+8+6*Nr][j]=keyfarr[i][j+2];\
                 }\
              }\
           }\
           else if(Nr%2 !=0)\
           {\
              for(int i=0;i<4;i++)\
              {\
                 for(int j=0;j<4;j++)\
                 {\
                    keyfinalarray[i+6+6*Nr][j]=keyfarr[i][j]; \
                 }\
              }\
              for(int i=0;i<4;i++)\
              {\
                 for(int j=0;j<2;j++)\
                 {\
                    keyfinalarray[i+10+6*Nr][j]=keyfarr[i][j+4]; \
                 }\
              }\
           }\
        }\
        else if(Nk==8)\
        {\
           for(int i=0+4*Nr;i<4+4*Nr;i++)\
           {\
              for(int j=0;j<4;j++) \
              {\
                 keyfinalarray[i+8+4*Nr][j]=keyfarr[i-(4*Nr)][j];\
              }\
           }\
           for(int i=0+4*Nr;i<4+4*Nr;i++)\
           {\
              for(int j=0;j<4;j++)\
              {\
                 keyfinalarray[i+12+4*Nr][j]=keyfarr[i-(4*Nr)][j+4];\
              }\
           }\
        }\
        k=0;\
        for(int l=0;l<Nk;l++)\
        {\
           for(int j=0;j<4;j++)\
           {\
              keyin[k]=keyround[j][l];\
              k++;\
           }\
        }\


#define AES_INIT_KEY_SPIKE(keyinspike,keyspikeround,Nk,tn,Nr)\
        uint8_t k=0;\
        uint8_t keyinspike[4*Nk];\
        uint8_t keyrsltspike[4*Nk];\
        uint8_t keyspikeround[4][Nk];\
        for(int i=0;i<(4*Nk);i++)\
        {\
           keyinspike[i]=(uint8_t)data[(tn-1)*(4*Nk)+i+((4*Nk)*(Nr))];\
           keyrsltspike[i]=keyinspike[i];\
        }\
        k=0;\
        for(int i=0;i<Nk;i++)\
        {\
           for(int j=0;j<4;j++)\
           {\
             keyspikeround[j][i]= keyinspike[k];\
             k++;\
           }\
        }\
                
 
#define AES_KEY_SPIKE(keyin,keyarrin,keyarr1,keyarr,keyrsltspike,keyinspike,Nk,tn,Nr)\
        uint8_t keyarrin[4][Nk];\
        uint8_t keyarr[4][Nk];\
        uint8_t keyarr1[4][Nk];\
        for(int i=0;i<Nk;i++)\
        {\
           for(int j=0;j<4;j++)\
           {\
               keyinspike[k]=keyspikeround[j][i];\
               keyarr[j][i]=keyinspike[k];\
               keyarr1[j][i]=keyinspike[k];\
               keyarrin[j][i]=keyinspike[k];\
               k++;\
           }\
        }\

       

#define AES_KEY_ARRAYUP_SPIKE(Nk,keyarr)\
        uint8_t keyarrups[4][Nk];\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<Nk;j++)\
           {\
               if(j==(Nk-1))\
              {\
                  keyarrups[i][Nk-1]=(keyarr[i+1][Nk-1]);\
              }\
              else\
              {\
                 keyarrups[i][j]=(keyarr[i][j]);\
              }\
           }\
           if(i==3)\
           {\
              keyarrups[3][Nk-1]=(keyarr[0][Nk-1]);\
           }\
        }\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<Nk;j++)\
           {\
              keyarr[i][j]=keyarrups[i][j];\
           }\
        }\


#define sboxkey_SPIKE(Nk,keyarr)\
        int m1,m,l;\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<Nk;j++)\
           {\
               if(j==(Nk-1))\
               {\
                  m1=(keyarr[i][j]) & (0xF0);\
                  m=m1>> 4;\
                  l=(keyarr[i][j]) & (0x0F);\
                  keyarr[i][j]=s[m][l];\
               }\
               else\
               {\
                  keyarr[i][j]=keyarr[i][j];\
               }\
           }\
        }\


#define addrcon_SPIKE(Nk,keyarr,Nr)\
        uint8_t keyarrrcon[4][Nk];\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<Nk;j++)\
           {\
              keyarrrcon[i][j]=keyarr[i][j];\
              if((i==0) & (j==(Nk-1)))\
              {\
                 keyarrrcon[i][j]=keyarr[i][j]^rcon[i+Nr][0];\
              }\
           }\
        }\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<Nk;j++)\
           {\
              keyarr[i][j]=keyarrrcon[i][j];\
           }\
        } \


#define finalkeys_SPIKE(Nk,keyarr,keyarr1,keyrsltc,keyarrin,keyinspike,Nr,tn)\
        uint8_t keyfarr[4][Nk];\
        uint8_t keyfirst[4][Nk];\
        uint8_t keysub[4][Nk];\
        uint8_t keyrsltc[4*Nk];\
        if(Nr==0 & Nk==4)\
        {\
           for(int i=0;i<4;i++)\
           {\
              for(int j=0;j<4;j++)\
              {\
                 keyfirst[i][j]=keyarr1[i][j];\
                 keyfinalarray[i][j]=keyarr1[i][j];\
              }\
           }\
        }\
        else if(Nr==0 & Nk !=4)\
        {\
           for(int i=0;i<4;i++)\
           {\
              for(int j=0;j<4;j++)\
              {\
                 keyfirst[i][j]=keyarr1[i][j];\
                 keyfinalarray[i][j]=keyarr1[i][j];\
              }\
           }\
           for(int i=0;i<4;i++)\
           {\
              for(int j=4;j<Nk;j++)\
              {\
                 keyfinalarray[i+4][j-4]=keyarr1[i][j];\
              }\
           }\
         }\
         for(int i=0;i<4;i++)\
         {\
            for(int j=0;j<Nk;j++)\
            {\
               if(j==0)\
               {\
                  keyfarr[i][j]=keyarr1[i][j] ^ keyarr[i][j+(Nk-1)];\
                  keysub[i][j]=keyfarr[i][j];\
               }\
               else\
               {\
                  if(j==3 & Nk==8)\
                  {\
                     int k1,k2,k3;\
                     keyfarr[i][j]=keyfarr[i][j-1] ^ keyarr1[i][j]; \
                     keysub[i][j]=keyfarr[i][j];\
                     k1=(keysub[i][j]) & (0xF0);\
                     k2=k1>> 4;\
                     k3=(keysub[i][j]) & (0x0F);\
                     keysub[i][j]=s[k2][k3];\
                  }\
                  else  if(Nk==8 & j==4)\
                  {\
                     keyfarr[i][j]=keysub[i][j-1] ^ keyarr1[i][j];\
                     keysub[i][j]=keyfarr[i][j];\
                  }\
                  else\
                 {\
                    keyfarr[i][j]=keyfarr[i][j-1] ^ keyarr1[i][j]; \
                    keysub[i][j]=keyfarr[i][j];\
                 }\
               }\
            }\
         }\
         k=0;\
         for(int i=0+4*Nr;i<4+4*Nr;i++)\
         {\
            for(int j=0;j<Nk;j++) \
            {\
                keyarr[i-(4*Nr)][j]=keyfarr[i-(4*Nr)][j];\
                keyarr1[i-(4*Nr)][j]=keyarr[i-(4*Nr)][j];\
                keyspikeround[i-(4*Nr)][j]=keyfarr[i-(4*Nr)][j];\
            }\
         }\
         if(Nk==4)\
         {\
            for(int i=0+4*Nr;i<4+4*Nr;i++)\
            {\
                for(int j=0;j<Nk;j++) \
                {\
                   keyfinalarray[i+4][j]=keyfarr[i-(4*Nr)][j];\
                }\
             }\
          }\
          else if(Nk==6)\
          {\
             if(Nr%2==0)\
             {\
                for(int i=0;i<4;i++)\
                {\
                   for(int j=0;j<2;j++)\
                   {\
                      keyfinalarray[i+4+6*Nr][j+2]=keyfarr[i][j];\
                   }\
                }\
                for(int i=0;i<4;i++)\
                {\
                   for(int j=0;j<4;j++)\
                   {\
                      keyfinalarray[i+8+6*Nr][j]=keyfarr[i][j+2];\
                   }\
                }\
             }\
             else if(Nr%2 !=0)\
             {\
                for(int i=0;i<4;i++)\
                {\
                   for(int j=0;j<4;j++)\
                   {\
                      keyfinalarray[i+6+6*Nr][j]=keyfarr[i][j]; \
                   }\
                }\
               for(int i=0;i<4;i++)\
               {\
                  for(int j=0;j<2;j++)\
                  {\
                     keyfinalarray[i+10+6*Nr][j]=keyfarr[i][j+4]; \
                  }\
               }\
             }\
          }\
          else if(Nk==8)\
          {\
             for(int i=0+4*Nr;i<4+4*Nr;i++)\
             {\
                for(int j=0;j<4;j++) \
                {\
                   keyfinalarray[i+8+4*Nr][j]=keyfarr[i-(4*Nr)][j];\
                }\
             }\
             for(int i=0+4*Nr;i<4+4*Nr;i++)\
             {\
                for(int j=0;j<4;j++)\
                {\
                   keyfinalarray[i+12+4*Nr][j]=keyfarr[i-(4*Nr)][j+4];\
                }\
             }\
          }\
          k=0;\
          for(int i=0;i<Nk;i++)\
          {\
             for(int j=0;j<4;j++) \
             {\
                keyrsltspike[k]=keyspikeround[j][i-(4*Nr)];\
                keyinspike[k]=keyspikeround[j][i-(4*Nr)];\
                k++;\
             }\
          }\
        

#define AES_DATA_C(input,statearr,statearrin,tn)\
        int k=0;\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<4;j++)\
           {\
              statearr[j][i]=input[k];\
              statearrin[j][i]=input[k];\
              k++;\
           }\
        }\


#define AES_DATA_SPIKE(tn,kr,itn)\
        uint8_t spike_in[16];\
        for(int i=0;i<16;i++)\
        {\
           input[i]=data[((tn-1)*(4*Nk))+i+(4*Nk)+(itn*16*3)];\
           spike_in[i]=input[i];\
        }\
        int k=0;\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<4;j++)\
           {\
              statearr[j][i]=input[k];\
              statearrin[j][i]=input[k];\
              k++;\
           }\
        }\


#define addround_C(Nk,statearr,keyarrin,keyfinalarray,Nr,E,tn,sarr,key_final_c,itn)\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<4;j++)\
           {\
              if( E==1) \
              {\
                 sarr[i][j]=statearr[i][j] ^ keyfinalarray[i+4*Nr][j];\
                 key_final_c[i][j]=keyfinalarray[i+4*Nr][j];\
              }\
              else if(Nk==4 & E==0)\
              {\
                 sarr[i][j]=statearr[i][j]^keyfinalarray[40+i-(4*Nr)][j];\
              }\
              else if(Nk==6 & E==0)\
              {\
                 sarr[i][j]=statearr[i][j]^keyfinalarray[48+i-(4*Nr)][j];\
              }\
              else if(Nk==8 & E==0)\
              {\
                 sarr[i][j]=statearr[i][j]^keyfinalarray[56+i-(4*Nr)][j];\
              }\
           }\
        }\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<4;j++)\
           {\
              statearr[i][j]=sarr[i][j];\
           }\
        }\
        if(E==1)\
        {\
           k=0;\
           for(int i=0;i<4;i++)\
           {\
              for(int j=0;j<4;j++)\
              {\
                 actual_result[((tn-1)*(4*Nk))+k+(16)+((4*Nk))+(itn*16*3)]= statearr[j][i];\
                 k++;\
              }\
           }\
        }\
        else if(E==0)\
        {\
           k=0;\
           for(int i=0;i<4;i++)\
           {\
              for(int j=0;j<4;j++)\
              {\
                 actual_result[(tn-1)*(4*Nk)+k+(16+16)+((4*Nk))+(itn*16*3)]=statearr[j][i];\
                 k++;\
              }\
           }\
        }\

#define sboxdata_C(statearr,E)\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<4;j++)\
           {\
              m1=(statearr[i][j]) & (0xF0);\
              m=m1>> 4;\
              l=(statearr[i][j]) & (0x0F);\
              if(E==1) \
              {\
                 statearr[i][j]=s[m][l];\
              }\
              else \
              {\
                 statearr[i][j]=invsbox[m][l];\
              }\
           }\
        }\


#define datashift_C(statearr,E,tn)\
        if(E==1)\
        {\
           for(int i=0;i<4;i++)\
           {\
              for(int k=0;k<i;k++)\
              {\
                 for(int j=0;j<4;j++)\
                 {\
                    uint8_t temp;\
                    if(j==0)\
                    {\
                       temp=statearr[i][j];\
                       statearr[i][j]=statearr[i][j+1];\
                    }\
                    else if(j==3 )\
                    {\
                       statearr[i][3]=temp;\
                    }\
                    else \
                    {\
                       statearr[i][j]=statearr[i][j+1];\
                    }\
                 }\
              }\
           }\
        }\
        else if (E==0)\
        {\
           for(int i=0;i<4;i++)\
           {\
              for(int k=0;k<i;k++)\
              {\
                 for(int j=3;j>=0;j--)\
                 {\
                    uint8_t temp;\
                    if(j==3)\
                    {\
                       temp=statearr[i][j];\
                       statearr[i][j]=statearr[i][j-1];\
                    }\
                    else if(j==0)\
                    {\
                       statearr[i][0]=temp;\
                    }\
                    else\
                    {\
                       statearr[i][j]=statearr[i][j-1];\
                    }\
                 }\
              }\
           }\
        }\
   

#define mixcoloumnstate_C(statearr,E,tn)\
        uint8_t statemix[4][4];\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<4;j++)\
           {\
              if(E==1)\
              {\
                 if(i==0)\
                 {\
                    statemix[i][j]=mul2[(((statearr[i][j]) & (0xF0))>>4)][((statearr[i][j]) & (0x0F))] ^ mul3[(((statearr[i+1][j]) & (0xF0))>>4)][((statearr[i+1][j]) & (0x0F))] ^statearr[i+2][j] ^ statearr[i+3][j];\
                 }\
                 else if(i==1)\
                 {\
                    statemix[i][j]=statearr[i-1][j] ^ mul2[(((statearr[i][j]) & (0xF0))>>4)][((statearr[i][j]) & (0x0F))] ^ mul3[(((statearr[i+1][j]) & (0xF0))>>4)][((statearr[i+1][j]) & (0x0F))] ^statearr[i+2][j];\
                 } \
                 else if(i==2)\
                 {\
                    statemix[i][j]=statearr[i-2][j] ^ statearr[i-1][j] ^ mul2[(((statearr[i][j]) & (0xF0))>>4)][((statearr[i][j]) & (0x0F))] ^ mul3[(((statearr[i+1][j]) & (0xF0))>>4)][((statearr[i+1][j]) & (0x0F))];\
                 }\
                 else if(i==3)\
                 {\
                    statemix[i][j]=mul3[(((statearr[i-3][j]) & (0xF0))>>4)][((statearr[i-3][j]) & (0x0F))] ^ statearr[i-2][j] ^ statearr[i-1][j] ^ mul2[(((statearr[i][j]) & (0xF0))>>4)][((statearr[i][j]) & (0x0F))];\
                 }\
              }\
              else if(E==0)\
              {\
                 if(i==0)\
                 {\
                    statemix[i][j]=mul14[(((statearr[i][j]) & (0xF0))>>4)][((statearr[i][j]) & (0x0F))] ^ mul11[(((statearr[i+1][j]) & (0xF0))>>4)][((statearr[i+1][j]) & (0x0F))] ^ mul13[(((statearr[i+2][j]) & (0xF0))>>4)][((statearr[i+2][j]) & (0x0F))] ^ mul9[(((statearr[i+3][j]) & (0xF0))>>4)][((statearr[i+3][j]) & (0x0F))];\
                 }\
                 else if(i==1)\
                 {\
                    statemix[i][j]=mul9[(((statearr[i-1][j]) & (0xF0))>>4)][((statearr[i-1][j]) & (0x0F))] ^ mul14[(((statearr[i][j]) & (0xF0))>>4)][((statearr[i][j]) & (0x0F))] ^ mul11[(((statearr[i+1][j]) & (0xF0))>>4)][((statearr[i+1][j]) & (0x0F))] ^ mul13[(((statearr[i+2][j]) & (0xF0))>>4)][((statearr[i+2][j]) & (0x0F))];\
                 } \
                 else if(i==2)\
                {\
                   statemix[i][j]=mul13[(((statearr[i-2][j]) & (0xF0))>>4)][((statearr[i-2][j]) & (0x0F))] ^ mul9[(((statearr[i-1][j]) & (0xF0))>>4)][((statearr[i-1][j]) & (0x0F))] ^ mul14[(((statearr[i][j]) & (0xF0))>>4)][((statearr[i][j]) & (0x0F))] ^ mul11[(((statearr[i+1][j]) & (0xF0))>>4)][((statearr[i+1][j]) & (0x0F))];\
                }\
                else if(i==3)\
                {\
                   statemix[i][j]=mul11[(((statearr[i-3][j]) & (0xF0))>>4)][((statearr[i-3][j]) & (0x0F))] ^ mul13[(((statearr[i-2][j]) & (0xF0))>>4)][((statearr[i-2][j]) & (0x0F))] ^ mul9[(((statearr[i-1][j]) & (0xF0))>>4)][((statearr[i-1][j]) & (0x0F))] ^ mul14[(((statearr[i][j]) & (0xF0))>>4)][((statearr[i][j]) & (0x0F))];\
                }\
              }\
           }\
        }\
       for(int i=0;i<4;i++)\
       {\
          for(int j=0;j<4;j++)\
          {\
             statearr[i][j]=statemix[i][j];\
          }\
       }\


#define addround_SPIKE(Nk,statearr,keyarrin,keyfinalarray,Nr,E,tn,itn)\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<4;j++)\
           {\
              if( E==1) \
              {\
                 sarr[i][j]=statearr[i][j] ^ keyfinalarray[i+4*Nr][j];\
                 rslt_key_final_spike[i][j]=keyfinalarray[i+4*Nr][j];\
              }\
              else if(Nk==4 & E==0)\
              {\
                 sarr[i][j]=statearr[i][j]^keyfinalarray[40+i-(4*Nr)][j];\
              }\
              else if(Nk==6 & E==0)\
              {\
                 sarr[i][j]=statearr[i][j]^keyfinalarray[48+i-(4*Nr)][j];\
              }\
              else if(Nk==8 & E==0)\
              {\
                 sarr[i][j]=statearr[i][j]^keyfinalarray[56+i-(4*Nr)][j];\
              }\
           }\
        }\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<4;j++)\
           {\
              statearr[i][j]=sarr[i][j];\
           }\
        }\
        if(E==1)\
        {\
           k=0;\
           for(int i=0;i<4;i++)\
           {\
              for(int j=0;j<4;j++)\
              {\
                 spike_encrypt[k]=statearr[j][i];\
                 k++;\
              }\
           }\
        }\
        else if(E==0)\
        {\
           k=0;\
           for(int i=0;i<4;i++)\
           {\
              for(int j=0;j<4;j++)\
              {\
                 spike_decrypt[k]=statearr[j][i];\
                 k++;\
              }\
           }\
        }\
        for(int i=0;i<16;i++)\
        {\
           rslt_c_encrypt[i]=data[(tn-1)*(4*Nk)+i+16+((4*Nk))+(itn*16*3)];\
           rslt_c_decrypt[i]=data[(tn-1)*(4*Nk)+i+(16+16)+((4*Nk))+(itn*16*3)];\
        }\


#define sboxdata_SPIKE(statearr,E)\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<4;j++)\
           {\
              m1=(statearr[i][j]) & (0xF0);\
              m=m1>> 4;\
              l=(statearr[i][j]) & (0x0F);\
              if(E==1) \
              {\
                 statearr[i][j]=s[m][l];\
              }\
              else \
              {\
                 statearr[i][j]=invsbox[m][l];\
              }\
           }\
        }\


#define datashift_SPIKE(statearr,E,tn)\
        if(E==1)\
        {\
           for(int i=0;i<4;i++)\
           {\
              for(int k=0;k<i;k++)\
              {\
                 for(int j=0;j<4;j++)\
                 {\
                    uint8_t temp;\
                    if(j==0)\
                    {\
                       temp=statearr[i][j];\
                       statearr[i][j]=statearr[i][j+1];\
                    }\
                    else if(j==3 )\
                    {\
                       statearr[i][3]=temp;\
                    }\
                    else \
                    {\
                       statearr[i][j]=statearr[i][j+1];\
                    }\
                 }\
              }\
           }\
        }\
        else if (E==0)\
        {\
           for(int i=0;i<4;i++)\
           {\
              for(int k=0;k<i;k++)\
              {\
                 for(int j=3;j>=0;j--)\
                 {\
                    uint8_t temp;\
                    if(j==3)\
                    {\
                       temp=statearr[i][j];\
                       statearr[i][j]=statearr[i][j-1];\
                    }\
                    else if(j==0)\
                    {\
                       statearr[i][0]=temp;\
                    }\
                    else\
                    {\
                       statearr[i][j]=statearr[i][j-1];\
                    }\
                 }\
              }\
           }\
        }\
   

#define mixcoloumnstate_SPIKE(statearr,E,tn)\
        uint8_t statemix[4][4];\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<4;j++)\
           {\
              if(E==1)\
              {\
                 if(i==0)\
                 {\
                    statemix[i][j]=mul2[(((statearr[i][j]) & (0xF0))>>4)][((statearr[i][j]) & (0x0F))] ^ mul3[(((statearr[i+1][j]) & (0xF0))>>4)][((statearr[i+1][j]) & (0x0F))] ^statearr[i+2][j] ^ statearr[i+3][j];\
                 }\
                 else if(i==1)\
                 {\
                    statemix[i][j]=statearr[i-1][j] ^ mul2[(((statearr[i][j]) & (0xF0))>>4)][((statearr[i][j]) & (0x0F))] ^ mul3[(((statearr[i+1][j]) & (0xF0))>>4)][((statearr[i+1][j]) & (0x0F))] ^statearr[i+2][j];\
                 } \
                 else if(i==2)\
                 {\
                    statemix[i][j]=statearr[i-2][j] ^ statearr[i-1][j] ^ mul2[(((statearr[i][j]) & (0xF0))>>4)][((statearr[i][j]) & (0x0F))] ^ mul3[(((statearr[i+1][j]) & (0xF0))>>4)][((statearr[i+1][j]) & (0x0F))];\
                 }\
                 else if(i==3)\
                 {\
                    statemix[i][j]=mul3[(((statearr[i-3][j]) & (0xF0))>>4)][((statearr[i-3][j]) & (0x0F))] ^ statearr[i-2][j] ^ statearr[i-1][j] ^ mul2[(((statearr[i][j]) & (0xF0))>>4)][((statearr[i][j]) & (0x0F))];\
                 }\
              }\
              else if(E==0)\
              {\
                 if(i==0)\
                 {\
                    statemix[i][j]=mul14[(((statearr[i][j]) & (0xF0))>>4)][((statearr[i][j]) & (0x0F))] ^ mul11[(((statearr[i+1][j]) & (0xF0))>>4)][((statearr[i+1][j]) & (0x0F))] ^ mul13[(((statearr[i+2][j]) & (0xF0))>>4)][((statearr[i+2][j]) & (0x0F))] ^ mul9[(((statearr[i+3][j]) & (0xF0))>>4)][((statearr[i+3][j]) & (0x0F))];\
                 }\
                 else if(i==1)\
                 {\
                    statemix[i][j]=mul9[(((statearr[i-1][j]) & (0xF0))>>4)][((statearr[i-1][j]) & (0x0F))] ^ mul14[(((statearr[i][j]) & (0xF0))>>4)][((statearr[i][j]) & (0x0F))] ^ mul11[(((statearr[i+1][j]) & (0xF0))>>4)][((statearr[i+1][j]) & (0x0F))] ^ mul13[(((statearr[i+2][j]) & (0xF0))>>4)][((statearr[i+2][j]) & (0x0F))];\
                 } \
                 else if(i==2)\
                 {\
                   statemix[i][j]=mul13[(((statearr[i-2][j]) & (0xF0))>>4)][((statearr[i-2][j]) & (0x0F))] ^ mul9[(((statearr[i-1][j]) & (0xF0))>>4)][((statearr[i-1][j]) & (0x0F))] ^ mul14[(((statearr[i][j]) & (0xF0))>>4)][((statearr[i][j]) & (0x0F))] ^ mul11[(((statearr[i+1][j]) & (0xF0))>>4)][((statearr[i+1][j]) & (0x0F))];\
                 }\
                 else if(i==3)\
                 {\
                   statemix[i][j]=mul11[(((statearr[i-3][j]) & (0xF0))>>4)][((statearr[i-3][j]) & (0x0F))] ^ mul13[(((statearr[i-2][j]) & (0xF0))>>4)][((statearr[i-2][j]) & (0x0F))] ^ mul9[(((statearr[i-1][j]) & (0xF0))>>4)][((statearr[i-1][j]) & (0x0F))] ^ mul14[(((statearr[i][j]) & (0xF0))>>4)][((statearr[i][j]) & (0x0F))];\
                 }\
              }\
           }\
        }\
        for(int i=0;i<4;i++)\
        {\
           for(int j=0;j<4;j++)\
           {\
              statearr[i][j]=statemix[i][j];\
           }\
        }
   


#endif 
