install.packages("readr")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("tidyr")
install.packages("plotly")

library(readr)
library(dplyr)
library(ggplot2)
library(tidyr)
library(plotly)


#############################################################################

# Partie 1 : Lecture et affichage du dataset COVID-19

cat("\n # Partie 1 : Lecture et affichage du dataset COVID-19 \n\n\n")


url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/03-17-2020.csv"

covid_data <- read_csv(url, show_col_types = FALSE)

print(head(covid_data))

print("\nInformations sur le dataset:")
summary(covid_data)

print("\nInformation sur les données manquantes:")
summary(is.na(covid_data))


cat("\n\n\n\n\n")

#############################################################################

#
#
#
#

#############################################################################


# Partie 2 : Analyse des données COVID-19 par pays

cat("\n # Partie 2 : Analyse des données COVID-19 par pays \n\n\n")

url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/03-17-2020.csv"

covid_data <- read_csv(url, show_col_types = FALSE)

cat(colnames(covid_data))

if (!all(c("Confirmed", "Deaths", "Recovered", "Country/Region") %in% colnames(covid_data))) {
  stop("Le fichier ne contient pas les colonnes attendues.")
}

covid_data <- covid_data %>%
  mutate(
    Active = Confirmed - Deaths - Recovered
  )
cat(colnames(covid_data))

result <- covid_data %>%
  group_by(`Country/Region`) %>%
  summarise(
    Confirmed = sum(Confirmed, na.rm = TRUE),
    Deaths = sum(Deaths, na.rm = TRUE),
    Recovered = sum(Recovered, na.rm = TRUE),
    Active = sum(Active, na.rm = TRUE)
  ) %>%
  arrange(desc(Confirmed))

print(result)
write.csv(result, "disease_summary_by_country.csv", row.names = FALSE)

