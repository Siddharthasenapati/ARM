     PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION

	VMOV.F32 S1, #6;x-Number to find e^x
	MOV R1, #10;Number of terms been considered in e^x expansion
	MOV R4, #1;
	VMOV.F32 S3, #1;temp
	VMOV.F32 S4, #1; value of i in loop
	VMOV.F32 S5, #1; to store the result
	VMOV.F32 S7, #1;
	MOV R8, #1;
Loop 
	 CMP R1, R4;Comparison done for excuting taylor series expansion of e^x for s2 number of terms
	 BLT stop; Condition to check to enter inside loop
	 VDIV.F32 S6, S1, S4; temp1=x/count
	 VMUL.F32 S3, S3, S6; temp=temp*temp1;
	 VADD.F32 S5, S5, S3; result=result+temp;
	 VADD.F32 S4, S4, S7;
	 ADD R4, R4, R8; incrementing count
	 B Loop; 
	 
stop B stop ; stop program
	 ENDFUNC
	 END
