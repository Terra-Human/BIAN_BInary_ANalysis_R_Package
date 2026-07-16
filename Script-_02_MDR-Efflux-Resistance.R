############################################################
# Binary Heatmap of Multidrug and Efflux Resistance Genes
# Author : Bhagwan Rekadwad
############################################################

# Install package (Run only once)
# install.packages("pheatmap")

# Load libraries
library(pheatmap)
library(grid)

#-----------------------------------------------------------
# Input file
#-----------------------------------------------------------
file_path <- "C:/Users/HP/Desktop/binary_table.csv"

#-----------------------------------------------------------
# Read data
#-----------------------------------------------------------
data <- read.csv(file_path,
                 header = TRUE,
                 check.names = FALSE,
                 stringsAsFactors = FALSE)

# Make duplicate gene names unique
rownames(data) <- make.unique(data[,1])

# Remove first column (gene names)
data <- data[, -1]

# Convert all columns to numeric
data[] <- lapply(data, as.numeric)

# Convert to matrix
mat <- as.matrix(data)

#-----------------------------------------------------------
# Colors
#-----------------------------------------------------------
mycolors <- c("white", "#50C878")   # Navy blue

#-----------------------------------------------------------
# Generate timestamp
#-----------------------------------------------------------
timestamp <- format(Sys.time(), "%Y-%m-%d %H:%M:%S")
file_timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")

#-----------------------------------------------------------
# Output file
#-----------------------------------------------------------
output_file <- paste0(
  "C:/Users/HP/Desktop/binary_heatmap_",
  file_timestamp,
  ".pdf"
)

############################################################
# Create Heatmap
############################################################

hm <- pheatmap(
  mat,
  
  # Binary colours
  color = mycolors,
  breaks = c(-0.01, 0.5, 1.01),
  
  # Clustering
  cluster_rows = TRUE,
  cluster_cols = TRUE,
  
  # Appearance
  border_color = "grey80",
  show_rownames = TRUE,
  show_colnames = TRUE,
  
  #---------------- Font sizes ----------------#
  fontsize = 16,        # General font
  fontsize_row = 16,    # ARG names (increased from 8)
  fontsize_col = 16,    # Bacterial names
  
  #---------------- Cell size -----------------#
  cellwidth = 30,
  cellheight = 16,      # Increased from 8
  
  #---------------- Dendrogram size -----------#
  treeheight_row = 140, # Increased from 100
  treeheight_col = 150, # Slightly increased
  
  #---------------- Labels --------------------#
  angle_col = 90,
  
  #---------------- Title ---------------------#
  main = "Multidrug and Efflux Resistance Genes",
  
  silent = TRUE
)

library(grid)

# Make column names italic
idx <- which(hm$gtable$layout$name == "col_names")

hm$gtable$grobs[[idx]]$gp <- gpar(
  fontsize = 22,
  fontface = "italic"
)

grid.newpage()
grid.draw(hm$gtable)

############################################################
# Save publication-quality PDF
############################################################

pdf(output_file,
    width = 24,
    height = 60)

grid.newpage()

# Move heatmap upward to leave more space for bacterial names
pushViewport(
  viewport(
    x = 0.5,
    y = 0.57,
    width = 1,
    height = 0.88
  )
)

grid.draw(hm$gtable)

popViewport()

# Timestamp
grid.text(
  paste("Generated:", timestamp),
  x = unit(0.99, "npc"),
  y = unit(0.01, "npc"),
  just = c("right", "bottom"),
  gp = gpar(
    fontsize = 14,
    col = "black"
  )
)

dev.off()

#-----------------------------------------------------------
# Confirmation
#-----------------------------------------------------------
cat("\n=====================================\n")
cat("Heatmap successfully generated!\n")
cat("Generated :", timestamp, "\n")
cat("Saved File:", output_file, "\n")
cat("=====================================\n")

