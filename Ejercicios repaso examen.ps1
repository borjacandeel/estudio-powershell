# ============================================================
#   EJERCICIOS DE REPASO POWERSHELL - EXAMEN
#   Solo enunciados - intenta resolverlos tu solo!
# ============================================================


# ============================================================
# TEMA 1 - VARIABLES E I/O
# ============================================================

# Ejercicio 1.1
# Pide al usuario su nombre y su edad.
# Muestra: "Hola [nombre], tienes [edad] anyos."

# TU CODIGO AQUI

$nombre = Read-Host "Introduce tu nombre: "
$edad = Read-Host "Introduce tu edad: "
Write-Host "Hola $nombre, tienes $edad anyos"

# ------------------------------------------------------------
# Ejercicio 1.2
# Pide dos numeros al usuario.
# Muestra la suma, resta, multiplicacion y division.

# TU CODIGO AQUI

$num1 = Read-Host "Introduce el primer num"
$num2 = Read-Host "Introduce el segundo num"

$suma = [int]$num1 + [int]$num2
$resta = [int]$num1 - [int]$num2
$multi = [int]$num1 * [int]$num2
$divi = [int]$num1 / [int]$num2

Write-Host "La suma es $suma"
Write-Host "La resta es $resta"
Write-Host "La multi es $multi"
Write-Host "La divi es $divi"



# ------------------------------------------------------------
# Ejercicio 1.3
# Pide un numero al usuario.
# Muestra si es par o impar.
# Pista: par si $numero % 2 es igual a 0

# TU CODIGO AQUI

$num = Read-Host "Introduce un numero"
if ($num % 2 -eq 0) {
    Write-Host "El numero $num es PAR"
}
else {
    Write-Host "El numero $num es IMPAR"
}


# ============================================================
# TEMA 2 - IF / ELSEIF / ELSE
# ============================================================

# Ejercicio 2.1
# Pide una nota del 0 al 10.
# Muestra:
#   9 o 10       -> "Sobresaliente"
#   7 u 8        -> "Notable"
#   5 o 6        -> "Aprobado"
#   menos de 5   -> "Suspenso"

# TU CODIGO AQUI

$nota = Read-Host "Dime una nota"

if ($nota -ge 9) {
    Write-Host "Sobresaliente"
} elseif ($nota -ge 7) {
    Write-Host "Notable"
} elseif ($nota -ge 5) {
    Write-Host "Aprobado"
} else {
    Write-Host "Suspenso"
}

# ------------------------------------------------------------
# Ejercicio 2.2
# Pide la edad del usuario.
# Menos de 18      -> "Eres menor de edad"
# Entre 18 y 65    -> "Eres adulto"
# Mas de 65        -> "Eres jubilado"

# TU CODIGO AQUI

$edad = Read-Host "Dime tu edad"

if ($edad -ge 65) {Write-Host "Eres Jubilado"}
elseif ($edad -ge 18) {echo "Eres Adulto"}
elseif ($edad -lt 18) {echo "Eres menor de edad"}

# ------------------------------------------------------------
# Ejercicio 2.3
# Pide dos numeros.
# Muestra cual es el mayor, o si son iguales.

# TU CODIGO AQUI

$num1 = Read-Host "Num1"
$num2 = Read-Host "Num2"

if ($num1 -gt $num2) {echo "$num1 es mayor que $num2"}
if ($num1 -lt $num2) {echo "$num2 es menor que $num1"}
if ($num1 -eq $num2) {echo "Los dos numeros son iguales"}

# ------------------------------------------------------------
# Ejercicio 2.4
# Pide un anyo.
# Muestra si es bisiesto o no.
# Es bisiesto si: divisible entre 4  Y  (no divisible entre 100  O  divisible entre 400)

# TU CODIGO AQUI




# ============================================================
# TEMA 3 - SWITCH
# ============================================================

