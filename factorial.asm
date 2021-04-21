.data   
 prompt: .asciiz "Ingrese numero: "
 msg: .asciiz "El factorial es: "

.text
.globl main
main:
    li     $t1, 1              # factorial = 1
    li     $v0, 4              # codigo para imprimir mensaje
    la     $a0, prompt         # carga la direccion de prompt para imprimirlo
    syscall                    # imprime el mensaje
    li     $v0, 5              # codigo para escanear el input
    syscall                    # escanea el input
    move   $t0, $v0            # mueve el input escaneado a $t0
    bne    $t0, $zero, loop    # if ($t0 == 0) { loop } 
    li     $v0, 4              # codigo para imprimir mensaje 
    la     $a0, msg            # carga la direccion de msg para imprimirlo
    syscall                    # imprime el mensaje
    li     $v0, 1              # codigo para imprimir numero
    li     $a0, 1              # carga el numero 1 en $a0
    syscall                    # imprime el numero
    li     $v0, 10             # codigo para cerrar el programa
    syscall                    # cierra el programa
loop:
    beq    $t0, $zero, exit    # if ($t0 == 0) { exit }
    mul    $t1, $t0, $t1       # $t1 = $t0 * $t1
    addi   $t0, $t0, -1        # $t0 = $t0 + 1
    j loop                     # vuelve a loop:
exit:
    li     $v0, 4              # codigo para imprimir un mensaje
    la     $a0, msg            # carga la direccion de sg para imprimirlo
    syscall                    # imprime el mensaje
    li     $v0, 1              # codigo para imprimir un numero
    move   $a0, $t1            # mueve el valor de $t1 a $a0 para poder imprimirlo
    syscall                    # imprime el valor almacenado en $a0
    li     $v0, 10             # codigo para cerrar el programa
    syscall                    # cierra el programa