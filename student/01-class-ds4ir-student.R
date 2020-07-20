# title: "DS4IR"
# subtitle: "Processamento de Dados"
# author: 
# - Professor Davi Moreira
# - Professor Rafael Magalhães
# date: julho 2020

# packages ---------------------------------------------------------------------
library(tidyverse)
library(here)

# ## Programa para hoje
# 
# - Apresentação do Programa do Curso
# - Instruções do curso
# - Por quê o R e o RStudio? 
#   - Projetos e versionamento
# - Sripts, objetos
# - Funções
# - Tipos de dados
# - Dataframes
# - Operadores lógicos
# - Boas práticas de programação

## Apresentação do Programa do Curso

## Instruções do curso

## Motivação 

# ```{r eval=TRUE, echo=FALSE, message=FALSE, warning=FALSE}
library(gganimate)
library(gapminder)

ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  # Here comes the gganimate specific bits
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')
# ```

## Pipeline

# <center>
#   ![pipeline](images/pipeline.png){width=700px}
# </center>

#   ## 
#   
#   <center>
#   
#   ![R](images/R_logo.png){width=200px}
# 
# 
# </center>
#   
#   ## Por quê o R? 
#   
#   - Linguagem de programação de código aberto
# - Construída por estatísticos (isso é bom e ruim)
# - Ampla comunidade 
# 
# ## Comunidade
# 
# - [R-Bloggers](https://www.r-bloggers.com/)
# - [R-Ladies Global](https://rladies.org/)
# - [R-Ladies SP](https://www.meetup.com/pt-BR/R-Ladies-Sao-Paulo/)
# - [Minas Programam](https://minasprogramam.com/quem-faz/)
# 
# ## Por quê o RStudio? 
# 
# <center>
#   ![RStudio](images/r_rstudio_motor.png){width=800px}
# </center>
#   
#   ## Por quê o R e o RStudio? 
#   
#   <center>
#   ![RStudio Tela](images/1-tela-inicial.jpeg){width=700px}
# </center>
#   
#   ## Projetos e versionamento
#   
#   <center>
#   ![version](images/version-control-1.jpg){width=600px}
# </center>
#   
#   ## 
#   
#   <center>
#   ![GitHub](images/github.png){width=600px}
# </center>
#   
#   ## 
#   
#   <center>
#   ![GitHadley](images/hadley-git.png){width=700px}
# 
# [https://github.com/hadley/](https://github.com/hadley/)
# </center>
#   
#   
#   ##
#   <center>
#   ![GitVersion](images/5-git.png){width=800px}
# </center>
#   
#   ## 
#   
#   <center>
#   ![NewDir](images/0-novo-projeto.png){width=800px}
# 
# </center>
#   
#   ## Projetos e versionamento: referências
#   
#   - [Using Version Control with RStudio](https://support.rstudio.com/hc/en-us/articles/200532077-Version-Control-with-Git-and-SVN)
# 
# - [Version Control with RStudio and GitHub](https://aberdeenstudygroup.github.io/studyGroup/lessons/SG-T1-GitHubVersionControl/VersionControl/#2.4.)
#                                              
# - [Happy Git and GitHub for the useR](https://happygitwithr.com/)
# 
# - [R and version control for the solo data analyst](https://stackoverflow.com/questions/2712421/r-and-version-control-for-the-solo-data-analyst)
# 
# - [Workflow: Projects](https://r4ds.had.co.nz/workflow-projects.html)
# 
# - [Project-oriented workflow](https://www.tidyverse.org/blog/2017/12/workflow-vs-script/)
# 
# ## Há mais vantagens?
# 
# <center>
#   ![RmdWorkFlow](images/rmkd_workflow.png){width=800px}
# </center>
#   
#   ## Exercício: O R como uma calculadora!
#   
#   ```{r eval=FALSE, echo=TRUE}
# # Qual é o resultado?
2 + 9 * 4
4 + 3 / 10^2
pi - 3

