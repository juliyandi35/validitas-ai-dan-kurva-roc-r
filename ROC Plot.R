# Load necessary library
library(pROC)
library(readxl)

# Import data
Digoksin <- read_excel("Analisis Data (BackUp).xlsx",sheet="(Digoksin)Coding Interaksi Obat",range = "C1:F50")
head(Digoksin)
colnames(Digoksin) <- c("UpToDate","ChatGPT","Copilot","Gemini")

Warfarin <- read_excel("Analisis Data (BackUp).xlsx",sheet="(Warfarin)Coding Interaksi Obat",range = "C1:F164")
head(Warfarin)
colnames(Warfarin) <- c("UpToDate","ChatGPT","Copilot","Gemini")

# Function to create ROC curve for a single AI
create_roc <- function(ai_predictions, ground_truth, problem_number) {
  # Convert to binary classification
  binary_ground_truth <- ifelse(ground_truth >= problem_number, 1, 0)
  binary_predictions <- ai_predictions
  
  # Create ROC object
  roc_obj <- roc(binary_ground_truth, binary_predictions)
  
  # Plot ROC curve
  plot(roc_obj, main = paste("ROC Curve for", ai_name, "Problem", problem_number), col = "blue")
  
  # Add AUC value to plot
  auc_value <- auc(roc_obj)
  text(x = 0.7, y = 0.2, paste("AUC =", round(auc_value, 2)), col = "red")
  
  return(roc_obj)
}

# Loop through AIs and create ROC curves for each binary classification problem 
# Loop for Digoksin
for (problem_number in c(2,3,4)) { #Example: Problems 2, 3, and 4
  for (ai_name in c("ChatGPT", "Copilot", "Gemini")) {
    ai_predictions <- Digoksin[[ai_name]]
    ground_truth <- Digoksin$UpToDate
    roc_obj <- create_roc(ai_predictions, ground_truth, problem_number)
    print(paste("Digoksin ROC Curve for", ai_name, "Problem", problem_number, ":", roc_obj))
  }
}

# Loop for Warfarin
for (problem_number in c(2,3,4)) { #Example: Problems 2, 3, and 4
  for (ai_name in c("ChatGPT", "Copilot", "Gemini")) {
    ai_predictions <- Warfarin[[ai_name]]
    ground_truth <- Warfarin$UpToDate
    roc_obj <- create_roc(ai_predictions, ground_truth, problem_number)
    print(paste("Warfarin ROC Curve for", ai_name, "Problem", problem_number, ":", roc_obj))
  }
}
