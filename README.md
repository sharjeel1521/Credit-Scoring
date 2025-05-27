**Part 1**: is about preparing the data apply imputation, cleaning, preprocessing, using k-mean imputation and scaling methods
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

✅ Conclusion
Neural networks are suitable for datasets that are is not imputed then better when data avialiblity is high. Traditional models, especially tree-based ensembles, offer better out-of-the-box robustness and should be the go-to choice for initial modeling in real-world noisy datase