# Notação científica
5 * 10^2
5 * 10^-2
111111 * 111111
1111111 * 1111111
# ```
# 
# ## Objetos
# 
# ## Exercício: Variáveis e vetores
# 
# ```{r}
# Qual é o valor de a?
a <- 4
a <- a * 5
a <- a + 10
a <- seq(a, 100, 5)
# ```
# 
# Podemos criar vários objetos de uma vez:
#   ```{r}
x <- y <- z <- w <- pi
# ```

# Agora nós criamos um monte de objetos na memória do R. Vamos apagá-los para nosso ambiente não ficar bagunçado
# ```{r}
rm(list = ls())
# ```

## Vetores

# ```{r}
numeros <- c(1, 4, 10, pi, 1/3)
texto <- c("a", "b", "FGV-SP", "FGV-RJ")
(tudo_junto <- c(numeros, texto)) # tudo entre parênteses para mostrar  conteúdo do objeto
# ```

# Note que, quando juntamos números e texto, **todos os elementos viram texto**. 
# Vamos tratar das particularidades de texto mais para a frente.
# 
# ## Estilo
# 
# > "Programs must be written for people to read, and only incidentally for machines to execute.
# >
# > --- Hal Abelson
# >
# 
# <center>
# [The tidy tools manifesto](https://cran.r-project.org/web/packages/tidyverse/vignettes/manifesto.html)
# </center>
# 
# ## Estilo
# 
# É recomendável que os nomes dos objetos sejam descritivos. Além disso, é valiosa a adoção de um 
# estilo de programação para a sua análise de dados. Ela facilita a leitura e a 
# interpretação humana do código. Vejamos, por exemplo, os nomes
# de objetos retirados do [`r4ds`](https://r4ds.had.co.nz/workflow-basics.html). Qual deles é 
# melhor?
# 
# ```{r eval=FALSE, echo=TRUE}

# i_use_snake_case
# otherPeopleUseCamelCase
# some.people.use.periods
# And_aFew.People_RENOUNCEconvention

# ```

## The tidyverse style guide

# - [The tidyverse style guide](https://style.tidyverse.org/): o guia não só apresenta
# boas práticas e estilo de programação a serem seguidos como é acompanhado por dois pacotes
# que ajudam o cientista de dados a manter-se consistente em seu código. 
# 
# - Há alguns anos o Google desenvolveu seu próprio *R Style Guide*, mas hoje adota o 
# [*The tidyverse style guide*](https://style.tidyverse.org/).
# 
# ## Funções
# Funções são o arroz-com-feijão da programação estatística no R. 
# Muitas das análises que vamos fazer no curso tem como fundamento o uso de funções 
# corretas e a identificação dos **argumentos** apropriados para cada caso.
# 
# Nós já vimos alguns exemplos de funções na primeira aula:
# 
# ```
install.packages() # instala pacotes
library() # carrega pacotes na memória
sessionInfo() # Informações sobre a versão do R
# ```
# 
# O principal uso das funções é automatizar operações que, se fossem feitas 
# manualmente, demorariam muito tempo, estariam sujeitas a erros ou simplesmente 
# seriam muito tediosas.
# 
# ## Funções
# Por exemplo, se precisarmos achar a média entre dois números, poderíamos fazer o cálculo manualmente
# 
# ```{r}
(35 + 65)/2
# ```

# Mas se tivéssemos 1000 números em vez de 2, esse processo seria extremamente longo e cansativo. Assim, podemos simplesmente usar a função `mean()` para calcular a média de todos os números de 1 a 1000
# 
# ```{r}
mean(1:1000)
# ```

