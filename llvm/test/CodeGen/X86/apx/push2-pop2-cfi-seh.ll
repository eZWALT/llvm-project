; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-linux-gnu | FileCheck %s --check-prefix=LIN-REF
; RUN: llc < %s -mtriple=x86_64-unknown-linux-gnu -mattr=+push2pop2 | FileCheck %s --check-prefix=LIN
; RUN: llc < %s -mtriple=x86_64-unknown-linux-gnu -mattr=+push2pop2,+ppx | FileCheck %s --check-prefix=LIN-PPX
; RUN: llc < %s -mtriple=x86_64-windows-msvc | FileCheck %s --check-prefix=WIN-REF
; RUN: llc < %s -mtriple=x86_64-windows-msvc -mattr=+push2pop2 | FileCheck %s --check-prefix=WIN
; RUN: llc < %s -mtriple=x86_64-windows-msvc -mattr=+push2pop2,+ppx | FileCheck %s --check-prefix=WIN-PPX

define i32 @csr6_alloc16(ptr %argv) {
; LIN-REF-LABEL: csr6_alloc16:
; LIN-REF:       # %bb.0: # %entry
; LIN-REF-NEXT:    pushq %rbp
; LIN-REF-NEXT:    .cfi_def_cfa_offset 16
; LIN-REF-NEXT:    pushq %r15
; LIN-REF-NEXT:    .cfi_def_cfa_offset 24
; LIN-REF-NEXT:    pushq %r14
; LIN-REF-NEXT:    .cfi_def_cfa_offset 32
; LIN-REF-NEXT:    pushq %r13
; LIN-REF-NEXT:    .cfi_def_cfa_offset 40
; LIN-REF-NEXT:    pushq %r12
; LIN-REF-NEXT:    .cfi_def_cfa_offset 48
; LIN-REF-NEXT:    pushq %rbx
; LIN-REF-NEXT:    .cfi_def_cfa_offset 56
; LIN-REF-NEXT:    subq $24, %rsp
; LIN-REF-NEXT:    .cfi_def_cfa_offset 80
; LIN-REF-NEXT:    .cfi_offset %rbx, -56
; LIN-REF-NEXT:    .cfi_offset %r12, -48
; LIN-REF-NEXT:    .cfi_offset %r13, -40
; LIN-REF-NEXT:    .cfi_offset %r14, -32
; LIN-REF-NEXT:    .cfi_offset %r15, -24
; LIN-REF-NEXT:    .cfi_offset %rbp, -16
; LIN-REF-NEXT:    #APP
; LIN-REF-NEXT:    #NO_APP
; LIN-REF-NEXT:    xorl %ecx, %ecx
; LIN-REF-NEXT:    xorl %eax, %eax
; LIN-REF-NEXT:    callq *%rcx
; LIN-REF-NEXT:    addq $24, %rsp
; LIN-REF-NEXT:    .cfi_def_cfa_offset 56
; LIN-REF-NEXT:    popq %rbx
; LIN-REF-NEXT:    .cfi_def_cfa_offset 48
; LIN-REF-NEXT:    popq %r12
; LIN-REF-NEXT:    .cfi_def_cfa_offset 40
; LIN-REF-NEXT:    popq %r13
; LIN-REF-NEXT:    .cfi_def_cfa_offset 32
; LIN-REF-NEXT:    popq %r14
; LIN-REF-NEXT:    .cfi_def_cfa_offset 24
; LIN-REF-NEXT:    popq %r15
; LIN-REF-NEXT:    .cfi_def_cfa_offset 16
; LIN-REF-NEXT:    popq %rbp
; LIN-REF-NEXT:    .cfi_def_cfa_offset 8
; LIN-REF-NEXT:    retq
;
; LIN-LABEL: csr6_alloc16:
; LIN:       # %bb.0: # %entry
; LIN-NEXT:    pushq %rax
; LIN-NEXT:    .cfi_def_cfa_offset 16
; LIN-NEXT:    push2 %r15, %rbp
; LIN-NEXT:    .cfi_def_cfa_offset 32
; LIN-NEXT:    push2 %r13, %r14
; LIN-NEXT:    .cfi_def_cfa_offset 48
; LIN-NEXT:    push2 %rbx, %r12
; LIN-NEXT:    .cfi_def_cfa_offset 64
; LIN-NEXT:    subq $32, %rsp
; LIN-NEXT:    .cfi_def_cfa_offset 96
; LIN-NEXT:    .cfi_offset %rbx, -64
; LIN-NEXT:    .cfi_offset %r12, -56
; LIN-NEXT:    .cfi_offset %r13, -48
; LIN-NEXT:    .cfi_offset %r14, -40
; LIN-NEXT:    .cfi_offset %r15, -32
; LIN-NEXT:    .cfi_offset %rbp, -24
; LIN-NEXT:    #APP
; LIN-NEXT:    #NO_APP
; LIN-NEXT:    xorl %ecx, %ecx
; LIN-NEXT:    xorl %eax, %eax
; LIN-NEXT:    callq *%rcx
; LIN-NEXT:    addq $32, %rsp
; LIN-NEXT:    .cfi_def_cfa_offset 64
; LIN-NEXT:    pop2 %r12, %rbx
; LIN-NEXT:    .cfi_def_cfa_offset 48
; LIN-NEXT:    pop2 %r14, %r13
; LIN-NEXT:    .cfi_def_cfa_offset 32
; LIN-NEXT:    pop2 %rbp, %r15
; LIN-NEXT:    .cfi_def_cfa_offset 16
; LIN-NEXT:    popq %rcx
; LIN-NEXT:    .cfi_def_cfa_offset 8
; LIN-NEXT:    retq
;
; LIN-PPX-LABEL: csr6_alloc16:
; LIN-PPX:       # %bb.0: # %entry
; LIN-PPX-NEXT:    pushq %rax
; LIN-PPX-NEXT:    .cfi_def_cfa_offset 16
; LIN-PPX-NEXT:    push2p %r15, %rbp
; LIN-PPX-NEXT:    .cfi_def_cfa_offset 32
; LIN-PPX-NEXT:    push2p %r13, %r14
; LIN-PPX-NEXT:    .cfi_def_cfa_offset 48
; LIN-PPX-NEXT:    push2p %rbx, %r12
; LIN-PPX-NEXT:    .cfi_def_cfa_offset 64
; LIN-PPX-NEXT:    subq $32, %rsp
; LIN-PPX-NEXT:    .cfi_def_cfa_offset 96
; LIN-PPX-NEXT:    .cfi_offset %rbx, -64
; LIN-PPX-NEXT:    .cfi_offset %r12, -56
; LIN-PPX-NEXT:    .cfi_offset %r13, -48
; LIN-PPX-NEXT:    .cfi_offset %r14, -40
; LIN-PPX-NEXT:    .cfi_offset %r15, -32
; LIN-PPX-NEXT:    .cfi_offset %rbp, -24
; LIN-PPX-NEXT:    #APP
; LIN-PPX-NEXT:    #NO_APP
; LIN-PPX-NEXT:    xorl %ecx, %ecx
; LIN-PPX-NEXT:    xorl %eax, %eax
; LIN-PPX-NEXT:    callq *%rcx
; LIN-PPX-NEXT:    addq $32, %rsp
; LIN-PPX-NEXT:    .cfi_def_cfa_offset 64
; LIN-PPX-NEXT:    pop2p %r12, %rbx
; LIN-PPX-NEXT:    .cfi_def_cfa_offset 48
; LIN-PPX-NEXT:    pop2p %r14, %r13
; LIN-PPX-NEXT:    .cfi_def_cfa_offset 32
; LIN-PPX-NEXT:    pop2p %rbp, %r15
; LIN-PPX-NEXT:    .cfi_def_cfa_offset 16
; LIN-PPX-NEXT:    popq %rcx
; LIN-PPX-NEXT:    .cfi_def_cfa_offset 8
; LIN-PPX-NEXT:    retq
;
; WIN-REF-LABEL: csr6_alloc16:
; WIN-REF:       # %bb.0: # %entry
; WIN-REF-NEXT:    pushq %r15
; WIN-REF-NEXT:    .seh_pushreg %r15
; WIN-REF-NEXT:    pushq %r14
; WIN-REF-NEXT:    .seh_pushreg %r14
; WIN-REF-NEXT:    pushq %r13
; WIN-REF-NEXT:    .seh_pushreg %r13
; WIN-REF-NEXT:    pushq %r12
; WIN-REF-NEXT:    .seh_pushreg %r12
; WIN-REF-NEXT:    pushq %rbp
; WIN-REF-NEXT:    .seh_pushreg %rbp
; WIN-REF-NEXT:    pushq %rbx
; WIN-REF-NEXT:    .seh_pushreg %rbx
; WIN-REF-NEXT:    subq $56, %rsp
; WIN-REF-NEXT:    .seh_stackalloc 56
; WIN-REF-NEXT:    .seh_endprologue
; WIN-REF-NEXT:    #APP
; WIN-REF-NEXT:    #NO_APP
; WIN-REF-NEXT:    xorl %eax, %eax
; WIN-REF-NEXT:    callq *%rax
; WIN-REF-NEXT:    nop
; WIN-REF-NEXT:    .seh_startepilogue
; WIN-REF-NEXT:    addq $56, %rsp
; WIN-REF-NEXT:    popq %rbx
; WIN-REF-NEXT:    popq %rbp
; WIN-REF-NEXT:    popq %r12
; WIN-REF-NEXT:    popq %r13
; WIN-REF-NEXT:    popq %r14
; WIN-REF-NEXT:    popq %r15
; WIN-REF-NEXT:    .seh_endepilogue
; WIN-REF-NEXT:    retq
; WIN-REF-NEXT:    .seh_endproc
;
; WIN-LABEL: csr6_alloc16:
; WIN:       # %bb.0: # %entry
; WIN-NEXT:    pushq %rax
; WIN-NEXT:    .seh_pushreg %rax
; WIN-NEXT:    push2 %r14, %r15
; WIN-NEXT:    .seh_pushreg %r15
; WIN-NEXT:    .seh_pushreg %r14
; WIN-NEXT:    push2 %r12, %r13
; WIN-NEXT:    .seh_pushreg %r13
; WIN-NEXT:    .seh_pushreg %r12
; WIN-NEXT:    push2 %rbx, %rbp
; WIN-NEXT:    .seh_pushreg %rbp
; WIN-NEXT:    .seh_pushreg %rbx
; WIN-NEXT:    subq $64, %rsp
; WIN-NEXT:    .seh_stackalloc 64
; WIN-NEXT:    .seh_endprologue
; WIN-NEXT:    #APP
; WIN-NEXT:    #NO_APP
; WIN-NEXT:    xorl %eax, %eax
; WIN-NEXT:    callq *%rax
; WIN-NEXT:    nop
; WIN-NEXT:    .seh_startepilogue
; WIN-NEXT:    addq $64, %rsp
; WIN-NEXT:    pop2 %rbp, %rbx
; WIN-NEXT:    pop2 %r13, %r12
; WIN-NEXT:    pop2 %r15, %r14
; WIN-NEXT:    popq %rcx
; WIN-NEXT:    .seh_endepilogue
; WIN-NEXT:    retq
; WIN-NEXT:    .seh_endproc
;
; WIN-PPX-LABEL: csr6_alloc16:
; WIN-PPX:       # %bb.0: # %entry
; WIN-PPX-NEXT:    pushq %rax
; WIN-PPX-NEXT:    .seh_pushreg %rax
; WIN-PPX-NEXT:    push2p %r14, %r15
; WIN-PPX-NEXT:    .seh_pushreg %r15
; WIN-PPX-NEXT:    .seh_pushreg %r14
; WIN-PPX-NEXT:    push2p %r12, %r13
; WIN-PPX-NEXT:    .seh_pushreg %r13
; WIN-PPX-NEXT:    .seh_pushreg %r12
; WIN-PPX-NEXT:    push2p %rbx, %rbp
; WIN-PPX-NEXT:    .seh_pushreg %rbp
; WIN-PPX-NEXT:    .seh_pushreg %rbx
; WIN-PPX-NEXT:    subq $64, %rsp
; WIN-PPX-NEXT:    .seh_stackalloc 64
; WIN-PPX-NEXT:    .seh_endprologue
; WIN-PPX-NEXT:    #APP
; WIN-PPX-NEXT:    #NO_APP
; WIN-PPX-NEXT:    xorl %eax, %eax
; WIN-PPX-NEXT:    callq *%rax
; WIN-PPX-NEXT:    nop
; WIN-PPX-NEXT:    .seh_startepilogue
; WIN-PPX-NEXT:    addq $64, %rsp
; WIN-PPX-NEXT:    pop2p %rbp, %rbx
; WIN-PPX-NEXT:    pop2p %r13, %r12
; WIN-PPX-NEXT:    pop2p %r15, %r14
; WIN-PPX-NEXT:    popq %rcx
; WIN-PPX-NEXT:    .seh_endepilogue
; WIN-PPX-NEXT:    retq
; WIN-PPX-NEXT:    .seh_endproc
entry:
  tail call void asm sideeffect "", "~{rbp},~{r15},~{r14},~{r13},~{r12},~{rbx},~{dirflag},~{fpsr},~{flags}"()
  %a = alloca [3 x ptr], align 8
  %b = call ptr (...) null()
  ret i32 undef
}
