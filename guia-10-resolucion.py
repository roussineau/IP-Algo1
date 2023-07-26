import os
import random
from queue import LifoQueue as Pila
from queue import LifoQueue as Cola
from array import *

directorio_actual = os.getcwd()

nuevo_directorio = "C:/Users/Santi/OneDrive/Escritorio/computacion/primer-anio/primer-cuatrimestre/IP-Algo1"
os.chdir(nuevo_directorio)



# ARCHIVOS

# Ejercicio 1.1)
def contarlineas(nombre_archivo: str) -> int:
    archivo = open(nombre_archivo)
    lineas: list = archivo.readlines()
    res: int = len(lineas)
    return res


# Ejercicio 1.2)
def existePalabra(palabra: str, nombre_archivo: str) -> bool:
    archivo = open(nombre_archivo)
    texto: str = archivo.read()
    res: bool = palabra in texto
    return res


# Ejercicio 1.3)
def cantidadApariciones(nombre_archivo: str, palabra: str) -> int:
    res = 0
    archivo = open(nombre_archivo)
    texto = archivo.read()
    palabras = texto.split()
    for pal in palabras:
        if palabra in pal:
            res += 1
    return res


# Ejercicio 2)
def empiezaCon(cadena: str, caracter: str) -> bool:
    for c in cadena:
        if c == " ":
            continue
        elif c == caracter:
            return True
        else:
            return False

def clonarSinComentarios(nombre_archivo: str):

    archivo_original = open(nombre_archivo)
    lineas_original = archivo_original.readlines()
    
    nombre_clon : str = "sin_comentarios_" + nombre_archivo
    archivo_clon = open(nombre_clon, 'w')

    for linea in lineas_original:
        if empiezaCon(linea, "#"):
            continue
        else:
            archivo_clon.write(linea)
    
    print("Se creo el archivo " + nombre_clon)


# Ejercicio 3:
def clonarInvertido(nombre_archivo: str):

    archivo_original = open(nombre_archivo)
    lineas_original = archivo_original.readlines()

    nombre_clon = "reverso.txt"
    archivo_clon = open(nombre_clon, 'w')

    for i in range(len(lineas_original)):
        archivo_clon.write(lineas_original[len(lineas_original)-i-1])
    
    print("Se creo el archivo " + nombre_clon)


# Ejercicio 4)
def agregarFraseAlFinal(nombre_archivo: str, frase: str):
    archivo = open(nombre_archivo, 'a')
    archivo.write("\n" + frase)
    print('Se agrego la frase "' + frase + '"\nal final del archivo ' + nombre_archivo)


# Ejercicio 5)
def agregarFraseAlInicio(nombre_archivo: str, frase: str):
    archivo = open(nombre_archivo)
    contenido = archivo.read()
    archivo.close()
    archivo = open(nombre_archivo, 'w')
    archivo.write(frase + "\n" + contenido)
    print('Se agrego la frase "' + frase + '"\nal inicio del archivo ' + nombre_archivo)


# Ejercicio 6)
def palabrasLegiblesEnBinario(nombre_archivo: str) -> list:

    archivo = open(nombre_archivo, 'rb') #En la documentación oficial de Python, cuando se menciona el modo 'b', se refiere a abrir el archivo en modo binario sin especificar si es para lectura o escritura. Por otro lado, 'rb' se utiliza específicamente para abrir un archivo en modo binario de solo lectura. Cuando se utiliza 'rb', el archivo se abre en modo de solo lectura y se asegura de que los datos se lean como bytes. Esto significa que los bytes se leen directamente del archivo sin realizar ninguna conversión a caracteres o cadenas de texto.
    contenido = archivo.read()

    palabras_legibles = []
    palabra_actual = ""

    for byte in contenido:
        caracter = chr(byte)
        if caracter.isalnum() or caracter == " " or caracter == "_":
            palabra_actual += caracter
        elif len(palabra_actual) >= 5:
            palabras_legibles.append(palabra_actual)
            palabra_actual = ""
        else:
            palabra_actual = ""
    
    if len(palabra_actual) >= 5:
        palabras_legibles.append(palabra_actual)
    
    return palabras_legibles


