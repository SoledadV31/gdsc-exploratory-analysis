## Pyton
from google.colab import drive
drive.mount('/content/drive') # Added closing single quote

### Cambiar entorno de ejecucion a R: entorno de ejecucion, cambiar tipo de entorno -> R

# Instalar y cargar paquetes necesarios

# Manejo de datos tabulares
if (!require("dplyr")) install.packages("dplyr")
if (!require("tidyr")) install.packages("tidyr")
if (!require("data.table")) install.packages("data.table")
if (!require("corrplot")) install.packages("corrplot") #para depues

# Lectura de archivos Excel y CSV
if (!require("readxl")) install.packages("readxl")  # Para leer archivos Excel
if (!require("writexl")) install.packages("writexl")  # Para escribir archivos Excel
if (!require("readr")) install.packages("readr")  # Para leer archivos CSV

# Visualización de datos
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("plotly")) install.packages("plotly")  # Gráficos interactivos
if (!require("ggthemes")) install.packages("ggthemes")  # Temas para ggplot2

# Cargar las librerías
library(dplyr)
library(tidyr)
library(data.table)
library(readxl)
library(writexl)
library(readr)
library(ggplot2)
library(plotly)
library(ggthemes)
library(corrplot)

# Install and load the readr package (if not installed)
if (!require("readr")) install.packages("readr")
library(readr)

# Read a CSV file
drug_sens <- read_csv("/content/drive/MyDrive/Mentoria/GDSC2-dataset.csv") #completo (por ahora no lo vamos a usar)

# Display the first few rows
head(drug_sens)

# Install and load the readxl package (if not installed)
if (!require("readxl")) install.packages("readxl")
library(readxl)

# Read a specific sheet from an Excel file
cell_lines<- read_excel("/content/drive/MyDrive/Mentoria/Cell_Lines_Details.xlsx", sheet = 1)

# Display the first few rows
head(cell_lines)

#Compounds-annotation.csv (Drug Details)
drug_details <- read_csv("/content/drive/MyDrive/Mentoria/Compounds-annotation.csv", show_col_types = FALSE)
head(drug_details)


# Install and load naniar (if not installed)
if (!require("naniar")) install.packages("naniar")
library(naniar)

miss_var_summary (drug_sens)

# Bar plot of missing values per variable
gg_miss_var(drug_sens)

# Missing values heatmap
vis_miss(drug_sens)

# General structure of the dataframe
str(drug_sens)

# Summary statistics
summary(drug_sens)

# Data types of each column
sapply(drug_sens,class)

# cargar el dato
cell_lines <- read_excel("/content/drive/MyDrive/Mentoria/Cell_Lines_Details.xlsx", sheet = 1)

# pasarlo por la libreria naniar (missing 1)
miss_var_summary(cell_lines)

# missing 2
gg_miss_var(cell_lines)

# missing 3
vis_miss(cell_lines)

# explorar la estructura 1
str(cell_lines)

# explorar la estructura 2
summary(cell_lines)

# explorar la estructura 3
sapply(cell_lines, class)

# cargar el dato
sensibilidad <-

# missing
miss_var_summary(drug_details)

# missing 2
gg_miss_var(drug_details)

# missing 3
vis_miss(drug_details)

# structura 1
str(drug_details)

# structura 2
summary(drug_details)

# structura 3
sapply(drug_details, class)

# usar str primero para ver la estructura de las columnas del dataset antes de graficar

str(drug_sens)

if (!require("ggplot2")) install.packages("ggplot2")
library(ggplot2)

