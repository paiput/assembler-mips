.data
msg: .asciiz "Ingrese 0 para obtener el resultado de la suma\n"
prompt: .asciiz "Ingrese numero a la suma: "
result: .asciiz "El resultado de la suma de todos sus numeros es: " 

.text
.globl main
main:
  li            $v0, 4              # codigo para imprimir un string
  la            $a0, msg            # carga la direccion de msg en $a0
  syscall                           # imprime el string

loop:
  li            $v0, 4              # codigo para imprimir un string
  la            $a0, prompt         # carga la dirección de prompt en $a0
  syscall                           # imprime el string
  li            $v0, 5              # codigo para leer input el usuario
  syscall                           # lee el input del usuario
  
  move          $t0, $v0            # carga el valor de $v0 en $t0
  beq           $t0, $zero, exit    # if ($t0 == 0) { goto exit }
  add           $t1, $t1, $t0       # else $t1 = $t1 + $t0
  j             loop                # jump to loop
  
exit:
  li            $v0, 4              # codigo para imprimir un string
  la            $a0, result         # carga la direccion de result en $a0
  syscall                           # imprime el string
  li            $v0, 1              # codigo para imprimir un int
  move          $a0, $t1            # carga el valor $t1 en $a0
  syscall                           # imprime el int (valor en $a0)

  li            $v0, 10             # codigo para cerrar el programa
  syscall                           # cierra el programa