# Ejercicio 7) Le tuve que agregar el parametro nombre_archivo porque sino no se de donde hay que sacar las notas.
def promedioEstudiante(lu: str, nombre_archivo: str) -> float:
    suma = 0
    instancias = 0

    archivo = open(nombre_archivo)
    contenido = archivo.read()
    lineas = contenido.split("\n")

    for linea in lineas:
        contenido = linea.split(",")
        if contenido[0] == lu:
            suma += int(contenido[3])
            instancias += 1

    return suma / instancias



# PILAS

# Ejercicio 8)
def generarNrosAlAzar(n: int, desde: int, hasta: int) -> "list[int]":
    lista = []
    while desde <= hasta:
        lista.append(desde)
        desde += 1
    if n <= len(lista):
        return random.sample(lista, n)
    else:
        return lista


# Ejercicio 9)
def apilarNrosAlAzar(lista: list) -> Pila:
    p = Pila()
    for n in lista:
        p.put(n)
    return p


# Ejercicio 10)
def cantidadElementosPila(p: Pila) -> int:
    contador = 0
    while not p.empty():
        p.get()
        contador += 1
    return contador


# Ejercicio 11)
def buscarElMaximoPila(p: Pila) -> int:
    if p.empty():
        print("La pila esta vacia")
        return
    maximo = p.get()
    while not p.empty():
        elemento = p.get()
        if elemento > maximo:
            maximo = elemento
    return maximo


# Ejercicio 12)
def estaBienBalanceada(s: str) -> bool:
    pila = Pila()      
    for char in s:
        if char == "(":
            pila.put(char)
        elif char == ")":
            if pila.empty():
                return False
            pila.get()     
    return pila.empty()



# COLAS

# Ejercicio 13)
def encolarNrosAlAzar(lista: list) -> Cola:
    cola = Cola()
    for n in lista:
        cola.put(n)
    return cola


# Ejercicio 14)
def cantidadElementosCola(c: Cola) -> int:
    contador = 0
    while not c.empty():
        c.get()
        contador += 1
    return contador


# Ejercicio 15)
def buscarElMaximoCola(c: Cola) -> int:
    if c.empty():
        print("La cola esta vacia")
        return
    maximo: int = c.get()
    while not c.empty():
        elemento: int = c.get()
        if elemento > maximo:
            maximo = elemento
    return maximo


# Ejercicio 16)
def armarSecuenciaDeBingo() -> "Cola[int]":
    l = generarNrosAlAzar(100, 0, 99)
    secuencia = encolarNrosAlAzar(l)
    return secuencia

def jugarCartonDeBingo(carton: "list[int]", bolillero: "Cola[int]") -> int:
    jugadas = 0
    jugadas_buenas = 0
    orden_salida = []
    while not bolillero.empty():
        jugadas += 1
        numero = bolillero.get()
        if numero in carton:
            jugadas_buenas += 1
            orden_salida.append(numero)
            if jugadas_buenas == len(carton):
                return jugadas, orden_salida

# import copy

# def duplicar_cola(cola):
#     nueva_cola = Cola()
#     elementos = list(cola.queue)      
#     for elemento in elementos:
#         elemento_copia = copy.deepcopy(elemento)
#         nueva_cola.put(elemento_copia)
#     return nueva_cola

# def imprimirCola(cola):
#     lista = []
#     copia = duplicar_cola(cola)
#     while not copia.empty():
#         elem = copia.get()
#         lista.append(elem)
#     print(lista)

# bolillero = armarSecuenciaDeBingo()
# copia = duplicar_cola(bolillero)

# cartonSantiago = generarNrosAlAzar(12, 0, 99)
# cartonJoaquin = generarNrosAlAzar(12, 0, 99)

# print("Bolillero:")
# imprimirCola(bolillero)
# print("Santiago:")
# print(cartonSantiago)
# print("Joaquin:")
# print(cartonJoaquin)

