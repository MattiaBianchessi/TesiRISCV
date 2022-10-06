.LC0:
        .string "%d"
.LC1:
        .string "]"
.LC2:
        .string ", "
printArray:
        addi    sp,sp,-32
        sw      s0,24(sp)
        mv      s0,a0
        li      a0,91
        sw      ra,28(sp)
        sw      s1,20(sp)
        sw      s2,16(sp)
        sw      s3,12(sp)
        call    putchar
        lw      a1,0(s0)
        beq     a1,zero,.L1
        addi    s0,s0,4
        lui     s2,%hi(.LC0)
        lui     s3,%hi(.LC2)
        lui     s1,%hi(.LC1)
        j       .L5
.L12:
        call    puts
        lw      a1,0(s0)
        addi    s0,s0,4
        beq     a1,zero,.L1
.L5:
        addi    a0,s2,%lo(.LC0)
        call    printf
        lw      a5,0(s0)
        addi    a0,s1,%lo(.LC1)
        beq     a5,zero,.L12
        addi    a0,s3,%lo(.LC2)
        call    printf
        lw      a1,0(s0)
        addi    s0,s0,4
        bne     a1,zero,.L5
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
        beq     a0,zero,.L13
        addi    a5,a5,4
        j       .L15
.L22:
        lw      a0,-4(a5)
        beq     a0,zero,.L21
.L15:
        rem     a0,a1,a0
        addi    a5,a5,4
        bne     a0,zero,.L22
        li      a0,1
.L13:
        ret
.L21:
        ret
fillPrime:
        li      a1,4096
        li      a2,0
        li      a3,2
        addi    a1,a1,904
.L24:
        lw      a5,0(a0)
        addi    a4,a0,4
        bne     a5,zero,.L26
        j       .L27
.L35:
        lw      a5,-4(a4)
        beq     a5,zero,.L27
.L26:
        rem     a5,a3,a5
        addi    a4,a4,4
        bne     a5,zero,.L35
        addi    a3,a3,1
        bne     a2,a1,.L24
.L23:
        ret
.L27:
        slli    a5,a2,2
        add     a5,a0,a5
        sw      a3,0(a5)
        addi    a2,a2,1
        addi    a3,a3,1
        bne     a2,a1,.L24
        j       .L23
.LC4:
        .string "Tempo: %f\n"
main:
        li      a0,20480
        addi    sp,sp,-32
        addi    a0,a0,-480
        sw      ra,28(sp)
        sw      s0,24(sp)
        sw      s1,20(sp)
        call    malloc
        mv      s1,a0
        call    clock
        mv      s0,a0
        mv      a0,s1
        call    fillPrime
        call    clock
        sub     a0,a0,s0
        lui     a5,%hi(.LC3)
        fcvt.d.wu       fa4,a0
        fld     fa5,%lo(.LC3)(a5)
        lui     a0,%hi(.LC4)
        addi    a0,a0,%lo(.LC4)
        fdiv.d  fa5,fa4,fa5
        fsd     fa5,8(sp)
        lw      a2,8(sp)
        lw      a3,12(sp)
        call    printf
        lw      ra,28(sp)
        lw      s0,24(sp)
        lw      s1,20(sp)
        li      a0,0
        addi    sp,sp,32
        jr      ra
.LC3:
        .word   0
        .word   1093567616