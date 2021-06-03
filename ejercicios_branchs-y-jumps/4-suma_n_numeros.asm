.data
prompt: .asciiz "Ingrese un numero para agregar a la suma o 0 para recibir el resultado: "
result: .asciiz "El resultado de todos sus numeros sumados es: "

.text
.globl main
main:

loop:
  li            $v0, 4            #
  la            $a0, prompt       #
  syscall                         #

  li            $v0, 5            #
  syscall                         #
  move          $t0, $v0          #

  beq           $t0, $zero, exit  #

  add           $t1, $t1, $t0     #
  j             loop              #

exit:
  li            $v0, 4            #
  la            $a0, result       #
  syscall                         #
  li            $v0, 1            #
  move          $a0, $t1          #
  syscall                         #

  li            $v0, 10           #
  syscall                         #