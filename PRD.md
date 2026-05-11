# PRD — Revisión Editorial Libro UAP (Fase A)

## Descripción del proyecto

Revisión editorial autónoma del manuscrito del libro de no ficción sobre UAP/OVNIs ubicado en `C:\Users\pablo\Documents\libro-uap`. El trabajo consiste en aplicar un conjunto de intervenciones quirúrgicas sobre archivos `.md` existentes: eliminar duplicaciones, fusionar secciones redundantes, corregir errores de voz, reescribir cierres débiles y eliminar referencias sin respaldo documental. No se escribe contenido nuevo en esta fase.

## Usuarios y roles

- **Pablo (autor/editor):** revisa y aprueba cada commit al terminar un slice.
- **Claude Code:** ejecuta los cambios slice por slice, sin pausas de aprobación intermedia dentro de cada slice.

## Estructura del repositorio

```
libro-uap/
├── .claude/
│   └── settings.local.json
├── fuentes/
│   ├── casos-verificados.md
│   └── fuentes-descartadas.md
├── secciones-aprobadas/       ← todos los archivos de trabajo
│   ├── prologo-A.md
│   ├── cap01-A.md ... cap01-D.md
│   ├── cap02-A.md ... cap02-D.md
│   ├── cap03-A.md ... cap03-D.md
│   ├── cap04-A.md ... cap04-D.md
│   ├── cap05-A.md ... cap05-D.md
│   ├── cap06-A.md ... cap06-D.md
│   ├── cap07-A.md ... cap07-D.md
│   ├── cap08-A.md ... cap08-D.md
│   ├── cap09-A.md ... cap09-D.md
│   ├── cap10-A.md ... cap10-D.md  ← DUPLICADO de cap08 — se elimina
│   ├── cap11-A.md ... cap11-D.md  ← REEMPLAZA a cap09
│   ├── epilogo.md
│   └── mdmerger.py
├── CLAUDE.md
├── MANUSCRITO.md
└── PROMPT-MAESTRO.md
```

## Backlog Fase A — Intervenciones quirúrgicas

### SLICE 1 — Resolver duplicación Parte III (caps 8/10 y 9/11)
**Archivos afectados:** cap08-*.md, cap09-*.md, cap10-*.md, cap11-*.md

- Eliminar cap10-A.md, cap10-B.md, cap10-C.md, cap10-D.md (duplicado de cap08)
- Mejorar cap08-A.md con el opening de cap10-A.md (párrafos 1-3: Powers, Khrushchev, "furia ensayada")
- Mejorar cap08-B.md con la Sección B de cap10-B.md (más desarrollada, añade Greenglass al trío de espías, cuarto problema del comportamiento más detallado)
- Eliminar cap09-A.md, cap09-B.md, cap09-C.md, cap09-D.md (versión más débil)
- Renombrar cap11-*.md → cap09-*.md (versión más fuerte, pasa a ser el cap09 definitivo)
- Actualizar referencias internas ("Capítulo 10", "Capítulo 11") en todos los archivos afectados

### SLICE 2 — Fusionar secciones C y D en Parte III
**Archivos afectados:** cap07-C.md, cap07-D.md, cap08-C.md, cap08-D.md, cap09-C.md, cap09-D.md (nueva numeración)

Para cada capítulo de la Parte III (7, 8, 9):
- Extraer el contenido esencial de las secciones C y D: las tres precisiones del descarte + la transición al capítulo siguiente
- Reducir ese contenido a 2 párrafos máximo
- Añadirlos como cierre de la sección B del capítulo correspondiente (cap07-B.md, cap08-B.md, cap09-B.md)
- Eliminar los archivos cap07-C.md, cap07-D.md, cap08-C.md, cap08-D.md, cap09-C.md, cap09-D.md
- Actualizar referencias en MANUSCRITO.md si las hay

### SLICE 3 — Eliminar el tic del "narrador" en tercera persona
**Archivos afectados:** todos los archivos en secciones-aprobadas/

Buscar y reemplazar en todo el manuscrito todas las variantes de:
- "el narrador debe"
- "el narrador puede"
- "el narrador afirma"
- "el narrador señala"
- "el narrador declara"
- "el narrador no"
- "el narrador menciona"
- "el narrador usa"
- "el narrador describe"
- "el narrador reproduce"
- "el narrador trata"

Reemplazar cada instancia por primera persona ("debo", "puedo", "afirmo", etc.) o por voz implícita según el contexto. Excepciones: preservar la aparición en cap09-B.md (nueva numeración) donde "El narrador registra el comportamiento. No lo interpreta." tiene fuerza estilística — en ese caso reescribir como "Registro el comportamiento. No lo interpreto."

### SLICE 4 — Corregir el cierre del Epílogo
**Archivos afectados:** epilogo.md

- Eliminar las dos últimas frases: "Setenta y cuatro años entre esas dos declaraciones. El Libro 2 documenta lo que ocurrió entre una y otra."
- Reemplazar el cierre con una variación que derive del contraste Samford-2026 ya presente en el texto, terminando con el libro mirando hacia adentro (lo que el Libro 1 estableció) y no hacia afuera (lo que el Libro 2 hará)
- El nuevo cierre debe tener el mismo tono sobrio y la misma economía verbal que "Es la descripción exacta de dónde estamos" del cap09 (nueva numeración)
- Eliminar la frase exacta "Como si lo que venía después también estuviera esperando su turno" — está repetida del Prólogo. Sustituir por una formulación nueva con el mismo significado

