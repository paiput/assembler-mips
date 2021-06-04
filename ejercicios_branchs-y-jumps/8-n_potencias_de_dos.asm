# Escribir un programa que imprima las primeras n potencias de dos, siendo n un número ingresado por el usuario. 
# Al finalizar el programa debe imprimir la suma de las potencias calculadas.
.data
start: .asciiz "Ingrese un numero n para saber las primeras n potencias de 2 y luego sumarlas\n"
prompt: .asciiz "n: "
resMsg1: .asciiz "2 ** "
resMsg2: .asciiz " = "
lineBreak: .asciiz "\n"
response: .asciiz "La suma de todas esas potencias es: "

.text
.globl main
main:
  li            $v0, 4            #
  la            $a0, start        #
  syscall                         #
  li            $v0, 4            #
  la            $a0, prompt       #
  syscall                         #
  li            $v0, 5            # 
  syscall                         # lee el input del usuario
  move          $t0, $v0          # guarda ese input en $t0

  move          $t1, $zero        # $t1 = 0
  addi          $t2, $t2, 1       # $t2 = 0 + 1
loop:  
  li            $v0, 4            #
  la            $a0, resMsg1      #
  syscall                         # imprime resMsg1
  li            $v0, 1            # codigo para imprimir numero
  move          $a0, $t1          # guarda el valor de $t1 para poder imprimirlo
  syscall                         # imprime el numero guardado en $t1
  li            $v0, 4            #
  la            $a0, resMsg2      #
  syscall                         # imprime resMsg2
  li            $v0, 1            # codigo para imprimir numero
  move          $a0, $t2          # guarda el valor de $t2 para poder imprimirlo
  syscall                         # imprime el numero guardado en $t2
  li            $v0, 4            #
  la            $a0, lineBreak    #
  syscall                         # imprime un salto de linea
  # cada linea seria asi: 2 ** $t1 = $t2 reemplazando $t1 y $t2 por sus respectivos valores

  add           $t3, $t3, $t2     # $t3 += $t2  va sumando el resultado de cada potencia de 2

  beq           $t1, $t0, exit    # if ($t1 === $t0) { jump to exit }
  
  mul           $t2, $t2, 2       # $t2 *= 2

  addi          $t1, $t1, 1       # $t1 += 1
  j             loop              # jump to loop

exit:
  li            $v0, 4            #
  la            $a0, response     #
  syscall                         # imprime response
  li            $v0, 1            # codigo para imprimir numero
  move          $a0, $t3          # guarda el valor de $t3 en $a0 para poder imprimirlo
  syscall                         # imrpime el numero guardado en $t3

  li            $v0, 10           # codigo para cerrar el programa
  syscall                         # cierra el programa