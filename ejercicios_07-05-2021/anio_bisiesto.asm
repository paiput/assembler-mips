# tiene que ser divisible por 4 siempre
# si es divisible por 4 y NO por 100 es bisiesto
# si es divisble por 100 y TAMBIEN por 400 es bisiesto
.data
prompt: .asciiz "Ingrese anio: "
nomsg: .asciiz " no es bisiesto\n"
yesmsg: .asciiz " es bisiesto\n"

.text
.globl main
main:
  li          $v0, 4                  # codigo para imprimir string
  la          $a0, prompt             # carga direccion del string
  syscall                             # imprime el string
  
  li          $v0, 5                  # codigo para leer input del usuario
  syscall                             # lee el input del usuario
  
  move        $t0, $v0                # $t0 = valor leido luego del prompt 
  rem         $t1, $t0, 4             # $t1 = $t0 % 4
  beq         $t1, $zero, step2       # if ($t0 == 0) { goto step2 }
  j           no                      # else jump to no

step2:
  rem         $t1, $t0, 100           # $t1 = $t0 % 100
  bne         $t1, $zero, yes         # if ($t0 != 0) { goto yes }
  j           step3                   # else jump to step3

step3:
  rem         $t1, $t0, 400           # $t1 = $t0 % 400
  beq         $t0, $zero, yes         # if ($t0 == 0) { goto yes }
  j           no                      # else jump to no

no:
  li          $v0, 1                  # codigo para imprimir int
  move        $a0, $t0                # carga $t0 en $a0
  syscall                             # imprime el valor de $a0
  li          $v0, 4                  # codigo para imprimir string
  la          $a0, nomsg              # carga el valor de nomsg
  syscall                             # imprime el string
  j           exit                    # jump to exit

yes:
  li          $v0, 1                  # codigo para imprimir int
  move        $a0, $t0                # carga $t0 en $a0
  syscall                             # imprime el valor de $a0
  li          $v0, 4                  # codigo para imprimir string
  la          $a0, yesmsg             # carga el valor de yesmsg
  syscall                             # imprime el string
  j           exit                    # jump to exit

exit:
  li          $v0, 10                 # codigo para cerrar el programa
  syscall                             # cierra el programa