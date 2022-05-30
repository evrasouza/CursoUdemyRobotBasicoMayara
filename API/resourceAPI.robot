*** Settings ***
Documentation    Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Library    RequestsLibrary
Library    Collections
Library    factories/books.py

*** Variables ***
${URL_API}            https://fakerestapi.azurewebsites.net/api/v1
&{BOOK_15}            id=15
...                   title=Book 15
...                   pageCount=1500

*** Keywords ***
###SETUP E TEARDOWN
Conectar a minha API
    Create Session    fakerAPI    ${URL_API}    verify=True

###AÇÕES
Requisitar todos os livros
    ${RESPOSTA}    Get On Session    fakerAPI    Books    expected_status=any
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}    Get On Session    fakerAPI    Books/${ID_LIVRO}    expected_status=any
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Cadastrar um novo livro
    #Configurando a massa de dados para a criacao do parceiro
    ${book}              Factory New Book
    Set Global Variable        ${book}

    ${HEADERS}        Create Dictionary    content-type=application/json
    ${RESPOSTA}       Post On Session      fakerAPI    /Books
    ...                                    json=${book}
    ...                                    headers=${HEADERS}

    log to console    ${RESPOSTA.content}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}


Alterar um Livro
    #Configurando a massa de dados para a criacao do parceiro
    ${book}              Factory Update Book
    Set Global Variable        ${book}

    ${HEADERS}        Create Dictionary    content-type=application/json
    ${RESPOSTA}       Put On Session      fakerAPI    /Books/${book}[id]
    ...                                    json=${book}
    ...                                    headers=${HEADERS}

    log to console    ${RESPOSTA.content}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Deletar um livro
    Cadastrar um novo livro

    ${HEADERS}        Create Dictionary    content-type=application/json
    ${RESPOSTA}       Delete On Session    fakerAPI    /Books/${book}[id]
    ...                                    json=${book}
    ...                                    headers=${HEADERS}

    log to console    ${RESPOSTA.content}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

###CONFERÊNCIAS
Conferir o statuscode
    [Arguments]        ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}

Conferir o reason
     [Arguments]        ${REASON_DESEJADO}
     Should Be Equal As Strings    ${RESPOSTA.reason}    ${REASON_DESEJADO}

Conferir se retorna uma lista com "${QTDADE_LIVROS}" livros
    Length Should Be    ${RESPOSTA.json()}    ${QTDADE_LIVROS}

Conferir se retorna todos os dados corretos do livro 15
    Dictionary Should Contain Item    ${RESPOSTA.json()}        id             ${BOOK_15.id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}        title          ${BOOK_15.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}        pageCount      ${BOOK_15.pageCount}
    Should Not Be Empty               ${RESPOSTA.json()["description"]}
    Should Not Be Empty               ${RESPOSTA.json()["excerpt"]}
    Should Not Be Empty               ${RESPOSTA.json()["publishDate"]}

Conferir se retorna todos os dados corretos do livro
    Dictionary Should Contain Item    ${RESPOSTA.json()}        id             ${book}[id]
    Dictionary Should Contain Item    ${RESPOSTA.json()}        title          ${book}[title]
    Dictionary Should Contain Item    ${RESPOSTA.json()}        pageCount      ${book}[pageCount]
    Dictionary Should Contain Item    ${RESPOSTA.json()}        description    ${book}[description]
    Dictionary Should Contain Item    ${RESPOSTA.json()}        excerpt        ${book}[excerpt]
    Dictionary Should Contain Item    ${RESPOSTA.json()}        publishDate    ${book}[publishDate]

Conferir se livro foi excluido
    Should Be Empty    ${RESPOSTA.content}