cat("\n\n\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Partie 3 : Analyse des données COVID-19 par province et état

cat("\n # Partie 3 : Analyse des données COVID-19 par province et état \n\n\n")

url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/03-16-2020.csv"

covid_data <- read_csv(url, show_col_types = FALSE )
data <- covid_data %>%
  group_by(`Country/Region`, `Province/State`) %>%
  summarise(
    Confirmed = max(Confirmed, na.rm = TRUE),
    Deaths = max(Deaths, na.rm = TRUE),
    Recovered = max(Recovered, na.rm = TRUE)
  ) %>%
  ungroup()

options(dplyr.print_min = Inf, dplyr.print_max = Inf)

print(data)

cat("\n\n\n\n\n")


#############################################################################

#
#
#

#############################################################################

# Partie 4 : Analyse des données COVID-19 en Chine

cat("\n # Partie 4 : Analyse des données COVID-19 en Chine \n\n\n")

url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/03-17-2020.csv"
covid_data <- read.csv(url)

filtered_data <- covid_data %>%
  filter(Country.Region == "China") %>%
  select(Province.State, Confirmed, Deaths, Recovered)

result <- filtered_data %>%
  arrange(desc(Confirmed)) %>%
  mutate(row_number = row_number())

print(result)



cat("\n\n\n\n\n")



#############################################################################

#
#
#

#############################################################################


# Partie 5 : Analyse des données COVID-19 avec plus de décès

cat("\n Partie 5 : Analyse des données COVID-19 avec plus de décès \n\n\n")

url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/03-17-2020.csv"

covid_data <- read_csv(url, show_col_types = FALSE )

summarisez_data <- covid_data %>%
  group_by(`Country/Region`) %>%
  summarise(
    Confirmed = sum(Confirmed, na.rm = TRUE),
    Deaths = sum(Deaths, na.rm = TRUE),
    Recovered = sum(Recovered, na.rm = TRUE)
  )

result <- summarisez_data %>%
  filter(Deaths > 0) %>%
  select(`Country/Region`, Deaths)

print(result)

cat("\n\n\n\n\n")

#############################################################################

#
#
#

#############################################################################


# Partie 6 : Analyse des données COVID-19 avec seulement les cas récupérés

cat("\n Partie 6 : Analyse des données COVID-19 avec seulement les cas récupérés \n\n\n")

url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/03-17-2020.csv"

covid_data <- read_csv(url, show_col_types = FALSE)

data <- covid_data %>%
  group_by(`Country/Region`) %>%
  summarise(
    Confirmed = sum(Confirmed, na.rm = TRUE),
    Deaths = sum(Deaths, na.rm = TRUE),
    Recovered = sum(Recovered, na.rm = TRUE)
  )

result <- data %>%
  filter(Recovered == 0) %>%
  select(`Country/Region`, Confirmed, Deaths, Recovered)

print(result)

cat("\n\n\n\n\n")

#############################################################################

#
#
#

#############################################################################


# Partie 7 : Analyse des données COVID-19 avec égalité entre confirmés et décès


cat("\n Partie 7 : Analyse des données COVID-19 avec égalité entre confirmés et décès \n\n\n")

url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/03-17-2020.csv"
covid_data <- read_csv(url, show_col_types = FALSE )


data <- covid_data %>%
  group_by(`Country/Region`) %>%
  summarise(
    Confirmed = sum(Confirmed, na.rm = TRUE),
    Deaths = sum(Deaths, na.rm = TRUE),
    Recovered = sum(Recovered, na.rm = TRUE)
  )

result <- data %>%
  filter(Confirmed == Deaths) %>%
  filter(Confirmed > 0) %>%
  select(`Country/Region`, Confirmed, Deaths) %>%
  arrange(desc(Confirmed)) %>%
  ungroup() %>%
  mutate(RowID = row_number()) %>%
  select(-RowID)

print(result)

cat("\n\n\n\n\n")

#############################################################################

#
#
#

#############################################################################


# Partie 8 : Analyse des données COVID-19 avec égalité entre confirmés et récupérés

cat("\n Partie 8 : Analyse des données COVID-19 avec égalité entre confirmés et récupérés \n\n\n")

url <- 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/03-17-2020.csv'

covid_data <- read_csv(url, show_col_types = FALSE )

data <- covid_data %>%
  group_by(`Country/Region`) %>%
  summarise(
    Confirmed = sum(Confirmed, na.rm = TRUE),
    Deaths = sum(Deaths, na.rm = TRUE),
    Recovered = sum(Recovered, na.rm = TRUE)
  )

result <- data %>%
  filter(Confirmed == Recovered)

cat("\n 1 \n")
result <- result %>%
  select(`Country/Region`, Confirmed, Recovered)

cat("\n 2 \n")
result <- result %>%
  arrange(desc(Confirmed))

cat("\n 3 \n")
result <- result %>%
  filter(Confirmed > 0)

cat("\n 4 \n")
result <- result %>%
  mutate(row_number = row_number()) %>%
  select(-row_number)

cat("\n 5 \n")
print(result)
cat("\n\n\n\n\n")

#############################################################################

#
#
#

#############################################################################


# Partie 9 : Analyse des données COVID-19 du 18 mars 2020

cat("\n Partie 9 : Analyse des données COVID-19 du 18 mars 2020 \n\n\n")

url <- 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/03-18-2020.csv'
covid_data <- read_csv(url, col_types = cols_only(
  `Last Update` = col_character(),
  `Country/Region` = col_character(),
  Confirmed = col_double(),
  Deaths = col_double(),
  Recovered = col_double()
))

result <- covid_data %>%
  group_by(`Country/Region`) %>%
  summarise(
    `Last Update` = max(`Last Update`, na.rm = TRUE),
    Confirmed = max(Confirmed, na.rm = TRUE),
    Deaths = max(Deaths, na.rm = TRUE),
    Recovered = max(Recovered, na.rm = TRUE)
  )

result <- result %>%
  arrange(desc(Confirmed))

top_10_countries <- head(result, 10)

print(top_10_countries)

cat("\n\n\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Partie 10 : Création d'un graphique interactif avec Plotly

cat("\n Partie 10 :  Création d'un graphique interactif avec Plotly \n\n\n")
url <- 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/03-19-2020.csv'
covid_data <- read_csv(url, col_types = cols_only(
  `Last Update` = col_character(),
  `Country/Region` = col_character(),
  Confirmed = col_double(),
  Deaths = col_double(),
  Recovered = col_double()
))

# Ajout d'une colonne "Active" pour représenter les cas actifs
covid_data <- covid_data %>%
  mutate(Active = Confirmed - Deaths - Recovered)

# -----------------------------------------------------------------------------
# Regroupement par pays et agrégation des données
agg_data <- covid_data %>%
  group_by(`Country/Region`) %>%
  summarise(
    Deaths = sum(Deaths, na.rm = TRUE),
    Confirmed = sum(Confirmed, na.rm = TRUE),
    Recovered = sum(Recovered, na.rm = TRUE),
    Active = sum(Active, na.rm = TRUE)
  )

# Tri des pays par nombre de décès (en ordre décroissant) et filtrage
agg_data <- agg_data %>%
  arrange(desc(Deaths)) %>%
  filter(Deaths > 50)  # On garde seulement les pays ayant plus de 50 décès

# Transformation des données en format long pour ggplot
long_data <- agg_data %>%
  tidyr::pivot_longer(
    cols = c(Deaths, Confirmed, Recovered, Active),
    names_to = "Category",
    values_to = "Value"
  )

# Visualisation des données avec ggplot2
ggplot(long_data, aes(x = reorder(`Country/Region`, -Value), y = Value, color = Category, group = Category)) +
  geom_point(size = 2) +
  geom_line(linewidth = 1) +
  labs(
    title = 'Distribution des cas (>50 décès) : Confirmés, Guéris, Actifs et Décès',
    x = 'Pays',
    y = 'Nombre de cas'
  ) +
  theme_minimal() +
  scale_color_manual(
    values = c('Deaths' = 'red', 'Confirmed' = 'green', 'Recovered' = 'blue', 'Active' = 'black')
  ) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),  # Rotation des noms des pays
    plot.title = element_text(hjust = 0.5)             # Centrage du titre
  )

