            PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 IMPORT printMsg
     IMPORT Printtable		 
	 ENTRY 
__main  FUNCTION
	      VLDR.F32 S11,=0; x1
		  VLDR.F32 S12,=0; x2
		  VLDR.F32 S13,=0; x3
	      MOV R9 ,#0		
          MOV R7 ,#0 
          MOV R12,#0
start	 ADR.W r1,Branchtable_byte
	       MOV r2,#1
		   TBB[r1,r2]
NAND_LOGIC      VLDR.F32  S14,=0.6;W1
				VLDR.F32  S15,=-0.8;W2       0
				VLDR.F32  S16,=-0.8;W3
				VLDR.F32  S17,=0.3;BIAS
				B Z_CALC
NOR_LOGIC      VLDR.F32  S14,=0.5;W1
				VLDR.F32  S15,=-0.7;W2       1
				VLDR.F32  S16,=-0.7;W3
				VLDR.F32  S17,=0.1;BIAS
				B Z_CALC
AND_LOGIC      VLDR.F32  S14,=-0.1;W1
				VLDR.F32  S15,=0.2;W2        2
				VLDR.F32  S16,=0.2;W3
				VLDR.F32  S17,=-0.2;BIAS
				B Z_CALC
OR_LOGIC      VLDR.F32  S14,=-0.1;W1
				VLDR.F32  S15,=0.7;W2        3
				VLDR.F32  S16,=0.7;W3
				VLDR.F32  S17,=-0.1;BIAS
				B Z_CALC
XOR_LOGIC      VLDR.F32  S14,=-5;W1
				VLDR.F32  S15,=20;W2           4
				VLDR.F32  S16,=10;W3
				VLDR.F32  S17,=1;BIAS
				B Z_CALC
XNOR_LOGIC      VLDR.F32  S14,=-5;W1
				VLDR.F32  S15,=20;W2          5
				VLDR.F32  S16,=10;W3
				VLDR.F32  S17,=1;BIAS
				B Z_CALC
NOT_LOGIC       VLDR.F32  S14,=0.5;W1
				VLDR.F32  S15,=-0.7;W2        6
				VLDR.F32  S16,=0;W3
				VLDR.F32  S17,=0.1;BIAS
				B Z_CALC
Z_CALC    	          VMUL.F32  S18 , S11 ,S14  ;S15 WILL HAVE SUM OF WEIGHTS
                      VADD.F32  S19  , S19 ,S18
		              VMUL.F32  S18 , S12 ,S15  
					  VADD.F32  S19  , S19 ,S18
					  VMUL.F32  S18 , S13 ,S16
					  VADD.F32  S19  , S19 ,S18
                      VADD.F32  S19  , S19 ,S17
					  ;VMOV.F32 R5,S19
                      B SIGMOID					  
Branchtable_byte		  
    DCB   0		  
    DCB   ((NOR_LOGIC-NAND_LOGIC)/2)	
	DCB   ((AND_LOGIC-NAND_LOGIC)/2)	
	DCB   ((OR_LOGIC-NAND_LOGIC)/2)
	DCB   ((XOR_LOGIC-NAND_LOGIC)/2)
	DCB   ((XNOR_LOGIC-NAND_LOGIC)/2)
	DCB   ((NOT_LOGIC-NAND_LOGIC)/2)    				
        
	 
	 
SIGMOID		VMOV.F32 S1, S19;x-Number to find e^x
	        VMOV.F32 S2, #30;Number of terms been considered in e^x expansion
			VMOV.F32 S3, #1;count
			VMOV.F32 S4, #1; temp
			VMOV.F32 S5, #1; result
			VMOV.F32 S7, #1;register to hold one
			VMOV.F32 S10,#1;

Loop 
	 VCMP.F32 S2, S3;Comparison done for excuting taylor series expansion of e^x for s2 number of terms
	 VMRS.F32 APSR_nzcv,FPSCR;Used to copy fpscr to apsr
	 BLT Loop1;
	 VDIV.F32 S6, S1, S3; temp1=x/count
	 VMUL.F32 S4, S4, S6; temp=temp*temp1;
	 VADD.F32 S5, S5, S4; result=result+temp;
	 VADD.F32 S3, S3, S7; incrementing count
	 B Loop; 
Loop1	 VADD.F32 S8,S5,S10;
	     VDIV.F32 S9, S5,S8;
	 B output;
	 
output 	 VLDR.F32 S20,=0.5
         VCMP.F32 S9,S20
		 VMRS.F32 APSR_nzcv,FPSCR;Used to copy fpscr to apsr
		 ITE HI
		 MOVHI r0 , #1
		 MOVLS r0 , #0
		 BL printMsg
		 
           ADR.W r8 , Table_Byte		  
		  TBB [r8 , r9 ]		  		  
input2    VLDR.F32 s11 , =1 ;X0 DATA
          VLDR.F32 s12 , =0 ;X1 DATA
          VLDR.F32 s13 , =1 ;X2 DATA
          ADD r9 , r9 , #1                  	  
		  B start
		  
input3    VLDR.F32 s11 , =1 ;X0 DATA
          VLDR.F32 s12 , =1 ;X1 DATA
          VLDR.F32 s13 , =0 ;X2 DATA		  
		  ADD r9 , r9 , #1                   
		  B start
		  
input4    VLDR.F32 s11 , =1 ;X0 DATA
          VLDR.F32 s12 , =1 ;X1 DATA
          VLDR.F32 s13 , =1 ;X2 DATA
		  ADD r9 , r9 , #1                   
          B start
			 
                MOV R0 , R7
                MOV R7 ,#0	
                BL Printtable
				CMP R12 ,#6
				IT HI
				BHI stop1
				ADD R12 ,R12 ,#1
				B start
stop1           B   stop1	
Table_Byte		  
    DCB   0		  
    DCB   ((input3-input2)/2)	
    DCB   ((input4-input2)/2)	
    DCB   ((stop-input2)/2)   
    endfunc
      end
