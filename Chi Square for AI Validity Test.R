# Data 
conf_matrix_ChatGPT_4.0_Mini <- matrix(c(95, 40, 22, 55), nrow = 2, byrow = TRUE,
                      dimnames = list("True" = c("Positive", "Negative"),
                                      "False" = c("Positive", "Negative")))
print(conf_matrix_ChatGPT_4.0_Mini)

conf_matrix_Copilot <- matrix(c(116, 19, 53, 24), nrow = 2, byrow = TRUE,
                                       dimnames = list("True" = c("Positive", "Negative"),
                                                       "False" = c("Positive", "Negative")))
print(conf_matrix_Copilot)

conf_matrix_Gemini <- matrix(c(120, 15, 44, 33), nrow = 2, byrow = TRUE,
                                       dimnames = list("True" = c("Positive", "Negative"),
                                                       "False" = c("Positive", "Negative")))
print(conf_matrix_Gemini)

# Hasil Uji Chi-Square
chi_sq_test_ChatGPT <- chisq.test(conf_matrix_ChatGPT_4.0_Mini)
print("Hasil Uji Chi-Square ChatGPT 4.0 Mini:")
print(chi_sq_test_ChatGPT)

chi_sq_test_Copilot <- chisq.test(conf_matrix_Copilot)
print("Hasil Uji Chi-Square Copilot:")
print(chi_sq_test_Copilot)

chi_sq_test_Gemini <- chisq.test(conf_matrix_Gemini)
print("Hasil Uji Chi-Square Gemini:")
print(chi_sq_test_Gemini)
