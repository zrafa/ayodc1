
# uart.s E/S por el UART del AR9331 (TL-MR3020)
# MIPS32 big endian, Linux o32, sin libc.



# ---- Syscalls de Linux MIPS o32 ----
        .equ SYS_exit,    4001
        .equ SYS_open,    4005
        .equ SYS_mmap2,   4210

# ---- Constantes ----
        .equ O_RDWR_SYNC, 0x4012        # O_RDWR | O_SYNC (valores de MIPS)
        .equ PROT_RW,     3             # PROT_READ | PROT_WRITE
        .equ MAP_SHARED,  1




        .data
devmem: .asciz "/dev/mem"




# ---- Registros de E/S del UART (AR933x) ----
	uart_data:  .word       # COMPLETAR CON UART_PHYS: dir del registro DATA desplazado >> 12 
	uart_mascara: .word     # mascara podría ser util 




        .text
        .globl _start
_start:
        addiu   $sp, $sp, -32           # lugar para los args 5 y 6 de mmap2

        # fd = open("/dev/mem", O_RDWR|O_SYNC)
        la      $a0, devmem
        li      $a1, O_RDWR_SYNC
        li      $v0, SYS_open
        syscall
        bnez    $a3, error              # a3 != 0 -> la syscall fallo
        sw      $v0, 16($sp)            # 5to arg de mmap2: fd

        # base = mmap2(0, 4096, PROT_RW, MAP_SHARED, fd, UART_PGOFF)
	lw 	$t0, uart_data
        sw      $t0, 20($sp)            # 6to arg de mmap2: offset
        move    $a0, $zero
        li      $a1, 4096
        li      $a2, PROT_RW
        li      $a3, MAP_SHARED
        li      $v0, SYS_mmap2
        syscall
        bnez    $a3, error
        move    $s0, $v0                # s0 = direccion virtual del UART






	# COMPLETAR DEBAJO CON ENTRADA SALIDA PROGRAMADA
        # Para Enviar una letra o frase :)

	# En el registro $s0 queda la dirección virtual del registro DATA del dispositivo de E/S uart

	# Cómo enviar un byte (o letra ASCII)
	# 1. Esperar a que el dispositivo esté disponible
	# 2. Preparar el dato (letra) y el bit de transmisición en 1 en un registro de propósito general
	# 3. Escribir el registro de propósito general en el registro DATA del dispositivo








        # exit(0)
        li      $a0, 0
        j       do_exit
error:
        li      $a0, 1
do_exit:
        li      $v0, SYS_exit
        syscall

