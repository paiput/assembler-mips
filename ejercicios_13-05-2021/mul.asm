.data
prompt_num1: .asciiz "Ingrese el primer numero que quiere multiplicar: "
prompt_num2: .asciiz "Ingrese el segundo numero que quiere multiplicar: "
producto_msg: .asciiz "El resultado es: "

.text
.globl main
main: 
  li            $v0, 4              
  la            $a0, prompt_num1    
  syscall                           # imprime el mensaje de prompt_num1
  li            $v0, 5              
  syscall                           # lee el input del usuario
  move          $t0, $v0            # lo copia en $t0

  li            $v0, 4              
  la            $a0, prompt_num2 
  syscall                           # imprime el mensaje de prompt_num2
  li            $v0, 5                
  syscall                           # lee el input del usuario
  move          $t1, $v0            # lo copia en $t1

  move          $a0, $t0            # copia el valor de $t0 en $a0 (que es un parametro de la funcion multiplicar)
  move          $a1, $t1            # copia el valor de $t1 en $a1 (que es un parametro de la funcion multiplicar)

  jal           multiplicar         # salta a multiplicar y guarda la direccion de retorno
  move          $t2, $v0            # copia el valor de retorno de la funcion en $t2

  li            $v0, 4
  la            $a0, producto_msg
  syscall                           # imprime el mensaje de producto_msg
  li            $v0, 1
  move          $a0, $t2            # copia el valor de $t2 en el registro $a0 para poder imprimirlo
  syscall                           # imprime el valor de $a0

  li            $v0, 10
  syscall                           # cierra el programa


multiplicar:
  mul           $v0, $a0, $a1       # $v0 = $a0 * $a1
  jr            $ra                 # retorna el valor de la funcion que esta guardado en $v0