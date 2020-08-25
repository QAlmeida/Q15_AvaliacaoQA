*** Settings ***
Documentation   Formulário

Library     SeleniumLibrary

Library      OperatingSystem



*** Test Cases ***
Cadastrar Usuário

    Dado que acesso o Formulário
    Quando eu faço um novo cadastro de usuário
    Então vejo a mensagem de sucesso "Usuário cadastrado com sucesso."
    E vejo este novo cadastro na lista


*** Keywords ***

Dado que acesso o Formulário

    Open Browser        http://localhost:8080/usuarios      firefox
    Set Selenium Implicit Wait      5
    Click Link          /usuarios/new


Quando eu faço o cadastro de um novo usuario

    Input Text          id:usuario_nome             Iuri Almeida
    Input Text          id:usuario_email            iuri@qanalyst.com

    Click Element       xpath://input[@value='Cadastrar']

Então vejo a mensagem de sucesso "${mensagem_esperada}"

    Element Should Contain      css:div[role=alert]     ${mensagem_esperada}
    Capture Page Screenshot

E vejo este novo usuario na lista

    Element Should Contain      css:table tbody          Iuri Almeida
    Element Should Contain      css:table tbody          iuri@qanalyst.com

    Capture Page Screenshot
    Close Browser


   


