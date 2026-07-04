# Defensa Personal para Mujeres — Manual del Estudiante

Proyecto LaTeX del manual *Defensa Personal para Mujeres* (edición revisada
y ampliada, 2026). El documento original (`.odt`) se ha convertido a un
proyecto LaTeX modular, con un capítulo por archivo.

## Estructura del proyecto

```
manual-defensa-personal/
├── main.tex                 # Documento principal: incluye todos los capítulos
├── preamble.tex             # Paquetes, idioma, estilos y cajas destacadas
├── frontmatter/
│   └── portada.tex          # Página de título
├── chapters/                # Un archivo por capítulo
│   ├── 01-introduccion.tex
│   ├── 02-estructura-programa.tex
│   ├── 03-actitud.tex
│   ├── 04-como-actuar.tex
│   ├── 05-ejercicios-observacion.tex
│   ├── 06-cuestiones-legales.tex
│   ├── 07-tipos-agresores.tex
│   ├── 08-agresor-sexual.tex
│   ├── 09-violencia-pareja.tex
│   ├── 10-tipos-agresiones.tex
│   ├── 11-entrenamiento.tex
│   ├── 12-puntos-a-golpear.tex
│   ├── 13-guardia-y-distancia.tex
│   ├── 14-aplicaciones-moviles.tex
│   ├── 15-conclusiones.tex
│   └── 16-fuentes-bibliografia.tex   # Bibliografía (BibTeX) + licencia
├── bibliography/
│   └── referencias.bib      # Base de datos bibliográfica (autor-año)
├── figures/                 # Imágenes
├── .latexmkrc               # Configuración de compilación con latexmk
├── Makefile                 # Atajos de compilación
└── .gitignore               # Ignora ficheros auxiliares de LaTeX
```

## Cómo compilar

El motor recomendado es **pdfLaTeX**. La bibliografía se genera con **BibTeX**.

### Opción 1 — latexmk (recomendada)

```bash
latexmk            # genera main.pdf resolviendo índice y bibliografía
latexmk -c         # limpia ficheros auxiliares (conserva el PDF)
latexmk -C         # limpia también el PDF
```

### Opción 2 — make

```bash
make               # compila el PDF
make clean         # limpia auxiliares
make view          # compila y abre el PDF
```

### Opción 3 — manual

```bash
pdflatex main
bibtex   main
pdflatex main
pdflatex main
```

> Se necesitan dos pasadas finales de `pdflatex` para que el índice, las
> referencias cruzadas y las citas queden bien resueltos.

## Notas técnicas

- **Idioma.** Se usa `babel` moderno con `\babelprovide[import,main]{spanish}`,
  que no depende del antiguo `spanish.ldf` y aporta «Capítulo», «Índice»,
  fechas y guionado en español.
- **Bibliografía.** Estilo autor-año con `natbib` + `plainnat`. Las fuentes
  citadas en el texto usan `\citep`/`\citeyear`; las consultadas pero no
  citadas explícitamente se incluyen con `\nocite` para preservar la lista
  completa de fuentes del original.
- **Cajas destacadas.** Definidas con `tcolorbox` en `preamble.tex`:
  `aviso`, `consejo`, `reglaoro` y `definicion`. Para añadir una nueva:

  ```latex
  \begin{consejo}
  Texto del consejo...
  \end{consejo}
  ```

- **Comillas.** Se emplea `csquotes` (`\enquote{...}`), que produce las
  comillas «latinas» propias del español.

## Imágenes

El manual original no incluía ilustraciones. Para añadirlas, coloca los
archivos en `figures/` y referéncialos así (la ruta ya está configurada
con `\graphicspath`):

```latex
\begin{figure}[h]
  \centering
  \includegraphics[width=0.7\linewidth]{nombre-imagen}
  \caption{Descripción.}
\end{figure}
```

## Editar un solo capítulo

Para acelerar la compilación mientras editas, descomenta y ajusta en
`main.tex`:

```latex
\includeonly{chapters/03-actitud}
```

## Licencia

La obra está bajo **Creative Commons BY-NC-SA 3.0 Unported**. Las obras
derivadas deben distribuirse bajo la misma licencia.
