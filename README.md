**IAVS-2026**
This repository contains data, code, and figure outputs used to produce the IAVS 2026 poster on Cerrado forb community responses to fire suppression.

**Project structure**
    data/: raw input data used in the analyses.

    scripts/: supporting R scripts for plotting and analysis steps.

    figures/: figure outputs generated for the poster.
    .quarto/: Quarto project files.
    poster_iavs2026.qmd: main Quarto document used to run the workflow and assemble analyses, figures, and poster content.

    renv/, renv.lock, .Rprofile: files used to manage the R environment and improve computational reproducibility.

**Reproducibility**
All data files in data/ are treated as raw input files. The forb dataset used in this project is part of a larger database that is currently being reorganized; therefore, the complete dataset is not yet available. Data cleaning, filtering, analysis, and figure generation are performed in the Quarto workflow (*poster_iavs2026.qmd*) and, when needed, in supporting scripts stored in scripts/.

To reproduce the project:

a) Open the project in RStudio or VS Code with R support enabled;

b) Restore the project environment with renv::restore();

c) Render the Quarto document poster_iavs2026.qmd.


This project is organized to support reproducibility and FAIR-oriented practices:
    
1. Findable: clear folder structure and descriptive file names.
2. Accessible: plain-text scripts and documentation.
3. Interoperable: preference for open tabular formats such as .csv when possible.
4. Reusable: analytical steps are documented in code rather than performed manually.

Contact

@gabrieladezotti

gabriela.dezotti@unesp.br
