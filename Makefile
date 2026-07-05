lat# =====================================================================
#  Makefile — Manual de Defensa Personal para Mujeres
# =====================================================================
MAIN    = main
LATEXMK = latexmk

.PHONY: all pdf clean distclean view

all: pdf

## pdf: compila el manual completo (índice + bibliografía)
pdf:
	$(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error $(MAIN).tex

## clean: elimina ficheros auxiliares, conserva el PDF
clean:
	$(LATEXMK) -c

## distclean: elimina todo lo generado, incluido el PDF
distclean:
	$(LATEXMK) -C

## view: abre el PDF resultante
view: pdf
	@xdg-open $(MAIN).pdf 2>/dev/null || open $(MAIN).pdf 2>/dev/null || true