### SLICE 5 — Revisar el Prólogo
**Archivos afectados:** prologo-A.md

- Eliminar las dos últimas frases del Prólogo: "Si el gobierno más poderoso del mundo admite que no sabe qué son esos objetos, la pregunta no es si deberías creerle. La pregunta es: ¿qué te impide a ti tomarlo en serio?"
- Reemplazar el cierre con una frase que termine en la incertidumbre del narrador — en el momento en que acaba de leer el comunicado del Pentágono por tercera vez y no sabe qué hacer con lo que leyó
- Eliminar el párrafo que comienza "Este libro construye esa respuesta por eliminación rigurosa. Descarta el ruido..." — es prosa de catálogo editorial, no de narración
- Eliminar o condensar la lista de casos (Trans-en-Provence, Rendlesham, Teherán) que aparece antes del cierre — en el Prólogo son nombres vacíos sin contexto
- Añadir en el segundo o tercer párrafo una frase que establezca la identidad profesional del narrador (una sola frase, sin biografía)
- Añadir en algún punto del Prólogo la formulación "causa probable, consistente con la evidencia disponible" como contrato con el lector sobre el tipo de conclusión que encontrará al final

### SLICE 6 — Eliminar Manises sin documentación y corregir afirmaciones universales
**Archivos afectados:** cap08-A.md, cap08-B.md, cap09-A.md, cap09-B.md (nueva numeración), epilogo.md

- Buscar todas las apariciones de "Manises" en el manuscrito
- Eliminarlas de los párrafos donde aparecen como evidencia sin sustituir por otro caso, o sustituir por una referencia al caso Nimitz (que sí tiene documentación desarrollada en el libro)
- Buscar todas las apariciones de "ningún programa clasificado" o "ningún programa militar" seguidas de afirmaciones absolutas
- Añadir la calificación "conocido" o "del que tengamos registro histórico" en cada caso
- Corregir la fecha de Pasteur: "1859" → "1861" en cap08-D.md (o cap09 según nueva numeración tras los slices anteriores)
- Verificar y corregir la afirmación sobre la iconografía Grey atribuida exclusivamente a Communion de Whitley Strieber — añadir los antecedentes de Betty y Barney Hill (1961) y Pascagoula (1973) en cap07-A.md

### SLICE 7 — Evaluar hipótesis de inversión térmica Washington D.C. 1952
**Archivos afectados:** cap05-A.md o cap05-B.md (según donde esté el desarrollo del caso Washington)

- Localizar el tratamiento del caso Washington D.C. 1952 en los archivos del Cap05
- Añadir un párrafo de evaluación de la hipótesis de inversión térmica con la misma estructura de cuatro puntos que el Capítulo 1 usa para el halo solar:
  - Qué puede explicar la hipótesis (luces en el cielo, condiciones de julio en D.C.)
  - Punto débil 1: los objetos desaparecían al aproximarse los cazas — las inversiones térmicas no responden a aeronaves
  - Punto débil 2: el patrón se repitió en dos noches distintas con la misma secuencia — no es consistente con un fenómeno atmosférico aleatorio
  - Punto débil 3: múltiples radares con geometrías distintas registraron los mismos objetos — las inversiones térmicas no producen coincidencia radar multi-geometría con esa precisión
  - Conclusión modesta: la hipótesis no cierra satisfactoriamente para el subconjunto de datos más sólidos del caso

### SLICE 8 — Propagación de "causa probable" y revisión de referencias cruzadas
**Archivos afectados:** prologo-A.md, MANUSCRITO.md

- Verificar que la formulación "causa probable, consistente con la evidencia disponible" aparezca al menos en el Prólogo (ya encargado en Slice 5) y en el cap09-A.md (nueva numeración)
- Revisar MANUSCRITO.md para actualizar el índice o cualquier referencia a números de capítulo que haya cambiado por la eliminación de cap10 y la renumeración de cap11→cap09
- Verificar que todas las referencias cruzadas internas ("como el Capítulo 4 documentó", "que el Capítulo 7 estableció") sean correctas después de la renumeración

## Lo que NO hace esta fase

- No escribe el capítulo del Nimitz
- No narra Trans-en-Provence como experiencia en Cap05
- No narra la rueda de prensa de Samford
- No desarrolla a Renato Nicolaï como personaje
- No añade la sección que intenta descartar la hipótesis de agencia no humana en Cap09
- No añade la grabación de audio de Halt en Cap04
- No añade citas directas de testigos de 1896

Todo lo anterior es Fase B — escritura nueva que requiere decisiones editoriales del autor.

## Definición de "borrador revisado" completado

La Fase A está completa cuando:
- No existen cap10-*.md en secciones-aprobadas/
- cap09-*.md son los archivos renumerados del cap11 original
- Los capítulos 7, 8 y 9 tienen 2 secciones cada uno (A y B), sin C ni D como archivos independientes
- grep "el narrador" en todo secciones-aprobadas/ devuelve 0 resultados
- epilogo.md no contiene "El Libro 2 documenta"
- prologo-A.md no contiene "¿qué te impide a ti tomarlo en serio?"
- "Manises" no aparece en ningún archivo sin referencia documental
- La fecha de Pasteur en el manuscrito es 1861
- MANUSCRITO.md tiene índice actualizado
