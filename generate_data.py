import pandas as pd
import numpy as np
import os
import random

# Set seed for reproducibility
np.random.seed(42)
random.seed(42)

def generate_clinical_data(n=200):
    print("Generating Clinical Data...")
    ids = [f"P{i:03d}" for i in range(1, n+1)]
    age = np.random.normal(55, 12, n).astype(int)
    gender = np.random.choice(['Male', 'Female'], n)
    # Simulate BMI with some missing values
    bmi = np.random.normal(25, 4, n)
    bmi[np.random.choice(n, int(n*0.05), replace=False)] = np.nan # 5% missing
    
    # Blood pressure correlated with age and BMI
    sys_bp = 100 + 0.5 * age + 0.8 * np.nan_to_num(bmi, nan=25) + np.random.normal(0, 10, n)
    
    # Diagnosis (Target): Higher risk if older or high BMI
    interaction = (age - 50)/10 + (np.nan_to_num(bmi, nan=25) - 25)/5
    prob = 1 / (1 + np.exp(-(interaction - 1)))
    diagnosis = [1 if p > 0.5 else 0 for p in prob]
    
    df = pd.DataFrame({
        'PatientID': ids,
        'Age': age,
        'Gender': gender,
        'BMI': np.round(bmi, 1),
        'SystolicBP': np.round(sys_bp, 0),
        'Diagnosis': diagnosis
    })
    
    # Introduce some "dirty" data for cleaning exercises
    # 1. Invalid age
    df.loc[0, 'Age'] = 150
    # 2. Typos in Gender
    df.loc[1, 'Gender'] = 'Femle'
    
    df.to_csv('data/clinical/simulated_ehr.csv', index=False)
    print("Saved data/clinical/simulated_ehr.csv")

def generate_tcm_data(n_transactions=500):
    print("Generating TCM Data...")
    # Common TCM herbs
    herbs = [
        'GanCao', 'RenShen', 'HuangQi', 'BaiZhu', 'FuLing', 
        'DangGui', 'ChuanXiong', 'BaiShao', 'ShuDiHuang', 
        'ChaiHu', 'GuiZhi', 'MaHuang', 'XingRen', 'ShiGao'
    ]
    
    # Create some strong associations (rules)
    # Rule 1: GuiZhi + MaHuang (often appear together)
    # Rule 2: SiJunZiTang (RenShen, BaiZhu, FuLing, GanCao)
    
    transactions = []
    for i in range(n_transactions):
        # Base random selection
        n_items = random.randint(3, 8)
        selected = random.sample(herbs, n_items)
        selected_set = set(selected)
        
        # Inject patterns
        r = random.random()
        if r < 0.3: # 30% chance for MaHuang-GuiZhi pair
            selected_set.add('MaHuang')
            selected_set.add('GuiZhi')
        elif r < 0.6: # 30% chance for SiJunZiTang subset partial
            selected_set.update(['RenShen', 'BaiZhu', 'FuLing'])
            
        transactions.append(",".join(list(selected_set)))
        
    df = pd.DataFrame({'PrescriptionID': range(1, n_transactions+1), 'Herbs': transactions})
    df.to_csv('data/tcm/tcm_prescriptions.csv', index=False)
    print("Saved data/tcm/tcm_prescriptions.csv")

def generate_omics_data(n_genes=1000, n_samples=20):
    print("Generating Omics Data...")
    # Simple DE analysis simulation
    # 10 Control, 10 Disease
    samples = [f"Ctrl_{i}" for i in range(1, 11)] + [f"Dis_{i}" for i in range(1, 11)]
    groups = ['Control'] * 10 + ['Disease'] * 10
    
    # Base expression log-normal
    expr = np.random.normal(10, 2, (n_genes, n_samples))
    
    # Make first 50 genes differentially expressed (Up-regulated in Disease)
    expr[:50, 10:] += 2 
    # Make next 50 genes down-regulated in Disease
    expr[50:100, 10:] -= 2
    
    genes = [f"Gene_{i:04d}" for i in range(1, n_genes+1)]
    
    df_expr = pd.DataFrame(expr, columns=samples, index=genes)
    df_expr.index.name = 'GeneID'
    
    df_meta = pd.DataFrame({'SampleID': samples, 'Group': groups})
    
    df_expr.to_csv('data/omics/gene_expression.csv')
    df_meta.to_csv('data/omics/sample_info.csv', index=False)
    print("Saved data/omics/gene_expression.csv and sample_info.csv")

if __name__ == "__main__":
    generate_clinical_data()
    generate_tcm_data()
    generate_omics_data()