cat("\n\n\n\n\n")

#############################################################################

#
#
#

#############################################################################


#############################################################################

# Partie 11 : Graphique interactif des décès par État aux USA
cat("\n Partie 11 :  Graphique interactif des décès par État aux USA \n\n\n")

url <- 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/03-17-2020.csv'
covid_data <- read_csv(url, show_col_types = FALSE )

us_data <- covid_data %>%
  filter(`Country/Region` == "US") %>%
  select(-`Country/Region`, -Latitude, -Longitude)

us_data <- us_data %>%
  rowwise() %>%
  filter(sum(c_across(Confirmed:Recovered), na.rm = TRUE) > 0) %>% 
  ungroup()

us_data <- us_data %>%
  group_by(`Province/State`) %>%
  summarise(Deaths = sum(Deaths, na.rm = TRUE)) %>%
  ungroup()


us_data_death <- us_data %>%
  filter(Deaths > 0)

state_fig <- plot_ly(
  data = us_data_death,
  x = ~`Province/State`,
  y = ~Deaths,
  type = "bar",
  text = ~Deaths,
  textposition = "outside",
  marker = list(color = "red")
) %>%
  layout(
    title = "Nombre de décès par État aux USA (COVID-19)",
    xaxis = list(title = "Province/État"),
    yaxis = list(title = "Nombre de Décès"),
    showlegend = FALSE
  )

state_fig

htmlwidgets::saveWidget(state_fig, "plot_us_deaths.html")
browseURL("plot_us_deaths.html")

