**Credit Scoing of financial data**


**Part 1**: is about preparing the data apply imputation, cleaning, preprocessing, using k-mean imputation and scaling methods.

**Part 2**: Core ML Methods – Scaling, Imputation, and Model Robustness
In this phase, we explored different core machine learning methods to assess their robustness in the presence of missing values and unscaled features. The goal was to understand how various models respond to imperfect or “unclean” data.

**⚙️ Key Experiments Conducted**
Applied different imputation strategies (mean, median, KNN) to fill missing values.

Tested feature scaling techniques (StandardScaler, MinMaxScaler, RobustScaler).

Evaluated model performance with and without preprocessing on the following algorithms:

**Logistic Regression**

**Random Forest**

**XGBoost**

**K-Nearest Neighbors (KNN)**

**Neural Networks (MLPClassifier)**

🧪 **Observations**
Tree-based models (Random Forest, XGBoost) were more resilient to missing values and unscaled data.

Linear models (Logistic Regression) improved significantly with scaling.

Neural networks performed poorly on raw or uncleaned data:

Sensitive to feature scale differences.

Prone to overfitting on missing/imputed noise.

After applying proper scaling and imputation:

Neural networks caught up in performance but still lagged behind ensemble methods on smaller or noisy datasets.

✅ **Conclusion**
Neural networks are suitable for datasets that are is not imputed then better when data avialiblity is high. Traditional models, especially tree-based ensembles, offer better out-of-the-box robustness and should be the go-to choice for initial modeling in real-world noisy database

## 🔄 System Architecture (Flow Diagram)

```mermaid

flowchart TD

subgraph Data_Preparation[Data Preparation]
    A1[Raw Financial Data] --> A2[Data Cleaning & Preprocessing]
    A2 --> A3[Missing Value Imputation]
    A3 --> A4[K-Means / Mean / Median / KNN Imputation]
    A4 --> A5[Feature Scaling]
    A5 --> B1[Cleaned & Scaled Dataset]
end

subgraph Model_Training[Model Training & Evaluation]
    B1 --> C1[Train/Test Split]
    C1 --> C2[Model Training]

    subgraph Models[Algorithms Tested]
        C2 --> M1[Logistic Regression]
        C2 --> M2[Random Forest]
        C2 --> M3[XGBoost]
        C2 --> M4[K-Nearest Neighbors]
        C2 --> M5[Neural Network (MLP)]
    end

    C2 --> C3[Model Evaluation]
    C3 --> D1[Select Best Model]
    D1 --> MLFlow[Register Model in MLflow Model Registry]
end

subgraph Inference_Production[Production Pipeline]
    MLFlow --> E1[Serve Model for New Loan Data]
    E1 --> E2[Credit Score Prediction]
    E2 --> E3[Post-Processing & Business Rules]
    E3 --> F1[Logger & Feedback Capture]
    F1 --> F2[Monitor Model Performance & Label Drift]
    F2 --> MLFlow
end

E3 --> G[Final Loan Approval Decision]

It is published paper https://www.researchgate.net/profile/Sharjeel-Imtiaz/publication/318889918_A_Better_Comparison_Summary_of_Credit_Scoring_Classification/links/5992c769aca272ec90800688/A-Better-Comparison-Summary-of-Credit-Scoring-Classification.pdf with 29 citations
