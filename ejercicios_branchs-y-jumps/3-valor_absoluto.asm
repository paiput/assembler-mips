# Escribir un programa en MIPS que devuelva el valor absoluto de un número ingresado por el usuario.
.data
prompt: .asciiz "Ingrese un número para retornar su valor absoluto: "
response: .asciiz "El valor absoluto de su numero es: "

.text
.globl main
main:
  li            $v0, 4                  #
  la            $a0, prompt             #
  syscall                               # imprime mensaje de prompt

  li            $v0, 5                  #
  syscall                               # lee el input del usuario
  move          $t0, $v0                # guarda el ese input en $t0

  bgez          $t0, exit               # if ($t0 >= 0) { jump to exit }

  move          $t1, $zero              # inicializa $t1 con valor 0
  
loop:
  addi          $t1, $t1, 1             # le suma 1 a $t1
  addi          $t0, $t0, 1             # le suma 1 a $t0

  bne           $t0, $zero, loop        # if ($t0 != 0) { jump to loop }

  add           $t0, $t0, $t1           # $t0 = $t0 + $t1

exit:
  li            $v0, 4                  #
  la            $a0, response           #
  syscall                               # imprime mensaje response
  li            $v0, 1                  # codigo para imprimir numero
  move          $a0, $t0                # mueve el valor con el numero a $a0 para poder imprimirlo
  syscall                               # lo imprime

  li            $v0, 10                 #
  syscall                               # cierra el programa