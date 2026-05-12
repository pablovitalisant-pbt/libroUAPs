# PRD-RENUMERACION.md — Corrección de numeración de capítulos

## Descripción

Corrección quirúrgica de numeración tras la incorporación del capítulo Nimitz
en Fase B. Dos capítulos quedaron con numeración 6. Este PRD resuelve la
ambigüedad y deja el libro con numeración limpia del 1 al 10.

## Estado actual del repositorio

```
cap01-A/B/C/D       <- limpio, no tocar
cap02-A/B/C/D       <- limpio, no tocar
cap03-A/B/C/D       <- limpio, no tocar
cap04-A/B/C/D       <- limpio, no tocar
cap05-A/B/C/D       <- limpio, no tocar
cap06-nimitz-A/B    <- Nimitz — renombrar a cap06-A/B
cap06-A/B/C/D       <- Francia/GEIPAN — renombrar a cap07-A/B/C/D
cap07-A/B           <- Psicología — renombrar a cap08-A/B
cap08-A/B           <- Tecnología secreta — renombrar a cap09-A/B
cap09-A/B           <- Agencia no humana — renombrar a cap10-A/B
prologo-A.md        <- no tocar
epilogo.md          <- actualizar referencia si menciona cap09
```

## Numeración final objetivo

| Cap | Contenido | Archivos finales |
|-----|-----------|-----------------|
| 01 | — | cap01-A/B/C/D |
| 02 | — | cap02-A/B/C/D |
| 03 | — | cap03-A/B/C/D |
| 04 | Teherán 1976 | cap04-A/B/C/D |
| 05 | Trans-en-Provence + Washington 1952 | cap05-A/B/C/D |
| 06 | Nimitz 2004 | cap06-A/B |
| 07 | Francia/GEIPAN/Latinoamérica | cap07-A/B/C/D |
| 08 | Psicología cognitiva | cap08-A/B |
| 09 | Tecnología humana secreta | cap09-A/B |
| 10 | Agencia no humana | cap10-A/B |
| Epílogo | — | epilogo.md |

---

## Operaciones requeridas

### Fase 1 — Renombrado de archivos

Ejecutar en este orden exacto para evitar colisiones:

```powershell
$base = "C:\Users\pablo\Documents\libro-uap\secciones-aprobadas"

# Paso 1: mover cap09 a nombre temporal para liberar cap09
Rename-Item "$base\cap09-A.md" "cap09-A.md.tmp"
Rename-Item "$base\cap09-B.md" "cap09-B.md.tmp"

# Paso 2: mover cap08 a cap09
Rename-Item "$base\cap08-A.md" "cap09-A.md"
Rename-Item "$base\cap08-B.md" "cap09-B.md"

# Paso 3: mover cap07 a cap08
Rename-Item "$base\cap07-A.md" "cap08-A.md"
Rename-Item "$base\cap07-B.md" "cap08-B.md"

# Paso 4: mover cap06 (Francia/GEIPAN) a cap07
Rename-Item "$base\cap06-A.md" "cap07-A.md"
Rename-Item "$base\cap06-B.md" "cap07-B.md"
Rename-Item "$base\cap06-C.md" "cap07-C.md"
Rename-Item "$base\cap06-D.md" "cap07-D.md"

# Paso 5: mover cap06-nimitz a cap06
Rename-Item "$base\cap06-nimitz-A.md" "cap06-A.md"
Rename-Item "$base\cap06-nimitz-B.md" "cap06-B.md"

# Paso 6: resolver temporales
Rename-Item "$base\cap09-A.md.tmp" "cap10-A.md"
Rename-Item "$base\cap09-B.md.tmp" "cap10-B.md"
```

### Fase 2 — Actualización de contenido interno

Para cada archivo renombrado, actualizar:

1. **Línea de encabezado del capítulo** — cualquier mención de "CAPÍTULO 6",
   "CAPÍTULO 7", etc. en la primera sección del archivo
2. **Metadata "Siguiente sección"** — la línea que indica el archivo siguiente,
   presente en el encabezado de cada sección
3. **Referencias cruzadas internas** — cualquier mención de "Capítulo 6",
   "Cap06", "capítulo anterior", "capítulo siguiente" o equivalentes en el
   cuerpo del texto

Archivos a revisar obligatoriamente:

