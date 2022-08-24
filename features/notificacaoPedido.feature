Feature: Notificação de pedido
    As a usuário do tipo fornecedor do sistema
    I want to ser notificado quando um novo medido for realizado
    So that poderei ter um maior controle do fluxo de vendas

Scenario: histórico de vendas
	Given estou logado no sistema com o usuário mmmj@cin.ufpe.br com a senha 12345
	When e eu clicar na página de notificações
    Then tenho que ver as notificações de vendas dos últimos 7 dias

Scenario: limite de notificação por página
	Given estou logado no sistema com o usuário mmmj@cin.ufpe.br com a senha 12345
	When e eu clicar na página de notificações
	And houver mais que 15 notificações nos últimos 7 dias
    Then só serão mostradas as últimas 15 notificações
	And existirá um botão para passar para a página seguinte com as 15 notificações seguintes.

Scenario: venda realizada
	Given estou logado no sistema com o usuário mmmj@cin.ufpe.br com a senha 12345
	When o usuário "Allan" comprar o livro "Sapiens"
	And e eu clicar na página de notificações
    Then tenho que ver a notificação de compra

Scenario: erro na compra
	Given estou logado no sistema com o usuário mmmj@cin.ufpe.br com a senha 12345
	When o usuário "Allan" comprar o livro "Sapiens"
	And eu clicar na página de notificações
	And eu clicar na notificação de compra do usuário allan
    Then tenho que ver a notificação de compra detalhada
