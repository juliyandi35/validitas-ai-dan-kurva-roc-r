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

# Digoksin
## ChatGPT 4.0 Mini
# Membuat ROC object untuk setiap kategori
roc_obj_1 <- roc(ifelse(Digoksin$UpToDate == "1", 1, 0), ifelse(Digoksin$ChatGPT == "1", 1, 0))
roc_obj_2 <- roc(ifelse(Digoksin$UpToDate == "2", 1, 0), ifelse(Digoksin$ChatGPT == "2", 1, 0))
roc_obj_3 <- roc(ifelse(Digoksin$UpToDate == "3", 1, 0), ifelse(Digoksin$ChatGPT == "3", 1, 0))
roc_obj_4 <- roc(ifelse(Digoksin$UpToDate == "4", 1, 0), ifelse(Digoksin$ChatGPT == "4", 1, 0))

# Plot ROC curve untuk setiap kategori dalam satu plot
plot(roc_obj_1, col = "blue", main = "ROC Curve Digoksin untuk Setiap Kategori ChatGPT 4.0 Mini")
lines(roc_obj_2, col = "red")
lines(roc_obj_3, col = "green")
lines(roc_obj_4, col = "purple")

# Menghitung dan menyimpan nilai AUC
auc_value_1 <- auc(roc_obj_1)
auc_value_2 <- auc(roc_obj_2)
auc_value_3 <- auc(roc_obj_3)
auc_value_4 <- auc(roc_obj_4)

# Membuat legend dengan nilai AUC
legend_text <- c(
  paste("No Known Interaction (AUC =", round(auc_value_1, 2), ")"),
  paste("Minor (AUC =", round(auc_value_2, 2), ")"),
  paste("Moderate (AUC =", round(auc_value_3, 2), ")"),
  paste("Major (AUC =", round(auc_value_4, 2), ")")
)

# Menambahkan legend
legend("bottomright", 
       legend = legend_text,
       col = c("blue", "red", "green", "purple"),
       pch = 16) # pch = 16 untuk simbol titik berisi

## Copilot
# Membuat ROC object untuk setiap kategori
roc_obj_1 <- roc(ifelse(Digoksin$UpToDate == "1", 1, 0), ifelse(Digoksin$Copilot == "1", 1, 0))
roc_obj_2 <- roc(ifelse(Digoksin$UpToDate == "2", 1, 0), ifelse(Digoksin$Copilot == "2", 1, 0))
roc_obj_3 <- roc(ifelse(Digoksin$UpToDate == "3", 1, 0), ifelse(Digoksin$Copilot == "3", 1, 0))
roc_obj_4 <- roc(ifelse(Digoksin$UpToDate == "4", 1, 0), ifelse(Digoksin$Copilot == "4", 1, 0))

# Plot ROC curve untuk setiap kategori dalam satu plot
plot(roc_obj_1, col = "blue", main = "ROC Curve Digoksin untuk Setiap Kategori Copilot")
lines(roc_obj_2, col = "red")
lines(roc_obj_3, col = "green")
lines(roc_obj_4, col = "purple")

# Menghitung dan menyimpan nilai AUC
auc_value_1 <- auc(roc_obj_1)
auc_value_2 <- auc(roc_obj_2)
auc_value_3 <- auc(roc_obj_3)
auc_value_4 <- auc(roc_obj_4)

# Membuat legend dengan nilai AUC
legend_text <- c(
  paste("No Known Interaction (AUC =", round(auc_value_1, 2), ")"),
  paste("Minor (AUC =", round(auc_value_2, 2), ")"),
  paste("Moderate (AUC =", round(auc_value_3, 2), ")"),
  paste("Major (AUC =", round(auc_value_4, 2), ")")
)

# Menambahkan legend
legend("bottomright", 
       legend = legend_text,
       col = c("blue", "red", "green", "purple"),
       pch = 16) # pch = 16 untuk simbol titik berisi

## Gemini
# Membuat ROC object untuk setiap kategori
roc_obj_1 <- roc(ifelse(Digoksin$UpToDate == "1", 1, 0), ifelse(Digoksin$Gemini == "1", 1, 0))
roc_obj_2 <- roc(ifelse(Digoksin$UpToDate == "2", 1, 0), ifelse(Digoksin$Gemini == "2", 1, 0))
roc_obj_3 <- roc(ifelse(Digoksin$UpToDate == "3", 1, 0), ifelse(Digoksin$Gemini == "3", 1, 0))
roc_obj_4 <- roc(ifelse(Digoksin$UpToDate == "4", 1, 0), ifelse(Digoksin$Gemini == "4", 1, 0))

# Plot ROC curve untuk setiap kategori dalam satu plot
plot(roc_obj_1, col = "blue", main = "ROC Curve Digoksin untuk Setiap Kategori Gemini")
lines(roc_obj_2, col = "red")
lines(roc_obj_3, col = "green")
lines(roc_obj_4, col = "purple")

# Menghitung dan menyimpan nilai AUC
auc_value_1 <- auc(roc_obj_1)
auc_value_2 <- auc(roc_obj_2)
auc_value_3 <- auc(roc_obj_3)
auc_value_4 <- auc(roc_obj_4)

# Membuat legend dengan nilai AUC
legend_text <- c(
  paste("No Known Interaction (AUC =", round(auc_value_1, 2), ")"),
  paste("Minor (AUC =", round(auc_value_2, 2), ")"),
  paste("Moderate (AUC =", round(auc_value_3, 2), ")"),
  paste("Major (AUC =", round(auc_value_4, 2), ")")
)

# Menambahkan legend
legend("bottomright", 
       legend = legend_text,
       col = c("blue", "red", "green", "purple"),
       pch = 16) # pch = 16 untuk simbol titik berisi

