*** Settings ***
Documentation       Essa suite testa o site da Amazon.com.br
Resource            amazon_resources.robot
Test Setup          abrir o navegador
Test Teardown       fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]     Esse menu verifica o menu Eletrônicos do site da Amazon.com.br
    ...                 e verifica a categoria Computadores e Informática
    [Tags]              menus       categorias
    Dado que estou na home page da Amazon.com.br
    Quando acesar o menu "Eletrônicos"
    Entao o titulo da pagina deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E a categoria "Computadores e Informática" deve ser exibida na pagina

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]     Esse menu verifica a busca de um produto
    [Tags]              busca_produtos      lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Entao o titulo da pagina deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na pagina

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho1
    Dado que estou na home page da Amazon.com.br
    Quando adicionar o produto "Console PlayStation 5" no carrinho
    Então o produto "Console PlayStation 5" deve ser mostrado no carrinho
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho1
    Dado que estou na home page da Amazon.com.br
    E existe o produto "Console Xbox Series S" no carrinho
    Quando remover o produto "Console Xbox Series S" do carrinho
    Então o carrinho deve ficar vazio

