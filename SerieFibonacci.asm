.data
n: .word 10 # Define el número de términos de la serie de Fibonacci que se van a generar
fibonacci: .space 40 # Reserva espacio en la memoria para almacenar la serie de Fibonacci

.text
main:
    li $t0, 0 # Inicializa el primer término de la serie de Fibonacci en 0
    li $t1, 1 # Inicializa el segundo término de la serie de Fibonacci en 1
    la $t2, fibonacci # Carga la dirección de memoria donde se almacenará la serie de Fibonacci
    sw $t0, 0($t2) # Almacena el primer término en la memoria
    sw $t1, 4($t2) # Almacena el segundo término en la memoria
    lw $t3, n # Carga el número de términos que se van a generar
    addi $t3, $t3, -2 # Resta 2 al número de términos porque ya se han generado los dos primeros términos

loop:
    add $t4, $t0, $t1 # Suma los dos últimos términos para generar el siguiente término de la serie
    addi $t2, $t2, 4 # Avanza a la siguiente dirección de memoria para almacenar el siguiente término
    sw $t4, 0($t2) # Almacena el nuevo término en la memoria
    move $t0, $t1 # Actualiza el penúltimo término con el valor del último término
    move $t1, $t4 # Actualiza el último término con el valor del nuevo término
    addi $t3, $t3, -1 # Decrementa el contador del número de términos que quedan por generar
    bnez $t3, loop # Si aún quedan términos por generar, vuelve al inicio del bucle

end:
    li $v0, 10 # Prepara para terminar la ejecución del programa
    syscall # Termina la ejecución del programa