# =====================================================================
#  .latexmkrc — Configuración de compilación con latexmk
#  Uso:  latexmk          (compila main.pdf con pdflatex + bibtex)
#        latexmk -c        (limpia ficheros auxiliares, conserva el PDF)
#        latexmk -C        (limpia también el PDF)
#
#  Se compila en la raíz del proyecto (en vez de en build/) porque es
#  lo más robusto cuando se usan \include con subcarpetas (cada \include
#  genera su propio .aux) y coincide con el comportamiento de Overleaf.
#  Los ficheros auxiliares están en .gitignore.
# =====================================================================
$pdf_mode = 1;             # 1 = pdflatex
$bibtex_use = 2;           # usa bibtex y limpia .bbl al hacer -C
@default_files = ('main.tex');

# Extensiones auxiliares adicionales a limpiar con -c / -C
$clean_ext = 'bbl synctex.gz run.xml';
