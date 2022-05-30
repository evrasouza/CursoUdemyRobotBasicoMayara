*** Settings ***
Documentation    Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Resource        resourceAPI.robot
Suite Setup    Conectar a minha API

*** Test Cases ***
Buscar listagem de todos os livros (GET em todos os livros)
    Requisitar todos os livros
    Conferir o statuscode    200
    Conferir o reason    OK
    Conferir se retorna uma lista com "200" livros

Buscar um livro específico (GET em um livro específico)
    [Tags]    livro
    Requisitar o livro "15"
    Conferir o statuscode    200
    Conferir o reason    OK
    Conferir se retorna todos os dados corretos do livro 15

Cadastrar um novo Livro (POST)
    [Tags]    livroNovo
    Cadastrar um novo livro
    Conferir o statuscode    200
    Conferir o reason    OK
    Conferir se retorna todos os dados corretos do livro

Alterar um Livro (PUT)
    [Tags]    updateLiivro
    Alterar um livro
    Conferir o statuscode    200
    Conferir o reason    OK
    Conferir se retorna todos os dados corretos do livro

Deletar um Livro (DELETE)
    [Tags]    deleteLivro
    Deletar um livro
    Conferir o statuscode    200
    Conferir o reason    OK
    Conferir se livro foi excluido