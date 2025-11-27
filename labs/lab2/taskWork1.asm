.data
    numbers:  .asciiz"how many numbers will u enter:"
    number:   .asciiz"\nenter number "
    avg:      .asciiz"\naverage = "
    colon:    .asciiz ": "
    dot:      .asciiz"."
    newLine:  .asciiz"\n"
.text
main:
    li $v0,4
    la $a0,numbers
    syscall

    li $v0,5
    syscall
    
    move $s0,$v0   # number of numbers is in $s0
    move $s1,$zero   # sum
    move $s2,$zero   #counter
    loop:
        beq $s2, $s0 ,end
        li $v0,4
        la $a0,number
        syscall
        addi $s2,$s2,1
        li $v0,1
        li $a0,0
        add $a0,$a0,$s2
        syscall
        li $v0,4
        la $a0,colon
        syscall

        li $v0,5
        syscall
        add $s1,$s1,$v0
        j loop
    end:
    li $v0,4
    la $a0,avg
    syscall

    div $s1, $s0
    mflo $a0    #avg
    li $v0,1
    syscall
    li $v0,4
    la $a0,dot
    syscall
    mfhi $a0    #avg
    li $s3,10
    mul $a0,$a0,$s3
    div $a0,$s0
    mflo $a0
    li $v0,1
    syscall
    li $v0,4
    la $a0,newLine
    syscall

    li $v0,10
    syscall