# ## Funções
# O R possui inúmeras funções para fazer todo tipo de cálculo que vocês possam imaginar 
# (e também o que vocês nem conseguem imaginar). Ainda assim, à medida que vocês avançam 
# no uso, haverá a necessidade de fazer tarefas específicas, para as quais nenhuma função 
# existente é satisfatória. Nesses momentos fica evidente a vantagem de o R ser uma 
# linguagem de programação, pois podemos **criar nossas próprias funções**. 
# 
# Por enquanto, vamos explorar algumas funções que já existem no R. Vocês perceberam 
# que não precisei digitar todos os números de 1 a 1000 no slide anterior?
# 
# ```{r}
numeros <- 1:1000
numeros_desc <- 1000:1 
# ```
# 
# Muito mais fácil do que `numeros <- c(1, 2, 3, ..., 1000)`
# 
# ## Funções
# Mas e se eu quisesse tirar a média dos números ímpares de 1 a 1000? Teria que digitar os números um a um?
# 
# Nesses momentos é bom lembrar que a **preguiça** é um dos traços que separam os bons programadores dos demais. Quase todas as tarefas tediosas e repetitivas na programação podem ser automatizadas de alguma maneira.
# 
# Obviamente, o R tem a função `seq()` que nos permite criar um vetor de números ímpares. Note como são utilizados os argumentos da função.
# 
# ```{r}
impares <- seq(from = 1,  to = 1000,  by = 2)
mean(impares)
# ```
# 
# ## Funções
# O R vem pré-instalado com diversas funções estatísticas -- afinal, essa é uma de suas razões de existir. Além da função `mean()`, que vimos no slide anterior, podemos olhar também para outras estatísticas descritivas
# 
# ```{r results='hide'}
sd(impares) # desvio-padrão
var(impares) # variância
range(impares) # amplitude
IQR(impares) # intervalo interquartil
# ```
# 
# O comando `summary()` nos dá uma visão geral sobre esse vetor
# 
# ```{r}
summary(impares)
# ```
# 
# ## Tipos de dados
# Linguagens de programação aramazenam variáveis sob diferentes classes.
# 
# Hoje vamos fazer apenas uma discussão geral para que vocês saibam que elas existem, 
# e comentaremos os detalhes ao longo das aulas.
# 
# - Valores numéricos: `double`, `integer`
# - Texto: `character`
# - Fatores: `factor`
# - Valores lógicos: `logical`
# - Valores especiais: `NA`, `NULL`, `Inf`, `NaN`
# 
# Para descobrir o tipo de um objeto, você pode usar a função `typeof()`
# 
# ```{r results='hide'}
impares <- seq(from = 1,  to = 1000,  by = 2)
typeof(impares)
# ```
# 
# ## Dataframes
# 
# Podemos pensar nos dataframes como **coleções de vetores** dispostos lado a lado. 
# É, de longe, o formato  mais utilizado para a análise e processamento de dados. 
# 
# ```{r results='hide'}
nomes <- c("Rafael", "Davi", "Ana", "Pedro")
formacao <- c("Data Science", "Ciência Política", "Adm Publica", "RI")
tempo_empresa <- c(3, 10, 10, 1)

equipe <- data.frame(nomes, formacao, tempo_empresa)

nrow(equipe) # número de linhas
ncol(equipe) # número de colunas
head(equipe) # primeiras obs
summary(equipe) # resumo dos dados
# ```
# 
# O `R` tem suporte para outras estruturas de dados como matrizes e listas, 
# que veremos conforme a necessidade.
# 
# ## Tidy data
# - Observações nas linhas
# - Atributos nas colunas
# - Valores nas células
# 
# ![Tidy Data](images/tidy.png)
# 
# ## Subsetting para vetores
# As ferramentas que vamos ver agora servem para "pinçar" informações que estã na 
# memória do R. Voltando ao vetor de números ímpares que criamos mais cedo, suponha 
# que eu queira saber o valor do 287º elemento
# 
# ```{r results='hide'}
impares <- seq(from = 1,  to = 1000,  by = 2)
impares[287]
# ```
# 
# Podemos expandir o operador `[` para diversas seleções, de acordo com a necessidade
# 
# ```{r results='hide'}
impares[c(1, 76, 48)] # seleção de diversos números
impares[-c(1:250)] # todos os números menos os 250 primeiros
impares[impares > 900] # apenas valores maiores que 900
# ```
# 
# Note que **sempre** podemos guardar os resultados dessas operações em um novo objeto
# 
# ```{r results='hide'}
selecao_impares <- impares[c(1, 76, 48)] # seleção de diversos números
# ```
# 
# ## Subsetting para dataframes
# O funcionamento do operador `[` é semelhante para dataframes, mas precisamos atentar para as dimensões de linhas e colunas
# 
# ```{r results='hide'}
equipe[1, 3] # linha 1, coluna 3
equipe[1,] # retorna toda a linha 1
equipe[,3] # retorna toda a coluna 3
equipe[,c(1, 3)] # retorna as colunas 1 e 3
# ```
# 
# A diferença é que, com dataframes, é muito comum utilizarmos o operador `$` para selecionar colunas
# ```{r results='hide'}
equipe$tempo_empresa # seleciona a variável "tempo de empresa"
equipe[,3] # mesmo resultado
# ```
# 
# ## Operadores Lógicos
# 
# Para seleções mais complexas, é comum que se precise recorrer a operadores lógicos. 
# 
# <center>
# ![Logical](images/transform-logical.png){width=800px}
# </center>