# Warfarin
## ChatGPT 4.0 Mini
# Membuat ROC object untuk setiap kategori
roc_obj_1 <- roc(ifelse(Warfarin$UpToDate == "1", 1, 0), ifelse(Warfarin$ChatGPT == "1", 1, 0))
roc_obj_2 <- roc(ifelse(Warfarin$UpToDate == "2", 1, 0), ifelse(Warfarin$ChatGPT == "2", 1, 0))
roc_obj_3 <- roc(ifelse(Warfarin$UpToDate == "3", 1, 0), ifelse(Warfarin$ChatGPT == "3", 1, 0))
roc_obj_4 <- roc(ifelse(Warfarin$UpToDate == "4", 1, 0), ifelse(Warfarin$ChatGPT == "4", 1, 0))

# Plot ROC curve untuk setiap kategori dalam satu plot
plot(roc_obj_1, col = "blue", main = "ROC Curve Warfarin untuk Setiap Kategori ChatGPT 4.0 Mini")
lines(roc_obj_2, col = "red")
lines(roc_obj_3, col = "green")
lines(roc_obj_4, col = "purple")

# Menghitung dan menyimpan nilai AUC
auc_value_1 <- auc(roc_obj_1)
auc_value_2 <- auc(roc_obj_2)
auc_value_3 <- auc(roc_obj_3)
auc_value_4 <- auc(roc_obj_4)

# Membuat legend dengan nilai AUC
legend_text <- c(
  paste("No Known Interaction (AUC =", round(auc_value_1, 2), ")"),
  paste("Minor (AUC =", round(auc_value_2, 2), ")"),
  paste("Moderate (AUC =", round(auc_value_3, 2), ")"),
  paste("Major (AUC =", round(auc_value_4, 2), ")")
)

# Menambahkan legend
legend("bottomright", 
       legend = legend_text,
       col = c("blue", "red", "green", "purple"),
       pch = 16) # pch = 16 untuk simbol titik berisi

## Copilot
# Membuat ROC object untuk setiap kategori
roc_obj_1 <- roc(ifelse(Warfarin$UpToDate == "1", 1, 0), ifelse(Warfarin$Copilot == "1", 1, 0))
roc_obj_2 <- roc(ifelse(Warfarin$UpToDate == "2", 1, 0), ifelse(Warfarin$Copilot == "2", 1, 0))
roc_obj_3 <- roc(ifelse(Warfarin$UpToDate == "3", 1, 0), ifelse(Warfarin$Copilot == "3", 1, 0))
roc_obj_4 <- roc(ifelse(Warfarin$UpToDate == "4", 1, 0), ifelse(Warfarin$Copilot == "4", 1, 0))

# Plot ROC curve untuk setiap kategori dalam satu plot
plot(roc_obj_1, col = "blue", main = "ROC Curve Warfarin untuk Setiap Kategori Copilot")
lines(roc_obj_2, col = "red")
lines(roc_obj_3, col = "green")
lines(roc_obj_4, col = "purple")

# Menghitung dan menyimpan nilai AUC
auc_value_1 <- auc(roc_obj_1)
auc_value_2 <- auc(roc_obj_2)
auc_value_3 <- auc(roc_obj_3)
auc_value_4 <- auc(roc_obj_4)

# Membuat legend dengan nilai AUC
legend_text <- c(
  paste("No Known Interaction (AUC =", round(auc_value_1, 2), ")"),
  paste("Minor (AUC =", round(auc_value_2, 2), ")"),
  paste("Moderate (AUC =", round(auc_value_3, 2), ")"),
  paste("Major (AUC =", round(auc_value_4, 2), ")")
)

# Menambahkan legend
legend("bottomright", 
       legend = legend_text,
       col = c("blue", "red", "green", "purple"),
       pch = 16) # pch = 16 untuk simbol titik berisi

## Gemini
# Membuat ROC object untuk setiap kategori
roc_obj_1 <- roc(ifelse(Warfarin$UpToDate == "1", 1, 0), ifelse(Warfarin$Gemini == "1", 1, 0))
roc_obj_2 <- roc(ifelse(Warfarin$UpToDate == "2", 1, 0), ifelse(Warfarin$Gemini == "2", 1, 0))
roc_obj_3 <- roc(ifelse(Warfarin$UpToDate == "3", 1, 0), ifelse(Warfarin$Gemini == "3", 1, 0))
roc_obj_4 <- roc(ifelse(Warfarin$UpToDate == "4", 1, 0), ifelse(Warfarin$Gemini == "4", 1, 0))

# Plot ROC curve untuk setiap kategori dalam satu plot
plot(roc_obj_1, col = "blue", main = "ROC Curve Warfarin untuk Setiap Kategori Gemini")
lines(roc_obj_2, col = "red")
lines(roc_obj_3, col = "green")
lines(roc_obj_4, col = "purple")

# Menghitung dan menyimpan nilai AUC
auc_value_1 <- auc(roc_obj_1)
auc_value_2 <- auc(roc_obj_2)
auc_value_3 <- auc(roc_obj_3)
auc_value_4 <- auc(roc_obj_4)

# Membuat legend dengan nilai AUC
legend_text <- c(
  paste("No Known Interaction (AUC =", round(auc_value_1, 2), ")"),
  paste("Minor (AUC =", round(auc_value_2, 2), ")"),
  paste("Moderate (AUC =", round(auc_value_3, 2), ")"),
  paste("Major (AUC =", round(auc_value_4, 2), ")")
)

# Menambahkan legend
legend("bottomright", 
       legend = legend_text,
       col = c("blue", "red", "green", "purple"),
       pch = 16) # pch = 16 untuk simbol titik berisi
