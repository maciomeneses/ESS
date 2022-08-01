Scenario: Registro de despacho do pedido -> Indicar despacho de pedido na aba
de despacho os pedidos para indicar que já foram enviados ao clientes
Scenario: Registrando despacho do pedido
	Given the system has pedido "AAA12" with status "Despachar"
	When code "AAA12"is provided in the page "Despachar pedidos"
	Then pedido "AAA12"is stored in the system with status "Em trânsito"
Scenario: Registrando despacho do pedido inexistente 
	Given the system has no pedido "AAA12" 
	When code "AAA12"is provided in the page "Despachar pedidos"
	Then nothing is stored in the system 
Scenario: Registro de pedido já despachado -> Indicar o despacho de um pedido já despachado e recebe um aviso
	Given I am logged in with user "Loja do Joãozinho" as "seller"
	And I am on the "despachar pedidos" page
	And I have pedido "LJ123" as "enviado"
	When I ask the system to "despachar"
	And I give the code for pedido "LJ123"
	Then I am still on de "despachar pedidos" page
	And I get a message informing pedido "LJ123" has already been sent 
	And I can see pedido "LJ123" as "enviado"
Scenario: Registro de pedido não existente -> Indicar despacho de pedido que não existe como despachado e recebe um erro
	Given I am logged in with user "Loja do Joãozinho" as "seller"
	And I am on the "despachar pedidos" page
	And I  do not have pedido "LJ123" 
	When I ask the system to "despachar"
	And I give the code for pedido "LJ123"
	Then I am still on de "despachar pedidos" page 
	And I get an error message informing code "LJ123" does not exist
Scenario: Ver a quantidade de pedidos despachados -> Indicar a quantidade de pedidos que já foram despachados e estão em trânsito
	Given I am logged in with user "Loja do Joãozinho" as "seller"
	And I am on the "despachar pedidos" page
	And I have pedido "LJ123" as "enviado"
	When I ask the system to "mostrar pedidos enviados"
	Then I get a list containing pedido "LJ123" 
