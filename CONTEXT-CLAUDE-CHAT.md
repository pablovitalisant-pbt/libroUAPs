# CONTEXT-CLAUDE-CHAT.md — Libro UAP: Revisión Editorial

## Qué es este proyecto

Manuscrito de no ficción sobre UAP/OVNIs. Argumento central: proceso de eliminación rigurosa de hipótesis (error de percepción → tecnología humana secreta → agencia no humana) aplicado a un núcleo verificable de casos con confirmación instrumental. El libro tiene Prólogo, 11 capítulos y Epílogo.

## Estado actual del manuscrito

- **Fase de auditoría:** completada. Auditoría editorial capítulo por capítulo realizada en conversación con Claude chat.
- **Fase de revisión:** iniciando. Claude Code ejecutará los cambios de la Fase A (intervenciones quirúrgicas sobre texto existente).

## Stack

- Archivos: `.md` en `secciones-aprobadas/`
- OS: Windows / PowerShell
- Directorio: `C:\Users\pablo\Documents\libro-uap`
- Control de versiones: Git

## Problemas críticos detectados en auditoría (Fase A los resuelve)

1. **Duplicación Parte III:** Caps 8 y 10 son el mismo capítulo. Caps 9 y 11 son el mismo capítulo. Solución: eliminar cap10, mejorar cap08 con lo mejor del cap10. Eliminar cap09, renombrar cap11→cap09.
2. **Secciones C y D redundantes en Parte III:** 8 secciones de resumen en 5 capítulos. Solución: fusionar en 2 párrafos de cierre de cada sección B.
3. **Tic del "narrador" en tercera persona:** aparece en todos los capítulos. Solución: reemplazar por primera persona en todo el manuscrito.
4. **Cierre del Epílogo:** termina anunciando el Libro 2 como publicidad. Solución: reescribir terminando con la imagen del contraste Samford-2026.
5. **Prólogo:** cierre condescendiente, narrador sin identidad, segunda mitad de catálogo editorial. Solución: cirugía parcial.
6. **Manises sin documentación:** aparece como evidencia en caps de conclusión sin desarrollo en Parte II. Solución: eliminar o reemplazar por Nimitz.
7. **Afirmaciones universales:** "ningún programa clasificado" sin calificación. Solución: añadir "conocido".
8. **Fecha de Pasteur:** 1859 en texto, correcto es 1861.
9. **Iconografía Grey atribuida solo a Communion:** falta antecedentes Hill (1961) y Pascagoula (1973).
10. **Hipótesis inversión térmica Washington 1952:** no evaluada con el mismo rigor que otras hipótesis del libro.

## Problemas que Fase A NO resuelve (Fase B — escritura nueva)

- Capítulo del Nimitz inexistente en Parte II
- Trans-en-Provence no narrado como experiencia (Nicolaï sin voz)
- Rueda de prensa de Samford no narrada
- Sección que intenta descartar hipótesis de agencia no humana (asimetría de rigor)
- Grabación de audio de Halt no usada en Cap04
- Citas directas de testigos de 1896 ausentes en Cap02
- Identidad del narrador no establecida (una frase en el Prólogo — incluido en Fase A)

## Backlog Fase A — 8 slices

| Slice | Descripción | Archivos principales |
|-------|-------------|---------------------|
| 1 | Resolver duplicación caps 8/10 y 9/11 | cap08-*.md, cap09-*.md, cap10-*.md, cap11-*.md |
| 2 | Fusionar secciones C y D en caps 7, 8, 9 | cap07-*.md, cap08-*.md, cap09-*.md |
| 3 | Eliminar tic "el narrador" en todo el manuscrito | todos los .md |
| 4 | Reescribir cierre del Epílogo | epilogo.md |
| 5 | Revisar Prólogo | prologo-A.md |
| 6 | Eliminar Manises, corregir afirmaciones universales, fecha Pasteur, iconografía Grey | cap07-A.md, cap08-*.md, cap09-*.md |
| 7 | Añadir evaluación hipótesis inversión térmica Washington 1952 | cap05-*.md |
| 8 | Propagación "causa probable", revisión referencias cruzadas | prologo-A.md, MANUSCRITO.md |

## Calificaciones de auditoría (referencia)

Prólogo 6.5 / Cap1 7.0 / Cap2 6.5 / Cap3 6.0 / Cap4 7.5 / Cap5 5.5 / Cap6 5.5 / Cap7 7.5 / Cap8 7.0 / Cap9 6.5 / Cap10 N/A / Cap11 7.5 / Epílogo 5.5 — **Media: 6.6**

## Cómo usar este contexto

Pegar en una conversación nueva con Claude chat cuando necesites decisiones de arquitectura, resolución de dudas editoriales durante la Fase A, o planificación de la Fase B.
