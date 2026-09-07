# BInary_ANalysis_R_Package (BIAN): An R Package for Binary Analysis of AMR, MDR and Metal-Resistance in Microbial Taxa

Author: Bhagwan Rekadwad

The Binary Analysis Tool is a method for detecting and assessing the presence or absence of antimicrobial resistance (AMR), multidrug resistance (MDR), and metal resistance genes in bacterial isolates or genomes, using a 1- or 0-based scale. It concentrates binary abundance in each, making it a useful tool for comparative genomics, surveillance studies, and epidemiological research. This tool is available via https://github.com/Terra-Human/binary-analysis-amr-metal-mdr-genes.git.

BIAN_BInary_ANalysis_R_Package/
│
├── DESCRIPTION
├── NAMESPACE
├── LICENSE
├── README.md
├── NEWS.md
│
├── R/
│   ├── binary_matrix.R
│   ├── amr_analysis.R
│   ├── mdr_analysis.R
│   ├── metal_analysis.R
│   ├── heatmap.R
│   ├── prevalence.R
│   ├── resistance_burden.R
│   └── export_functions.R
│
├── inst/
│   └── extdata/
│       └── example_binary_matrix.csv
│
├── man/
│   └── ...
│
├── scripts/
│   ├── Script_01_AMR_Genes.R
│   ├── Script_02_MDR_Efflux_Resistance.R
│   └── Script_03_Metal_Resistance.R
│
├── tests/
│   └── testthat/
│
└── vignettes/
    └── BIAN_workflow.Rmd
