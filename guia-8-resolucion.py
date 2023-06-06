import math
from typing import List, T
import random
import numpy as np

# PRIMERA PARTE:

# Ejercicio 1.1) Están hechas con tipos genéricos.
def pertenece1(s: List[T], e: T) -> bool:
    i: int = 0
    while i < len(s):
        if e == s[i]:
            return True
        else:
            i+=1
    return False

def pertenece2(s: List[T], e: T) -> bool:
    for i in s:
        if e == i:
            return True
    return False

def pertenece3(s: List[T], e: T) -> bool:
    return s.count(e) > 0


# Ejercicio 1.2)
def divideATodos(s: list, e: int) -> bool:
    for i in s:
        if i%e != 0:
            return False
    return True


# Ejercicio 1.3)
def sumaTotal(s: list) -> int:
    suma: int = 0
    for num in s:
        suma += num
    return suma


# Ejercicio 1.4)
def ordenados(s: list) -> bool:
    for i in range(1, len(s)):
        if s[i-1] > s[i]:
            return False
    return True


# Ejercicio 1.5)
def mas_de7_letras(s: list) -> bool:
    for palabra in s:
        if len(palabra) > 7:
            return True
    return False


# Ejercicio 1.6)
def es_palindroma(palabra: str) -> bool:
    for i in range(len(palabra)):
        if palabra[i] == palabra[len(palabra)-i-1]:
            continue
        return False
    return True


# Ejercicio 1.7)  A < a < B < b < ... < Z < z
def fortaleza_contraseña(password: str) -> str:
    longitud: int = len(password)
    if longitud < 5:
            return "ROJA"    
    else:
        if longitud > 8:
            for caracter in password:
                if caracter.isupper():
                    for caracter in password:
                        if caracter.islower():
                            for caracter in password:
                                if caracter.isdigit():
                                        return "VERDE"
        return "AMARILLA"
        

# Ejercicio 1.8)
def saldo(movimientos: list) -> int:
    dinero: int = 0
    for mov in movimientos:
        if mov[0] == "I":
            dinero += mov[1]
        elif mov[0] == "R":
            dinero -= mov[1]
    return dinero


# Ejercicio 1.9)
a: list = ["A", "a"]
e: list = ["E", "e"]
i: list = ["I", "i"]
o: list = ["O", "o"]
u: list = ["U", "u"]
vocales: list = [a, e, i, o, u]

def es_vocal(letra: str) -> bool:
    for vocal in vocales:
        if pertenece1(vocal, letra):
            return True
    return False

def tres_vocales_distintas(palabra: str) -> bool:
    for letra1 in palabra:
        if es_vocal(letra1):
            for letra2 in palabra:
                if es_vocal(letra2) and letra2 != letra1:
                    for letra3 in palabra:
                        if es_vocal(letra3) and letra3 != letra1 and letra3 != letra2:
                            return True
    return False



# SEGUNDA PARTE:

# Ejercicio 2.1)
def posiciones_pares_inout(s: list) -> list:
    for i in range(1, len(s), 2):
        s[i] = 0
    return s


# Ejercicio 2.2)
def posiciones_pares_in(s: list) -> list:
    lista: list = []
    for i in range(len(s)):
        if i%2 == 0:
            lista.append(s[i])
        else:
            lista.append(0)
    return lista


# Ejercicio 2.3)
def sin_vocales(texto: str) -> str:
    res: str = ""
    for caracter in texto:
        if es_vocal(caracter):
            continue
        res += caracter
    return res


# Ejercicio 2.4)
def reemplazaVocales(s: list) -> list:
    res: str = ""
    for caracter in s:
        if es_vocal(caracter):
            caracter = "-"
        res += caracter
    return res


# Ejercicio 2.5)
def daVueltaStr(s: str) -> str:
    res: str = ""
    for i in range(len(s)):
        res += s[len(s)-i-1]
    return res


# Ejercicio 3.1)
def nombres_de_mis_estudiantes() -> list:
    lista: list = []
    while True:
        nombre: str = input("Ingrese un nombre, o ponga 'listo' para finalizar:")
        if nombre == 'listo':
            break
        lista.append(nombre)
    return lista


# Ejercicio 3.2)
def monedero_electronico() -> list:
    historial: list = []
    while True:
        movimiento: str = input("Ingrese:\n'C' para cargar creditos\n'D' para descontar creditos\n'X' para finalizar:\n\n")
        if movimiento == 'C':
            monto: int = int(input("Monto a cargar: "))
            historial.append((movimiento, monto))
        elif movimiento == 'D':
            monto: int = int(input("Monto a descontar: "))
            historial.append((movimiento, monto))
        elif movimiento == 'X':
            break
    return historial


# Ejercicio 3.3)
def siete_y_medio() -> list:
    historial: list = []
    puntuacion: float = 0
    valor: float = 0
    picks: int = 0
    while picks < 40:
        carta: int = random.randint(1,12)
        if carta == 8 or carta == 9:
                continue
        elif historial.count(carta) < 4:
            if (carta == 10 or carta == 11 or carta == 12):
                valor = 0.5
            else:
                valor = carta
            puntuacion += valor
            historial.append(carta)
            picks += 1
            decision: str = input("Agarraste una carta. Ingresa cualquier cosa para seguir, o 1 para plantarte: ")
            if decision == "1":
                if puntuacion > 7.5:
                    print("Lo siento, perdiste. Tu puntaje es", puntuacion)
                else:
                    print("Tu puntaje es", puntuacion)
                return historial
        else:
            continue
    print("No hay mas cartas. Tu puntaje es", puntuacion)
    return historial


# Ejercicio 4.1)
def perteneceACadaUno(s: list, e: int) -> list:
    res: list = []
    for i in s:
        res.append(pertenece1(i,e))
    return res


# Ejercicio 4.2)
def esMatriz(s: list) -> bool:
    ancho = len(s[0])
    for i in range(len(s)):
        if len(s[i]) != ancho:
            return False
    return True


# Ejercicio 4.3)
def filasOrdenadas(m: list) -> list:
    res = []
    for s in m:
        res.append(ordenados(s))
    return res


# Ejercicio 4.4) Para revisar mas adelante.