# print("Jugadas Santiago:")
# print(jugarCartonDeBingo(cartonSantiago, bolillero))
# print("Jugadas Joaquin:")
# print(jugarCartonDeBingo(cartonJoaquin, copia))


# Ejercicio 17)
def nPacientesUrgentes(c: "Cola[int,str,str]") -> int:
    urgentes = []
    while not c.empty():
        paciente = c.get()
        if paciente[0] >= 1 and paciente[0] <= 3:
            urgentes.append(paciente)
    return len(urgentes)


# pac1 = (1, "Santiago", "Nefro")
# pac2 = (1, "Santiago", "Nefro")
# pac3 = (5, "Santiago", "Nefro")
# pac4 = (2, "Santiago", "Nefro")
# pac5 = (4, "Santiago", "Nefro")
# pac6 = (3, "Santiago", "Nefro")
# pac7 = (8, "Santiago", "Nefro")
# pac8 = (2, "Santiago", "Nefro")
# pac9 = (4, "Santiago", "Nefro")
# pac10 = (10, "Santiago", "Nefro")
# pac11 = (7, "Santiago", "Nefro")
# pac12 = (1, "Santiago", "Nefro")
# pac13 = (7, "Santiago", "Nefro")

# pacientes = [pac1, pac2, pac3, pac4, pac5, pac6, pac7, pac8, pac9, pac10, pac11, pac12, pac13]

# colapac = encolarNrosAlAzar(pacientes)

# print(nPacientesUrgentes(colapac))



# DICCIONARIOS

# Ejercicio 18)
def agruparPorLongitud(nombre_archivo: str) -> dict:
    diccionario = {}
    archivo = open(nombre_archivo)
    contenido = archivo.read()
    lineas = contenido.split("\n")
    for linea in lineas:
        texto = linea.split(" ")
        for palabra in texto:
            longitud = len(palabra)
            if not longitud in diccionario:
                diccionario[longitud] = 1
            else:
                diccionario[longitud] += 1
    return diccionario


# Ejercicio 19)
def promedioEstudiantes(nombre_archivo: str) -> dict:
    diccionario = {}

    archivo = open(nombre_archivo)
    contenido = archivo.read()
    lineas = contenido.split("\n")

    for linea in lineas:
        content = linea.split(",")
        estudiante = content[0]
        if not estudiante in diccionario:
            diccionario[estudiante] = promedioEstudiante(estudiante, nombre_archivo)
    
    return diccionario


# Ejercicio 20)
def laPalabraMasFrecuente(nombre_archivo: str) -> str:
    diccionario = {}
    archivo = open(nombre_archivo)
    contenido = archivo.read()

    for char in contenido:
        if char.isalnum() or char == " ":
            continue
        else:
            contenido = contenido.replace(char, "")

    lineas = contenido.split("\n")

    for linea in lineas:
        palabras = linea.split(" ")
        for palabra in palabras:
            if not palabra in diccionario:
                diccionario[palabra] = 1
            else:
                diccionario[palabra] += 1
    
    palabra_mas_frecuente = next(iter(diccionario))

    for clave in diccionario:
        if diccionario[clave] > diccionario[palabra_mas_frecuente]:
            palabra_mas_frecuente = clave
    
    return palabra_mas_frecuente


def valoresY(duplasXY: list, valoresX: list) -> list:
    res = []
    for caracter in valoresX:
        for dupla in duplasXY:
            if caracter == dupla[0]:
                res.append(dupla[1])
    return res


duplas = [("a","b"),("c","d")]
valores = ["a","c"]

# print(valoresY(duplas, valores))

ganadores = [['Messi', 'Cristiano', 'Mbappe'], [7, 5, 1]] #Esta seria la matriz de 2x3 (2 filas x 3 columnas)
# def contar(matriz):
#     for fila in ganadores:
# 	    for columna in fila:
# 		    print(columna)
                    
# contar(ganadores)


print("++ con for, i son las filas")
for i in range(len(ganadores)):
    for j in range(len(ganadores)):
        print("ganadores["+str(i)+"]["+str(j)+"] = " + str(ganadores[i][j]))