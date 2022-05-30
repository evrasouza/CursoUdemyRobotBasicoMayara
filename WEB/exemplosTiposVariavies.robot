*** Settings ***
Documentation       Exemplo de tipos de variaveis: SIMPLES, LISTAS e DICIONARIOS

*** Variables ***
#Simples
${GLOBAL_SIMPLES}    Vamos ver os tipos de variaveis no robot

#Tipo Lista
@{FRUTAS}            morango     banana    maça    uva    abacaxi

#Tipo Dicionário
&{PESSOA}            nome=Everton Souza        email=evrasouza@gmail.com        idade=38        sexo=masculino

*** Test Cases ***
Caso de Teste de exemplo 01
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
    #Simples
    Log                ${GLOBAL_SIMPLES}

    #Tipo Lista
    Log                Tem que ser abacaxi: ${FRUTAS[4]} e Essa tem que ser banana: ${FRUTAS[1]}

    #Tipo Dicionário
    Log                Nome: ${PESSOA.nome} e email: ${PESSOA.email}
