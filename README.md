# Quantitative Research Thesis Template

This public template provides a robust LaTeX thesis format tailored for anyone conducting quantitative research. It includes working examples for common thesis elements (figures, tables, algorithms, code, glossaries, acronyms, citations), so you can spend more time on content and results.

## Key Features

- Professional structure: `book` class with front matter, lists (figures, tables, listings, algorithms), and appendices.
- Quant methods ready: math (`amsmath`, `amssymb`), units (`siunitx`), algorithms (`algorithm2e`), and high-quality tables (`booktabs`, `threeparttablex`).
- Reproducible assets: SVG and EPS auto-conversion via Inkscape/epstopdf into `figures-converted/`.
- Clean references: `natbib` with `apalike` style and `cleveref` for robust cross-references.
- Glossaries & acronyms: `glossaries` configured with examples in [glossaries.tex](glossaries.tex).
- Code listings: configured `listings` for readable, citable snippets.

## Quick Start

### Overleaf

Use the maintained Overleaf project:

https://www.overleaf.com/read/ddfmndqjycyn#ae66eb

### Local (Windows)

Prerequisites:

- MiKTeX: https://miktex.org/download
- Inkscape (optional, for SVG conversion): https://inkscape.org

Build and clean:

```powershell
# Build the thesis (runs pdflatex ×3, bibtex, makeglossaries)
./build.bat

# Clean auxiliary files and converted assets
./clean.bat
```

The output PDF is `main.pdf` in the project root.

## Project Structure

- [main.tex](main.tex): thesis entry point and chapter structure.
- [preamble.tex](preamble.tex): packages, styles, headers, and referencing.
- [iem.sty](iem.sty): cover page and UT IEM styling helpers.
- [references.bib](references.bib): bibliography database.
- [glossaries.tex](glossaries.tex): glossary and acronym definitions.
- [figures/](figures/): source images (PNG/JPG/SVG/EPS).
- [figures-converted/](figures-converted/): auto-generated assets (do not edit).
- [logos/](logos/): institutional logos.
- [build.bat](build.bat), [clean.bat](clean.bat): Windows build and cleanup scripts.

## Writing Guide (Common Elements)

- Figures:
	- Raster/vector: place in `figures/` and reference with `\includegraphics`.
	- SVG: use `\includesvg[width=...]{figures/your-figure}`; conversion handled during build.
	- EPS: drop into `figures/`; automatic PDF conversion via `epstopdf`.

- Tables:
	- Prefer `booktabs` (`\toprule`, `\midrule`, `\bottomrule`).
	- Use `threeparttablex` for footnotes; avoid vertical lines for readability.

- Algorithms:
	- Use `algorithm2e` with `\begin{algorithm}` and options (`linesnumbered, ruled, vlined`).
	- Reference algorithms via `\label{}` and `\Cref{}`.

- Code Listings:
	- Use `listings` with `\begin{lstlisting}[language=Python] ... \end{lstlisting}` (set language as needed).

- Math & Units:
	- Use `amsmath` environments and `siunitx` for units and numbers (e.g., `\SI{12.5}{\kilo\meter}`).

- Cross-References:
	- Use `\Cref{fig:..., tab:..., alg:...}` for capitalized, robust references via `cleveref`.

- Citations:
	- Add entries to [references.bib](references.bib) and cite with `natbib` commands:
		- Author-year in text: `\citet{key}`; parenthetical: `\citep{key}`.

- Glossaries & Acronyms:
	- Define in [glossaries.tex](glossaries.tex) with `\newglossaryentry` and `\newacronym`.
	- Use `\gls{}` (singular) / `\glspl{}` (plural) in text; lists are auto-generated.

## Recommended Workflow

- Update metadata in [preamble.tex](preamble.tex) and cover details via commands in [main.tex](main.tex).
- Draft content per chapter in [main.tex](main.tex) (or split into `\include{}` files if preferred).
- Keep figures and tables close to where they’re first referenced; label everything.
- Commit early and often; the repository is public to encourage collaboration and reproducibility.

## Troubleshooting

- Inkscape not found: SVGs won’t convert; install Inkscape and ensure it’s on PATH.
- Missing packages: MiKTeX will prompt to install; accept on first build.
- Glossaries not appearing: ensure `makeglossaries` ran (included in `build.bat`).

## Contributing

Issues and pull requests are welcome. Please:

- Keep examples minimal yet instructive.
- Document any new packages or commands in [preamble.tex](preamble.tex).
- Add usage notes or examples when introducing new thesis elements.
