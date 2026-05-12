# CLAUDE.md — Libro UAP: Fase B

## Qué es este proyecto

Manuscrito de no ficción sobre UAP/OVNIs. Argumento central: proceso de
eliminación rigurosa de hipótesis aplicado a un núcleo verificable de casos
con confirmación instrumental. El libro tiene Prólogo, 10 capítulos y Epílogo
(tras reorganización de Fase A).

---

## Stack

- Archivos: `.md` en `secciones-aprobadas/`
- OS: Windows / PowerShell
- Directorio: `C:\Users\pablo\Documents\libro-uap`
- Control de versiones: Git
- Herramienta de escritura: Claude Code (este entorno)

---

## Estructura de carpetas relevante

```
libro-uap/
  secciones-aprobadas/       ← todos los archivos de trabajo
    cap01-A.md ... cap01-D.md
    cap02-A.md ... cap02-D.md
    cap03-A.md ... cap03-D.md
    cap04-A.md ... cap04-D.md
    cap05-A.md ... cap05-D.md  ← Trans-en-Provence + Washington 1952
    cap06-nimitz-A.md          ← NUEVO — Fase B Slice 1
    cap06-nimitz-B.md          ← NUEVO — Fase B Slice 1
    cap07-A.md ... cap07-B.md  ← renumerado desde cap06
    cap08-A.md ... cap08-B.md  ← renumerado desde cap07
    cap09-A.md ... cap09-B.md  ← renumerado desde cap08 (contiene Slice 2)
    cap10-A.md ... cap10-B.md  ← renumerado desde cap09
    prologo-A.md
    epilogo.md
  PRD-FASE-B.md
  CLAUDE.md
  mdmerger.py
```

---

## Comandos útiles

```powershell
# Contar palabras en un archivo
(Get-Content "secciones-aprobadas\cap06-nimitz-A.md" |
  Measure-Object -Word).Words

# Contar palabras en todos los archivos de un cap
Get-ChildItem "secciones-aprobadas\cap06-nimitz-*.md" |
  ForEach-Object { (Get-Content $_.FullName | Measure-Object -Word).Words } |
  Measure-Object -Sum | Select-Object Sum

# Verificar ausencia de términos prohibidos
Select-String -Path "secciones-aprobadas\cap06-nimitz-*.md" `
  -Pattern "nave\b|extraterrestre|el narrador|GIMBAL|GOFAST"

# Ver primeras 20 líneas de un archivo
Get-Content "secciones-aprobadas\cap06-nimitz-A.md" -TotalCount 20

# Commit de un slice completado
git add secciones-aprobadas/
git commit -m "Fase B Slice 1: Capítulo Nimitz completo"
```

---

## Restricciones globales de voz y tono

Estas restricciones son no negociables. Aplican a cada línea escrita.

### Voz narrativa
- **Secciones de reconstrucción de escenas:** tercera persona limitada
  siguiendo al personaje principal (modelo Cap04/Teherán, modelo Cap05-A/Nicolaï)
- **Secciones de análisis y transición:** primera persona del
  narrador-investigador
- **Prohibido:** "el narrador" como referencia en tercera persona

### El objeto
- Términos permitidos: "el objeto", "lo que [testigo] vio", "el fenómeno"
- Términos prohibidos: "nave", "aeronave no identificada" como categoría
  cerrada, "extraterrestre" como adjetivo descriptivo de ningún objeto

### Afirmaciones
- Cero afirmaciones universales sin calificador
- Obligatorio: "conocido", "hasta donde la documentación pública permite
  establecer", "según declaró X", "de acuerdo con documentación pública"
- Separación explícita entre hecho documentado e inferencia: cuando el texto
  pase de uno a otro, debe marcarlo con lenguaje que el lector perciba

### Testigos
- Sin hagiografía: no describir a ningún testigo como "honesto", "simple",
  "humilde", "trabajador" ni equivalentes implícitos
- Los hechos de carrera y credenciales bastan para establecer credibilidad
- Sin estados mentales no documentados: prohibido "sintió", "pensó",
  "recordó", "temió" salvo que el propio testigo lo haya declarado

### Certeza
- Términos prohibidos en secciones de análisis: "demuestra", "prueba",
  "confirma" aplicados a la naturaleza del objeto
- Término obligatorio al final del proceso de eliminación: "mejor hipótesis
  disponible" o equivalente, nunca "conclusión definitiva"

---

## Modelo de sección de referencia

El estándar de calidad para Fase B es **Cap04-A.md** (apertura Teherán) y
**Cap05-A.md** (Trans-en-Provence). Antes de entregar cualquier sección,
Claude Code debe leer esos dos archivos y verificar que el tono, ritmo y
nivel de detalle son comparables.

---

## Criterios de done por slice

### Slice 1 — Capítulo Nimitz

```powershell
# 1. Sin términos prohibidos
Select-String -Path "secciones-aprobadas\cap06-nimitz-*.md" `
  -Pattern "nave\b|extraterrestre|el narrador|GIMBAL|GOFAST"
# Resultado esperado: sin coincidencias

# 2. Conteo total de palabras: entre 3.000 y 3.500
Get-ChildItem "secciones-aprobadas\cap06-nimitz-*.md" |
  ForEach-Object { (Get-Content $_.FullName | Measure-Object -Word).Words } |
  Measure-Object -Sum

# 3. Sección C entre 900 y 1.100 palabras (archivo cap06-nimitz-A.md)
(Get-Content "secciones-aprobadas\cap06-nimitz-A.md" |
  Measure-Object -Word).Words
# Esperado: entre 1.800 y 2.100 (secciones A+B+C juntas)

# 4. Cada afirmación de hecho en secciones B, D, E tiene calificador
Select-String -Path "secciones-aprobadas\cap06-nimitz-*.md" `
  -Pattern "según|de acuerdo|declaró|documentación pública|conocido"
# Resultado esperado: al menos 8 coincidencias distribuidas
```

### Slice 2 — Sección descarte Cap09

```powershell
# 1. Sin términos de certeza no sostenida
Select-String -Path "secciones-aprobadas\cap09-*.md" `
  -Pattern "demuestra\b|prueba\b|confirma\b"
# Resultado esperado: sin coincidencias en la sección nueva

# 2. Sin "extraterrestre"
Select-String -Path "secciones-aprobadas\cap09-*.md" `
  -Pattern "extraterrestre"
# Resultado esperado: sin coincidencias

# 3. Conteo sección nueva: entre 650 y 750 palabras
# (verificar manualmente contra el conteo del archivo antes y después)

# 4. Los tres argumentos presentes en orden
Select-String -Path "secciones-aprobadas\cap09-*.md" `
  -Pattern "consistencia|ausencia de contacto|agentividad"
# Resultado esperado: al menos una coincidencia de cada término
```

---

## Lo que Claude Code NO debe hacer

- No modificar archivos fuera del alcance del slice activo
- No hacer commits sin aprobación explícita de Pablo
- No inferir hechos sobre el caso Nimitz más allá del corpus
  documentado en PRD-FASE-B.md sección Slice 1
- No usar GIMBAL ni GOFAST como evidencia del caso Nimitz
  (son videos de 2015, incidente USS Theodore Roosevelt, no USS Nimitz 2004)
- No inventar estados mentales de testigos
- No describir el objeto con nombre ontológico

---

## Flujo de trabajo por slice

1. Leer PRD-FASE-B.md sección del slice activo
2. Leer cap04-A.md y cap05-A.md como referencia de tono
3. Escribir el contenido nuevo
4. Ejecutar criterios de done del slice
5. Reportar resultados a Pablo
6. Esperar "go" antes de commit
