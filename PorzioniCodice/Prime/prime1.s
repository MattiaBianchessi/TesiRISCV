.LC0:
        .string "%d"
.LC1:
        .string "]"
.LC2:
        .string ", "
printArray:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        sw      s1,20(sp)
        sw      s2,16(sp)
        sw      s3,12(sp)
        mv      s0,a0
        li      a0,91
        call    putchar
        lw      a1,0(s0)
        beq     a1,zero,.L1
        addi    s0,s0,4
        lui     s1,%hi(.LC0)
        lui     s3,%hi(.LC2)
        lui     s2,%hi(.LC1)
        j       .L5
.L3:
        addi    a0,s3,%lo(.LC2)
        call    printf
.L4:
        addi    s0,s0,4
        lw      a1,-4(s0)
        beq     a1,zero,.L1
.L5:
        addi    a0,s1,%lo(.LC0)
        call    printf
        lw      a5,0(s0)
        bne     a5,zero,.L3
        addi    a0,s2,%lo(.LC1)
        call    puts
        j       .L4
.L1:
        lw      ra,28(sp)
        lw      s0,24(sp)
        lw      s1,20(sp)
        lw      s2,16(sp)
        lw      s3,12(sp)
        addi    sp,sp,32
        jr      ra
divisibile:
        mv      a5,a0
        lw      a0,0(a0)
        beq     a0,zero,.L8
        addi    a5,a5,4
.L10:
        rem     a0,a1,a0
        beq     a0,zero,.L11
        addi    a5,a5,4
        lw      a0,-4(a5)
        bne     a0,zero,.L10
        ret
.L11:
        li      a0,1
.L8:
        ret
fillPrime:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        sw      s1,20(sp)
        sw      s2,16(sp)
        sw      s3,12(sp)
        mv      s2,a0
        li      s1,0
        li      s0,2
        li      s3,4096
        addi    s3,s3,903
        j       .L15
.L14:
        addi    s0,s0,1
        bgt     s1,s3,.L18
.L15:
        mv      a1,s0
        mv      a0,s2
        call    divisibile
        bne     a0,zero,.L14
        slli    a5,s1,2
        add     a5,s2,a5
        sw      s0,0(a5)
        addi    s1,s1,1
        j       .L14
.L18:
        lw      ra,28(sp)
        lw      s0,24(sp)
        lw      s1,20(sp)
        lw      s2,16(sp)
        lw      s3,12(sp)
        addi    sp,sp,32
        jr      ra
.LC4:
        .string "Tempo: %f\n"
main:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        sw      s1,20(sp)
        li      a0,20480
        addi    a0,a0,-480
        call    malloc
        mv      s1,a0
        call    clock
        mv      s0,a0
        mv      a0,s1
        call    fillPrime
        call    clock
        sub     a0,a0,s0
        fcvt.d.wu       fa4,a0
        lui     a5,%hi(.LC3)
        fld     fa5,%lo(.LC3)(a5)
        fdiv.d  fa5,fa4,fa5
        fsd     fa5,8(sp)
        lw      a2,8(sp)
        lw      a3,12(sp)
        lui     a0,%hi(.LC4)
        addi    a0,a0,%lo(.LC4)
        call    printf
        li      a0,0
        lw      ra,28(sp)
        lw      s0,24(sp)
        lw      s1,20(sp)
        addi    sp,sp,32
        jr      ra
.LC3:
        .word   0
        .word   1093567616