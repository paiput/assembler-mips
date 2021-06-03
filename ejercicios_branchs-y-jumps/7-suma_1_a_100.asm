# Escribir un programa en MIPS que sume los números del 1 al 100.
.data
msg: .asciiz "La suma de todos los numeros del 1 al 100 es: "
# lineBreak: .asciiz "\n"

.text
.globl main
main:
  li            $v0, 4            #
  la            $a0, msg          #
  syscall                         # imprime msg

loop:
  addi        $t1, $t1, 1         # $t1 = $t1 + 1 es el valor que voy a sumar en cada vuelta
  add         $t0, $t0, $t1       # $t0 = $t0 + $t1 es el acumulador del resultado

  # li          $v0, 1              
  # move        $a0, $t1
  # syscall
  # li          $v0, 4
  # la          $a0, lineBreak
  # syscall  

  beq         $t1, 100, exit      # if ($t1 === 100) { jump to exit } cuando sume el 100 el acumulador termina el loop
  j           loop                # else { jump to loop }

exit:
  li          $v0, 1              # codigo para imprimir un numero
  move        $a0, $t0            # carga el numero en $a0
  syscall                         # imprime el numero

  li          $v0, 10             #
  syscall                         # cierra el programa