```
cap05-D.md     <- su "Siguiente sección" apunta a cap06 — debe apuntar a cap06 (Nimitz, ok)
cap06-A.md     <- encabezado dice "nimitz" o similar — actualizar a CAPÍTULO 6
cap06-B.md     <- ídem
cap07-A.md     <- encabezado dice CAPÍTULO 6 — actualizar a CAPÍTULO 7
cap07-B.md     <- ídem
cap07-C.md     <- ídem
cap07-D.md     <- ídem — su "Siguiente sección" debe apuntar a cap08
cap08-A.md     <- encabezado dice CAPÍTULO 7 — actualizar a CAPÍTULO 8
cap08-B.md     <- ídem — su "Siguiente sección" debe apuntar a cap09
cap09-A.md     <- encabezado dice CAPÍTULO 8 — actualizar a CAPÍTULO 9
cap09-B.md     <- ídem — su "Siguiente sección" debe apuntar a cap10
cap10-A.md     <- encabezado dice CAPÍTULO 9 — actualizar a CAPÍTULO 10
cap10-B.md     <- ídem — su "Siguiente sección" debe apuntar a epílogo
epilogo.md     <- verificar si menciona cap09 — actualizar a cap10 si aplica
prologo-A.md   <- verificar si menciona numeración de capítulos
```

### Fase 3 — Verificación de cadena de transiciones

Confirmar que el último párrafo o línea de transición de cada sección final
apunta al capítulo correcto en la nueva numeración:

```
cap05-D.md  → apunta a cap06 (Nimitz)
cap06-B.md  → apunta a cap07 (Francia/GEIPAN)
cap07-D.md  → apunta a cap08 (Psicología)
cap08-B.md  → apunta a cap09 (Tecnología)
cap09-B.md  → apunta a cap10 (Agencia no humana)
cap10-B.md  → apunta a Epílogo
```

---

## Criterios de done

```powershell
$base = "C:\Users\pablo\Documents\libro-uap\secciones-aprobadas"

# 1. No existe ningún archivo con "nimitz" en el nombre
Get-ChildItem $base -Filter "*nimitz*"
# Esperado: sin resultados

# 2. No existe cap06 con contenido de Francia/GEIPAN
# (cap06 debe ser Nimitz — verificar encabezado)
Select-String -Path "$base\cap06-*.md" -Pattern "GEIPAN|Francia|Latinoam"
# Esperado: sin coincidencias

# 3. No existe cap09 con contenido de agencia no humana en encabezado
# (cap09 debe ser Tecnología — cap10 es Agencia)
Select-String -Path "$base\cap09-*.md" -Pattern "Agencia no humana|CAPÍTULO 9.*[Aa]gencia"
# Esperado: sin coincidencias

# 4. No existen archivos con numeración antigua (cap06-nimitz, cap07 psicología, etc.)
Get-ChildItem $base | Where-Object { $_.Name -match "nimitz|\.tmp$" }
# Esperado: sin resultados

# 5. Cadena de "Siguiente sección" es consistente
Select-String -Path "$base\cap05-D.md" -Pattern "cap06"
Select-String -Path "$base\cap06-B.md" -Pattern "cap07"
Select-String -Path "$base\cap07-D.md" -Pattern "cap08"
Select-String -Path "$base\cap08-B.md" -Pattern "cap09"
Select-String -Path "$base\cap09-B.md" -Pattern "cap10"
Select-String -Path "$base\cap10-B.md" -Pattern "epilogo|epílogo"
# Esperado: una coincidencia en cada línea

# 6. Inventario final — debe listar exactamente estos archivos y ningún otro
Get-ChildItem $base -Filter "cap*.md" | Select-Object Name | Sort-Object Name
# Esperado:
# cap01-A.md, cap01-B.md, cap01-C.md, cap01-D.md
# cap02-A.md, cap02-B.md, cap02-C.md, cap02-D.md
# cap03-A.md, cap03-B.md, cap03-C.md, cap03-D.md
# cap04-A.md, cap04-B.md, cap04-C.md, cap04-D.md
# cap05-A.md, cap05-B.md, cap05-C.md, cap05-D.md
# cap06-A.md, cap06-B.md
# cap07-A.md, cap07-B.md, cap07-C.md, cap07-D.md
# cap08-A.md, cap08-B.md
# cap09-A.md, cap09-B.md
# cap10-A.md, cap10-B.md
```

---

## Restricciones

- No modificar contenido narrativo — solo encabezados, metadata y
  referencias cruzadas de numeración
- No tocar cap01 al cap05
- No hacer commit hasta que los 6 criterios de done pasen sin errores
- Si algún archivo no tiene línea "Siguiente sección", no crearla —
  reportar a Pablo
