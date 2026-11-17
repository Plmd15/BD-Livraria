📚 Sistema de Gestão de Livraria (Livraria_DB)

Este repositório contém o script SQL para a criação e povoamento do banco de dados relacional de uma Livraria, desenvolvido para gerenciar editoras, livros, autores, clientes, pedidos e itens de pedidos.

🚀 Tecnologias Utilizadas

SGBD: SQL Server (ou compatíveis com sintaxe T-SQL)

Linguagem: SQL (DDL e DML)

🗂️ Estrutura do Banco de Dados (Modelo Lógico)

O banco de dados é composto por 7 tabelas principais que armazenam e relacionam as informações do sistema:

tbl_editora: Armazena as informações das editoras parceiras.

Livro: Contém o catálogo de livros disponíveis, vinculados às suas respectivas editoras.

tbl_autor: Registra os dados biográficos dos autores.

tbl_cliente: Mantém o cadastro dos clientes da livraria.

tbl_pedido: Registra as compras realizadas pelos clientes.

tbl_ItemPedido: Detalha os livros e quantidades compradas em cada pedido.

tbl_livro_autor: Tabela associativa que resolve o relacionamento N:N entre Livros e Autores.

🔗 Relacionamentos entre as Tabelas

EDITORA (1:N) LIVRO: Uma editora publica vários livros, mas cada livro pertence a uma única editora.

LIVRO (N:N) AUTOR: Um livro pode ter múltiplos autores e um autor pode escrever vários livros (relacionamento intermediado por tbl_livro_autor).

CLIENTE (1:N) PEDIDO: Um cliente pode realizar vários pedidos, mas cada pedido é associado a um único cliente.

📋 Exemplo de Consultas de Verificação

O script já inclui comandos de seleção (SELECT *) ao final de cada tabela para testar o povoamento inicial. Você pode validar executando consultas individuais como:

SELECT * FROM Livro;
SELECT * FROM tbl_cliente;

💡 Autor

Documentação gerada automaticamente com base na estrutura lógica do projeto de banco de dados da Livraria.

PEDIDO (1:N) ITEM_PEDIDO: Um pedido contém um ou mais itens de compra.

LIVRO (1:N) ITEM_PEDIDO: Um livro pode aparecer em vários itens de pedidos ao longo do tempo.# BD-Livraria
Banco de Dados com tabelas te informações para uma livraria.
