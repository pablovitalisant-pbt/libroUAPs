# PRD-FASE-B.md — Libro UAP: Escritura Nueva

## Descripción

Fase B del manuscrito de no ficción sobre UAP/OVNIs. Escritura nueva: un
capítulo completo (Nimitz), y una sección argumentativa (descarte en Cap09).
La Fase A está completada.

## Stack

- Archivos: `.md` en `secciones-aprobadas/`
- OS: Windows / PowerShell
- Directorio: `C:\Users\pablo\Documents\libro-uap`
- Control de versiones: Git

## Restricciones globales de voz y tono

Aplican a los dos slices sin excepción.

1. Primera persona del narrador-investigador para análisis y transición.
   Tercera persona limitada para escenas de reconstrucción (modelo Cap04/Cap05-A).
2. Cero afirmaciones universales sin calificador. Obligatorio: "conocido",
   "hasta donde la documentación pública permite establecer", "según declaró X".
3. Separación explícita entre hecho documentado e inferencia en todo momento.
4. Sin hagiografía de testigos. Los hechos de carrera bastan.
5. Sin tic "el narrador". Primera persona directa en análisis.
6. El objeto no tiene nombre ontológico. Usar: "el objeto", "lo que Fravor vio",
   "el fenómeno". Prohibido: "nave", "extraterrestre" como adjetivo descriptivo.

---

## Orden de ejecución

Slice 1 (Nimitz) → Slice 2 (descarte Cap09)

---

## SLICE 1 — Capítulo Nimitz

### Archivos a crear

```
secciones-aprobadas/cap06-nimitz-A.md   <- secciones A, B, C
secciones-aprobadas/cap06-nimitz-B.md   <- secciones D, E, F
```

### Corpus verificable — NO inferir fuera de esto

**Fecha y lugar:**
14 de noviembre de 2004. Océano Pacífico, ~100 millas al suroeste de San Diego.
Grupo de ataque del USS Nimitz (CVN-68) en ejercicios de preparación.

**Personal documentado:**
- Cdr. David Fravor — comandante VFA-41 Black Aces, piloto F/A-18F líder
- Lt. Cdr. Jim Slaight — segundo asiento del F/A-18F de Fravor
- Lt. Cdr. Alex Dietrich — piloto del segundo F/A-18F
- Chad Underwood — grabó el video FLIR1 en misión posterior al encuentro
- Petty Officer Kevin Day — operador radar USS Princeton (CG-47), rastreó
  objetos durante días previos al 14 de noviembre

**Documentación autenticada:**
- Video FLIR1: autenticado por el DoD, comunicado oficial 27 abril 2020.
  Confirma autenticidad del material. No se pronuncia sobre naturaleza del objeto.
- GIMBAL y GOFAST: autenticados en el mismo comunicado PERO corresponden a
  2015, USS Theodore Roosevelt. NO usar como evidencia de este caso.
- Declaraciones de Fravor: Senado 2019, Cámara 26 julio 2023, NYT 2017.
- Artículo de ruptura: Cooper/Blumenthal/Kean, NYT, 16 diciembre 2017.
- Programa AATIP: existencia confirmada por DoD. Memorando DIA referenciado
  en fuentes públicas pero texto completo no desclasificado.

**Características del objeto según declaraciones de Fravor:**
- Sin superficies de control visibles
- Sin firma de escape o propulsión identificable
- Forma cilíndrica blanca, ~40 pies, descrita como "Tic Tac"
- Descendió desde altitud de crucero a nivel del mar, se detuvo, ascendió
  abruptamente, aceleró más allá de la capacidad de seguimiento del F/A-18F
- Se presentó en el CAP point programado antes de que llegara Fravor

**Kevin Day:** registró objetos descendiendo desde 28.000 pies a casi nivel
del mar en menos de 0,78 segundos. Presentar siempre como "según Day declaró",
no como dato instrumental independiente verificado.

**FLIR1:** muestra firma térmica anómala y movimiento errático. No muestra
velocidad precisa, tamaño ni altitud exacta. Grabado por Underwood en misión
posterior. Fravor no vio el FLIR1 hasta años después del incidente.

### Estructura de secciones

**Sección A — El radar que nadie tomó en serio** (~500 palabras)
Punto de vista: Kevin Day, USS Princeton, días previos al 14 de noviembre.
Objetos que aparecen y desaparecen. La frustración de no poder interceptarlos.
Función: crear acumulación. El lector entra con la pregunta correcta.
Voz: tercera persona limitada siguiendo a Day.

**Sección B — David Fravor** (~400 palabras)
Presentación del protagonista. 18 años de vuelo en combate. Sin hagiografía.
Los hechos de carrera hacen innecesario argumentar credibilidad.
Voz: narrador en primera persona presentando al personaje.

**Sección C — El encuentro** (~1.000 palabras)
La secuencia del 14 de noviembre. El vector de intercepción. El objeto sobre
el agua. La maniobra de Fravor. La pérdida del objeto. El CAP point vacío
y luego ocupado. Fuente primaria exclusiva: declaraciones de Fravor en
audiencias del Congreso y NYT 2017. La escena narra la experiencia perceptual
y la desorientación táctica. El texto no toma partido sobre la naturaleza
del objeto. Voz: tercera persona limitada siguiendo a Fravor.

**Sección D — Lo que Underwood grabó** (~500 palabras)
Underwood vuela la misión posterior. Activa el FLIR1. Lo que el sensor
registra y lo que no. Testimonio de Underwood sobre firma térmica (fuente:
NY Magazine 2019 — marcar como fuente secundaria). Distinción explícita:
Underwood grabó el objeto; Fravor lo vio. Son dos eventos con dos tipos
de evidencia distintos. Voz: tercera persona limitada → análisis en primera.

