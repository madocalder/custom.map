install: check
	R -s -e "devtools::install()"

check: mkdocs 
	R -s -e "devtools::check()"

document:  
	R -s -e "devtools::document()"

mkdocs: document
	mkdocs build
	
mkdocs_dev:
	mkdocs serve

dev: document
	Rscript test.R

