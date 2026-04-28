# ============================================================
#   GUIA COMPLETA POWERSHELL - REFERENCIA PARA EL EXAMEN
# ============================================================

# ============================================================
# 1. VARIABLES Y I/O
# ============================================================

# Declarar variable
$miVariable = "Hola"
$numero = 42

# Pedir input al usuario
$nombre = Read-Host "Escribe tu nombre"

# Mostrar por pantalla (las 3 hacen lo mismo)
Write-Host $miVariable

# Interpolacion dentro de string (comillas dobles)
Write-Host "Tu nombre es $nombre"

# Pausa (espera a que el usuario pulse Enter)
pause

# Salir del script
# exit




# ============================================================
# 2. OPERADORES DE COMPARACION
# ============================================================

# -eq   igual a
# -ne   distinto de
# -lt   menor que
# -le   menor o igual que
# -gt   mayor que
# -ge   mayor o igual que
# -and  Y logico
# -or   O logico
# -not  negacion

# Ejemplos:
# $a -eq $b
# $a -ne 7
# $a -lt 10
# ($a -eq 1) -and ($b -eq 2)

# Operadores aritmeticos: + - * / %
# % es el modulo (resto de la division entera)
$resto = 2024 % 12    # resultado: 0 -> Mono

$a -lt 10
# ($a -eq 1) -and ($b -eq 2)

# Operadores aritmeticos: + - * / %
# % es el modulo (resto de la division entera)
$resto = 2024 % 12    # resultado: 0 -> Mono


# ============================================================
# 4. DICCIONARIOS (clave -> valor)
# ============================================================

# Crear diccionario con @{}
$datos = @{
    0  = "Mono";
    1  = "Gallo";
    2  = "Perro";
    3  = "Cerdo";
    4  = "Rata";
    5  = "Buey";
    6  = "Tigre";
    7  = "Conejo";
    8  = "Dragon";
    9  = "Serpiente";
    10 = "Caballo";
    11 = "Cabra"
}

# Acceder a un valor por su clave - 2 formas equivalentes
Write-Host $datos[0]
Write-Host $datos.get_Item(0)

# Ejemplo horoscopo chino completo
$anyo = Read-Host "Introduce tu anyo de nacimiento"
$resto = $anyo % 12
Write-Host "Tu signo es:" $datos.get_Item($resto)




# ============================================================
# 5. IF / ELSEIF / ELSE
# ============================================================

$opcion = Read-Host "Elige opcion (1-6)"

if ($opcion -eq 1) {
    Get-Host          # muestra version de PowerShell
}
elseif ($opcion -eq 2) {
    Get-Date          # muestra fecha y hora
}
elseif ($opcion -eq 3) {
    Get-Help          # muestra ayuda
}
elseif ($opcion -eq 4) {
    start notepad     # abre bloc de notas
}
elseif ($opcion -eq 5) {
    start calc        # abre calculadora
}
else {
    Write-Host "Opcion no valida"
}




# ============================================================
# 6. SWITCH
# ============================================================

# Read-Host devuelve STRING, por eso se compara con "1" no con 1
$opcion = Read-Host "Elige opcion"

switch ($opcion) {
    "1" { Get-Host }
    "2" { Get-Date }
    "3" { Get-Help }
    "4" { start notepad }
    "5" { start calc }
    "6" { exit }
    default { Write-Host "Opcion no valida" }
}




# ============================================================
# 7. BUCLE WHILE  (comprueba la condicion ANTES de entrar)
#    -> si la condicion es falsa desde el inicio, no entra nunca
# ============================================================

$i = 0
while ($i -le 5) {
    Write-Host $i
    $i++
}




# ============================================================
# 8. BUCLE DO-WHILE  (ejecuta SIEMPRE al menos 1 vez)
#    -> repite mientras la condicion sea TRUE
# ============================================================

$i = 0
do {
    Write-Host $i
    $i++
} while ($i -le 5)