**Sección E — El proceso de eliminación** (~500 palabras)
Aplicar el marco del libro. Error de percepción: descartado por corroboración
radar + visual + FLIR simultáneos. Dron: incompatible con altitud, velocidad
y comportamiento en 2004. Avión experimental: ningún programa conocido con
esas características en 2004. Globo: incompatible con maniobras activas.
Voz: narrador en primera persona.

**Sección F — Lo que el caso representa** (~300 palabras)
No conclusión sobre naturaleza del objeto. Sí conclusión sobre lo que el
caso representa: primer caso en la historia donde el gobierno de EE.UU.
autenticó material audiovisual de un evento no identificado y reconoció
públicamente carecer de explicación. Solo esa afirmación. Nada más.
Voz: narrador en primera persona.

### Criterios de done — Slice 1

```powershell
# 1. Sin términos prohibidos
Select-String -Path "secciones-aprobadas\cap06-nimitz-*.md" `
  -Pattern "nave\b|extraterrestre|el narrador|GIMBAL|GOFAST"
# Esperado: sin coincidencias

# 2. Conteo total: entre 3.000 y 3.500 palabras
Get-ChildItem "secciones-aprobadas\cap06-nimitz-*.md" |
  ForEach-Object { (Get-Content $_.FullName | Measure-Object -Word).Words } |
  Measure-Object -Sum

# 3. Al menos 8 calificadores de fuente distribuidos
Select-String -Path "secciones-aprobadas\cap06-nimitz-*.md" `
  -Pattern "según|de acuerdo|declaró|documentación pública|conocido"
# Esperado: 8 o más coincidencias
```

---

## SLICE 2 — Sección de descarte en Cap09

### Archivo a modificar

```
secciones-aprobadas/cap09-A.md   <- o cap09-B.md según donde termine la sección B actual
```

Insertar sección nueva de ~700 palabras como "Sección B-bis" entre la
sección B actual (síntesis de evidencia) y la sección C actual (conclusión).

### Marco argumentativo

Esta sección cierra la asimetría de rigor. Los capítulos 7 y 8 aplicaron
el proceso de eliminación a hipótesis convencionales. La hipótesis de agencia
no humana nunca fue sometida al mismo proceso. Esta sección lo hace.
El resultado no es descartarla: es evaluar cuánto peso puede sostener.

**Argumento 1 — La consistencia escurridiza**
El fenómeno mantiene consistencia interna durante registros históricos extensos
pero nunca produce el artefacto verificable que lo resolvería definitivamente.
Compatible tanto con agencia real que evita verificación como con sesgo
cognitivo que proyecta patrones consistentes sobre fenómenos heterogéneos.
Presentar ambas lecturas sin resolver.

**Argumento 2 — La ausencia de contacto verificable**
Si existe una agencia capaz de operar en espacio aéreo de potencias militares
sin ser interceptada, la ausencia de contacto directo verificable requiere
explicación. Tres posibilidades: (a) el contacto existe pero no es reconocido
como tal, (b) la agencia no tiene interés en el contacto, (c) no existe
agencia. Articular las tres con la misma seriedad.

**Argumento 3 — El problema de la agentividad proyectada**
La cognición humana tiene sesgo documentado hacia detección de agencia.
Este sesgo no invalida la hipótesis pero significa que la evidencia
comportamental ("el objeto evadió a Fravor") debe evaluarse con ese sesgo
en mente. Hacer esto explícito sin usarlo para descartarlo todo.

### Estructura de la sección

**Párrafo 1** (~120 palabras): El narrador señala la asimetría y anuncia
que aplicará el mismo rigor a la hipótesis que queda en pie.

**Párrafos 2–4** (~420 palabras, ~140 cada uno): Los tres argumentos.
Misma arquitectura para cada uno: enunciado, fuerza máxima, límite.
Sin jerarquizar.

**Párrafo 5** (~160 palabras): Lo que queda. La hipótesis de agencia no
humana es la que mejor se ajusta al corpus con las restricciones
epistemológicas del libro. Eso no es demostración.

### Criterios de done — Slice 2

```powershell
# 1. Sin certeza no sostenida en la sección nueva
Select-String -Path "secciones-aprobadas\cap09-*.md" `
  -Pattern "demuestra\b|prueba\b|confirma\b"
# Esperado: sin coincidencias en párrafos nuevos

# 2. Sin "extraterrestre"
Select-String -Path "secciones-aprobadas\cap09-*.md" `
  -Pattern "extraterrestre"
# Esperado: sin coincidencias

# 3. Los tres argumentos presentes
Select-String -Path "secciones-aprobadas\cap09-*.md" `
  -Pattern "consistencia|ausencia de contacto|agentividad"
# Esperado: al menos una coincidencia de cada término

# 4. Conteo sección nueva: entre 650 y 750 palabras
# Verificar manualmente: conteo del archivo antes y después de insertar
```

---

## Criterios de done globales — Fase B completa

```powershell
# Sin términos prohibidos en todo el manuscrito nuevo
Select-String -Path "secciones-aprobadas\cap06-nimitz-*.md", `
  "secciones-aprobadas\cap09-*.md" `
  -Pattern "nave\b|extraterrestre|el narrador"
# Esperado: sin coincidencias

# Conteo total de palabras nuevas: entre 3.650 y 4.250
# (Slice 1: 3.000-3.500 + Slice 2: 650-750)

# Git log muestra un commit por slice
git log --oneline -5
```
