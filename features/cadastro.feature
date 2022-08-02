# OOOOOOOOOOOAAAAAAAAAA ASDFNOINSALDJKC MDASLCNJFKA SK TESTE MODIFICACAO
# Cenários de GUI

Scenario: Cadastro inválido de uma loja com um CNPJ já registrado no banco de dados.
Given um usuário que ainda não cadastrou sua loja está na página "Cadastro Loja"
And  usuário havia preenchido o campo "CNPJ" de sua loja "João Cosméticos" com o valor "02.359.075/0001"
And o campo "CNPJ" da loja "Barão Eletrônicos" já está registrado no banco de dados com o valor "02.359.075/0001" 
When o usuário clicar no botão "Cadastrar"
Then o usuário permanecerá na página "Cadastro Loja"
And será exibida uma mensagem de erro por ter o valor "02.359.075/0001" associado ao campo "CNPJ" já cadastrado no sistema

Scenario: Atualização inválida do CNPJ de uma loja para um já existente no banco de dados
Given um usuário que já tem sua loja "Mariazinha Móveis" cadastrada está na página "Atualizar Loja" 
And o usuário havia preenchido que o campo "CNPJ" de sua loja tem o valor "02.359.075/0001"
And o campo "CNPJ" da loja "Barão Eletrônicos" já está registrado no banco de dados com o valor "02.359.075/0001" 
When o usuário clicar no botão "Atualizar"
Then o usuário permanecerá na página "Atualizar Loja"
And será exibida uma mensagem de erro por ter o valor "02.359.075/0001" associado ao campo "CNPJ" já cadastrado no sistema

Scenario: Cadastro inválido de um fornecedor com caracteres especiais no nome
Given um fornecedor que ainda não se cadastrou está na página "Cadastro Fornecedor"
And  o fornecedor havia preenchido o campo "Nome do fornecedor" com o valor "¯\_(ツ)_/¯ J. U. B. I. L. E. U. ¯\_(ツ)_/¯"
When o usuário clicar no botão "Cadastrar"
Then o usuário permanecerá na página "Cadastro Fornecedor"
And será exibida uma mensagem de erro por terem sido encontrado(s) caractere(s) especial(is) no valor "¯\_(ツ)_/¯ J. U. B. I. L. E. U. ¯\_(ツ)_/¯" associado ao campo "Nome do fornecedor" que foi informado

Scenario: Falha na atualização de algum dado da loja por nenhum campo relativo à atualização ter sido preenchido
Given um usuário que já tem sua loja "Mariazinha Móveis" cadastrada está na página "Atualizar Loja" 
And o usuário não preencheu nenhum campo existente
When o usuário clicar no botão "Atualizar"
Then o usuário permanecerá na página "Atualizar Loja"
And será exibida uma mensagem de erro informando que não foi possível realizar nenhuma atualização pois nenhum novo valor foi preenchido

# Cenários de serviço

Scenario: Cadastro inválido de uma loja com um CNPQ já registrado no banco de dados - Serviço
Given o sistema conta com um registro de loja com o campo "CNPJ" com o valor "02.359.075/0001"
When o sistema receber um request de "Cadastrar Loja" com um registro de loja com o campo "CNPJ" com o valor "02.359.075/0001"
Then essa loja não será cadastrada
And será enviada uma mensagem de erro para o cliente por ter o valor "02.359.075/0001" associado ao campo "CNPJ" já cadastrado no sistema

# Cenário trivial

Scenario: Cadastro válido de fornecedor
Given um usuário que ainda mão se cadastrou está na página "Cadastro Fornecedor"
And o usuário preencheu o campo "CPF" como "00011122299" e não há nenhum outro cadastro no sistema com essa combinação de campo e valor
And o usuário preencheu o campo "Nome" como "Pedro da Silva Santos"
And o usuário preencheu o campo "Data de nascimento" como "01/01/2000"
And o usuário preencheu o campo "País" como "Brasil"
And o usuário preencheu o campo "Estado" como "Pernambuco"
And o usuário preencheu o campo "Cidade" como "Recife"
And o usuário preencheu o campo "Bairro" como "Boa Viagem"
And o usuário preencheu o campo "Rua" como "Rua Fulano de Tal"
And o usuário preencheu o campo "Número" como "123"
And o usuário preencheu o campo "Complemento" como "Apto 404"
And o usuário preencheu o campo "Email" como "pedro@cin.ufpe.br" e não há nenhum outro cadastro no sistema com essa combinação de campo e valor
And o usuário preencheu o campo "Senha" como "senha123"
And o usuário preencheu o campo "Nome de usuário" como "pedro"
And o usuário preencheu o campo "Descrição" como "Pedro Produtos Eletrônicos"
And o usuário deixou os campos "Facebook", "Instagram" e "Logo" em branco 
When o usuário clicar no botão "Cadastrar"
Then o usuário será direcionado para uma página "Cadastro finalizado com sucesso"
And será exibida uma mensagem de sucesso no cadastro de fornecedor

Scenario: Cadastro válido de fornecedor
Given um usuário que ainda mão se cadastrou está na página "Cadastro Fornecedor"
And o usuário preencheu o campo "CPF" como "99988877700" e não há nenhum outro cadastro no sistema com essa combinação de campo e valor
And o usuário preencheu o campo "Nome" como "Maria"
And o usuário preencheu o campo "Data de nascimento" como "01/01/2000"
And o usuário preencheu o campo "País" como "Brasil"
And o usuário preencheu o campo "Estado" como "Pernambuco"
And o usuário preencheu o campo "Cidade" como "Recife"
And o usuário preencheu o campo "Bairro" como "Pina"
And o usuário preencheu o campo "Rua" como "Avenida Sicrano"
And o usuário preencheu o campo "Número" como "100"
And o usuário preencheu o campo "Complemento" como "Apto 200"
And o usuário preencheu o campo "Email" como "maria@cin.ufpe.br" e não há nenhum outro cadastro no sistema com essa combinação de campo e valor
And o usuário preencheu o campo "Senha" como "password"
And o usuário preencheu o campo "Nome de usuário" como "maria"
And o usuário preencheu o campo "Descrição" como "Maria Móveis"
And o usuário deixou os campos "Facebook", "Instagram" e "Logo" em branco 
When o usuário clicar no botão "Cadastrar"
Then o usuário será direcionado para uma página "Cadastro finalizado com sucesso"
And será exibida uma mensagem de sucesso no cadastro de fornecedor

# oi
#
