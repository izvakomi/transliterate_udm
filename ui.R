# CC-BY Niko Partanen, Freiburg Research Project in Saami Studies

library(shiny)
library(htmlTable)

shinyUI(navbarPage("", position = "fixed-bottom",
        tabPanel("Транслитерация",
        titlePanel(title = em(h1("Удмурт гожысь бертысь"), 
                              align = "right"), 
                   windowTitle = "Transliteration tool"),
        includeCSS("www/udm_theme.css"),
        
sidebarLayout(
        sidebarPanel(
                HTML('<textarea id="text" rows="10" cols="38">мон ксен’йа, ӓбилэн внучкӓйэз лӱис’ко.  тӱэ школмэ  бътти. татън пэ˙рвой коркан улисˈко та  урамън.  удгуэ дъшэсˈкънъ пърънъ малпасˈко тожэ удмуртский факулˈтˈэтэ. но дъшэсˈконо луоз илˈи вэнгэ˙рский, илˈи англˈи˙ский къл. къкэз но äйбäт. \n ук тӧсˈкъ. кълˈэм арън мънса экза˙мэн сˈотоно вал. но тӱэ со экза˙мэнэз куштизъ. сойэн но школэз бъттэм бэрэ йэгэ рэзулˈта˙тъйосън пърисˈкомъ дъшэсˈкънъ.</textarea>'),
                helpText(p("Та программа одӥг научнэй транскрипцияысь мукетэ бэртыны юртэм сётоз.")),
                
                selectInput("inputText", 
                            label = p("Берйы инпут:"),
                            choices = list("Удмурт научнэй транскрипция"),
                            selected = "Удмурт научнэй транскрипция"),
                selectInput("outputModel", 
                            label = p("Берйы модел:"),
                            choices = list("Уральский фонет. алфавит" = "patterns/udm_upa.csv",
                                           "Халык. фонет. алфавит" = "patterns/udm_ipa.csv",
                                           "Удмурт орфография" = "patterns/udm_orth.csv")),
                downloadButton(outputId = "downloadData", label = "Босьты файлзэ")
        ),
        mainPanel(htmlOutput("text"))
)),
        tabPanel("Information",
                p("This web application has been built in Freiburg Research Group in Saami Studies. We have been using Shiny web framework for R. It is a technical test done in order to help a collegue who works with Udmurt. The work was done within Izhva Komi Language Documentation project."),
                p("One can ask what a project that works with the northernmost Komi dialect has to do with very southern Udmurt dialects. However, as Permic languages are relatively tight knit group, the best context to understand these languages may very well be the context of all different variants of Permic languages, both within Komi and Udmurt."),
                p("Another point to consider is that the open source code behind this program can be very easily adjusted to any other language with similar issues, namely the need to convert texts from different transliteration systems to another. Currently we do this work with our data using project internal Perl and R scripts, but in principle also these models could be easily added into a web application such as this, if someone would have project external need for exactly same transliteration patterns. (Somewhat unlikely, but of course possible.)"),
                p("The work has been funded by Kone Foundation and the project is led by Rogier Blokland, Michael Rießler and Marina Fedina. This application was written by Niko Partanen. (nikotapiopartanen@gmail.com)")
        )
))
