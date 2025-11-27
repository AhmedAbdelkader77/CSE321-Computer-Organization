.data
    choose:   .asciiz"enter the number of your choice : \n1-first choice\n2-second choice\n3-third choice\n"
    firstchoice:  .asciiz"we are in the first choice\n"
    secondchoice: .asciiz"we are in the second choice\n"
    thirdchoice:   .asciiz"we are in the third choice\n"
    default:      .asciiz"your choice is out of the three choices"


.text
main:
    li $v0,4
    la $a0,choose
    syscall
    li $v0,5
    syscall
    move $s0,$v0

    beq $s0,1,first
    beq $s0,2,second
    beq $s0,3,third

    wrongchoice:
    li $v0,4
    la $a0,default
    j end
    first:
    li $v0,4
    la $a0,firstchoice
    j end
    second:
    li $v0,4
    la $a0,secondchoice
    j end
    third:
    li $v0,4
    la $a0,thirdchoice
    end:
    syscall
    li $v0,10
    syscall



