Description of the work/Package Name: BInary ANalysis R Package
Title of the work (in English): BInary ANalysis R Package for AMR, MDR, and Metal-Resistance in Bacteria
Long Title: BInary ANalysis R Package (BIAN) for analysis of antimicrobial resistance (AMR), multidrug resistance (MDR), and metal-resistance-associated determinants in bacterial genomes
Language of the Work: English
Author and Owner: Bhagwan Rekadwad
Version: 1.0.0
Repository:
https://github.com/Terra-Human/binary-analysis-amr-metal-mdr-genes
Zenodo:
https://zenodo.org/records/21472686

Overview
BIAN (BInary ANalysis) is an R-based framework for characterizing and visualizing the genomic distribution of antimicrobial resistance (AMR), multidrug-resistance (MDR), and metal-resistance-associated determinants across bacterial isolates or genomes.
BIAN converts curated genomic resistance-associated features into a binary presence/absence matrix, in which:
•	1 = determinant detected/present
•	0 = determinant not detected/absent
The resulting matrix provides an interpretable representation of resistance-associated genomic profiles across bacterial genomes and can be used for comparative genomics, microbial surveillance, environmental microbiology, and epidemiological studies.
Importantly, BIAN distinguishes genomic detection of resistance-associated determinants from phenotypically confirmed resistance. Detection of a gene alone does not necessarily establish antimicrobial resistance, multidrug resistance, or metal resistance.

Scientific rationale
Genomic analyses frequently produce large lists of genes associated with antimicrobial resistance, multidrug resistance, metal resistance, transport, and cellular homeostasis. However, simple detection of a gene does not always establish that it functions as a resistance determinant.
BIAN therefore provides a transparent binary framework in which resistance-associated determinants can be curated before binary profiling.
The framework is particularly useful for distinguishing:
1.	Acquired antimicrobial-resistance genes
2.	Intrinsic chromosomal resistance determinants
3.	Resistance-associated mutations
4.	Characterized multidrug-resistance determinants
5.	Metal-resistance determinants
6.	General physiological transporters
7.	Metal uptake/homeostasis genes
8.	Nonspecific efflux systems
Only determinants satisfying the predefined classification criteria should be included in the final binary resistance matrix.

Features
BIAN supports:
•	Binary presence/absence analysis
•	AMR determinant profiling
•	MDR-associated determinant profiling
•	Metal-resistance determinant profiling
•	Genome-level comparison
•	Gene-level comparison
•	Binary matrix generation
•	Binary heatmap visualization
•	Export of processed matrices and figures
•	Reproducible R-based analysis
•	Custom user-defined determinant categories
•	Analysis of unequal numbers of bacterial genomes
•	Transparent separation of genomic evidence from phenotypic resistance

Input data
BIAN uses a binary matrix containing resistance-associated determinants and bacterial genomes.
A typical input file is:
binary_table.csv
Example:
Determinant	Genome_01	Genome_02	Genome_03	Genome_04
blaOXA	1	1	0	0
gyrA_QRDR_mutation	0	1	1	0
acrB_AMR	1	1	1	0
czcA	1	0	1	1
The first column contains determinant names and subsequent columns contain individual bacterial genomes or isolates.

Binary coding
BIAN uses a binary representation:
1 = present/detected
0 = absent/not detected
The binary value should be assigned after resistance-determinant curation.
For example:
Gene detected
      ↓
Functional/database assessment
      ↓
Resistance-associated determinant?
      ↓
Yes → 1
No  → exclude or classify separately
A gene should not automatically be assigned 1 as a resistance determinant solely because its name contains terms such as:
•	efflux
•	transporter
•	metal
•	resistance
•	uptake
•	homeostasis
Functional context and curated evidence should be considered.

AMR classification
AMR determinants should be identified using an established AMR resource and predefined criteria.
Depending on the upstream analysis, users may use resources such as:
•	CARD
•	AMRFinderPlus
•	ResFinder
•	BV-BRC AMR resources
•	Other appropriately curated AMR databases
The database name, version, date, detection criteria, sequence identity threshold, alignment coverage, and E-value should be documented for reproducibility.
Important distinction
Detection of an AMR-associated gene represents:
genomic evidence of resistance potential
and should not automatically be reported as:
phenotypically confirmed antimicrobial resistance
unless antimicrobial susceptibility testing (AST) or other experimental evidence is available.

