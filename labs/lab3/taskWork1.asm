#f(0)=0
#f(1)=1
#f(2)=1
#f(3)=2
#f(4)=3

.data
    prompt:  .asciiz "enter a number: "
    rslt:    .asciiz"fibonacci = "
    newline: .asciiz"\n"

.text

fibonacci:
    #counter
    li $t0,0 
    #result
    li $t1,0
    li $t2,1
    loop:
    beq $t0,$a0,end
    add $t3,$t2,$t1
    move $t1,$t2
    move $t2,$t3
    addi $t0,$t0,1
    j loop
    end:
    move $v0,$t1
    jr $ra

main:
    addi $sp,$sp,-4
    sw $ra,0($sp)
    li $v0,4
    la $a0,prompt
    syscall
    li $v0,5
    syscall
    move $a0,$v0

    jal fibonacci
    move $s0,$v0
    li $v0,4
    la $a0,rslt
    syscall
    move $a0,$s0
    li $v0,1
    syscall
    li $v0,4
    la $a0,newline
    syscall
    lw $ra,0($sp)
    addi $sp,$sp,4

    li $v0,10
    syscall