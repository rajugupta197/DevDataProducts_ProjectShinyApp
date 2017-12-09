#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic
dt <- read.csv('data/payments.csv')
states <- sort(unique(dt$Provider.State))
drugs <- sort(unique(dt$DRG.Definition))

CA <- dt[dt$Provider.State == 'CA', c('DRG.Definition', 'Provider.State', 'Average.Covered.Charges', 'Average.Total.Payments')]
FL <- dt[dt$Provider.State == 'FL', c('DRG.Definition', 'Provider.State', 'Average.Covered.Charges', 'Average.Total.Payments')]
IL <- dt[dt$Provider.State == 'IL', c('DRG.Definition', 'Provider.State', 'Average.Covered.Charges', 'Average.Total.Payments')]
NY <- dt[dt$Provider.State == 'NY', c('DRG.Definition', 'Provider.State', 'Average.Covered.Charges', 'Average.Total.Payments')]
PA <- dt[dt$Provider.State == 'PA', c('DRG.Definition', 'Provider.State', 'Average.Covered.Charges', 'Average.Total.Payments')]
TX <- dt[dt$Provider.State == 'TX', c('DRG.Definition', 'Provider.State', 'Average.Covered.Charges', 'Average.Total.Payments')]

lm.CA1 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(CA, DRG.Definition == drugs[1]))
lm.CA2 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(CA, DRG.Definition == drugs[2]))
lm.CA3 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(CA, DRG.Definition == drugs[3]))
lm.CA4 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(CA, DRG.Definition == drugs[4]))
lm.CA5 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(CA, DRG.Definition == drugs[5]))
lm.CA6 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(CA, DRG.Definition == drugs[6]))

lm.FL1 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(FL, DRG.Definition == drugs[1]))
lm.FL2 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(FL, DRG.Definition == drugs[2]))
lm.FL3 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(FL, DRG.Definition == drugs[3]))
lm.FL4 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(FL, DRG.Definition == drugs[4]))
lm.FL5 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(FL, DRG.Definition == drugs[5]))
lm.FL6 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(FL, DRG.Definition == drugs[6]))

lm.IL1 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(IL, DRG.Definition == drugs[1]))
lm.IL2 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(IL, DRG.Definition == drugs[2]))
lm.IL3 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(IL, DRG.Definition == drugs[3]))
lm.IL4 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(IL, DRG.Definition == drugs[4]))
lm.IL5 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(IL, DRG.Definition == drugs[5]))
lm.IL6 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(IL, DRG.Definition == drugs[6]))

lm.NY1 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(NY, DRG.Definition == drugs[1]))
lm.NY2 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(NY, DRG.Definition == drugs[2]))
lm.NY3 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(NY, DRG.Definition == drugs[3]))
lm.NY4 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(NY, DRG.Definition == drugs[4]))
lm.NY5 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(NY, DRG.Definition == drugs[5]))
lm.NY6 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(NY, DRG.Definition == drugs[6]))

lm.PA1 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(PA, DRG.Definition == drugs[1]))
lm.PA2 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(PA, DRG.Definition == drugs[2]))
lm.PA3 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(PA, DRG.Definition == drugs[3]))
lm.PA4 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(PA, DRG.Definition == drugs[4]))
lm.PA5 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(PA, DRG.Definition == drugs[5]))
lm.PA6 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(PA, DRG.Definition == drugs[6]))

lm.TX1 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(TX, DRG.Definition == drugs[1]))
lm.TX2 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(TX, DRG.Definition == drugs[2]))
lm.TX3 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(TX, DRG.Definition == drugs[3]))
lm.TX4 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(TX, DRG.Definition == drugs[4]))
lm.TX5 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(TX, DRG.Definition == drugs[5]))
lm.TX6 <- lm(Average.Total.Payments ~ Average.Covered.Charges, data = subset(TX, DRG.Definition == drugs[6]))

options(scipen = 5)

