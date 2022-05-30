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
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a categoria "TV, Áudio e Cinema em Casa"

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]     Esse menu verifica a busca de um produto
    [Tags]              busca_produtos      lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    O sistema deve exibir a tela com o resultado da pesquisa, listando o produto "Console Xbox Series S".

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Console PlayStation 5" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console PlayStation 5"
    Adicionar o produto "Console PlayStation 5" no carrinho
    Verificar se o produto "Console PlayStation 5" foi adicionado com sucesso
 
Caso de Teste 04 - Remover Produto do Carrinho
     [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
     [Tags]             remover_carrinho
     Acessar a home page do site Amazon.com.br
     Digitar o nome de produto "Console PlayStation 5" no campo de pesquisa
     Clicar no botão de pesquisa
     Verificar o resultado da pesquisa se está listando o produto "Console PlayStation 5"
     Adicionar o produto "Console PlayStation 5" no carrinho
     Verificar se o produto "Console PlayStation 5" foi adicionado com sucesso
     Remover o produto "Console Xbox Series S" do carrinho
     Verificar se o carrinho fica vazio
