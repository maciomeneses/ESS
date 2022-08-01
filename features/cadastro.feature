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