shinyServer(function(input, output) 
{
    # isCA <- reactive({
    #     if('CA' %in% input$states) TRUE else FALSE
    # })
    # isFL <- reactive({
    #     if('FL' %in% input$states) TRUE else FALSE
    # })
    # isIL <- reactive({
    #     if('IL' %in% input$states) TRUE else FALSE
    # })
    # isNY <- reactive({
    #     if('NY' %in% input$states) TRUE else FALSE
    # })
    # isPA <- reactive({
    #     if('PA' %in% input$states) TRUE else FALSE
    # })
    # isTX <- reactive({
    #     if('TX' %in% input$states) TRUE else FALSE
    # })

    output$statechoices <- renderUI({
        if(1) {
            checkboxGroupInput('states', 'Show/Hide States', states, selected=states)
        }
    })
    
    output$drugchoices <- renderUI({
        if(1) {
            checkboxGroupInput('drugs', 'Select Model Fit For Diagnosis-Related Groups', drugs, selected=drugs)
        }
    })

    output$plotlegend <- renderPlot({
        plot.new()
        legend("bottom",
               legend = drugs, 
               #text.width = max(sapply(text, strwidth)),
               pch = c(15:20)[as.numeric(drugs)], 
               col=1:6, 
               #lwd=5, 
               cex=0.9, 
               horiz = F, 
               text.col = 1:6, 
               box.col = "black", 
               box.lty = 2,
               title = "Diagnosis-Related Groups Definition")
    })
    
    output$plotbystateCA <- renderPlot({
        # if(isCA() == TRUE) {
        if('CA' %in% input$states) {
            plot(x = CA$Average.Covered.Charges, y = CA$Average.Total.Payments, ylab = "Mean Total Payments", 
                 xlab = "Mean Covered Charges", main = "CA", col = CA$DRG.Definition, ylim = c(0,15000), 
                 xlim = c(0,100000), pch = c(15:20)[as.numeric(CA$DRG.Definition)], cex = 0.8)
            if('194 - SIMPLE PNEUMONIA & PLEURISY W CC' %in% input$drugs) abline(lm.CA1, col = 1, lwd = 2)
            if('292 - HEART FAILURE & SHOCK W CC' %in% input$drugs) abline(lm.CA2, col = 2, lwd = 2)
            if('392 - ESOPHAGITIS, GASTROENT & MISC DIGEST DISORDERS W/O MCC' %in% input$drugs) abline(lm.CA3, col = 3, lwd = 2)
            if('641 - MISC DISORDERS OF NUTRITION, METABOLISM, FLUIDS/ELECTROLYTES W/O MCC' %in% input$drugs) abline(lm.CA4, col = 4, lwd = 2)
            if('690 - KIDNEY & URINARY TRACT INFECTIONS W/O MCC' %in% input$drugs) abline(lm.CA5, col = 5, lwd = 2)
            if('871 - SEPTICEMIA OR SEVERE SEPSIS W/O MV 96+ HOURS W MCC' %in% input$drugs) abline(lm.CA6, col = 6, lwd = 2)
        }
    })
    
    output$plotbystateFL <- renderPlot({
        if('FL' %in% input$states) {
            plot(x = FL$Average.Covered.Charges, y = FL$Average.Total.Payments, ylab = "Mean Total Payments", 
                 xlab = "Mean Covered Charges", main = "FL", col = FL$DRG.Definition, ylim = c(0,15000), 
                 xlim = c(0,100000), pch = c(15:20)[as.numeric(FL$DRG.Definition)], cex = 0.8)
            if('194 - SIMPLE PNEUMONIA & PLEURISY W CC' %in% input$drugs) abline(lm.FL1, col = 1, lwd = 2)
            if('292 - HEART FAILURE & SHOCK W CC' %in% input$drugs) abline(lm.FL2, col = 2, lwd = 2)
            if('392 - ESOPHAGITIS, GASTROENT & MISC DIGEST DISORDERS W/O MCC' %in% input$drugs) abline(lm.FL3, col = 3, lwd = 2)
            if('641 - MISC DISORDERS OF NUTRITION, METABOLISM, FLUIDS/ELECTROLYTES W/O MCC' %in% input$drugs) abline(lm.FL4, col = 4, lwd = 2)
            if('690 - KIDNEY & URINARY TRACT INFECTIONS W/O MCC' %in% input$drugs) abline(lm.FL5, col = 5, lwd = 2)
            if('871 - SEPTICEMIA OR SEVERE SEPSIS W/O MV 96+ HOURS W MCC' %in% input$drugs) abline(lm.FL6, col = 6, lwd = 2)
        }
    })
    
    output$plotbystateIL <- renderPlot({
        if('IL' %in% input$states) {
            plot(x = IL$Average.Covered.Charges, y = IL$Average.Total.Payments, ylab = "Mean Total Payments", 
                 xlab = "Mean Covered Charges", main = "IL", col = IL$DRG.Definition, ylim = c(0,15000), 
                 xlim = c(0,100000), pch = c(15:20)[as.numeric(IL$DRG.Definition)], cex = 0.8)
            if('194 - SIMPLE PNEUMONIA & PLEURISY W CC' %in% input$drugs) abline(lm.IL1, col = 1, lwd = 2)
            if('292 - HEART FAILURE & SHOCK W CC' %in% input$drugs) abline(lm.IL2, col = 2, lwd = 2)
            if('392 - ESOPHAGITIS, GASTROENT & MISC DIGEST DISORDERS W/O MCC' %in% input$drugs) abline(lm.IL3, col = 3, lwd = 2)
            if('641 - MISC DISORDERS OF NUTRITION, METABOLISM, FLUIDS/ELECTROLYTES W/O MCC' %in% input$drugs) abline(lm.IL4, col = 4, lwd = 2)
            if('690 - KIDNEY & URINARY TRACT INFECTIONS W/O MCC' %in% input$drugs) abline(lm.IL5, col = 5, lwd = 2)
            if('871 - SEPTICEMIA OR SEVERE SEPSIS W/O MV 96+ HOURS W MCC' %in% input$drugs) abline(lm.IL6, col = 6, lwd = 2)
        }
    })
    
    output$plotbystateNY <- renderPlot({
        if('NY' %in% input$states) {
            plot(x = NY$Average.Covered.Charges, y = NY$Average.Total.Payments, ylab = "Mean Total Payments", 
                 xlab = "Mean Covered Charges", main = "NY", col = NY$DRG.Definition, ylim = c(0,15000), 
                 xlim = c(0,100000), pch = c(15:20)[as.numeric(NY$DRG.Definition)], cex = 0.8)
            if('194 - SIMPLE PNEUMONIA & PLEURISY W CC' %in% input$drugs) abline(lm.NY1, col = 1, lwd = 2)
            if('292 - HEART FAILURE & SHOCK W CC' %in% input$drugs) abline(lm.NY2, col = 2, lwd = 2)
            if('392 - ESOPHAGITIS, GASTROENT & MISC DIGEST DISORDERS W/O MCC' %in% input$drugs) abline(lm.NY3, col = 3, lwd = 2)
            if('641 - MISC DISORDERS OF NUTRITION, METABOLISM, FLUIDS/ELECTROLYTES W/O MCC' %in% input$drugs) abline(lm.NY4, col = 4, lwd = 2)
            if('690 - KIDNEY & URINARY TRACT INFECTIONS W/O MCC' %in% input$drugs) abline(lm.NY5, col = 5, lwd = 2)
            if('871 - SEPTICEMIA OR SEVERE SEPSIS W/O MV 96+ HOURS W MCC' %in% input$drugs) abline(lm.NY6, col = 6, lwd = 2)
        }
    })
    
    output$plotbystatePA <- renderPlot({
        if('PA' %in% input$states) {
            plot(x = PA$Average.Covered.Charges, y = PA$Average.Total.Payments, ylab = "Mean Total Payments", 
                 xlab = "Mean Covered Charges", main = "PA", col = PA$DRG.Definition, ylim = c(0,15000), 
                 xlim = c(0,100000), pch = c(15:20)[as.numeric(PA$DRG.Definition)], cex = 0.8)
            if('194 - SIMPLE PNEUMONIA & PLEURISY W CC' %in% input$drugs) abline(lm.PA1, col = 1, lwd = 2)
            if('292 - HEART FAILURE & SHOCK W CC' %in% input$drugs) abline(lm.PA2, col = 2, lwd = 2)
            if('392 - ESOPHAGITIS, GASTROENT & MISC DIGEST DISORDERS W/O MCC' %in% input$drugs) abline(lm.PA3, col = 3, lwd = 2)
            if('641 - MISC DISORDERS OF NUTRITION, METABOLISM, FLUIDS/ELECTROLYTES W/O MCC' %in% input$drugs) abline(lm.PA4, col = 4, lwd = 2)
            if('690 - KIDNEY & URINARY TRACT INFECTIONS W/O MCC' %in% input$drugs) abline(lm.PA5, col = 5, lwd = 2)
            if('871 - SEPTICEMIA OR SEVERE SEPSIS W/O MV 96+ HOURS W MCC' %in% input$drugs) abline(lm.PA6, col = 6, lwd = 2)
        }
    })
    
    output$plotbystateTX <- renderPlot({
        if('TX' %in% input$states) {
            plot(x = TX$Average.Covered.Charges, y = TX$Average.Total.Payments, ylab = "Mean Total Payments", 
                 xlab = "Mean Covered Charges", main = "TX", col = TX$DRG.Definition, ylim = c(0,15000), 
                 xlim = c(0,100000), pch = c(15:20)[as.numeric(TX$DRG.Definition)], cex = 0.8)
            if('194 - SIMPLE PNEUMONIA & PLEURISY W CC' %in% input$drugs) abline(lm.TX1, col = 1, lwd = 2)
            if('292 - HEART FAILURE & SHOCK W CC' %in% input$drugs) abline(lm.TX2, col = 2, lwd = 2)
            if('392 - ESOPHAGITIS, GASTROENT & MISC DIGEST DISORDERS W/O MCC' %in% input$drugs) abline(lm.TX3, col = 3, lwd = 2)
            if('641 - MISC DISORDERS OF NUTRITION, METABOLISM, FLUIDS/ELECTROLYTES W/O MCC' %in% input$drugs) abline(lm.TX4, col = 4, lwd = 2)
            if('690 - KIDNEY & URINARY TRACT INFECTIONS W/O MCC' %in% input$drugs) abline(lm.TX5, col = 5, lwd = 2)
            if('871 - SEPTICEMIA OR SEVERE SEPSIS W/O MV 96+ HOURS W MCC' %in% input$drugs) abline(lm.TX6, col = 6, lwd = 2)
        }
    })
    
    dataTable <- reactive(
        {
            dt[dt$Provider.State %in% input$states & dt$DRG.Definition %in% input$drugs, c('DRG.Definition', 'Provider.State', 'Average.Covered.Charges', 'Average.Total.Payments')]
        })
    
    output$table <- renderDataTable({dataTable()}, options = list(bFilter = FALSE, iDisplayLength = 50))
    
    output$downloadData.csv <- downloadHandler(
        filename = 'data.csv', content = function(file)
        {
            write.csv(dataTable(), file, row.names=FALSE)
        }
    )
})