ggplot(drug_sens, aes(x = LN_IC50)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Histogram of IC 50 ", x = "Values", y = "Frequency") +
  theme_minimal()

ggplot(drug_sens, aes(x = PATHWAY_NAME)) +
  geom_bar(fill = "darkgreen", color = "black") +
  labs(title = "Pathway name", x = "Categories", y = "Count") +
  theme_minimal()

ggplot(drug_sens, aes(x = DRUG_NAME, y = LN_IC50, fill = DRUG_NAME)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Comparison of Drug Sensitivity (LN_IC50)",
       x = "Drug Name",
       y = "LN_IC50") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

str(cell_lines)

p <- ggplot(cell_lines, aes(x = `GDSC\nTissue descriptor 1`)) +
  geom_bar(fill = "steelblue") +
  coord_flip() +  # Opcional: mejora legibilidad si hay muchas categorías
  labs(title = "Distribución por tejido primario",
       x = "Tejido",
       y = "Cantidad de líneas celulares") +
  theme_minimal()

print(p)


ggplot(cell_lines, aes(x = `Cancer Type\n(matching TCGA label)`)) +
  geom_bar(fill = "darkorange") +
  coord_flip() +
  labs(title = "Distribución por tipo de cáncer (TCGA)",
       x = "Tipo de cáncer",
       y = "Frecuencia") +
  theme_minimal()

ggplot(cell_lines, aes(x = `Microsatellite \ninstability Status (MSI)`)) +
  geom_bar(fill = "darkgreen") +
  labs(title = "Distribución de líneas celulares según MSI",
       x = "Estado MSI",
       y = "Cantidad") +
  theme_minimal()

names(cell_lines)

# compounds: barplot ACA


inner <- inner_join(df1, df2, by = "ID")

inner





unique_drugs <- unique (drug_sens$DRUG_NAME)
drug_groups <- split (unique_drugs, cut(seq_along(unique_drugs), 12, labels = FALSE))

group1 <- drug_groups[[1]]

ggplot(subset(drug_sens, DRUG_NAME %in% group1),
aes (x=DRUG_NAME, y= LN_IC50, fill = DRUG_NAME)) +
  geom_boxplot()+
  geom_jitter(color="black", size=0.2, alpha=0.9) +
  theme_minimal()+
  labs(title= "LN_IC50- Drug Group 1",
x= "Drug name",
y=" LN_IC50") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group2 <- drug_groups[[2]]

ggplot(subset(drug_sens, DRUG_NAME %in% group2),
aes (x=DRUG_NAME, y= LN_IC50, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "LN_IC50- Drug Group 2",
x= "Drug name",
y=" LN_IC50") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group3 <- drug_groups[[3]]

ggplot(subset(drug_sens, DRUG_NAME %in% group3),
aes (x=DRUG_NAME, y= LN_IC50, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "LN_IC50- Drug Group 3",
x= "Drug name",
y=" LN_IC50") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group4 <- drug_groups[[4]]

ggplot(subset(drug_sens, DRUG_NAME %in% group4),
aes (x=DRUG_NAME, y= LN_IC50, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "LN_IC50- Drug Group 4",
x= "Drug name",
y=" LN_IC50") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group5 <- drug_groups[[5]]

ggplot(subset(drug_sens, DRUG_NAME %in% group5),
aes (x=DRUG_NAME, y= LN_IC50, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "LN_IC50- Drug Group 5",
x= "Drug name",
y=" LN_IC50") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group6 <- drug_groups[[6]]

ggplot(subset(drug_sens, DRUG_NAME %in% group6),
aes (x=DRUG_NAME, y= LN_IC50, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "LN_IC50- Drug Group 6",
x= "Drug name",
y=" LN_IC50") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group7 <- drug_groups[[7]]

ggplot(subset(drug_sens, DRUG_NAME %in% group7),
aes (x=DRUG_NAME, y= LN_IC50, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "LN_IC50- Drug Group 7",
x= "Drug name",
y=" LN_IC50") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group8 <- drug_groups[[8]]

ggplot(subset(drug_sens, DRUG_NAME %in% group8),
aes (x=DRUG_NAME, y= LN_IC50, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "LN_IC50- Drug Group 8",
x= "Drug name",
y=" LN_IC50") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group9 <- drug_groups[[9]]

ggplot(subset(drug_sens, DRUG_NAME %in% group9),
aes (x=DRUG_NAME, y= LN_IC50, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "LN_IC50- Drug Group 9",
x= "Drug name",
y=" LN_IC50") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group10 <- drug_groups[[10]]

ggplot(subset(drug_sens, DRUG_NAME %in% group10),
aes (x=DRUG_NAME, y= LN_IC50, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "LN_IC50- Drug Group 10",
x= "Drug name",
y=" LN_IC50") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group11 <- drug_groups[[11]]

ggplot(subset(drug_sens, DRUG_NAME %in% group11),
aes (x=DRUG_NAME, y= LN_IC50, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "LN_IC50- Drug Group 11",
x= "Drug name",
y=" LN_IC50") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group12 <- drug_groups[[12]]

ggplot(subset(drug_sens, DRUG_NAME %in% group12),
aes (x=DRUG_NAME, y= LN_IC50, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "LN_IC50- Drug Group 12",
x= "Drug name",
y=" LN_IC50") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))



# dataset Gise
#drug_sens <- read_csv("/content/drive/MyDrive/Salud-Analytics/Mentoria/Sole - Salud Analytics/Plataforma/Datasets/Copia de GDSC2-dataset.csv") #completo (por ahora no lo vamos a usar)

colnames(drug_sens)

str(drug_sens)

# cargo el dataset
# defino la variable x -> DRUG_NAME
# hacer grupos de DRUG_NAME -> mini datasets con una cierta cantidad de drug_name -> todas las variables que luego van a ser "y": AUC, RMSE, CONC
# grafico de boxplot donde vas a llamar a tu variable "x": DRUG_NAME
# no hace falta cargar el dataset de nuevo, pero si queres cambiar los grupos tenes que volver a redefinirlos

# cuando Error: si cambio la X -> AUC -> drug_sens$AUC -> traer todas las y -> minidatasets en funcion de AUC
# porque el grafico vacio: ggplot(subset(drug_sens, DRUG_NAME %in% group1) -> le estoy pidiendo que me traiga nombre de drogas en el grupo 1, y solo tengo lista de AUC

unique_drugs <- unique(drug_sens$DRUG_NAME) #aca tiene que ser la variable que vamos a dividir, la categoria -> DRUG_NAME
drug_groups <- split(unique_drugs, cut(seq_along(unique_drugs), 12, labels = FALSE))

length(unique_drugs)

group1 <- drug_groups[[1]]

group1

group1 <- drug_groups[[1]]

ggplot(subset(drug_sens, DRUG_NAME %in% group1),
aes (x=DRUG_NAME, y= MIN_CONC, fill = DRUG_NAME)) +
  geom_boxplot()+
  scale_y_log10()+
  theme_minimal()+
  labs(title= "MIN_CON- Drug Group 1" ,
x= "Drug name",
y=" MIN_CON(log10)") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

# grafico mejorado
ggplot(subset(drug_sens, DRUG_NAME %in% group1),
       aes(x = DRUG_NAME, y = MIN_CONC)) +
  geom_boxplot(fill = "steelblue", color = "black", outlier.shape = 1, outlier.size = 1.5) +
  scale_y_log10() +
  geom_jitter(color="black", size=0.4, alpha=0.9) +
  theme_minimal(base_size = 11) +
  labs(
    title = "Minimum Concentration (MIN_CONC) – Drug Group 1",
    x = "Drug Name",
    y = "MIN_CONC (log10 scale)"
  ) +
  theme(
    axis.text.x = element_text(angle = 60, hjust = 1, size = 8),
    axis.text.y = element_text(size = 9),
    plot.title = element_text(face = "bold"),
    legend.position = "none"
  )

group2 <- drug_groups[[2]]

ggplot(subset(drug_sens, DRUG_NAME %in% group2),
aes (x=DRUG_NAME, y= MIN_CONC, fill = DRUG_NAME)) +
  geom_boxplot()+
  scale_y_log10()+
  theme_minimal()+
  labs(title= "MIN_CON- Drug Group 2" ,
x= "Drug name",
y=" MIN_CON(log10)") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group3 <- drug_groups[[3]]

ggplot(subset(drug_sens, DRUG_NAME %in% group3),
aes (x=DRUG_NAME, y= MIN_CONC, fill = DRUG_NAME)) +
  geom_boxplot()+
  scale_y_log10()+
  theme_minimal()+
  labs(title= "MIN_CON- Drug Group 3" ,
x= "Drug name",
y=" MIN_CON(log10)") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group4 <- drug_groups[[4]]

ggplot(subset(drug_sens, DRUG_NAME %in% group4),
aes (x=DRUG_NAME, y= MIN_CONC, fill = DRUG_NAME)) +
  geom_boxplot()+
  scale_y_log10()+
  theme_minimal()+
  labs(title= "MIN_CON- Drug Group 4" ,
x= "Drug name",
y=" MIN_CON(log10)") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group1 <- drug_groups[[1]]

ggplot(subset(drug_sens, DRUG_NAME %in% group1),
aes (x=DRUG_NAME, y= AUC, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "AUC- Drug Group 1" ,
x= "Drug name",
y=" AUC") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

# grafico mejorado

library(ggplot2)
library(dplyr)

# Reordenar los fármacos según la mediana de AUC dentro del grupo
drug_group1_data <- drug_sens %>%
  filter(DRUG_NAME %in% group1) %>%
  mutate(DRUG_NAME = reorder(DRUG_NAME, AUC, FUN = median, na.rm = TRUE))

# Crear el boxplot mejorado
ggplot(drug_group1_data, aes(x = DRUG_NAME, y = AUC)) +
  geom_boxplot(fill = "steelblue", color = "black", outlier.shape = 1, outlier.size = 1.5) +
  theme_minimal(base_size = 11) +
  labs(
    title = "AUC – Drug Group 1",
    x = "Drug Name",
    y = "AUC"
  ) +
  theme(
    axis.text.x = element_text(angle = 60, hjust = 1, size = 8),
    axis.text.y = element_text(size = 9),
    plot.title = element_text(face = "bold"),
    legend.position = "none"
  )


group2 <- drug_groups[[2]]

ggplot(subset(drug_sens, DRUG_NAME %in% group2),
aes (x=DRUG_NAME, y= AUC, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "AUC- Drug Group 2" ,
x= "Drug name",
y=" AUC") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group3 <- drug_groups[[3]]

ggplot(subset(drug_sens, DRUG_NAME %in% group3),
aes (x=DRUG_NAME, y= AUC, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "AUC- Drug Group 3" ,
x= "Drug name",
y=" AUC") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group4 <- drug_groups[[4]]

ggplot(subset(drug_sens, DRUG_NAME %in% group4),
aes (x=DRUG_NAME, y= AUC, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "AUC- Drug Group 4" ,
x= "Drug name",
y=" AUC") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group1 <- drug_groups[[1]]

ggplot(subset(drug_sens, DRUG_NAME %in% group1),
aes (x=DRUG_NAME, y= RMSE, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "RMSE- Drug Group 1" ,
x= "Drug name",
y=" RMSE") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group2 <- drug_groups[[2]]

ggplot(subset(drug_sens, DRUG_NAME %in% group2),
aes (x=DRUG_NAME, y= RMSE, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "RMSE- Drug Group 2" ,
x= "Drug name",
y=" RMSE") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group3 <- drug_groups[[3]]

ggplot(subset(drug_sens, DRUG_NAME %in% group3),
aes (x=DRUG_NAME, y= RMSE, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "RMSE- Drug Group 3" ,
x= "Drug name",
y=" RMSE") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group4 <- drug_groups[[4]]

ggplot(subset(drug_sens, DRUG_NAME %in% group4),
aes (x=DRUG_NAME, y= RMSE, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "RMSE- Drug Group 4" ,
x= "Drug name",
y=" RMSE") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

unique_drugs <- unique (drug_sens$Z_SCORE)
drug_groups <- split (unique_drugs, cut(seq_along(unique_drugs), 4, labels = FALSE))

group1 <- drug_groups[[1]]

ggplot(subset(drug_sens, DRUG_NAME %in% group1),
aes (x=DRUG_NAME, y= Z_SCORE, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "Z_SCORE- Drug Group 1",
x= "Drug name",
y=" Z_SCORE") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group2 <- drug_groups[[2]]

ggplot(subset(drug_sens, DRUG_NAME %in% group2),
aes (x=DRUG_NAME, y= Z_SCORE, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "Z_SCORE- Drug Group 2",
x= "Drug name",
y=" Z_SCORE") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group3 <- drug_groups[[3]]

ggplot(subset(drug_sens, DRUG_NAME %in% group3),
aes (x=DRUG_NAME, y= Z_SCORE, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "Z_SCORE- Drug Group 3",
x= "Drug name",
y=" Z_SCORE") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group4 <- drug_groups[[4]]

ggplot(subset(drug_sens, DRUG_NAME %in% group4),
aes (x=DRUG_NAME, y= Z_SCORE, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "Z_SCORE- Drug Group 4",
x= "Drug name",
y=" Z_SCORE") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group1 <- drug_groups[[1]]

ggplot(subset(drug_sens, DRUG_NAME %in% group1),
aes (x=DRUG_NAME, y= MAX_CONC, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "MAX_CONC- Drug Group 1",
x= "Drug name",
y=" MAX_CONC") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group2 <- drug_groups[[2]]

ggplot(subset(drug_sens, DRUG_NAME %in% group2),
aes (x=DRUG_NAME, y= MAX_CONC, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "MAX_CONC- Drug Group 2",
x= "Drug name",
y=" MAX_CONC") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group3 <- drug_groups[[3]]

ggplot(subset(drug_sens, DRUG_NAME %in% group3),
aes (x=DRUG_NAME, y= MAX_CONC, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "MAX_CONC- Drug Group 3",
x= "Drug name",
y=" MAX_CONC") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

group4 <- drug_groups[[4]]

ggplot(subset(drug_sens, DRUG_NAME %in% group4),
aes (x=DRUG_NAME, y= MAX_CONC, fill = DRUG_NAME)) +
  geom_boxplot()+
  theme_minimal()+
  labs(title= "MAX_CONC- Drug Group 4",
x= "Drug name",
y=" MAX_CONC") +
  theme (axis.text.x= element_text( angle= 45, hjust= 1))

if (!require("dplyr")) install.packages("dplyr")

df1 <- data.frame(ID = c(1, 2, 3), Name = c("A", "B", "C"))
df2 <- data.frame(ID = c(2, 3, 4), Score = c(80, 90, 70))

inner_join(df1, df2, by = "ID")

inner <- inner_join(df1, df2, by = "ID")

inner

left_join(df1, df2, by = "ID")

right_join(df1, df2, by = "ID")

full_join(df1, df2, by = "ID")

semi_join(df1, df2, by = "ID")

anti_join(df1, df2, by = "ID")

drug_details <- read_csv("/content/drive/MyDrive/Mentoria/Compounds-annotation.csv", show_col_types = FALSE)

colnames(drug_sens)

head(drug_sens$DRUG_NAME)

colnames(drug_details)

head(drug_details$DRUG_NAME)

data1 <- inner_join(drug_sens, drug_details, by = "DRUG_NAME", relationship = "many-to-many")

head(data1)

str(data1)

colnames(data1)

# colnames(dataset1-izquierda) #el que mas info tenga, el mas importante

# colnames(dataset2-derecha) # evaluar las columnas iguales

# hacer el joint por la columna en conjunto

# head del dataset unido para ver que cambio

library(dplyr)

drug_combined <- left_join(drug_sens, drug_details, by = "DRUG_ID")

names(drug_sens)
names(drug_details)

head(drug_combined)

left_join(drug_sens,drug_details, by= "DRUG_ID")

right_join(drug_sens,drug_details, by= "DRUG_ID")

full_join(drug_sens,drug_details, by = "DRUG_ID")

semi_join(drug_sens,drug_details,by = "DRUG_ID")

anti_join(drug_sens,drug_details, by ="DRUG_ID")

drug_compounds <-inner_join (drug_sens, drug_details, by = "DRUG_NAME")

head(drug_compounds)

glimpse(drug_compounds)

tabla_dos <- left_join(drug_sens, cell_lines, by = c("COSMIC_ID" = "COSMIC identifier"))

colnames (cell_lines)

head (tabla_dos)

sum(is.na(tabla_dos))

glimpse(tabla_dos)

tabla_tres <-right_join(drug_sens,cell_lines, by= c("COSMIC_ID" = "COSMIC identifier") )

head(tabla_tres)

glimpse(tabla_tres)

solo_en_cell_lines <- tabla_tres %>% filter(is.na(LN_IC50))

sum(is.na(drug_sens$LN_IC50))

colnames(cell_lines)

solo_en_cell_lines

full_join <- full_join (cell_lines, drug_sens, by = c ("COSMIC identifier" = "COSMIC_ID"))

full_join

ncol(full_join)

glimpse(full_join)

tabla_semi_join <- semi_join (drug_sens, cell_lines, by = c( "COSMIC_ID" = "COSMIC identifier"))

tabla_semi_join

glimpse(tabla_semi_join)

anti_join <- anti_join (drug_sens, cell_lines, by = c( "COSMIC_ID" = "COSMIC identifier"))

anti_join

glimpse(anti_join)

tabla_siete <- inner_join(drug_sens,drug_details, by = "DRUG_NAME")

head(tabla_siete)

glimpse(tabla_siete)

colnames(drug_sens)

colnames(drug_details)

tabla_ocho <- left_join (drug_sens, drug_details, by= "DRUG_NAME")

head(tabla_ocho)

glimpse(tabla_ocho)

sin_target <- tabla_ocho %>% filter (is.na(TARGET)) ##FILTRA LAS DROGAS QUE NO TIENEN TARGET

unique(sin_target$DRUG_NAME)

sum(is.na(tabla_ocho$TARGET))

tabla_full_nueve <- full_join (drug_sens,drug_details,by= "DRUG_NAME" )

glimpse(tabla_full_nueve)

solo_en_drug_sens <- tabla_full_nueve %>% filter(is.na(SCREENING_SITE))

solo_en_drug_details <- tabla_full_nueve %>% filter(is.na(AUC))

unique(solo_en_drug_sens$DRUG_NAME)
## no hay drogas de drug sens sin match

sum(is.na(tabla_full_nueve$SCREENING_SITE))

unique(solo_en_drug_details$DRUG_NAME)

tabla_con_drogas_sens_match_details <- semi_join (drug_sens,drug_details, by = "DRUG_ID")

head(tabla_con_drogas_sens_match_details)

glimpse(tabla_con_drogas_sens_match_details)

# generar dataset unido

# cargar dataset unido

library(tidyverse)
library(readr)

sens_details <- left_join (drug_sens, drug_details, by = "DRUG_NAME")

missing_targets <- sens_details %>%
  filter (is.na(TARGET))
  distinct("DRUG_NAME")


filtro <- sens_details %>% filter(is.na(TARGET))
nrow(filtro)

glimpse(sens_details)

missing_targets <- sens_details %>%
  filter(is.na(TARGET))%>%
  distinct(DRUG_NAME)

print (missing_targets)

# Graficar cantidad de fármacos sin TARGET
missing_targets %>%
  count() %>%
  ggplot(aes(x = "sens_details", y = n)) +
  geom_col(fill = "red") +
  coord_polar("y") +
  labs(title = "Cantidad de fármacos sin TARGET asignado",
       y = "Cantidad", x = "sens_details") +
  theme_void()

only_in_drug_sens <- anti_join (drug_sens, drug_details, by = "DRUG_NAME") %>%
  distinct("DRUG_NAME")

print(only_in_drug_sens)

library(tidyverse)
library(readxl)


names(cell_lines) <- str_replace_all(names(cell_lines), "\n", " ") %>% str_trim()


sens_details <- left_join(drug_sens, drug_details, by = "DRUG_NAME")

final_dataset <- left_join (sens_details, cell_lines, by = c("COSMIC_ID" = "COSMIC identifier"))

glimpse(final_dataset)

colSums(is.na(final_dataset))

write_csv(final_dataset, "GDSC2_Final_Integrado.csv")

library(tidyverse)

final_dataset <-read.csv("/content/drive/MyDrive/Sole - Salud Analytics/Plataforma/Datasets/GDSC2_Final_Integrado.csv")

dim(final_dataset)

colnames(final_dataset)

str(final_dataset)

categorical_vars <- c("TCGA_DESC", "Cancer.Type..matching.TCGA.label.", "PATHWAY_NAME", "TARGET_PATHWAY", "GDSC.Tissue.descriptor.1", "Growth.Properties", "Microsatellite..instability.Status..MSI.", "Drug.Response", "Gene.Expression", "Methylation" )

final_dataset <- final_dataset %>% mutate(across(all_of(categorical_vars), as.factor))

summary(select(final_dataset, all_of(c("Methylation", "Gene.Expression", "Drug.Response"))))

final_dataset <- final_dataset %>%
  mutate(across(c("Methylation", "Gene.Expression", "Drug.Response"),
                ~ factor(., levels = c("N", "Y"))))

vars_to_scale <- c("LN_IC50", "AUC", "RMSE", "Z_SCORE", "MIN_CONC", "MAX_CONC")

for (var in vars_to_scale) {
  new_col <- paste0(var, "_scaled")
  final_dataset[[new_col]] <- scale(final_dataset[[var]])
}

glimpse(final_dataset)

colSums(is.na(final_dataset))
