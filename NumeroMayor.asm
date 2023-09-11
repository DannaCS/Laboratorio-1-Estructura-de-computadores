.data
numeros: .word 4, 3, 2, 1 #Define una lista de números en la memoria
maximo: .word 0 #Define una variable para almacenar el número máximo

.text
main:
    la $t0, numeros # Carga la dirección de la lista de números en el registro $t0
    lw $t1, 0($t0) # Carga el primer número de la lista en el registro $t1
    sw $t1, maximo # Almacena el primer número como el número máximo

    addi $t0, $t0, 4 # Avanza a la siguiente dirección de memoria para cargar el siguiente número
    lw $t1, 0($t0) # Carga el segundo número de la lista en el registro $t1
    lw $t2, maximo # Carga el número máximo actual en el registro $t2
    slt $t3, $t2, $t1 # Compara si el segundo número es mayor que el número máximo actual
    beqz $t3, skip1 # Si no es mayor, salta a la siguiente iteración
    sw $t1, maximo # Si es mayor, almacena el segundo número como el nuevo número máximo

skip1:
    addi $t0, $t0, 4 # Avanza a la siguiente dirección de memoria para cargar el siguiente número
    lw $t1, 0($t0) # Carga el tercer número de la lista en el registro $t1
    lw $t2, maximo # Carga el número máximo actual en el registro $t2
    slt $t3, $t2, $t1 # Compara si el tercer número es mayor que el número máximo actual
    beqz $t3, skip2 # Si no es mayor, salta a la siguiente iteración
    sw $t1, maximo # Si es mayor, almacena el tercer número como el nuevo número máximo

skip2:
    addi $t0, $t0, 4 # Avanza a la siguiente dirección de memoria para cargar el siguiente número
    lw $t1, 0($t0) # Carga el cuarto número de la lista en el registro $t1
    lw $t2, maximo # Carga el número máximo actual en el registro $t2
    slt $t3, $t2, $t1 # Compara si el cuarto número es mayor que el número máximo actual
    beqz $t3, skip3 # Si no es mayor, salta a la siguiente iteración
    sw $t1, maximo # Si es mayor, almacena el cuarto número como el nuevo número máximo

skip3:
    li $v0, 10 # Prepara para terminar la ejecución del programa
    syscall # Termina la ejecución del programa