# Ejercicio 3.1
# Pide un numero del 1 al 7.
# Muestra el dia de la semana: 1=Lunes, 2=Martes ... 7=Domingo
# Si no es del 1 al 7: "Dia no valido"

# TU CODIGO AQUI

$num = Read-Host "Dime un num del 1 al 7"

switch ($num) {

    "1" {echo "Lunes"}
    "2" {echo "Martes"}
    "3" {echo "Miercoles"}
    "4" {echo "Jueves"}
    "5" {echo "Viernes"}
    "6" {echo "Sabado"}
    "7" {echo "Domingo"}
    default {echo "Opcion no valida"}
}


# ------------------------------------------------------------
# Ejercicio 3.2
# Mini calculadora con switch.
# Pide dos numeros y una operacion (+, -, *, /).
# Muestra el resultado.
# Si la operacion no es valida: "Operacion no valida"
# Ojo: si dividen entre 0, avisa del error.

# TU CODIGO AQUI

$num1 = [int](Read-Host "Numero 1")
$num2 = [int](Read-Host "Numero 2")
$operacion = Read-Host "Que quieres hacer: suma/resta/multi/divi"

switch ($operacion) {

    "suma" {echo "La suma es $($num1 + $num2)"}
    "resta" {echo "La resta es $($num1 - $num2)"}
    "multi" {echo "La multi es $($num1 * $num2)"}
    "divi" {echo "La divi es $($num1 / $num2)"}
    default {echo "Opcion incorrecta"}

}

# ============================================================
# TEMA 4 - BUCLES
# ============================================================

# Ejercicio 4.1 - while
# Muestra los numeros del 1 al 10.

# TU CODIGO AQUI

$i = 1
while ($i -le 10) {
    echo "$i"
    $i++
}

# ------------------------------------------------------------
# Ejercicio 4.2 - while
# Pide numeros al usuario hasta que introduzca el 0.
# Al final muestra cuantos numeros ha introducido (sin contar el 0).

# TU CODIGO AQUI

$i = 1
while ($i -eq 1){
    $num = Read-Host "Introduce un numero"
    if ($num -eq 0) {break}
}

# ------------------------------------------------------------
# Ejercicio 4.3 - do-while
# Pide una contrasena al usuario.
# Repite hasta que escriba "1234".
# Cuando acierte: "Acceso concedido"

# TU CODIGO AQUI

do {
    $contra = Read-Host "Introduce la contrasenya"
    
    if ($contra -ne 1234) {echo "Contra incorrecta tete"}
    else {echo "Contra correcta"}

} while ($contra -ne 1234)


# ------------------------------------------------------------
# Ejercicio 4.4 - do-until
# Muestra los numeros del 1 al 5.

# TU CODIGO AQUI

$num = 1

do {
    echo "$num"
    $num = $num + 1

} until ($num -eq 6)

# ------------------------------------------------------------
# Ejercicio 4.5 - for
# Muestra la tabla de multiplicar de un numero pedido al usuario.
# Ejemplo para el 3:
#   3 x 1 = 3
#   3 x 2 = 6
#   ...
#   3 x 10 = 30

# TU CODIGO AQUI



# ------------------------------------------------------------
# Ejercicio 4.6 - for
# Muestra todos los numeros pares del 1 al 20.

# TU CODIGO AQUI


# ------------------------------------------------------------
# Ejercicio 4.7 - for
# Cuenta atras del 10 al 1 y luego muestra "Despegue!"

# TU CODIGO AQUI




# ============================================================
# TEMA 5 - MENU COMPLETO
# ============================================================

# Ejercicio 5.1
# Crea un menu que se repita hasta elegir Salir con estas opciones:
#   1. Mostrar fecha y hora       -> Get-Date
#   2. Version de PowerShell      -> Get-Host
#   3. Tabla de multiplicar       -> pide el numero y la muestra
#   4. Par o impar                -> pide un numero y lo comprueba
#   5. Salir

# TU CODIGO AQUI