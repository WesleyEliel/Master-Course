library(shiny)
library(dplyr)
library(ggplot2)
library(readr)
library(caret)
library(rclone)

ui <- fluidPage(
  titlePanel("Iris Dataset Visualization"),

  sidebarLayout(
    sidebarMenu(
      menuItem("Data Import", icon = icon("database"), tabName = "import"),
      menuItem("Data Overview", icon = icon("dashboard"), tabName = "overview"),
      menuItem("Data Visualization", icon = icon("chart-bar"), tabName = "visualization"),
      menuItem("Data Encoding", icon = icon("cog"), tabName = "encoding"),
      menuItem("Correlation Matrix", icon = icon("table"), tabName = "correlation"),
      menuItem("Data Normalization", icon = icon("scale-balanced"), tabName = "normalization"),
      menuItem("Machine Learning Model", icon = icon("robot"), tabName = "ml")
    ),

    mainPanel(
      tabItems(
        # Tabs will be defined here
      )
    )
  )
)

import_data <- function() {
  file_input <- reactive({
    input$file
  })

  df <- reactive({
    if (!is.null(file_input())) {
      read_csv(file_input$datapath)
    }
  })

  return(df)
}

data_overview <- function(df) {
  # Function to display dataset info
  info <- reactive({
    req(df)
    paste0(
      "Number of rows: ", nrow(df),
      "\nNumber of columns: ", ncol(df),
      "\nData types:\n", sapply(df, class)
    )
  })

  # Function to display summary statistics
  summary_stats <- reactive({
    req(df)
    summary(df)
  })

  # Function to display missing values
  missing_values <- reactive({
    req(df)
    sum(is.na(df))
  })

  return(list(info = info, summary_stats = summary_stats, missing_values = missing_values))
}

histogram <- function(df) {
  hist_data <- reactive({
    req(df)
    df %>% select(sepal_length, petal_length) %>%
      mutate(species = factor(species)) %>%
      ggplot(aes(x = sepal_length, y = petal_length, color = species)) +
      geom_point() +
      theme_minimal()
  })

  return(hist_data)
}

encode_species <- function(df) {
  encoded_df <- reactive({
    req(df)
    df %>%
      mutate(species_encoded = as.integer(factor(species)))
  })

  return(encoded_df)
}

correlation_matrix <- function(df) {
  corr_matrix <- reactive({
    req(df)
    cor(df[, sapply(df, is.numeric)])
  })

  return(corr_matrix)
}

normalize_data <- function(df) {
  normalized_df <- reactive({
    req(df)
    scale(df[, sapply(df, is.numeric)])
  })

  return(normalized_df)
}

ml_model <- function(df) {
  X <- reactive({
    req(df)
    df %>% select(sepal_length, petal_length)
  })

  Y <- reactive({
    req(df)
    df %>% pull(species_encoded)
  })

  train_model <- reactive({
    req(X(), Y())
    set.seed(123)
    train("rf", x = X(), y = Y(), method = "oob")
  })

  predict_model <- reactive({
    req(train_model())
    predict(train_model(), newdata = X())
  })

  accuracy <- reactive({
    req(predict_model())
    mean(Y() == predict_model())
  })

  return(list(model = train_model(), predict = predict_model(), accuracy = accuracy))
}

server <- function(input, output) {
  df <- import_data()

  overview <- data_overview(df())

  hist_plot <- histogram(df())

  encoded_df <- encode_species(df())

  corr_matrix <- correlation_matrix(encoded_df())

  normalized_df <- normalize_data(encoded_df())

  ml_results <- ml_model(encoded_df())

  output$import <- renderText({
    paste("File imported:", input$file$datapath)
  })

  output$overview <- renderUI({
    tabItem(
      title = "Data Overview",
      fluidRow(
        column(6, textOutput("info")),
        column(6, tableOutput("summary_stats"))
      ),
      fluidRow(
        column(12, textOutput("missing_values"))
      )
    )
  })

  output$visualization <- renderPlot({
    hist_plot()
  })

  output$encoding <- renderTable({
    head(encoded_df())
  })

  output$correlation <- renderMatrix({
    corr_matrix()
  })

  output$normalization <- renderTable({
    head(normalized_df())
  })

  output$ml <- renderText({
    paste("Accuracy:", round(ml_results$accuracy(), 2))
  })
}


shinyApp(ui = ui, server = server)