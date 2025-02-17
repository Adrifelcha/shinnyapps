library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(
    disable = TRUE),
  dashboardSidebar(
    width = 190,
    sidebarMenu(
      menuItem("Introduction", tabName = "intro", icon = icon("book")),
      menuItem("About the Model", tabName = "about", icon = icon("star-o")),
      menuItem("ROC Curves", tabName="roc", icon = icon("star-o")),
      menuItem("Parametric Estimation", tabName="para", icon = icon("info"))
      #menuItem("Non-Parametric Analysis", tabName="nop", icon = icon("info"))
      )),
  dashboardBody(
    tags$head(
      tags$style(HTML('.main-header .logo {
                      font-family: "Georgia", Times, "Times New Roman", serif;
                      font-weight: bold;
                      font-size: 24px;}
                      
                      .body{
                      background-color:green;}

                      <!--About Discriminabilidad-->
                      .js-irs-0 .irs-bar {
                      border-top-color: #000000; border-bottom-color: #000000;} 
                      .js-irs-0 .irs-bar-edge {
                      border-color:#000000;}
                      .js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {
                      background: #AC58FA;}

                      <!--About Criterio y Sesgo-->
                      .js-irs-1 .irs-bar {
                      border-top-color: #000000; border-bottom-color: #000000;} 
                      .js-irs-1 .irs-bar-edge {
                      border-color:#000000;}
                      .js-irs-1 .irs-single, .js-irs-1 .irs-bar-edge, .js-irs-1 .irs-bar {
                      background: #000000;}

                      <!--ROC Discriminabilidad-->                      
                      .js-irs-2 .irs-bar {
                      border-top-color: #000000; border-bottom-color: #000000;} 
                      .js-irs-2 .irs-bar-edge {
                      border-color:#000000;}
                      .js-irs-2 .irs-single, .js-irs-2 .irs-bar-edge, .js-irs-2 .irs-bar {
                      background: #AC58FA;}

                      <!--ROC Criterio-->                      
                      .js-irs-3 .irs-bar {
                      border-top-color: #000000; border-bottom-color: #000000;} 
                      .js-irs-3 .irs-bar-edge {
                      border-color:#000000;}
                      .js-irs-3 .irs-single, .js-irs-3 .irs-bar-edge, .js-irs-3 .irs-bar {
                      background: #D19D12;}
                      
                      <!--Parametro K Rechazos Correctos-->                
                      .js-irs-4 .irs-bar {
                      border-top-color: #000000; border-bottom-color: #000000;} 
                      .js-irs-4 .irs-bar-edge {
                      border-color:#000000;}
                      .js-irs-4 .irs-single, .js-irs-4 .irs-bar-edge, .js-irs-4 .irs-bar {
                      background: #267DB9;}
                      
                      <!--Parametro D prima Rechazos Correctos-->                      
                      .js-irs-5 .irs-bar {
                      border-top-color: #000000; border-bottom-color: #000000;} 
                      .js-irs-5 .irs-bar-edge {
                      border-color:#000000;}
                      .js-irs-5 .irs-single, .js-irs-5 .irs-bar-edge, .js-irs-5 .irs-bar {
                      background: #267DB9;}

                      <!--Parametro D prima Omisiones-->                      
                      .js-irs-6 .irs-bar {
                      border-top-color: #000000; border-bottom-color: #000000;} 
                      .js-irs-6 .irs-bar-edge {
                      border-color:#000000;}
                      .js-irs-6 .irs-single, .js-irs-6 .irs-bar-edge, .js-irs-6 .irs-bar {
                      background: #B726B9;}

                      <!--Parametro C Criterio-->                      
                      .js-irs-7 .irs-bar {
                      border-top-color: #000000; border-bottom-color: #000000;} 
                      .js-irs-7 .irs-bar-edge {
                      border-color:#000000;}
                      .js-irs-7 .irs-single, .js-irs-7 .irs-bar-edge, .js-irs-7 .irs-bar {
                      background: #1FBE65;}

                      <!--Parametro Beta Criterio-->                      
                      js-irs-8 .irs-bar {
                      border-top-color: #000000; border-bottom-color: #000000;} 
                      .js-irs-8 .irs-bar-edge {
                      border-color:#000000;}
                      .js-irs-8 .irs-single, .js-irs-8 .irs-bar-edge, .js-irs-8 .irs-bar {
                      background: #1FBE65;}'))),
    tabItems(
      
############ INTRODUCTION
      tabItem(tabName = "intro",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Signal Detection Theory</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>by Adriana F. Chávez</b></p>')),
              
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              HTML('<h2 style="text-align:center; color:purple;"><b>Introduction</b></h2>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"><b>Signal Detection Theory</b> (SDT) provides a statistical model to understand the challenge organisms face when they need to decide if <i>something</i> (a <b>signal</b>) is present or not in their environment, to guide their behavior optimally based on the consequences announced by its presence (or absence).</h4>'),
                              HTML('<h4 style="text-align:justify;">SDT describes <b>signal detection</b> as a fundamental decision problem for organism adaptation, based on two major assumptions:</h4>'),
                              HTML('<h4 style="text-align:justify;">&nbsp <b>1) There is uncertainty in every detection task:</b> There is variability in how stimuli are perceived and/or presented each time we interact with them: The signals we want to detect are not always associated with the same evidence and can be confused with other stimulation we receive from the world (<b>noise</b>).</h4>'),
                              HTML('<h4 style="text-align:justify;">&nbsp <b>2) Consequences matter:</b> Getting the detection judgment right pays off and making a mistake costs. There is a specific consequence associated with each possible outcome.</h4>'),
                              HTML('<h4 style="text-align:justify;">According to SDT, organisms compensate for the uncertainty inherent in the detection task with information they possess about their environment\'s structure to make their detection judgment.</h4>'),
                              HTML('<br>'),
                              HTML('<center>')))),
      
############ ABOUT THE MODEL
      tabItem(tabName = "about",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Signal Detection Theory</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>by Adriana F. Chávez</b></p>')),
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              HTML('<h2 style="text-align:center; color:purple;"><b>Details about the Model</b></h2>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>Signal Detection Theory</b> (SDT) first appeared in 1954 in the context of radar studies for detecting electric signals (Peterson, Birdsall y Fox, 1954). A few months later, psychologists John A. Swets and Wilson P. Tanner (1954) adapted the theory to a psychological context to contribute to the study of perception as a cognitive process. Since then, SDT has become one of the most studied models, generalized and widely applied in Psychology (Stainslaw y Todorov, 1999), extending from the study of perceptual systems to the study of any phenomenon or scenario where organisms -as decision-making agents- face the challenge of making detection judgments based on the consequences of their presence (or absence).</h4>'),
                              HTML('<h4 style="text-align:justify;"> SDT functions as a descriptive model that allows, based on the observed performance in detection tasks, to make inferences about the precision with which the signal is distinguished from noise (<b>discriminability</b>) and the possible preference -or tendency- of the detection system to respond in favor or against its detection, according to the structure of the task (<b>bias</b>). This distinction between the discriminability of the involved stimuli and the system\'s bias is one of the main properties of SDT whose implications are discussed below.</h4>'),
                              tags$br(),
                              tags$br(),
                              HTML('<h2 style="text-align:justify; color:purple;"><b>I. Uncertainty and Discriminability</b></h2>'),
                              #tags$br(),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> SDT defines <b>signal detection</b> as a task loaded with uncertainty. The variability is considered an intrinsic property of the signals to be detected under the assumption that no stimulus is perceived or presented in an identical manner in each exposure. The model usually <b>describes the implicit variability in the evidence associated with the Signal with a normal distribution.</b></h4>'),
                              HTML('<h4 style="text-align:justify;"> It is also necessary to take into account that signals coexist in the world with other stimuli or states that -given their own variability- can produce evidence similar to the signal and be confused with it. To capture this idea, the model usually presents <b>a second normal distribution to represent the variability associated with the Noise in the environment</b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> In the framework of SDT, <b>discriminability</b> represents the degree to which the signal can distinguish itself from noise. Graphically, discriminability is reflected by <b>the distance between the means of the Noise and Signal distributions</b>, which determines the total size of the overlap that exists between these. <b>Higher discriminability, smaller area of overlap.</b></h4>'),
                              column(width=8, offset = 2,
                                     wellPanel(sliderInput(inputId="disc", 
                                                           label = "Discriminability*",
                                                           value=2, min=0, max=4,
                                                           step= 0.2))),
                              column(width=10, offset = 1,
                                     plotOutput(outputId="sdt_inicial_d")))),
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              HTML('<h4 style="text-align:justify;"><b>*</b> Al ser definida como una distancia, la discriminabilidad s&oacutelo puede tomar valores positivos.</h4>'),
                              tags$br(),
                              tags$br(),
                              HTML('<h2 style="text-align:justify; color:purple;"><b>II. Choice and Bias</b></h2>'),
                              HTML('<h4 style="text-align:justify;"> According to the <b>correspondence between the real state of the world</b> (the presence or absence of the signal) <b>and the detection judgment emitted</b> by the detection system (-S&iacute, the signal is present /No, the signal is not present-), SDT distinguishes between two types of hits and two types of errors errors, captured in the following contingency matrix:</h4>'),
                              HTML('<center>'),
                              tags$img(height=230, 
                                       width=350,
                                       align="middle",
                                       src = "http://www.kitchensoap.com/wp-content/uploads/2013/07/Screen-Shot-2013-07-22-at-2.13.38-PM.png"),
                              HTML('</center>'),
                              #HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;">When the <b>signal is present</b> the organism can detect it appropriately (<b>Hit</b>) or let it pass (<b>Omission</b>), and on the contrary, when <b>the signal is not present</b>, the organism can report it accurately (<b>Correct Rejection</b>) or confuse the noise with the signal, (<b>False Alarm</b>).</h4>'),
                              HTML('<h4 style="text-align:justify;">Depending on the <b>structure of the task</b>, some of the results may be associated with a gain or with a greater loss. That is why SDT functions as a <b>decision-making model</b> where it is assumed that the organism fixes <b>a criterion of choice</b> to determine based on the probability structure of its environment and the consequences at stake.</h4>'),
                              HTML('<h4 style="text-align:justify;">The criterion of choice is graphically represented as a <b>vertical line that crosses the distributions of noise and signal</b> and is determined based on the evidence at which the organism determines if <i>S&iacute</i> or <i>No</i> has detected the signal. In this way, <b>the area of the distributions of Noise and Signal</b> that is above the criterion, <b>reflects the probability</b> of making a False Alarm or a Hit, respectively, and the area that is below the criterion, the probability of making a Correct Rejection or an Omission.</h4>'),
                       column(width=8, offset = 2,
                              wellPanel(sliderInput(inputId="crit", 
                                                    label = "Criterion",
                                                    value=0, min=-4, max=5,
                                                    step= 0.05))),
                       column(width=11, offset = 1,
                              plotOutput(outputId="sdt_inicial_k"),
                              tags$br(),
                              tags$br(),
                              tags$br()))),
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;">According to the information they possess about their environment, organisms may be biased to seek or avoid a particular type of outcome. <b>The localization of the criterion is a reflection of the bias that the system might present.</b></h4>'),
                              HTML('<h4 style="text-align:justify;">A system free of bias (<b>neutral bias</b>), should place its criterion of choice exactly at the point where the distributions of Noise and Signal intersect, because in this way, the area of the distributions on each side of the criterion will be the same, ensuring equiprobability between both types of hits and both types of errors. <i>Try it yourself with the graphic above</i></h4>'),
                              HTML('<h4 style="text-align:justify;">We talk about a bias in the system when the localization of the criterion increases or reduces the probability of obtaining certain results. SDT distinguishes between two types of biases: when the criterion is placed to the left of the neutral point already described, we talk about a <b>liberal bias</b> that leads the organism to <b>report the presence of the signal</b> at low levels of evidence; on the other hand, when the criterion is placed to the right of the neutral point, we talk about a <b>conservative bias</b>, because the organism shows <b>reluctance to report the presence of the signal</b> at high levels of evidence.</h4>'),
                              tags$br(),
                              tags$br(),
                              tags$br(),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h2 style="text-align:justify; color:purple;"><b>References</b></h2>'),
                              HTML('<h4 style="text-align:justify;"><b>1.</b> Peterson, W.W., Birdsall, T. G., y Fox, W. C. (1954). The theory of signal detectability. IRE Trans. on Information Theory, 12(4), 171-212.</h4>'),
                              HTML('<h4 style="text-align:justify;"><b>2.</b> Tanner, W. P., y Swets, J. A. (1954). A decision-making theory of visual detection. Psychological Review, 61(6), 401-409.</h4>'),
                              HTML('<h4 style="text-align:justify;"><b>3. </b> Stainslaw, H., y Todorov, N. (1999). Calculation of signal detection theory measures.Behavior ResearchMethods, Instruments and Computers, 31(1), 137-149.</h4>'),
                              HTML('<h4 style="text-align:justify;"> </h4>'),
                              tags$br()))),


############ ROC CURVES      
      tabItem(tabName = "roc",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Signal Detection Theory</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>by Adriana F. Chávez</b></p>')),
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              HTML('<h2 style="text-align:center; color:purple;"><b>ROC Curves</b></h2>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> The <b>ROC curves</b>  (identified by their name in English: <i>Receiver-Operating Characteristic Curve</i>) describe the relationship between the Hit and False Alarm rates expected to be observed in a detection task for each possible localization of the criterion of choice, given the discriminability of the stimuli (that is, the distance between the Signal and Noise distributions).</h4>'),
                              HTML('<h4 style="text-align:justify;"> ROC curves represent a tool to evaluate the sensitivity of the evaluated detection system, under the assumption that discriminability -understood as a quality of the stimuli- is constant and that we have control over the specific localization of the criterion, which depends on the task structure and the bias that results from it.</h4>'),
                              HTML('<br>'))),              
              fluidRow(column(width=5, offset = 1, 
                              wellPanel(sliderInput(inputId="d_roc", 
                                                    label = "Discriminability (d')",
                                                    value=2, min=-0, max=4,
                                                    step= 0.05))),
                       column(width=5, offset = 0,        
                              wellPanel(sliderInput(inputId="k_roc", 
                                                    label = "Criterion (k)",
                                                    value=1, min=-4, max=4,
                                                    step= 0.05))),
                       column(width=5, offset = 1,
                              plotOutput(outputId="roc_sdt"),
                              tags$br(),
                             tags$br(),
                             tags$br()),
                       column(width=5, offset = 0,
                              plotOutput(outputId="roc_sdt2"))),
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              HTML('<h4 style="text-align:justify;"> The area under the ROC curve (<b>AUC</b>, by its acronym in English: <i>Area Under the Curve</i>) is used to make inferences about the sensitivity of the detection system in the studied task. N&oacutetese that <b>Sensitivity</b> is handled as a property of the system and not of the stimuli (as it happens when we talk about Discriminability).</h4>'),
                              HTML('<h4 style="text-align:justify;"> In general, <b>higher discriminability, higher sensitivity</b>. When the signal is indistinguishable from noise (d = 0) the ROC curve looks like an identity function (with AUC = 0.5), where the probability of obtaining a Hit or a False Alarm is exactly the same regardless of where the criterion is located. As discriminability increases, the ROC curve moves away from the identity function, with an AUC that gets closer and closer to 1.0.</h4>'),
                              HTML('<h4 style="text-align:justify;"> The AUC can take values between 0.5 (indicating that the system is unable to distinguish between the Signal and Noise) and 1.0 (suggesting a perfect distinction between them).</h4>'),
                              HTML('<h2 style="text-align:justify; color:purple;"><b>References</b></h2>'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<br>')))),
      
      
      
############ NON-PARAMETRIC ANALYSIS
      tabItem(tabName = "nop",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Signal Detection Theory</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>by Adriana F. Chávez</b></p>'),
                       tags$br(),
                       tags$br()),
              HTML('<h1 style="text-align:center;"><b>Slope Section</b></h1>')),
      
      
      
      
      
      
      
############ PARAMETRIC ESTIMATION
      tabItem(tabName = "para",
              fluidRow(HTML('<h1 style="text-align:center; color:purple;"><b><u>Signal Detection Theory</u></b></h1>'),
                       HTML('<p style="text-align:center;"><b>by Adriana F. Chávez</b></p>')),
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              HTML('<h2 style="text-align:center; color:purple;"><b>Parametric Estimation</b></h2>'),
                              HTML('<hr style="border: 0; height: 1px; background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);"'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> A continuación se ilustra el cálculo de los parámetros derivados de la Teoría de Detección de Señales <i>estándar</i>, donde la variabilidad asociada con la Señal y el Ruido es descrita con un par de <b>distribuciones normales con varianzas iguales</b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> Al realizar una <b>tarea de detección experimental</b>, donde sujetos experimentales son expuestos a una serie de ensayos aleatorizados que pueden -o no- contener la señal a detectar, las <b>tasas de respuesta</b> (la proporción de ensayos en que se observa cada tipo de acierto o error), permiten estimar la estructura subyacente a la tarea.</h4>'),
                              HTML('<h4 style="text-align:justify;"> En general, la estimación paramétrica a realizar, encuentra sus bases en las siguientes ideas centrales:</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>1.</b> Las tasas de respuesta registradas reflejan el área de las distribuciones de Ruido y Señal que caen a cada lado del criterio. A partir de ellas es posible estimar 1) la localización del criterio, 2) la distancia entre las distribuciones y 3) la preferencia o sesgo del sistema hacia una respuesta.</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>1.1</b> Las tasas de respuesta computadas a partir de un mismo total son complementarias. La tasa de Falsas Alarmas y la tasa de Rechazos correctos suman a 1 porque representan los resultados posibles al responder a un ensayo con Ruido. Lo mismo ocurre con la tasas de Hits y Omisiones, computadas a partir de los ensayos con la Señal. En este tutorial, <b>sólo utilizaremos las tasas de Rechazos Correctos y Omisiones</b> para ilustrar la estimación paramétrica, en el entendido de que las tasas de Hits y Falsas Alarmas son redundantes.</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>2.</b> Para contar con un punto de referencia a partir del cual asignar un valor a los elementos localizados sobre el eje de evidencia (la base de las distribuciones de Ruido y Señal), se asigna arbitrariamente una media = 0 a la distribución de Ruido, con una desviación estándar =  1. Asumiendo que la distribución de Señal es equivariante, la localización de los elementos sobre el eje de evidencia es computada usando <b>como unidad las desviaciones estándar</b>, (mediante el cálculo de <b>puntajes Z</b>).</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>3.</b> La <b>distribución de Ruido siempre tiene que estar a la izquierda</b> de la distribución de Señal. SDT es un modelo de detección, no de discriminación: la evidencia evaluada para emitir un juicio de decisión está intrínsecamente relacionada con la Señal y, por fuerza, la Señal tiene que contener más de esta evidencia que cualquier otro estímulo.</h4>'),
                              tags$br(),
                              HTML('<h2 style="text-align:center; color:purple;"><b>1. Criterion (k)</b></h2>'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> Asumiendo que la distribución de Ruido tiene una media en 0 y desviación estándar de 1, la localización del criterio sobre el eje de evidencia puede estimarse a partir de la <b>tasa de rechazos correctos</b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> SDT captura la localización del criterio sobre el eje de evidencia con el <b>parámetro k</b>, en unidades de desviación estándar respecto de la media del Ruido. Para ello, basta computar el <b>puntaje Z</b> correspondiente a la tasa de Rechazos Correctos para localizar el criterio sobre el eje de evidencia.</h4>'),
                              column(width=6, offset = 3,
                                     wellPanel(sliderInput(inputId="k_rej", 
                                                           label = "Tasa de Rechazos Correctos",
                                                           value=2, min=0.01, max=0.99,
                                                           step= 0.01))),
                              column(width=10, offset = 1,
                                     plotOutput(outputId="param_criterio"),
                                     tags$br()))),
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              tags$br(),
                              HTML('<h2 style="text-align:center; color:purple;"><b>2. Discriminability (d)</b></h2>'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> SDT mide la discriminabilidad de la Señal y el Ruido con el <b>parámetro d-prima</b>, que captura <b>la distancia entre las medias de la distribución de Ruido y Señal</b>, en unidades de desviación estándar.</h4>'),
                              HTML('<h4 style="text-align:justify;"> El cálculo de la d-prima se puede realizar <b>a partir de las tasas de omisiones y rechazos correctos</b>, en tres sencillos pasos:</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>1.- Estimamos la distancia entre la media del Ruido y el criterio.</b> Usamos la <b>tasa de Rechazos Correctos</b> como indicador del área de la distribución de Ruido que ha caído por debajo del criterio. De esta forma, podemos estimar la distancia entre la media de la distribución de ruido y el criterio en unidades de desviación estándar, computando para ello el puntaje Z correspondiente. El valor absoluto del puntaje Z representa la distancia y el signo (+/-) indica la dirección, por debajo (-) o por encima (+) de la media. <b><i>Ver Panel A</i></b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>2.- Estimamos la distancia entre la media de la distribución Señal y el criterio</b> usando la <b>tasa de Omisiones</b> para conocer el área de la distribución que queda por debajo del criterio y computar el puntaje Z correspondiente. Ahora conoceremos la distancia y posición relativa del criterio respecto de la media de la Señal. <b><i>Ver Panel B</i></b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>3.- </b>Finalmente, <b>integramos la información que tenemos acerca de la distancia entre el criterio y las medias de cada distribución</b> con una resta simple: Restamos el Puntaje Z computado respecto de la distribución de Señal del Puntaje Z computado a partir de la distribución de Ruido. <b><i>Ver Panel C</i></b>.</h4>'))),
                       fluidRow(column(width=10, offset = 1,        
                       column(width=5, offset = 1,        
                                     wellPanel(sliderInput(inputId="d_rej", 
                                                           label = "Tasa de Rechazos Correctos*",
                                                           value=0.5, min=0.50, max=0.99,
                                                           step= 0.01))),
                              column(width=5, offset = 0,
                                     wellPanel(sliderInput(inputId="d_miss", 
                                                           label = "Tasa de Omisiones*",
                                                           value=0.5, min=0.01, max=0.50,
                                                           step= 0.01))),
                              column(width=5, offset = 1,
                                     plotOutput(outputId="param_discriminabilidad1"),
                                     tags$br()),
                              column(width=5, offset = 0,
                                     plotOutput(outputId="param_discriminabilidad2"),
                                     tags$br()),
                              column(width=10, offset = 1,
                                     plotOutput(outputId="param_discriminabilidad3"),
                                     tags$br()))),
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              HTML('<h4 style="text-align:justify;"><b>*</b> N&oacutetese que a pesar de que las tasas de respuesta pueden tener valores reales entre 0 y 1, para efectos de este gráfico hemos restringido la tasa de Omisiones entre 0 y 0.5, y la tasa de Rechazos correctos entre 0.5 y 1. Esta restricción permite garantizar que durante tu interacción con el gráfico, la distribución de Señal NUNCA estará por debajo de la distribución de Ruido.</h4>'),
                              tags$br(),
                              HTML('<h2 style="text-align:center; color:purple;"><b>3. Bias c</b></h2>'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> La discriminabilidad de los estímulos comprometidos en la tarea de detección, se cuantifica con el <b>parámetro d</b> que representa <b>la distancia entre las medias de las distribuciones de ruido y señal, en unidades de desviación estándar</b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> El cálculo de d se puede realizar <b>a partir de las tasas de omisiones y rechazos correctos</b>, de tal forma que la estimación de la media de la distribución de señal puede entenderse a partir de los siguientes pasos, ilustrados de manera independiente en nuestro siguiente gráfico:</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>1.- </b>Usamos la tasa de rechazos correctos como un indicador del área de la distribución de ruido que ha caído por debajo del criterio. De esta forma, podemos estimar la distancia entre la media de la distribución de ruido y el criterio en unidades de desviación estándar, computando para ello el puntaje Z correspondiente. Una vez más, el valor absoluto del puntaje Z resultante indica la distancia respecto de la media de la distribución de Ruido, mientras que el signo positivo o negativo indica la dirección relativa del criterio por debajo o por encima de la misma. <b><i>Ver Panel A</i></b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>2.- </b>Ahora, para determinar la distancia entre el criterio de elección y la media de la distribución de señal, usamos la tasa de omisiones para saber cuánta es el área de esta distribución que queda por debajo del criterio y computar el puntaje Z correspondiente. De esta forma, podemos saber la distancia y posición relativa del criterio respecto de la media de la distribución de señal.  <b><i>Ver Panel B</i></b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>3.- </b>Finalmente, integramos la información que tenemos acerca de la distancia entre el criterio y las medias de cada distribución mediante una resta simple: Restamos el Puntaje Z computado para la distribución de Señal (a partir de la tasa de omisiones) del Puntaje Z computado para la distribución de Ruido (a partir de la tasa de rechazos correctos). <b><i>Ver Panel C</i></b>.</h4>'))),
              fluidRow(column(width=10, offset = 1,        
                              column(width=6, offset = 3,        
                                     wellPanel(sliderInput(inputId="c_crit", 
                                                           label = "Criterion",
                                                           value=1, min=-4, max=5,
                                                           step= 0.05))),
                              column(width=10, offset = 1,
                                     plotOutput(outputId="param_C"),
                                     tags$br()))),
              fluidRow(column(width=8, offset = 2, background = 'yellow',
                              tags$br(),
                              HTML('<h2 style="text-align:center; color:purple;"><b>3. Bias Beta</b></h2>'),
                              HTML('<h4 style="text-align:justify;"></h4>'),
                              HTML('<h4 style="text-align:justify;"> La discriminabilidad de los estímulos comprometidos en la tarea de detección, se cuantifica con el <b>parámetro d</b> que representa <b>la distancia entre las medias de las distribuciones de ruido y señal, en unidades de desviación estándar</b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> El cálculo de d se puede realizar <b>a partir de las tasas de omisiones y rechazos correctos</b>, de tal forma que la estimación de la media de la distribución de señal puede entenderse a partir de los siguientes pasos, ilustrados de manera independiente en nuestro siguiente gráfico:</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>1.- </b>Usamos la tasa de rechazos correctos como un indicador del área de la distribución de ruido que ha caído por debajo del criterio. De esta forma, podemos estimar la distancia entre la media de la distribución de ruido y el criterio en unidades de desviación estándar, computando para ello el puntaje Z correspondiente. Una vez más, el valor absoluto del puntaje Z resultante indica la distancia respecto de la media de la distribución de Ruido, mientras que el signo positivo o negativo indica la dirección relativa del criterio por debajo o por encima de la misma. <b><i>Ver Panel A</i></b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>2.- </b>Ahora, para determinar la distancia entre el criterio de elección y la media de la distribución de señal, usamos la tasa de omisiones para saber cuánta es el área de esta distribución que queda por debajo del criterio y computar el puntaje Z correspondiente. De esta forma, podemos saber la distancia y posición relativa del criterio respecto de la media de la distribución de señal.  <b><i>Ver Panel B</i></b>.</h4>'),
                              HTML('<h4 style="text-align:justify;"> <b>3.- </b>Finalmente, integramos la información que tenemos acerca de la distancia entre el criterio y las medias de cada distribución mediante una resta simple: Restamos el Puntaje Z computado para la distribución de Señal (a partir de la tasa de omisiones) del Puntaje Z computado para la distribución de Ruido (a partir de la tasa de rechazos correctos). <b><i>Ver Panel C</i></b>.</h4>'))),
            fluidRow(column(width=10, offset = 1,        
                              column(width=6, offset = 3,        
                                     wellPanel(sliderInput(inputId="beta_crit", 
                                                           label = "Criterion",
                                                           value=1, min=-4, max=5,
                                                           step= 0.05))),
                              column(width=10, offset = 1,
                                     plotOutput(outputId="param_beta"),
                                     tags$br()))),
            fluidRow(column(width=10, offset = 1,   
            HTML('<h2 style="text-align:justify; color:purple;"><b>References</b></h2>'),
            HTML('<h4 style="text-align:justify;"><b>1. </b> Stainslaw, H., y Todorov, N. (1999). Calculation of signal detection theory measures.Behavior ResearchMethods, Instruments and Computers, 31(1), 137-149.</h4>'),
            HTML('<h4 style="text-align:justify;"><b>2. </b> Gescheider, G. A. (2013). Psychophysics: The fundamentals (3rd Edition; Psychology Press, Ed.).</h4>'),
            HTML('<h4 style="text-align:justify;"></h4>')))))))


server <- function(input, output) {
  

  output$sdt_inicial_d <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                         font.lab=2, axes = "FALSE", xlim= c(-4,6),  ylim= c(0,.45),  col="darkorchid3", lwd=2)
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=2, lty=1, col='black') #NOISE
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),input$disc,1),type='l', lwd=2, lty=1, col='black') #SIGNAL
    lines(c(0,0), c(0,0.4))
    lines(c(input$disc,input$disc), c(0,0.4))
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6), labels=c("", "", "", "", "", "", "", "", "", "", ""), font=2)
    lines(c(0,input$disc),c(0.18,0.18), lwd=4, col="darkorchid3")
    text(-0.5,.13,expression(paste(mu,"R")),cex=1.5,col='black',f=2)
    text(input$disc+0.5,.13,expression(paste(mu,"S")),cex=1.5,col='black',f=2)
    text(0,.43,"Ruido",cex=1.2,col='black',f=2)
    text(input$disc,.43,"Se\u{00F1}al",cex=1.2,col='black',f=2)
    mtext("Evidencia evaluada",1,cex=2, line=3, f=2)})
  
  
  
  
  output$sdt_inicial_k <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                    font.lab=2, axes = "FALSE", xlim= c(-4,5),  ylim= c(0,.5),  col="darkorchid3", lwd=2)
    lines(seq(input$crit,10,.05),dnorm(seq(input$crit,10,.05),2,1),type='l', lwd=4, col='forestgreen') #Hit
    lines(seq(input$crit,10,.05),dnorm(seq(input$crit,10,.05),0,1),type='l', lwd=4, col='firebrick3') #FA
    lines(seq(-10,input$crit,.05),dnorm(seq(-10,input$crit,.05),0,1),type='l', lwd=4, col='dodgerblue3') #Rej
    lines(seq(-10,input$crit,.05),dnorm(seq(-10,input$crit,.05),2,1),type='l', lwd=4, col='darkorchid3') #Miss
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=1, lty=3, col='white') #NOISE
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),2,1),type='l', lwd=1, lty=3, col='white') #SIGNAL
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5), labels=c("", "", "", "", "", "", "", "", "", ""), font=2)
    abline(v=input$crit, lwd=3)
    text(-2.4,.5,"Probabilidad de:",cex=1,col='black',f=2)
    text(-2.4,.46,paste("Hit= ",round(pnorm(input$crit,2,1,lower.tail=FALSE),3)), cex=1, col='forestgreen', f=2) 
    text(-2.4,.34,paste("Omisi\u{00F3}n= ",round(pnorm(input$crit,2,1,lower.tail=TRUE),3)), cex=1, col='darkorchid3', f=2) 
    text(-2.4,.42,paste("Falsa Alarma= ",round(pnorm(input$crit,0,1,lower.tail=FALSE),3)), cex=1, col='firebrick3', f=2) 
    text(-2.4,.38,paste("Rechazo Correcto= ",round(pnorm(input$crit,0,1,lower.tail=TRUE),3)), cex=1, col='dodgerblue3', f=2) 
    text(0,.43,"Ruido",cex=1.5,col='black',f=2)
    text(2,.43,"Se\u{00F1}al",cex=1.5,col='black',f=2)
    mtext("Evidencia evaluada",1,cex=3, line=3, f=2)})
  
  output$roc_sdt <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                         font.lab=2, axes = "FALSE", xlim= c(-4,5),  ylim= c(0,.5),  col="darkorchid3", lwd=2)
    lines(seq(input$k_roc,10,.05),dnorm(seq(input$k_roc,10,.05),input$d_roc,1),type='l', lwd=3, col='forestgreen') #Hit
    lines(seq(input$k_roc,10,.05),dnorm(seq(input$k_roc,10,.05),0,1),type='l', lwd=3, col='firebrick3') #FA
    lines(seq(-10,input$k_roc,.05),dnorm(seq(-10,input$k_roc,.05),0,1),type='l', lwd=3, col='black') #Rej
    lines(seq(-10,input$k_roc,.05),dnorm(seq(-10,input$k_roc,.05),input$d_roc,1),type='l', lwd=3, col='black') #Miss
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=1, lty=3, col='white') #NOISE
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),2,1),type='l', lwd=1, lty=3, col='white') #SIGNAL
    lines(c(0,0), c(0,0.4))
    lines(c(input$d_roc,input$d_roc), c(0,0.4))
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6), labels=c("", "", "", "", "", "", "", "", "", "", ""), font=2)
    lines(c(0,input$d_roc),c(0.18,0.18), lwd=4, col="darkorchid3")
    text(-0.5,.13,expression(paste(mu,"R")),cex=1.5,col='black',f=2)
    text(input$d_roc+0.5,.13,expression(paste(mu,"S")),cex=1.5,col='black',f=2)
    lines(c(input$k_roc,input$k_roc), c(0,0.43), lwd=4, col="goldenrod4")
    text(-2.1,.5,"Probabilidad de:",cex=1,col='black',f=2)
    text(-2.7,.47,paste("Hit= ",round(pnorm(input$k_roc,2,1,lower.tail=FALSE),3)), cex=1, col='forestgreen', f=2) 
    #text(-3.1,.34,paste("Omisi\u{00F3}n= ",round(pnorm(input$k_roc,2,1,lower.tail=TRUE),3)), cex=1, col='darkorchid3', f=2) 
    text(-2.8,.45,paste("F.A.= ",round(pnorm(input$k_roc,0,1,lower.tail=FALSE),3)), cex=1, col='firebrick3', f=2) 
    #text(-3.1,.38,paste("Rechazo Correcto= ",round(pnorm(input$k_roc,0,1,lower.tail=TRUE),3)), cex=1, col='dodgerblue3', f=2) 
    text(0,.43,"Ruido",cex=1.5,col='black',f=2)
    text(2,.43,"Se\u{00F1}al",cex=1.5,col='black',f=2)
    mtext("Evidencia evaluada",1,cex=1.5, line=3, f=2)})
  
  
  
  bias_c <- seq(-10,10,0.05) 
  d_null <- 0  
  hits_na <- c()     
  falarms_na <- c()  
  for (i in 1:length(bias_c)){
  hits_na[i] <- pnorm((d_null/2)-bias_c[i])      
  falarms_na[i] <- pnorm((-d_null/2)-bias_c[i])
  }
  
  output$roc_sdt2 <- renderPlot({
    plot(.5,.5, pch=16, col='white', xlim=c(0,1), ylim=c(0,1), xlab='F.A. Rate', ylab='Hit Rate')    
    lines(pnorm((-(input$d_roc)/2)-bias_c), pnorm((input$d_roc/2)-bias_c), lwd=2, col='darkorchid3')   
    lines(hits_na,falarms_na,lwd=1,col='black', lty=2) 
    lines(c(0.38, 0.48),c(0.2,0.2), lwd=2, lty=1, col="deepskyblue3")      
    points(0.43,0.1, lty=3, pch=16, col='deepskyblue4')
    points(pnorm(input$k_roc,input$d_roc,1), pnorm(input$k_roc,0,1),  cex=2, lty=3, pch=16, col='goldenrod4')
    text(0.5, 0.2, labels="Combinaciones posibles Hits-F.A. por d'", offset=0, cex = 0.7, pos=4)
    text(0.5, 0.1, labels="Tasas de Hits y F.A. asociados con k", offset=0, cex = 0.7, pos=4)
    text(0.85, 0.83, labels="d' = 0", offset=0, cex = 0.8, pos=4)
    #text(fa_rate-0.13, h_rate+0.02, paste("d' =", d), offset=0, cex = 0.8, pos=4)
    title('ROC')})
  
  
  
  
  
  output$param_criterio <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                           font.lab=2, axes = "FALSE", xlim= c(-4,5),  ylim= c(0,.5),  col="darkorchid3", lwd=2)
    lines(seq(qnorm(input$k_rej, 0,1),10,.05),dnorm(seq(qnorm(input$k_rej, 0,1),10,.05),0,1),type='l', lwd=4, col='firebrick3') #FA
    lines(seq(-10,qnorm(input$k_rej, 0,1),.05),dnorm(seq(-10,qnorm(input$k_rej, 0,1),.05),0,1),type='l', lwd=4, col='dodgerblue3') #Rej
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=1, lty=3, col='white') #NOISE
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),2,1),type='l', lwd=1, lty=2, col='black') 
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5), labels=c("", "", "", "", "0", "", "", "", "", ""), font=2)
    lines(c(0,0), c(0,0.45), lwd=2, lty=3)
    lines(c(0,qnorm(input$k_rej, 0,1)), c(0.05,0.05), lwd=2, lty=3)
    abline(v=qnorm(input$k_rej, 0,1), lwd=2)
    text(-2.9,.47,"Tasas de respuesta:",cex=1,col='black',f=2)
    text(-3.1,.42,paste("Falsa Alarma= ",round(pnorm(qnorm(input$k_rej, 0,1),0,1,lower.tail=FALSE),3)), cex=1, col='firebrick3', f=1) 
    text(-2.9,.38,paste("Rechazo Correcto= ",round(pnorm(qnorm(input$k_rej, 0,1),0,1,lower.tail=TRUE),3)), cex=1, col='dodgerblue3', f=1) 
    text(-3.1,.30,paste("k = ",round(qnorm(input$k_rej, 0,1),3)), cex=2, col='black', f=2) 
    text(qnorm(input$k_rej, 0,1)/2,.08,paste("Z = ",round(qnorm(input$k_rej, 0,1),3)), cex=1, col='black', f=2) 
    text(0,.43,"Ruido",cex=1.5,col='black',f=2)
    text(2,.43,"Se\u{00F1}al",cex=1.5,col='black',f=1)
    mtext("Evidencia evaluada",1,cex=1.5, line=3, f=2)})
  
  
  output$param_discriminabilidad1 <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                            font.lab=2, axes = "FALSE", xlim= c(-4,5),  ylim= c(0,.5),  col="white", lwd=2)
    lines(seq(qnorm(input$d_rej, 0,1),10,.05),dnorm(seq(qnorm(input$d_rej, 0,1),10,.05),0,1),type='l', lwd=4, col='black') #FA
    lines(seq(-10,qnorm(input$d_rej, 0,1),.05),dnorm(seq(-10,qnorm(input$d_rej, 0,1),.05),0,1),type='l', lwd=4, col='dodgerblue3') #Rej
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=1, lty=3, col='white') #NOISE
    #lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),2,1),type='l', lwd=1, lty=2, col='black') 
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5), labels=c("", "", "", "", "0", "", "", "", "", ""), font=2)
    lines(c(0,0), c(0,0.45), lwd=2, lty=3)
    lines(c(0,qnorm(input$d_rej, 0,1)), c(0.05,0.05), lwd=2, lty=3)
    abline(v=qnorm(input$d_rej, 0,1), lwd=2, col="dodgerblue3")
    text(-2.9,.5,"Tasas de respuesta:",cex=1,col='black',f=2)
    text(-2.9,.47,paste("Rechazo Correcto= ",round(pnorm(qnorm(input$d_rej, 0,1),0,1,lower.tail=TRUE),3)), cex=1, col='dodgerblue3', f=1) 
    text(-2.9,.35,"Distancia entre el criterio", cex=1, col='black', f=2) 
    text(-2.9,.32,"y la media Ruido", cex=1, col='black', f=2)
    text(-2.8,.27,paste("Puntaje Z = ",round(qnorm(input$d_rej, 0,1),3)), cex=1.5, col='black', f=2) 
    text(4.5,0.49,"Panel A",cex=1.5,col='black',f=2)
    text(0,.43,"Ruido",cex=1.5,col='black',f=2)
    #text(2,.43,"Se\u{00F1}al",cex=1.5,col='black',f=1)
    mtext("Evidencia evaluada",1,cex=1.5, line=3, f=2)})
  
  
  output$param_discriminabilidad2 <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                            font.lab=2, axes = "FALSE", xlim= c(-4,5),  ylim= c(0,.5),  col="white", lwd=2)
    lines(seq(qnorm(input$d_miss,0,1),10,.05),dnorm(seq(qnorm(input$d_miss, 0,1),10,.05),2,1),type='l', lwd=4, col='black') #FA
    lines(seq(-10,(qnorm(input$d_miss,0,1)+2),.05),dnorm(seq(-10,(qnorm(input$d_miss,0,1)+2),.05),2,1),type='l', lwd=4, col='darkorchid3') #Miss
    #lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=1, lty=2, col='black') #NOISE
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),2,1),type='l', lwd=1, lty=3, col='white') 
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5), labels=c("", "", "", "", "", "", "?", "", "", ""), font=2)
    abline(v=2+qnorm(input$d_miss, 0,1), lwd=2, col="darkorchid3")
    lines(c(2,2), c(0,0.45), lwd=2, lty=3)
    lines(c(2,(qnorm(input$d_miss, 0,1)+2)), c(0.05,0.05), lwd=2, lty=3)
    text(-2.9,.5,"Tasas de respuesta:",cex=1,col='black',f=2)
    text(-2.9,.47,paste("Omisiones= ",round(pnorm(qnorm(input$d_miss, 0,1),0,1,lower.tail=TRUE),3)), cex=1, col='darkorchid3', f=1) 
    text(-2.9,.35,"Distancia entre el criterio", cex=1, col='black', f=2) 
    text(-2.9,.32,"y la media Senal", cex=1, col='black', f=2)
    text(-2.8,.27,paste("Puntaje Z = ",round(qnorm(input$d_miss, 0,1),3)), cex=1.5, col='black', f=2) 
    text(4.5,0.49,"Panel B",cex=1.5,col='black',f=2)
    #text(0,.43,"Ruido",cex=1.5,col='black',f=2)
    text(2,.43,"Se\u{00F1}al",cex=1.5,col='black',f=2)
    mtext("Evidencia evaluada",1,cex=1.5, line=3, f=1)})
  
  param_d <- reactive({qnorm(input$d_rej,0,1)-qnorm(input$d_miss,0,1)})
  
  output$param_discriminabilidad3 <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                            font.lab=2, axes = "FALSE", xlim= c(-4,5),  ylim= c(0,.5),  col="white", lwd=2)
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=3, lty=1, col='cornflowerblue') #NOISE
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),param_d(),1),type='l', lwd=3, lty=1, col='blueviolet') #Signal
    lines(seq(-10,qnorm(input$d_rej, 0,1),.05),dnorm(seq(-10,qnorm(input$d_rej, 0,1),.05),0,1),type='l', lwd=4, col='deepskyblue4') #Rej
    lines(seq(-10,(qnorm(input$d_miss,0,1)+param_d()),.05),dnorm(seq(-10,(qnorm(input$d_miss,0,1)+param_d()),.05),param_d(),1),type='l', lwd=4, col='darkorchid4') #Miss
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5), labels=c("", "", "", "", "", "", "", "", "", ""), font=2)
    abline(v=qnorm(input$d_rej, 0,1), lwd=3, lty=1, col="dodgerblue3")
    abline(v=qnorm(input$d_rej, 0,1), lwd=3, lty=3, col="darkorchid3")
    #text(-2.9,.5,"Tasas de respuesta:",cex=1,col='black',f=2)
    #text(-3.1,.42,paste("Falsa Alarma= ",round(pnorm(qnorm(input$k_rej, 0,1),0,1,lower.tail=FALSE),3)), cex=1, col='firebrick3', f=1) 
    #text(-2.6,.38,paste("Rechazo Correcto= ",round(pnorm(qnorm(input$k_rej, 0,1),0,1,lower.tail=TRUE),3)), cex=1, col='dodgerblue3', f=1) 
    #text(-3.1,.34,paste("k = ",round(qnorm(input$k_rej, 0,1),3)), cex=1, col='black', f=2) 
    text(4.5,0.49,"Panel C",cex=1.5,col='black',f=2)
    text(0,.43,"Ruido",cex=1.5,col='black',f=2)
    text(param_d(),.43,"Se\u{00F1}al",cex=1.5,col='black',f=2)
    mtext("Evidencia evaluada",1,cex=1.5, line=3, f=2)})
  
  
  output$param_C <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                           font.lab=2, axes = "FALSE", xlim= c(-4,5),  ylim= c(0,.47),  col="darkorchid3", lwd=2)
    lines(seq(input$c_crit,10,.05),dnorm(seq(input$c_crit,10,.05),2,1),type='l', lwd=3, col='black') #Hit
    lines(seq(input$c_crit,10,.05),dnorm(seq(input$c_crit,10,.05),0,1),type='l', lwd=3, col='black') #FA
    lines(seq(-10,input$c_crit,.05),dnorm(seq(-10,input$c_crit,.05),0,1),type='l', lwd=3, col='gray54') #Rej
    lines(seq(-10,input$c_crit,.05),dnorm(seq(-10,input$c_crit,.05),2,1),type='l', lwd=3, col='gray54') #Miss
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=1, lty=3, col='white') #NOISE
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),2,1),type='l', lwd=1, lty=3, col='white') #SIGNAL
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5), labels=c("", "-3", "-2", "-1", "0", "1", "2", "3", "", ""), font=2)
    lines(c(0,0), c(0,0.4), lwd=1, col="gray63", lty=4)
    lines(c(2,2), c(0,0.4), lwd=1, col="gray63", lty=4)
    lines(c(input$c_crit,input$c_crit), c(0,0.41), lwd=3)
    lines(c(1,1), c(0,0.41), lwd=3, col="red", lty=2)
    lines(c(1,input$c_crit), c(0.2,0.2), col="red", lwd=2)
    #text(-2.9,.5,"Probabilidad de cometer un(a):",cex=1,col='black',f=2)
    #text(-3.1,.46,paste("Hit= ",round(pnorm(input$crit,2,1,lower.tail=FALSE),3)), cex=1, col='forestgreen', f=2) 
    #text(-3.1,.34,paste("Omisi\u{00F3}n= ",round(pnorm(input$crit,2,1,lower.tail=TRUE),3)), cex=1, col='darkorchid3', f=2) 
    #text(-3.1,.42,paste("Falsa Alarma= ",round(pnorm(input$crit,0,1,lower.tail=FALSE),3)), cex=1, col='firebrick3', f=2) 
    #text(-3.1,.38,paste("Rechazo Correcto= ",round(pnorm(input$crit,0,1,lower.tail=TRUE),3)), cex=1, col='dodgerblue3', f=2) 
    text(-3.1,.30,paste("C = ",round(input$c_crit-1,3)), cex=2, col='black', f=2) 
    text(input$c_crit+0.5,.25,"Si",cex=1.5,col='black',f=2)
    text(input$c_crit-0.5,.25,"No",cex=1.5,col='gray28',f=2)
    text(0,.43,"Ruido",cex=1.5,col='black',f=2)
    text(2,.43,"Se\u{00F1}al",cex=1.5,col='black',f=2)
    mtext("Evidencia evaluada",1,cex=1.5, line=3, f=2)})
  
  output$param_beta <- renderPlot({plot(10, 20, main="", xlab="", ylab="",type='l',
                                           font.lab=2, axes = "FALSE", xlim= c(-4,5),  ylim= c(0,.47),  col="darkorchid3", lwd=2)
    lines(seq(input$beta_crit,10,.05),dnorm(seq(input$beta_crit,10,.05),2,1),type='l', lwd=4, col='black') #Hit
    lines(seq(input$beta_crit,10,.05),dnorm(seq(input$beta_crit,10,.05),0,1),type='l', lwd=4, col='black') #FA
    lines(seq(-10,input$beta_crit,.05),dnorm(seq(-10,input$beta_crit,.05),0,1),type='l', lwd=4, col='gray54') #Rej
    lines(seq(-10,input$beta_crit,.05),dnorm(seq(-10,input$beta_crit,.05),2,1),type='l', lwd=4, col='gray54') #Miss
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),0,1),type='l', lwd=1, lty=3, col='white') #NOISE
    lines(seq(-10,10,.05),dnorm(seq(-10,10,.05),2,1),type='l', lwd=1, lty=3, col='white') #SIGNAL
    axis(1,at=c(-4, -3, -2, -1, 0, 1, 2, 3, 4, 5), labels=c("", "", "", "", "", "", "", "", "", ""), font=2)
    lines(c(0,0), c(0,0.4), lwd=1, col="gray63", lty=4)
    lines(c(2,2), c(0,0.4), lwd=1, col="gray63", lty=4)
    lines(c(input$beta_crit,input$beta_crit),c(0,0.4), lwd=2)
    points(input$beta_crit, dnorm(input$beta_crit,2,1), col="red", pch=16, cex=2)
    points(input$beta_crit, dnorm(input$beta_crit,0,1), col="blue", pch=15, cex=2)
    #text(-2.9,.5,"Probabilidad de cometer un(a):",cex=1,col='black',f=2)
    #text(-3.1,.46,paste("Hit= ",round(pnorm(input$crit,2,1,lower.tail=FALSE),3)), cex=1, col='forestgreen', f=2) 
    #text(-3.1,.34,paste("Omisi\u{00F3}n= ",round(pnorm(input$crit,2,1,lower.tail=TRUE),3)), cex=1, col='darkorchid3', f=2) 
    #text(-3.1,.42,paste("Falsa Alarma= ",round(pnorm(input$crit,0,1,lower.tail=FALSE),3)), cex=1, col='firebrick3', f=2) 
    #text(-3.1,.38,paste("Rechazo Correcto= ",round(pnorm(input$crit,0,1,lower.tail=TRUE),3)), cex=1, col='dodgerblue3', f=2) 
    text(input$beta_crit+0.5,.25,"Si",cex=1.5,col='black',f=2)
    text(input$beta_crit-0.5,.25,"No",cex=1.5,col='gray28',f=2)
    text(0,.43,"Ruido",cex=1.5,col='black',f=2)
    text(2,.43,"Se\u{00F1}al",cex=1.5,col='black',f=2)
    mtext("Evidencia evaluada",1,cex=1.5, line=3, f=2)})
  
  
  
  
  
  
}



shinyApp(ui, server)