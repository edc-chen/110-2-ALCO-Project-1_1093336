.globl main
.data 
	endl:	.string "\n"
	input0:	.string "Input a number:\n"
	output0:	.string "The damage:\n"
.text
main:
	add s11, zero,zero
	la a0, input0
	li a7, 4
	ecall
	li a7, 5
	ecall
	add s2, zero,a0		#s2 == input num X
	addi s5, zero,-2048	#防輸入過小壞掉
	blt s2, s5,main
	jal ra, F
	la a0, output0
	li a7, 4
	ecall
	add a0, s11,zero	#s11==answer
	li a7, 1	
	ecall
	li a7, 10		#end
	ecall		
end:
	li a7, 1
	ecall
	li a7, 10
	ecall
F:
	addi s3, zero,0		#s3==0
	blt s2, s3,N_other
	beq s3, s2,N_0
	addi s3, zero,1 	#s3==1
	beq s3, s2,N_1
	addi s3, zero,10	#s3==10
	ble s2, s3,N_1_10
	addi s3, zero,20	#s3==20
	ble s2, s3,N_10_20	
	bgt s2, s3,N_20
N_0:
	addi s11, s11,1
	jalr zero, 0(ra)
N_1:
	addi s11, s11,5
	jalr zero, 0(ra)	
N_1_10:	
	addi sp, sp,-8		#預開8
	sw ra, 0(sp)
	sw s2, 4(sp)
	addi s2, s2,-1
	jal ra, F		#F(x-1)
	lw s2, 4(sp)
	addi s2, s2,-2
	jal ra, F		#F(x-2)
	lw ra, 0(sp)
	lw s2, 4(sp)			
	addi sp, sp,8		#回歸
	jalr zero, 0(ra)
N_10_20:
	addi sp, sp,-8		#預開8
	sw ra, 0(sp)
	sw s2, 4(sp)
	addi s2, s2,-2
	jal ra, F		#F(x-2)
	lw s2, 4(sp)
	addi s2, s2,-3
	jal ra, F		#F(x-3)
	lw ra, 0(sp)
	lw s2, 4(sp)			
	addi sp, sp,8		#回歸
	jalr zero, 0(ra)
N_20:
	addi sp, sp,-8		#預開8
	sw ra, 0(sp)
	sw s2, 4(sp)
	addi t6, zero,5
	div s2, s2,t6 
	jal ra, F		#F(x/5)
	lw ra, 0(sp)
	lw s2, 4(sp)
	add t6, s2,zero
	slli t6, t6,1
	add s11, s11,t6
	addi sp, sp,8		#回歸
	jalr zero, 0(ra)
N_other:
	addi s11, s11,-1
	jalr zero, 0(ra)	
