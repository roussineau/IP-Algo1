import math


# Ejercicio 1.1)
def raizDe2():
    raizDe2: float = round(math.sqrt(2),4)
    return raizDe2


# Ejercicio 1.2)
def imprimir_hola():
    print("hola")


# Ejercicio 1.3)
def imprimir_un_verso():
    verso: str = "Fabi me preguntó\nSi creía en los ovnis\nLe contesté que sí\n¿Qué le iba a decir a la chica más hermosa del mundo?"
    print(verso)


# Ejercicio 1.4)
def factorial(x: int) -> int:
    res: int = 1
    for i in range(1, x+1, 1):
        res *= i
    return res
    
def factorial_de_dos() -> int:
    return factorial(2)


# Ejercicio 1.5)
def factorial_de_tres() -> int:
    return factorial(3)


# Ejercicio 1.6)
def factorial_de_cuatro() -> int:
    return factorial(4)


# Ejercicio 1.7)
def factorial_de_cinco() -> int:
    return factorial(5)


# Ejercicio 2.1)
def imprimir_saludo(nombre: str) -> str:
    print("Hola", nombre)


# Ejercicio 2.2)
def raiz_cuadrada_de(numero: int) -> int:
    return math.sqrt(numero)


# Ejercicio 2.3)
def imprimir_dos_veces(estribillo: str):
    print(estribillo*2)


# Ejercicio 2.4)
def es_multiplo_de(n: int, m: int) -> bool:
    return n%m == 0


# Ejercicio 2.5)
def es_par(numero: int) -> bool:
    return es_multiplo_de(numero, 2)


# Ejercicio 2.6)
def cantidad_de_pizzas(comensales: int, min_cant_de_porciones: int) -> int:
    pizzas: int = 0
    porciones: int = 0
    while (comensales*min_cant_de_porciones > porciones):
        pizzas += 1
        porciones = 8*pizzas
    return pizzas


# Ejercicio 3.1)
def alguno_es_0(numero1: int, numero2: int):
    return numero1 == 0 or numero2 == 0


# Ejercicio 3.2)
def ambos_son_0(numero1: int, numero2: int):
    return numero1 == 0 and numero2 == 0


# Ejercicio 3.3)
def es_nombre_largo(nombre: str) -> bool:
    return 3 <= len(nombre) <= 8


# Ejercicio 3.4)
def es_bisiesto(año: int):
    return año%400 == 0 or (año%4 == 0 and año%100 != 0)


# Ejercicio 4)
def peso_pino(altura: int) -> int:
    peso: int = 0
    if altura > 3:
        peso = 3*3*100 + 2*(altura-3)*100
    else:
        peso = 3*altura*100
    return peso

def es_peso_util(peso: int) -> bool:
    return 400 <= peso <= 1000

def sirve_pino(altura: int) -> bool:
    return es_peso_util(peso_pino(altura))


# Ejercicio 5.1)
def devolver_el_doble_si_es_par(un_numero: int) -> int:
    if un_numero%2 == 0:
        return un_numero*2
    else:
        return un_numero


# Ejercicio 5.2)
def devolver_valor_si_es_par_sino_el_que_sigue(un_numero: int) -> int:
    if un_numero%2 == 0:
        return un_numero
    else:
        return un_numero+1


# Ejercicio 5.3)
def devolver_el_doble_si_es_multiplo_de3_el_triple_si_es_multiplo_de_9(un_numero: int) -> int:
    if un_numero%9 == 0:
        return un_numero*3
    elif un_numero%3 == 0:
        return un_numero*2
    else:
        return un_numero

# Ejercicio 5.4)
def tu_nombre(nombre: str) -> str:
    if len(nombre) >= 5:
        return "Tu nombre tiene muchas letras!"
    else:
        return "Tu nombre tiene menos de 5 caracteres"


# Ejercicio 5.5)
def censo(sexo: str, edad: int) -> str:
    respuesta: str = ""
    if edad < 18:
        respuesta = "Andá de vacaciones"
    elif sexo == "M":
        if edad >= 65:
            respuesta = "Andá de vacaciones"
        else:
            respuesta = "Te toca trabajar"
    elif sexo == "F":
        if edad >= 60:
            respuesta = "Andá de vacaciones"
        else:
            respuesta = "Te toca trabajar"    
    print(respuesta)


# Ejercicio 6.1)
def cuenta_al10():
    i: int = 0
    while i < 10:
        i+=1
        print(i)


# Ejercicio 6.2)
def pares_del10_al40():
    i: int = 10
    while i<=40:
        print(i)
        i += 2


# Ejercicio 6.3)
def eco10():
    i = 0
    while i < 10:
        print("eco")
        i +=1


# Ejercicio 6.4)
def cuenta_despegue(numero: int):
    while numero > 0:
        print(numero)
        numero -= 1
    print("Despegue")


# Ejercicio 6.5)
def viaje_al_pasado(partida: int, llegada: int):
    while llegada < partida:
        partida-=1
        print("Viajó un año al pasado, estamos en el año", partida)


# Ejercicio 6.6)
def conocer_a_Aristoteles(partida: int):
    while partida-20 >= -384:
        partida -=20
        print("Viajó un año al pasado, estamos en el año", partida)


# Ejercicio 7)
def cuenta_al10__7():
    for i in range(1,11,1):
        print(i)

def pares_del10_al40__7():
    for i in range(10,41,2):
        print(i)

def eco10__7():
    for i in range(0,10,1):
        print("eco")

def cuenta_despegue__7(numero: int):
    for i in range(numero,0,-1):
        print(i)
    print("Despegue")

def viaje_al_pasado__7(partida: int, llegada: int):
    for i in range(partida-1,llegada-1,-1):
        print("Viajó un año al pasado, estamos en el año", i)

def conocer_a_Aristoteles__7(partida: int):
    for i in range(partida-20,-385,-20):
        print("Viajó un año al pasado, estamos en el año", i)