# ============================================================
# 9. BUCLE DO-UNTIL  (ejecuta SIEMPRE al menos 1 vez)
#    -> repite hasta que la condicion sea TRUE (logica invertida)
# ============================================================

$i = 0
do {
    Write-Host $i
    $i++
} until ($i -gt 5)




# ============================================================
# 10. BUCLE FOR
# ============================================================

# FOR clasico: inicio ; condicion ; incremento
for ($i = 0; $i -le 5; $i++) {
    Write-Host $i
}

# FOR recorriendo un array por indice
$array = 0..5
for ($i = 0; $i -lt $array.Length; $i++) {    # -lt (no -le) porque el ultimo indice es Length-1
    Write-Host $array[$i]
}




# ============================================================
# 11. FOREACH  (recorre directamente cada elemento del array)
# ============================================================

$array = "Uno", "Dos", "Tres"

# Forma 1 - mas comun
foreach ($elemento in $array) {
    Write-Host $elemento
}

# Forma 2 - metodo del propio array
$array.ForEach({ Write-Host $PSItem })   # $PSItem = elemento actual




# ============================================================
# 12. MENU COMPLETO  <-- PATRON TIPICO DE EXAMEN
#     estructura: while + switch + opciones
# ============================================================

$opcion = 0

while ($opcion -ne 7) {

    Clear-Host
    Write-Host "----------------------------------------"
    Write-Host "            MENU PRINCIPAL              "
    Write-Host "----------------------------------------"
    Write-Host " 1. Ver version de PowerShell           "
    Write-Host " 2. Ver fecha                           "
    Write-Host " 3. Ver ayuda                           "
    Write-Host " 4. Abrir Bloc de Notas                 "
    Write-Host " 5. Abrir Calculadora                   "
    Write-Host " 6. Horoscopo Chino                     "
    Write-Host " 7. Salir                               "
    Write-Host "----------------------------------------"
    Write-Host ""

    $opcion = Read-Host "Elige opcion"

    switch ($opcion) {

        1 {
            Get-Host
            Write-Host ""
            Write-Host "Version de PowerShell mostrada." -ForegroundColor Cyan
        }

        2 {
            Get-Date
            Write-Host ""
            Write-Host "Fecha actual mostrada." -ForegroundColor Cyan
        }

        3 {
            Get-Help
            Write-Host ""
            Write-Host "Ayuda mostrada." -ForegroundColor Cyan
        }

        4 {
            Write-Host ""
            Write-Host "Abriendo Bloc de Notas..." -ForegroundColor Cyan
            pause
            start notepad.exe
        }

        5 {
            Write-Host ""
            Write-Host "Abriendo Calculadora..." -ForegroundColor Cyan
            pause
            start calc.exe
        }

        6 {
            # Horoscopo con su propio do-while para repetir sin volver al menu
            do {
                Clear-Host
                Write-Host ""
                Write-Host "     HOROSCOPO CHINO     " -ForegroundColor Cyan
                Write-Host "-------------------------" -ForegroundColor Cyan
                Write-Host ""

                $datos = @{
                    0  = "Mono";
                    1  = "Gallo";
                    2  = "Perro";
                    3  = "Cerdo";
                    4  = "Rata";
                    5  = "Buey";
                    6  = "Tigre";
                    7  = "Conejo";
                    8  = "Dragon";
                    9  = "Serpiente";
                    10 = "Caballo";
                    11 = "Cabra"
                }

                $anyo = Read-Host "Anyo de nacimiento (o escribe 'salir')"

                if ($anyo -ne "salir") {
                    $resto = [int]$anyo % 12
                    Write-Host ""
                    Write-Host "Tu signo es:" $datos.get_Item($resto)
                    Write-Host ""
                    pause
                }

            } while ($anyo -ne "salir")
        }

        7 {
            Write-Host ""
            Write-Host "Saliendo del programa..." -ForegroundColor Red
        }

    }   # fin switch

    Write-Host ""
    pause

}   # fin while
