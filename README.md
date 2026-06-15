# Response Letter Template

A simple LaTeX template for preparing point-by-point responses to editors and reviewers. The template separates reviewer comments from author responses, applies consistent formatting, and includes common packages for citations, figures, tables, equations, and cross-references.
## Preview
![Preview](https://raw.githubusercontent.com/xuestrange/picGoUploader/main/img/Screenshot%202026-06-15%20at%2013-21-59.png)

## Files

- `main.tex`: Main response letter content.
- `response.cls`: Custom LaTeX class that defines the response-letter layout and environments.
- `ref.bib`: Bibliography file where all references are located.
- `figure/`: Suggested location for figures.
- `table/`: Suggested location for tables.

## Core Usage

1. Edit the title block in `main.tex` with the manuscript title and tracking number.
2. Add editor and reviewer sections as needed.
3. Use `comment[void]` for unnumbered introductory or summary comment boxes:
   ```tex
   \begin{comment}[void]
   Opening note or editor summary.
   \end{comment}
   ```
4. Put each reviewer's valid comment inside a regular `comment` environment:
   ```tex
   \begin{comment}
   Reviewer comment text goes here.
   \end{comment}
   ```
5. Put each reply inside a `response` environment:
   ```tex
   \begin{response}
   Our response text goes here.
   \end{response}
   ```
6. Add all references to `ref.bib` and cite them with normal BibLaTeX commands such as `\citet{...}` or `\citep{...}`.
```tex
\addbibresource{ref.bib}
```

## Advantages

- Clear point-by-point structure for editor and reviewer replies.
- Automatic comment numbering within each section.
- Visually distinct comment boxes and blue response text.
- Built-in support for APA-style references through BibLaTeX and Biber.
- Common academic writing packages are preloaded for tables, figures, equations, landscape pages, and cross-references.
- Consistent page margins, line spacing, fonts, hyperlinks, and page numbering are handled by `response.cls`.
