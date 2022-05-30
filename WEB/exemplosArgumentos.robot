*** Settings ***
Documentation       Exemplo de tipos de variaveis como argumentos em Ketwords.

*** Variables ***
&{PESSOA}            nome=Everton Souza        email=evrasouza@gmail.com        idade=38        sexo=masculino

*** Test Cases ***
Caso de Teste de exemplo 01
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
    Uma subkeyword com argumentos    ${PESSOA.nome}    ${PESSOA.email}
    ${MENSAGEM_ALERTA}        Uma subkeyword com retorno    ${PESSOA.nome}    ${PESSOA.idade}
    Log                ${MENSAGEM_ALERTA}

Uma subkeyword com argumentos
    [Arguments]        ${NOME_USUARIO}        ${EMAIL_USUARIO}
    Log                Nome Usuario: ${NOME_USUARIO}
    Log                Email: ${EMAIL_USUARIO}

Uma subkeyword com retorno
    [Arguments]        ${NOME_USUARIO}        ${IDADE_USUARIO}
    ${MENSAGEM}        Set Variable If    ${IDADE_USUARIO}<18    Não Autorizado! O usuário ${NOME_USUARIO} é menor de idade!
    [Return]           ${MENSAGEM}
    