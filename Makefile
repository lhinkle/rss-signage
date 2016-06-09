# Currently, everything will just build with a single run of pdflatex
# This is just a convenience for cleanup, and placeholder for more complex
# build setup.

RACKHAM_TEX = $(shell ls rackham*.tex)
LEAGUE_TEX = $(shell ls league*.tex)
NQ_TEX = $(shell ls nq*.tex)

RACKHAM_PDF = $(RACKHAM_TEX:%.tex=%.pdf)
LEAGUE_PDF = $(LEAGUE_TEX:%.tex=%.pdf)
NQ_PDF = $(NQ_TEX:%.tex=%.pdf)

OUTPUT_DIR = print-ready
OUTPUT_PDF = $(addprefix $(OUTPUT_DIR)/, $(RACKHAM_PDF))
OUTPUT_PDF += $(addprefix $(OUTPUT_DIR)/, $(LEAGUE_PDF))
OUTPUT_PDF += $(addprefix $(OUTPUT_DIR)/, $(NQ_PDF))


all: $(OUTPUT_PDF)
	@rm -f $(OUTPUT_DIR)/*.aux $(OUTPUT_DIR)/*.log

$(OUTPUT_DIR)/%.pdf: %.tex | $(OUTPUT_DIR)
	@echo "\t[$@]"
	@pdflatex -output-directory $(OUTPUT_DIR) $^

$(OUTPUT_DIR):
	@echo "[$(OUTPUT_DIR)]"
	@mkdir $(OUTPUT_DIR)

templates:

clean:
	rm -f *.aux *.log *.pdf $(OUTPUT_DIR)/*.pdf $(OUTPUT_DIR)/*.log $(OUTPUT_DIR)/*.aux
	rmdir $(OUTPUT_DIR)
