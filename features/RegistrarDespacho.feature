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
