# CLAUDE.md — Libro UAP: Revisión Editorial Fase A

## Proyecto

Revisión editorial quirúrgica de un manuscrito de no ficción sobre UAP/OVNIs. Todos los archivos de trabajo son `.md` en `secciones-aprobadas/`. No se escribe contenido nuevo en esta fase — solo se interviene sobre texto existente.

## Stack y entorno

- **Tipo de proyecto:** edición de texto, no software
- **Lenguaje de archivos:** Markdown (.md)
- **OS:** Windows (PowerShell)
- **Control de versiones:** Git — rama principal, commits solo cuando Pablo aprueba un slice
- **Herramienta de trabajo:** Claude Code en terminal local
- **Directorio raíz:** `C:\Users\pablo\Documents\libro-uap`

## Comandos útiles

```powershell
# Ver archivos afectados por slice
Get-ChildItem secciones-aprobadas\ -Filter "*.md" | Select-Object Name

# Buscar patrón en todo el manuscrito
Select-String -Path "secciones-aprobadas\*.md" -Pattern "el narrador"

# Contar apariciones de un término
(Select-String -Path "secciones-aprobadas\*.md" -Pattern "el narrador").Count

# Verificar que un término ya no existe
$r = Select-String -Path "secciones-aprobadas\*.md" -Pattern "Manises"
if ($r) { Write-Host "PENDIENTE: $($r.Count) apariciones" } else { Write-Host "OK: ninguna aparicion" }
```

## Estructura de archivos

```
secciones-aprobadas/
├── prologo-A.md
├── cap01-A.md ... cap01-D.md   (Parte I — histórico)
├── cap02-A.md ... cap02-D.md
├── cap03-A.md ... cap03-D.md
├── cap04-A.md ... cap04-D.md   (Parte II — casos modernos)
├── cap05-A.md ... cap05-D.md
├── cap06-A.md ... cap06-D.md
├── cap07-A.md, cap07-B.md      (Parte III — tras Slice 2)
├── cap08-A.md, cap08-B.md      (Parte III — tras Slice 2)
├── cap09-A.md, cap09-B.md      (Parte III — renumerado desde cap11)
├── epilogo.md
└── mdmerger.py
```

## Reglas de trabajo

1. **Un slice a la vez.** Completar y verificar cada slice antes de pasar al siguiente.
2. **Sin pausas de aprobación dentro del slice.** Ejecutar todos los pasos del slice de forma continua.
3. **Verificación al terminar cada slice.** Usar los comandos de verificación del PRD para confirmar que el criterio de "done" se cumple antes de declarar el slice completo.
4. **No modificar archivos fuera del alcance del slice activo.** Si un cambio en un slice afecta a un archivo que no está en su lista, registrarlo como pendiente para el slice correspondiente.
5. **Preservar el tono y la voz del autor.** Al reescribir cierres, eliminar tics o fusionar secciones, mantener el registro analítico-narrativo del manuscrito. No añadir dramatismo ni suavizar argumentos.
6. **No inventar contenido.** Si una fusión requiere un párrafo de transición, escribirlo con el material ya existente en el manuscrito. No añadir datos, casos ni afirmaciones que no estén en el texto original.
7. **Git:** no hacer commit sin instrucción explícita de Pablo.

## Convenciones del manuscrito

- **Voz:** primera persona del narrador, analítica, con control del tono emocional
- **Estructura:** cada capítulo tiene secciones A, B (y en la Parte III original también C y D — estas se eliminan en Slice 2)
- **Término correcto:** "el narrador" en tercera persona es un TIC que debe eliminarse — no es una convención del libro
- **Fórmula problemática a eliminar:** "La pregunta no es retórica. Es metodológica." — si aparece más de dos veces, reducir a máximo dos apariciones en todo el manuscrito
- **Longitud de secciones:** entre 400 y 1.900 palabras — no crear secciones más cortas salvo que el PRD lo indique explícitamente

## Criterios de calidad para intervenciones de texto

Al reescribir o fusionar texto, la intervención es correcta si:
- El párrafo resultante puede leerse en voz alta sin que suene artificial
- No introduce palabras o construcciones que no estén en el vocabulario del manuscrito
- No cambia el argumento — solo su presentación o posición
- Un lector que no ha visto el original no detecta la costura

## Referencia al PRD

Ver `PRD.md` para el backlog completo de 8 slices, los criterios de "done" de cada uno y la definición de "borrador revisado completado".
