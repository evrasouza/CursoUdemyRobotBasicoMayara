*** Settings ***
Documentation          1 - Crie um arquivo de teste novo;
...                    2 - Crie uma variável do tipo LISTA na seção de variáveis globais que contenha todos os meses do ano;
...                    3 - Crie um teste que imprima no Console (Log To Console) cada item dessa lista (não use FOR, imprima um a um).

*** Variables ***
@{MESES}        Janeiro    Fevereiro    Março    Abril    Maio    Junho    Julho    Agosto    Setembro    Outubro    Novembro    Dezembro

*** Test Cases ***
Caso de Teste de exemplo 01
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
    Log To Console    .
    Log To Console    Mês 01: ${MESES[0]}
    Log To Console    Mês 02: ${MESES[1]}
    Log To Console    Mês 03: ${MESES[2]}
    Log To Console    Mês 04: ${MESES[3]}
    Log To Console    Mês 05: ${MESES[4]}
    Log To Console    Mês 06: ${MESES[5]}
    Log To Console    Mês 07: ${MESES[6]}
    Log To Console    Mês 08: ${MESES[7]}
    Log To Console    Mês 09: ${MESES[8]}
    Log To Console    Mês 10: ${MESES[9]}
    Log To Console    Mês 11: ${MESES[10]}
    Log To Console    Mês 12: ${MESES[11]}
    Log To Console    ===================

