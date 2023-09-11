.data
numeros: .word 4, 3, 2, 1 #Define una lista de números en la memoria
minimo: .word 0 #Define una variable para almacenar el número máximo

.text
main:
    la $t0, numeros # Carga la dirección de la lista de números en el registro $t0
    lw $t1, 0($t0) # Carga el primer número de la lista en el registro $t1
    sw $t1, minimo # Almacena el primer número como el número minimo

    addi $t0, $t0, 4 # Avanza a la siguiente dirección de memoria para cargar el siguiente número
    lw $t1, 0($t0) # Carga el segundo número de la lista en el registro $t1
    lw $t2, minimo # Carga el número mínimo actual en el registro $t2
    slt $t3, $t1, $t2 # Compara si el segundo número es menor que el número mínimo actual
    beqz $t3, skip1 # Si no es menor, salta a la siguiente iteración
    sw $t1, minimo # Si es menor, almacena el segundo número como el nuevo número mínimo

skip1:
    addi $t0, $t0, 4 # Avanza a la siguiente dirección de memoria para cargar el siguiente número
    lw $t1, 0($t0) # Carga el tercer número de la lista en el registro $t1
    lw $t2, minimo # Carga el número mínimo actual en el registro $t2
    slt $t3, $t1, $t2 # Compara si el tercer número es menor que el número mínimo actual
    beqz $t3, skip2 # Si no es menor, salta a la siguiente iteración
    sw $t1, minimo # Si es menor, almacena el tercer número como el nuevo número mínimo

skip2:
    addi $t0, $t0, 4 # Avanza a la siguiente dirección de memoria para cargar el siguiente número
    lw $t1, 0($t0) # Carga el tercer cuarto de la lista en el registro $t1
    lw $t2, minimo # Carga el número mínimo actual en el registro $t2
    slt $t3, $t1, $t2 # Compara si el cuarto número es menor que el número mínimo actual
    beqz $t3, skip3 # Si no es menor, salta a la siguiente iteración
    sw $t1, minimo # Si es menor, almacena el cuarto número como el nuevo número mínimo

skip3:
    li $v0, 10 # Prepara para terminar la ejecución del programa
    syscall # Termina la ejecución del programa
