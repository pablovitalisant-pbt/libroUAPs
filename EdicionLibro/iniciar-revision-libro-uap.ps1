# iniciar-revision-libro-uap.ps1
# Prepara el entorno de trabajo para la revision editorial Fase A del libro UAP
# Uso: ejecutar desde la carpeta donde estan este script y los 3 archivos .md

$ScriptDir = Split-Path $MyInvocation.MyCommand.Path
$ProyectoDir = "C:\Users\pablo\Documents\libro-uap"

Write-Host ""
Write-Host "=== REVISION EDITORIAL LIBRO UAP - FASE A ===" -ForegroundColor Cyan
Write-Host ""

# Verificar que los 3 archivos existen en la misma carpeta que el script
$Archivos = @("PRD.md", "CLAUDE.md", "CONTEXT-CLAUDE-CHAT.md")
$TodosPresentes = $true

foreach ($Archivo in $Archivos) {
    $Ruta = Join-Path $ScriptDir $Archivo
    if (-not (Test-Path $Ruta)) {
        Write-Host "ERROR: No se encuentra $Archivo en $ScriptDir" -ForegroundColor Red
        $TodosPresentes = $false
    }
}

if (-not $TodosPresentes) {
    Write-Host ""
    Write-Host "Asegurate de que PRD.md, CLAUDE.md y CONTEXT-CLAUDE-CHAT.md esten en la misma carpeta que este script." -ForegroundColor Yellow
    exit 1
}

Write-Host "Archivos de sesion encontrados. Verificando repositorio..." -ForegroundColor Green

# Verificar que el directorio del proyecto existe
if (-not (Test-Path $ProyectoDir)) {
    Write-Host "ERROR: No se encuentra el directorio del proyecto en $ProyectoDir" -ForegroundColor Red
    Write-Host "Verifica que el repositorio esta clonado en esa ruta." -ForegroundColor Yellow
    exit 1
}

Write-Host "Repositorio encontrado en $ProyectoDir" -ForegroundColor Green

# Verificar que es un repositorio git
$GitDir = Join-Path $ProyectoDir ".git"
if (-not (Test-Path $GitDir)) {
    Write-Host "ERROR: $ProyectoDir no es un repositorio git." -ForegroundColor Red
    exit 1
}

# Verificar que existe la carpeta secciones-aprobadas
$SeccionesDir = Join-Path $ProyectoDir "secciones-aprobadas"
if (-not (Test-Path $SeccionesDir)) {
    Write-Host "ERROR: No se encuentra la carpeta secciones-aprobadas en $ProyectoDir" -ForegroundColor Red
    exit 1
}

Write-Host "Carpeta secciones-aprobadas encontrada." -ForegroundColor Green

# Contar archivos de trabajo
$NumArchivos = (Get-ChildItem -Path $SeccionesDir -Filter "*.md").Count
Write-Host "Archivos .md en secciones-aprobadas: $NumArchivos" -ForegroundColor Cyan

# Verificar presencia de los caps duplicados que se van a eliminar
$Cap10Existe = (Get-ChildItem -Path $SeccionesDir -Filter "cap10-*.md").Count -gt 0
$Cap11Existe = (Get-ChildItem -Path $SeccionesDir -Filter "cap11-*.md").Count -gt 0

if ($Cap10Existe) {
    Write-Host "cap10-*.md encontrados (duplicado - se eliminaran en Slice 1)" -ForegroundColor Yellow
}
if ($Cap11Existe) {
    Write-Host "cap11-*.md encontrados (se renombraran a cap09 en Slice 1)" -ForegroundColor Yellow
}

# Copiar los 3 archivos de sesion al directorio del proyecto
Write-Host ""
Write-Host "Copiando archivos de sesion al proyecto..." -ForegroundColor Cyan

foreach ($Archivo in $Archivos) {
    $Origen = Join-Path $ScriptDir $Archivo
    $Destino = Join-Path $ProyectoDir $Archivo
    Copy-Item -Path $Origen -Destination $Destino -Force
    Write-Host "  Copiado: $Archivo" -ForegroundColor Green
}

# Crear rama de trabajo para la revision
Set-Location $ProyectoDir

$RamaActual = git rev-parse --abbrev-ref HEAD 2>$null
Write-Host ""
Write-Host "Rama actual: $RamaActual" -ForegroundColor Cyan

$RamaRevision = "revision-fase-a"
$RamaExiste = git branch --list $RamaRevision

if ($RamaExiste) {
    Write-Host "La rama $RamaRevision ya existe. Cambiando a ella..." -ForegroundColor Yellow
    git checkout $RamaRevision
} else {
    Write-Host "Creando rama $RamaRevision..." -ForegroundColor Cyan
    git checkout -b $RamaRevision
}

# Commit inicial con los archivos de sesion
git add PRD.md CLAUDE.md CONTEXT-CLAUDE-CHAT.md
git commit -m "sesion-0: agregar PRD, CLAUDE.md y CONTEXT para revision Fase A"

Write-Host ""
Write-Host "=== ENTORNO LISTO ===" -ForegroundColor Green
Write-Host ""
Write-Host "Directorio de trabajo: $ProyectoDir" -ForegroundColor White
Write-Host "Rama activa:           $RamaRevision" -ForegroundColor White
Write-Host "Archivos de trabajo:   $NumArchivos archivos .md en secciones-aprobadas/" -ForegroundColor White
Write-Host ""
Write-Host "Slices pendientes:" -ForegroundColor Cyan
Write-Host "  Slice 1 - Resolver duplicacion caps 8/10 y 9/11" -ForegroundColor White
Write-Host "  Slice 2 - Fusionar secciones C y D en Parte III" -ForegroundColor White
Write-Host "  Slice 3 - Eliminar tic 'el narrador' en todo el manuscrito" -ForegroundColor White
Write-Host "  Slice 4 - Reescribir cierre del Epilogo" -ForegroundColor White
Write-Host "  Slice 5 - Revisar Prologo" -ForegroundColor White
Write-Host "  Slice 6 - Eliminar Manises, corregir afirmaciones universales y fechas" -ForegroundColor White
Write-Host "  Slice 7 - Anadir evaluacion hipotesis inversion termica Washington 1952" -ForegroundColor White
Write-Host "  Slice 8 - Propagacion 'causa probable', referencias cruzadas" -ForegroundColor White
Write-Host ""
Write-Host "Para comenzar, abre Claude Code con:" -ForegroundColor Yellow
Write-Host "  claude ." -ForegroundColor White
Write-Host ""