cat("\n\n\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Partie 12 : Graphique interactif des cas actifs par État aux USA
cat("\n Partie 12 :  Graphique interactif des cas actifs par État aux USA \n\n\n")

# Charger les données
url <- 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/03-18-2020.csv'
covid_data <- read_csv(url, show_col_types = FALSE)

# Calculer les cas actifs
covid_data <- covid_data %>%
  mutate(Active = Confirmed - Deaths - Recovered)

# Filtrer les données pour les États-Unis
us_data <- covid_data %>%
  filter(`Country/Region` == "US") %>%
  select(-`Country/Region`, -Latitude, -Longitude)  # Exclure les colonnes non nécessaires

# Supprimer les lignes avec une somme de colonnes numériques égale à zéro
us_data <- us_data %>%
  rowwise() %>%
  filter(sum(c_across(where(is.numeric)), na.rm = TRUE) > 0) %>%  # Sélectionner uniquement les colonnes numériques
  ungroup()

# Regrouper par État et calculer le total des cas actifs
us_data <- us_data %>%
  group_by(`Province/State`) %>%
  summarise(Active = sum(Active, na.rm = TRUE)) %>%
  ungroup()

# Filtrer pour les États avec des cas actifs > 0
us_data_active <- us_data %>%
  filter(Active > 0)

# Créer le graphique
state_fig <- plot_ly(
  data = us_data_active,
  x = ~`Province/State`,
  y = ~Active,
  type = "bar",
  text = ~Active,
  textposition = "outside",
  marker = list(color = "blue")
) %>%
  layout(
    title = "Nombre de cas actifs par État aux USA (COVID-19)",
    xaxis = list(title = "Province/État"),
    yaxis = list(title = "Cas Actifs"),
    showlegend = FALSE
  )

state_fig

cat("\n\n\n\n\n")

#############################################################################

#
#
#

#############################################################################

# Partie 13 : Graphique interactif combiné des cas confirmés, décès et récupérés par État aux USA

cat("\n Partie 13 :  Graphique interactif combiné des cas confirmés, décès et récupérés par État aux USA \n\n\n")

url <- 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/03-19-2020.csv'
covid_data <- read_csv(url, show_col_types = FALSE )

covid_data <- covid_data %>%
  mutate(Active = Confirmed - Deaths - Recovered)

combine_us_data <- covid_data %>%
  filter(`Country/Region` == "US") %>%
  select(-`Country/Region`, -Latitude, -Longitude)

combine_us_data <- combine_us_data %>%
  rowwise() %>%
  filter(sum(c_across(where(is.numeric)), na.rm = TRUE) > 0) %>%
  ungroup()

combine_us_data <- combine_us_data %>%
  group_by(`Province/State`) %>%
  summarise(
    Confirmed = sum(Confirmed, na.rm = TRUE),
    Deaths = sum(Deaths, na.rm = TRUE),
    Recovered = sum(Recovered, na.rm = TRUE),
    Active = sum(Active, na.rm = TRUE)
  ) %>%
  ungroup()

combine_us_data_long <- combine_us_data %>%
  pivot_longer(
    cols = c(Confirmed, Deaths, Recovered, Active),
    names_to = "Case",
    values_to = "Count"
  )

fig <- plot_ly(
  data = combine_us_data_long,
  x = ~`Province/State`,
  y = ~Count,
  color = ~Case,
  type = "bar",
  text = ~Count,
  textposition = "outside"
) %>%
  layout(
    title = "Nombre de cas combinés par État aux USA (COVID-19)",
    xaxis = list(title = "Province/État"),
    yaxis = list(title = "Nombre de Cas"),
    barmode = "group"
  )

fig

cat("\n\n\n\n\n")
#############################################################################

#
#
#

#############################################################################

# Partie 14 : Graphique interactif du nombre de cas confirmés au fil du temps

cat("\n Partie 14 :  Graphique interactif du nombre de cas confirmés au fil du temps \n\n\n")

url <- 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/03-19-2020.csv'
covid_data <- read_csv(url, show_col_types = FALSE )

grouped <- covid_data %>%
  group_by(`Last Update`) %>%
  summarise(
    Confirmed = sum(Confirmed, na.rm = TRUE),
    Deaths = sum(Deaths, na.rm = TRUE)
  ) %>%
  ungroup()

fig <- plot_ly(
  data = grouped,
  x = ~`Last Update`,
  y = ~Confirmed,
  type = "scatter",
  mode = "lines+markers",
  line = list(color = "cyan")
) %>%
  layout(
    title = "Nombre de cas confirmés de COVID-19 dans le monde au fil du temps",
    xaxis = list(title = "Dernière mise à jour"),
    yaxis = list(title = "Nombre de cas confirmés"),
    plot_bgcolor = "#111111",
    paper_bgcolor = "#111111",
    font = list(color = "white")
  )

fig

cat("\n\n\n\n\n")
#############################################################################