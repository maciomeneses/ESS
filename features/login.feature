Feature: Login dos fornecedores
    As a usuário do tipo fornecedor do sistema
    I want to entrar no sistema com meu e-mail e senha
    So that eu tenha acesso às funcionalidades do sistema que são acessíveis somente depois do login

Scenario: Login realizado com sucesso
	Given não estou logado em nenhuma conta
    And existe um usuário cadastrado com o e-mail “asv@cin.ufpe.br” e senha “123456” 
    And estou na página de “Login”
	When o campo de email é preenchido por “asv@cin.ufpe.br”
    And o campo da senha é preenchido por “123456”
    Then eu sou encaminhado para a página “Inicio” 

Scenario: Tentativa de login com e-mail não cadastrado
    Given não estou logado em nenhuma conta
    And sistema não possui o email “asv@cin.ufpe.br” cadastrado
    And estou na página de “Login”
	When o campo de email é preenchido por “asv@cin.ufpe.br”
    And o campo da senha é preenchido por “123456”
    Then aparece uma mensagem de falha no login

Scenario: Tentativa de login com senha incorreta
	Given não estou logado em nenhuma conta
    And existe um usuário cadastrado com o e-mail “asv@cin.ufpe.br” e senha “123456” 
    And estou na página de “Login”
	When o campo de email é preenchido por “asv@cin.ufpe.br”
    And o campo da senha é preenchido por “123”
    Then aparece uma mensagem de falha no login

Scenario: Redefinição de senha
	Given não estou logado em nenhuma conta
    And existe um usuário cadastrado com o e-mail “asv@cin.ufpe.br” e senha “123456” 
    And estou na página de “Redefinição de senha”
	When o campo de email é preenchido por “asv@cin.ufpe.br”
    And um email é enviado para “asv@cin.ufpe.br” com o código “1010”
    And o campo de código é preenchido por “1010”
    And o campo de nova senha é preenchido por “123”
    Then aparece uma mensagem de redefinição de senha realizada com sucesso

Scenario: Falha no login com e-mail em branco
    Given não estou logado em nenhuma conta
    And estou na página de "Login"
    When eu não preencho o campo de e-mail
    And eu preencho o campo de senha com "123456"
    Then eu não consigo pressionar o botão de entrar
    And continuo na página de "Login"

Scenario: Falha no login com senha em branco
    Given não estou logado em nenhuma conta
    And estou na página de "Login"
    When eu preencho o campo de e-mail com "asv@cin.ufpe.br"
    And eu não preencho o campo de senha
    Then eu não consigo pressionar o botão de entrar
    And continuo na página de "Login"

Scenario: Falha no login com e-mail incorreto
    Given estou na página de "Login"
    And não estou logado em nenhuma conta
    And existe um usuário cadastrado com o e-mail “asv@cin.ufpe.br” e senha “123456” 
    When eu preencho os campos com e-mail "josé" e senha "josezão"
    Then aparece uma mensagem de falha no login

OPA!
Segunda mudança!