#' Generate Simulated Medical Data
#'
#' This script generates simulated datasets for the course:
#' 1. Clinical Data (EHR simulation)
#' 2. TCM Prescription Data (Association rules)
#' 3. Omics Data (Differential expression)

set.seed(42)

# --- 1. Clinical Data ---
generate_clinical <- function(n = 200) {
  message("Generating Clinical Data...")
  
  ids <- sprintf("P%03d", 1:n)
  age <- as.integer(rnorm(n, mean = 55, sd = 12))
  gender <- sample(c("Male", "Female"), n, replace = TRUE)
  
  # BMI with missing values
  bmi <- rnorm(n, mean = 25, sd = 4)
  # 5% missing
  bmi[sample(1:n, size = n * 0.05)] <- NA
  
  # Blood pressure
  bmi_fill <- ifelse(is.na(bmi), 25, bmi)
  sys_bp <- 100 + 0.5 * age + 0.8 * bmi_fill + rnorm(n, 0, 10)
  
  # Diagnosis Prob
  interaction <- (age - 50)/10 + (bmi_fill - 25)/5
  prob <- 1 / (1 + exp(-(interaction - 1)))
  diagnosis <- ifelse(prob > 0.5, 1, 0)
  
  df <- data.frame(
    PatientID = ids,
    Age = age,
    Gender = gender,
    BMI = round(bmi, 1),
    SystolicBP = round(sys_bp, 0),
    Diagnosis = diagnosis
  )
  
  # Add "dirty" data
  df$Age[1] <- 150
  df$Gender[2] <- "Femle"
  
  if(!dir.exists("data/clinical")) dir.create("data/clinical", recursive = TRUE)
  write.csv(df, "data/clinical/simulated_ehr.csv", row.names = FALSE)
  message("Saved data/clinical/simulated_ehr.csv")
}

# --- 2. TCM Data ---
generate_tcm <- function(n_transactions = 500) {
  message("Generating TCM Data...")
  herbs <- c('GanCao', 'RenShen', 'HuangQi', 'BaiZhu', 'FuLing', 
             'DangGui', 'ChuanXiong', 'BaiShao', 'ShuDiHuang', 
             'ChaiHu', 'GuiZhi', 'MaHuang', 'XingRen', 'ShiGao')
  
  transactions <- character(n_transactions)
  
  for(i in 1:n_transactions) {
    n_items <- sample(3:8, 1)
    selected <- sample(herbs, n_items)
    unique_selected <- unique(selected)
    
    # Inject patterns
    r <- runif(1)
    if(r < 0.3) {
      unique_selected <- unique(c(unique_selected, 'MaHuang', 'GuiZhi'))
    } else if (r < 0.6) {
      unique_selected <- unique(c(unique_selected, 'RenShen', 'BaiZhu', 'FuLing'))
    }
    
    transactions[i] <- paste(unique_selected, collapse = ",")
  }
  
  df <- data.frame(PrescriptionID = 1:n_transactions, Herbs = transactions)
  
  if(!dir.exists("data/tcm")) dir.create("data/tcm", recursive = TRUE)
  write.csv(df, "data/tcm/tcm_prescriptions.csv", row.names = FALSE)
  message("Saved data/tcm/tcm_prescriptions.csv")
}

# --- 3. Omics Data ---
generate_omics <- function(n_genes = 1000, n_samples = 20) {
  message("Generating Omics Data...")
  samples <- c(paste0("Ctrl_", 1:10), paste0("Dis_", 1:10))
  groups <- c(rep("Control", 10), rep("Disease", 10))
  
  expr <- matrix(rnorm(n_genes * n_samples, mean = 10, sd = 2), 
                 nrow = n_genes, ncol = n_samples)
  rownames(expr) <- sprintf("Gene_%04d", 1:n_genes)
  colnames(expr) <- samples
  
  # Differential Expression
  # First 50 up in Disease
  expr[1:50, 11:20] <- expr[1:50, 11:20] + 2
  # Next 50 down in Disease
  expr[51:100, 11:20] <- expr[51:100, 11:20] - 2
  
  if(!dir.exists("data/omics")) dir.create("data/omics", recursive = TRUE)
  write.csv(expr, "data/omics/gene_expression.csv") # keep rownames
  
  meta <- data.frame(SampleID = samples, Group = groups)
  write.csv(meta, "data/omics/sample_info.csv", row.names = FALSE)
  message("Saved data/omics/gene_expression.csv and sample_info.csv")
}

# Run generation
generate_clinical()
generate_tcm()
generate_omics()