# ## Operadores Lógicos
# 
# Os mais comuns são `&` e `|`, mas todos os operadores relacionais também são 
# reconhecidos: `==` (igual a), `!=` (diferente de), `>` (maior que), `<` (menor que), 
# `>=` (maior ou igual que), `<=` (menor ou igual que)
# 
# ```{r results='hide'}
equipe[equipe$tempo_empresa == 10,] # apenas as pessoas com 10 meses de empresa
equipe[equipe$tempo_empresa < 5,] # apenas as pessoas com menos de 5 meses de empresa
equipe[equipe$tempo_empresa < 5 | equipe$formacao == "Adm Publica",] # menos de 5 meses de empresa OU fazem adm pública
equipe[equipe$tempo_empresa > 2 & equipe$tempo_empresa < 5,] # entre 2 e 5 meses de empresa
# ```
# 
# ## Importanto dados
# 
# Como adiantamos na abordagem de projetos no `RStudio`, um excelente pacote para 
# auxiliar na tarefa de navegação no diretório do projeto é o pacote `here`. 
# 
# A função que dá nome ao pacote é usada para direcionar o seu programa à pasta correta no 
# diretório do projeto. Vejamos o exemplo: 
# 
# ```{r eval=FALSE, message=FALSE, warning=FALSE}
library(here)
library(tidyverse)
wb <- read_csv2(here("data/wb-brazil-2020-07-18.csv"))

# ```
# 
# **Obs**: O Banco Mundial publica os dados de seus projetos. Os dados acima foram obtidos 
# através de download e seleção de algumas colunas da lista de projetos ativos no Brasil. 
# Você encontra a lista completa [aqui](https://projects.worldbank.org/en/projects-operations/projects-list?lang=en&searchTerm=&countrycode_exact=BR)!
# 
# ## Exportando dados
# 
# Suponha que após você carregar a base de dados, realizou tarefas que mudaram sua 
# configuração e você deseja salvá-las sem reescrever a base original.
# 
# ```{r eval=FALSE, message=FALSE, warning=FALSE}
write_csv2(wb, here("data/wb-brazil-filter.csv"))

# ```
# 
# ## Onde obter ajuda?
# 
# <center>
# ![google](images/google-better.png){width=400px}
# </center>
# 
# ## Onde obter ajuda?
# 
# A função `sum()` é frequentemente útil. Ela permite somar vetores. 
# Vamos aproveitar para consultar a **documentação** desta função através de outra 
# função, a função `?`.
# 
# ```{r message=FALSE, warning=FALSE, results='asis'}
?sum()
# ```

## Onde obter ajuda?

# Além da documentação oficial do R, uma referência muito valiosa é o [Stack Overflow](https://stackoverflow.com/)
# 
# <center>
# ![Stack](images/stack-WeRWhatWeAsk.jpg){width=800px}
# 
# 
# [useR!2017: We R What We Ask - Video!](https://channel9.msdn.com/Events/useR-international-R-User-conferences/useR-International-R-User-2017-Conference/We-R-What-We-Ask-The-Landscape-of-R-Users-on-Stack-Overflow)
# 
# </center>
# 
# ## Tarefa da aula
# 
# As instruções da tarefa estão no arquivo `NN-class-ds4ir-assignment.rmd` da pasta 
# `assignment` que se encontra na raiz desse projeto.