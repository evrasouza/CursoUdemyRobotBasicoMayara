*** Settings ***
Documentation          1 - Crie um arquivo de teste novo;
...                    2 - Crie uma variável do tipo DICIONÁRIO na seção de variáveis globais que contenha nela os meses do ano e, para cada mês, informe o número de dias desse mês;
...                    3 - Crie um teste que imprima no Console (Log To Console) cada mês e a sua respectiva quantidade de dias.

*** Variables ***
&{DIAS_POR_MES}         Janeiro=31
...                     Fevereiro=28
...                     Marco=31
...                     Abril=30
...                     Maio=31
...                     Junho=30
...                     Julho=31
...                     Agosto=31
...                     Setembro=30
...                     Outubro=31
...                     Novembro=30
...                     Dezembro=-31

*** Test Cases ***
Caso de Teste de exemplo 01
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
    Log To Console    .
    Log To Console    Em JANEIRO há: ${DIAS_POR_MES.Janeiro} dias!
    Log To Console    Em FEVEREIRO há: ${DIAS_POR_MES.Fevereiro} dias!
    Log To Console    Em MARÇO há: ${DIAS_POR_MES.Marco} dias!
    Log To Console    Em ABRIL há: ${DIAS_POR_MES.Abril} dias!
    Log To Console    Em MAIO há: ${DIAS_POR_MES.Maio} dias!
    Log To Console    Em JUNHO há: ${DIAS_POR_MES.Junho} dias!
    Log To Console    Em JULHO há: ${DIAS_POR_MES.Julho} dias!
    Log To Console    Em AGOSTO há: ${DIAS_POR_MES.Agosto} dias!
    Log To Console    Em SETEMBRO há: ${DIAS_POR_MES.Setembro} dias!
    Log To Console    Em OUTUBRO há: ${DIAS_POR_MES.Outubro} dias!
    Log To Console    Em NOVEMBRO há: ${DIAS_POR_MES.Novembro} dias!
    Log To Console    Em DEZEMBRO há: ${DIAS_POR_MES.Dezembro} dias!
    Log To Console    ===================

