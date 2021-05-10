.data
prompt: .asciiz "Ingrese un numero para saber si es par o impar: "
parmsg: .asciiz " es par\n"
imparmsg: .asciiz " es impar\n"

.text
.globl main
main:
  li          $v0, 4                  # codigo para imprimir string
  la          $a0, prompt                # carga el valor de prompt en $a0
  syscall                             # imprime el valor de $a0
 
  li          $v0, 5                  # codigo para leer input del usuario
  syscall                             # lee el input del usuario

  move        $t0, $v0                # mueve el valor de $v0 a $t0
  rem         $t1, $t0, 2             # $t1 = $t0 % 2
  beq         $t1, $zero, par         # if ($t1 == 0) { goto par }
  j           impar                   # else jump to impar

par:
  li          $v0, 1                  # codigo para imprimir int
  move        $a0, $t0                # carga $t0 en $a0
  syscall                             # imprime el valor de $a0
  li          $v0, 4                  # codigo para imprimir un string
  la          $a0, parmsg             # carrga el valor parmsg en $a0
  syscall                             # imprime el valor de $a0
  j           exit                    # jump to exit

impar:
  li          $v0, 1                  # codigo para imprimir int
  move        $a0, $t0                # carga $t0 en $a0
  syscall                             # imprime el valor de $a0
  li          $v0, 4                  # codigo para imprimir un string
  la          $a0, imparmsg           # carrga el valor imparmsg en $a0
  syscall                             # imprime el valor de $a0
  j           exit                    # jump to exit

exit: 
  li          $v0, 10                 # codigo para cerrar el programa
  syscall                             # cierra el programa