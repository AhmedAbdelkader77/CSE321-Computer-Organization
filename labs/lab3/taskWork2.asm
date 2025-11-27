.data
    prompt:  .asciiz "enter a number: "
    rslt:    .asciiz"fibonacci = "
    newline: .asciiz"\n"
.text

fibonacci:
    addi $sp,$sp,-12
    sw   $ra,0($sp)
    sw   $a0,4($sp)
    sw  $t0,8($sp)
   
    ble  $a0,1,fibonacciOfOne

    addi $a0,$a0,-1
    jal  fibonacci
    move $t0,$v0

    lw   $a0,4($sp)

    addi $a0,$a0,-2
    jal  fibonacci
    add  $v0,$v0,$t0
    j    end

fibonacciOfOne:
    move $v0,$a0

end:
    lw   $ra,0($sp)
    lw   $a0,4($sp)
    lw  $t0,8($sp)
    addi $sp,$sp,12
    jr   $ra
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

   