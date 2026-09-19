**Credit Scoing of financial data**

**Contributed by Usman Haider for SVM code

**Project Story – Credit Scoring System for Financial Data**

Financial institutions require robust credit scoring models to make timely, accurate lending decisions. Our team designed a scalable credit scoring pipeline that emphasizes data quality, model robustness, and operational reliability.

**Part 1 – Data Preparation:**
We ingested raw financial data containing missing values and heterogeneous feature scales. To ensure model readiness, we applied K-Means imputation, mean/median/KNN imputation, and feature scaling using StandardScaler, MinMaxScaler, and RobustScaler. This preprocessing step ensured consistent, high-quality inputs for downstream models.

**Part 2 – Core ML Methods & Robustness Testing:**
To understand how different algorithms respond to imperfect data, we evaluated Logistic Regression, Random Forest, XGBoost, K-Nearest Neighbors, and Neural Networks (MLPClassifier) with and without preprocessing.

**Key Experiments:**

Assessed performance under different imputation strategies.

Compared feature scaling methods to see impact on linear and non-linear models.

Evaluated sensitivity of neural networks to uncleaned data versus ensemble methods.

**Observations:**

Tree-based models (Random Forest, XGBoost) were resilient to missing or unscaled features.

Linear models (Logistic Regression) benefited significantly from scaling.

Neural networks struggled on raw data but improved after proper preprocessing, though they still required larger, cleaner datasets to match ensemble performance.

**Real-Time Production Deployment:**
In production, new applicant data is streamed in via a Kafka pipeline, connected to a feature store for precomputed embeddings and scaling parameters. Models are served through MLflow Model Registry, with post-processing rules applied for business logic.

**Monitoring & Feedback:**

Logging captures predictions and model feedback.

Drift monitoring identifies changes in input distributions.

Canary deployments and shadow traffic testing validate new models without affecting real applicants.

**Impact:**
This approach allowed the bank to quickly and accurately assess credit risk, improving lending decisions while maintaining robustness to missing or noisy financial data. Ensemble methods became the primary production choice for small/noisy datasets, while neural networks were reserved for high-quality, larger datasets.

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

**Training & Selection:** Multiple algorithms evaluated, best model registered in MLflow.

**Inference:** Model serves new loan applications and predicts credit scores.

**Post-Processing:** Applies business rules before logging and decision.

**Monitoring & Feedback Loop:** Drift and performance monitored, triggers retraining if needed.

**Decision Output:** Feeds directly into the loan approval process.

This diagram is presentation-ready and shows the entire end-to-end pipeline in one glance.

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
        C2 --> M5[Neural Network - MLP]
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