Resistance-associated mutations
For resistance mechanisms that depend on specific mutations, gene presence alone should not be considered sufficient evidence.
For example:
gyrA present
does not automatically mean:
fluoroquinolone resistant
Where applicable, specific resistance-associated mutations should be evaluated.
For example, fluoroquinolone resistance may involve mutations in the quinolone-resistance-determining region (QRDR) of genes such as:
•	gyrA
•	gyrB
•	parC
•	parE
The binary matrix should therefore distinguish:
gene present
from:
resistance-associated mutation present
when the resistance mechanism depends on a specific variant.

Intrinsic versus acquired determinants
BIAN supports separate classification of intrinsic and acquired resistance-associated determinants.
For example, an intrinsic chromosomal determinant such as:
blaOXA-51-like
in Acinetobacter baumannii should not automatically be treated as an acquired ARG.
Users should therefore maintain separate categories where appropriate:
Acquired ARG
Intrinsic determinant
Resistance-associated mutation
This prevents intrinsic species-associated genes from being incorrectly interpreted as horizontally acquired resistance genes.

MDR and efflux classification
The presence of an efflux transporter gene does not automatically establish multidrug resistance.
General physiological transporters and housekeeping efflux systems may have functions unrelated to antimicrobial resistance.
BIAN therefore recommends including an efflux determinant in the MDR matrix only when it has a documented association with antimicrobial resistance or belongs to a characterized resistance-associated system.
Thus:
Efflux transporter detected
          ↓
Documented AMR-associated function?
       /        \
     YES         NO
      ↓           ↓
 MDR determinant  General transporter

Metal-resistance classification
Genes involved in metal uptake or cellular metal homeostasis should not automatically be classified as metal-resistance genes.
A qualifying metal-resistance determinant should have evidence supporting a role in mechanisms such as:
•	metal efflux
•	metal detoxification
•	metal sequestration
•	metal transformation
•	metal reduction
•	protection against metal toxicity
Genes involved solely in:
•	essential metal uptake
•	nutrient transport
•	physiological metal homeostasis
•	general cellular transport
should not automatically be classified as metal-resistance determinants.

Binary matrix generation
The general workflow is:
Genome sequences / annotations
            ↓
Functional annotation
            ↓
AMR / MDR / metal-resistance identification
            ↓
Resistance determinant curation
            ↓
Removal of nonspecific physiological genes
            ↓
Binary matrix generation
            ↓
0 = absent
1 = present
            ↓
Visualization and comparative analysis
The binary matrix should contain individual genomes/isolates as individual observations unless an explicitly defined aggregation procedure is being used.

Handling unequal numbers of genomes
BIAN does not require equal numbers of genomes per genus.
For genome-level analysis:
Genus A → 20 genomes
Genus B → 10 genomes
Genus C → 5 genomes
all available genomes may be retained.
No genome should be duplicated merely to equalize group sizes.
No genome should be randomly removed unless a specific statistical analysis requires balanced sampling.
Therefore, the binary heatmap represents the observed genomic composition of the dataset.
Users should report the number of genomes analyzed for each taxonomic group.

Binary heatmap visualization
BIAN can visualize the binary matrix as a presence/absence heatmap.
For example:
              Genome1 Genome2 Genome3 Genome4

AMR_gene_A       1       0       1       1
AMR_gene_B       0       1       1       0
MDR_gene_A       1       1       0       0
Metal_gene_A     0       1       1       1
Conditional formatting can be used to visually distinguish:
1 = present
0 = absent
Conditional formatting is a visualization procedure only.
It does not perform:
•	distance calculation
•	clustering
•	statistical testing
•	significance testing
•	resistance prediction
Therefore, a binary presence/absence heatmap should be interpreted as a descriptive visualization unless an independent statistical analysis is performed.

Clustering
The basic BIAN binary heatmap does not require clustering.
If clustering is applied as an optional analysis, the distance metric and clustering method must be explicitly specified.
For binary genomic profiles, appropriate choices may include:
•	Jaccard distance
•	asymmetric binary distance
with an explicitly reported hierarchical clustering linkage method.
BIAN does not assume a particular clustering method when generating a simple binary presence/absence visualization.

