*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}                      chrome
${URL}                          http://www.amazon.com.br
${MENU_ELETRONICOS}             //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}           //h1[contains(.,'Eletrônicos e Tecnologia')]


*** Keywords ***
abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To                           url=${URL}
    Wait Until Element is Visible   locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element                   locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page contains        text=${FRASE}
    Wait Until Element is Visible   locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be                 title=${TITULO}

Verificar se aparece a categoria "${CATEGORIIA}"
    Wait Until Element is Visible   locator=(//img[contains(@alt,'${CATEGORIIA}')])[2]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text      locator=twotabsearchtextbox     text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element   locator=nav-search-submit-button

O sistema deve exibir a tela com o resultado da pesquisa, listando o produto "${PRODUTO}".
    Wait Until Element is Visible        locator=(//span[contains(.,'${PRODUTO}')])[2]

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element is Visible        locator=(//span[contains(.,'${PRODUTO}')])[4]

Adicionar o produto "${PRODUTO}" no carrinho
    Click Element    locator=(//span[contains(.,'${PRODUTO}')])[4]
    Wait Until Element is Visible    locator=add-to-cart-button
    Click Element        locator=add-to-cart-button

Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=//span[@class='a-size-base'][contains(.,'${PRODUTO}')]
    Set Global Variable    ${PRODUTO}

Remover o produto "Console Xbox Series S" do carrinho
    Wait Until Element Is Visible    locator=//input[contains(@title,'Excluir')]
    Click Element    locator=//input[contains(@title,'Excluir')]

Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=//a[@href='/gp/cart/view.html?ref_=sw_gtc'][contains(.,'Ir para o carrinho')]
    Click Element    locator=//a[@href='/gp/cart/view.html?ref_=sw_gtc'][contains(.,'Ir para o carrinho')]
    Wait Until Element Is Visible    locator=//*[@id="sc-active-cart"]/div/div/div[2]/div[1]/h2
    Page Should Contain        Seu carrinho da Amazon está vazio

#Gherkin Steps
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acesar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Entao o titulo da pagina deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E a categoria "Computadores e Informática" deve ser exibida na pagina
    Verificar se aparece a categoria "Computadores e Informática"
Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Entao o titulo da pagina deve ficar "${TITULO}"
    Title Should Be                 title=${TITULO}
E um produto da linha "Xbox Series S" deve ser mostrado na pagina
    O sistema deve exibir a tela com o resultado da pesquisa, listando o produto "Console Xbox Series S".
Quando adicionar o produto "Console PlayStation 5" no carrinho
    Digitar o nome de produto "Console PlayStation 5" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console PlayStation 5"
    Adicionar o produto "Console PlayStation 5" no carrinho
Então o produto "Console PlayStation 5" deve ser mostrado no carrinho
    Verificar se o produto "Console PlayStation 5" foi adicionado com sucesso

E existe o produto "Console Xbox Series S" no carrinho
    Quando adicionar o produto "Console PlayStation 5" no carrinho
Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho
Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio