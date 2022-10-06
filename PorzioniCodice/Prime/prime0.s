.LC0:
        .string "%d"
.LC1:
        .string "]"
.LC2:
        .string ", "
printArray:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      zero,-20(s0)
        li      a0,91
        call    putchar
        j       .L2
.L4:
        lw      a5,-20(s0)
        slli    a5,a5,2
        lw      a4,-36(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        mv      a1,a5
        lui     a5,%hi(.LC0)
        addi    a0,a5,%lo(.LC0)
        call    printf
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
        lw      a5,-20(s0)
        slli    a5,a5,2
        lw      a4,-36(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        bne     a5,zero,.L3
        lui     a5,%hi(.LC1)
        addi    a0,a5,%lo(.LC1)
        call    puts
        j       .L2
.L3:
        lui     a5,%hi(.LC2)
        addi    a0,a5,%lo(.LC2)
        call    printf
.L2:
        lw      a5,-20(s0)
        slli    a5,a5,2
        lw      a4,-36(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        bne     a5,zero,.L4
        nop
        nop
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
divisibile:
        addi    sp,sp,-48
        sw      s0,44(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        sw      zero,-20(s0)
        j       .L6
.L9:
        lw      a5,-20(s0)
        slli    a5,a5,2
        lw      a4,-36(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        lw      a4,-40(s0)
        rem     a5,a4,a5
        bne     a5,zero,.L7
        li      a5,1
        j       .L8
.L7:
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
.L6:
        lw      a5,-20(s0)
        slli    a5,a5,2
        lw      a4,-36(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        bne     a5,zero,.L9
        li      a5,0
.L8:
        mv      a0,a5
        lw      s0,44(sp)
        addi    sp,sp,48
        jr      ra
fillPrime:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        li      a5,2
        sw      a5,-20(s0)
        sw      zero,-24(s0)
        j       .L11
.L13:
        lw      a1,-20(s0)
        lw      a0,-36(s0)
        call    divisibile
        mv      a5,a0
        bne     a5,zero,.L12
        lw      a5,-24(s0)
        slli    a5,a5,2
        lw      a4,-36(s0)
        add     a5,a4,a5
        lw      a4,-20(s0)
        sw      a4,0(a5)
        lw      a5,-24(s0)
        addi    a5,a5,1
        sw      a5,-24(s0)
.L12:
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
.L11:
        lw      a4,-24(s0)
        li      a5,4096
        addi    a5,a5,903
        ble     a4,a5,.L13
        nop
        nop
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC4:
        .string "Tempo: %f\n"
main:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        li      a5,20480
        addi    a0,a5,-480
        call    malloc
        mv      a5,a0
        sw      a5,-20(s0)
        call    clock
        sw      a0,-24(s0)
        lw      a0,-20(s0)
        call    fillPrime
        call    clock
        sw      a0,-28(s0)
        lw      a4,-28(s0)
        lw      a5,-24(s0)
        sub     a5,a4,a5
        fcvt.d.wu       fa4,a5
        lui     a5,%hi(.LC3)
        fld     fa5,%lo(.LC3)(a5)
        fdiv.d  fa5,fa4,fa5
        fsd     fa5,-40(s0)
        lw      a2,-40(s0)
        lw      a3,-36(s0)
        lui     a5,%hi(.LC4)
        addi    a0,a5,%lo(.LC4)
        call    printf
        li      a5,0
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC3:
        .word   0
        .word   1093567616