Recommended analysis workflow
A reproducible analysis should document:
Step 1 — Genome input
Provide:
•	genome/strain identifiers
•	genome assemblies or protein sequences
•	taxonomic information
Step 2 — Functional annotation
Document:
•	annotation software
•	software version
•	database
•	database version/date
Step 3 — Resistance identification
Document:
•	AMR database
•	database version
•	search algorithm
•	sequence identity threshold
•	alignment coverage threshold
•	E-value
•	other detection parameters
Step 4 — Resistance curation
Remove or separately classify:
•	general transporters
•	housekeeping genes
•	physiological efflux systems
•	metal uptake genes
•	nonspecific homologues
•	pseudogenes
•	truncated sequences
•	intrinsic determinants when the objective is acquired ARG analysis
Step 5 — Binary matrix
Create:
1 = qualifying determinant detected
0 = qualifying determinant not detected
Step 6 — Visualization
Generate binary presence/absence heatmaps.
Step 7 — Optional statistics
If statistical comparisons are performed, report:
•	statistical test
•	distance metric
•	clustering algorithm
•	multiple-testing correction
•	significance threshold
•	effect-size measure where applicable

Required R packages
The BIAN workflow may use the following packages depending on the selected analysis:
install.packages(c(
  "pheatmap",
  "ggplot2",
  "dplyr",
  "tidyr",
  "readr"
))
The base R grid package is part of the standard R distribution and normally does not require separate installation.
The exact package versions used for a published analysis should be recorded.
Recommended reproducibility information includes:
sessionInfo()
or:
R.version.string

Example usage
Read the binary matrix:
binary_table <- read.csv(
  "binary_table.csv",
  check.names = FALSE,
  stringsAsFactors = FALSE
)
Set determinant names as row names:
rownames(binary_table) <- binary_table[[1]]

mat <- as.matrix(binary_table[, -1])
Convert values to numeric:
mat <- apply(mat, 2, as.numeric)

rownames(mat) <- rownames(binary_table)
Check the binary structure:
unique(as.vector(mat))
Expected output:
0 1
A simple binary heatmap can then be generated using:
library(pheatmap)

pheatmap(
  mat,
  cluster_rows = FALSE,
  cluster_cols = FALSE,
  legend = TRUE
)
This produces a descriptive binary presence/absence heatmap without statistical clustering.

Reproducibility
To reproduce a BIAN analysis, users should retain:
1.	Input genome identifiers
2.	Input binary matrix
3.	AMR/MDR/metal-resistance database names
4.	Database versions
5.	Software versions
6.	Sequence identity thresholds
7.	Alignment coverage thresholds
8.	E-value thresholds
9.	Gene-curation criteria
10.	Treatment of homologues and pseudogenes
11.	Treatment of intrinsic resistance determinants
12.	R version
13.	R package versions
14.	Complete BIAN source code
15.	Analysis scripts
16.	Example input data
17.	Output figures and tables
A complete versioned BIAN release should be archived using Zenodo so that the exact source code associated with a publication remains permanently accessible.

Interpretation and limitations
BIAN is primarily a genomic binary profiling framework.
A binary value of:
1
means that the corresponding qualifying genomic determinant was detected.
It does not necessarily mean that:
•	the organism is phenotypically resistant
•	the determinant is expressed
•	the determinant is functional
•	the organism is multidrug resistant
•	the organism is pathogenic
•	the determinant was horizontally transferred
Phenotypic resistance should therefore be confirmed using appropriate experimental data such as antimicrobial susceptibility testing whenever available.
Similarly, pathogenicity should be assessed independently using appropriate genomic, clinical, epidemiological, and/or literature evidence.

Applications
BIAN can be applied to:
•	Comparative bacterial genomics
•	AMR surveillance
•	MDR profiling
•	Environmental microbiology
•	Soil microbiome studies
•	One Health investigations
•	Metal-contaminated environments
•	Hospital bacterial surveillance
•	Epidemiological studies
•	Comparative resistance profiling
•	Genome collections and strain surveys

Citation
If BIAN is used in a publication, please cite the version archived on Zenodo:
Rekadwad, B. BIAN: BInary ANalysis R Package for Binary Analysis of AMR, MDR and Metal-Resistance in Microbial Genomes. Version 1.0.0. Zenodo.
Zenodo record:
https://zenodo.org/records/21472686
GitHub repository:
https://github.com/Terra-Human/binary-analysis-amr-metal-mdr-genes

