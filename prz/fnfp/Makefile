slides.pdf: fnfp.sty frames/*.tex slides.tex
	latexmk slides

thumbnail.png: slides.pdf
	inkscape -o thumbnail.png slides.pdf

article.pdf: content.tex fnfp.sty frames/*.tex article.tex
	latexmk article

clean:
	latexmk -c
	cd frames && latexmk -c
