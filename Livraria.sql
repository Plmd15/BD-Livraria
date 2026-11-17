Create Database Livraria_DB;

use Livraria_DB;

--tbl editora

CREATE table tbl_editora(

	Id_editora int,
	NomeEmpresa Varchar (150),
	Telefonedecontato varchar (20),
	EmailCorporativo varchar(150)

--Constraints
	Primary Key (Id_editora) 
);

Insert into tbl_editora (Id_editora, NomeEmpresa, Telefonedecontato, EmailCorporativo)VALUES

	(22, 'Leiamais', '98765-4321', 'Leiamais@gmail.com'),
	(75, 'Leiamenos', '12345-6789', 'Leiamenos@gmail.com'),
	(42, 'Leiamaisoumenos', '56432-1978', 'Leiamaisemenos@gmail.com'),
	(67, 'Vamosler', '57326-1948', 'Vamosler@gmail.com'),
	(13, 'QueroLer', '4002-8922', 'Queroler@gmail.com');

Select * from tbl_editora; 



--tbl livro

CREATE table Livro(

	ISBN varchar(20),
	Titulo varchar(200) Not null,
	PrecoVendaAtual decimal(10,2),
	QntNoEstoque int,
	AnoDePublicacao int,
	Id_editora int,

--Constraints 

	Primary Key(ISBN),
	Check (QntNoEstoque > 0),
	FOREIGN KEY (Id_editora) references tbl_editora(Id_editora),
);


	Insert into Livro(ISBN, Titulo, PrecoVendaAtual, QntNoEstoque, AnoDePublicacao, Id_editora)VALUES
	('978-85-359-0277-8', 'Diário de um bananá',227.90, 27, 2010, 22),
	('984-62-423-1022-7', 'Turma da Mônica Jovem',65.52, 2010,45,75),
	('754-35-429-3456-2','O pequeno principe',45.96,62,2010,42),
	('845-36-552-3597-4','Vivi viravento',47.72,2020,36,67),
	('978-85-740-6045-3','O menino maluquinho',63.21,2010,42,13);

Select * from Livro;


--Autor

CREATE TABLE tbl_autor(

	Id_autor int,
	NomeCompleto Varchar(150),
	Nacionalidade Varchar(80),
	DataNascimento Date,

--Constraints
	Primary Key (Id_autor)
);

Insert into tbl_autor(Id_autor,NomeCompleto, Nacionalidade, DataNascimento)Values
	(164, 'Maurício de Sousa', 'Brasileiro', '27/10/1935'),
	(165, 'Monteiro Lobato', 'Brasileiro', '18/04/1882'),
	(166, 'Machado de Assis', 'Brasileiro', '21/06/1939'),
	(167, 'Clarice Lispector', 'Ucraniana', '10/12/1920'),
	(168, 'J. K. Rowling', 'Britânica', '31/07/1965');

Select * from tbl_autor;

--Cliente

CREATE table tbl_cliente(

	Id_Cliente int,
	NomeCompleto Varchar (150),
	Email Varchar(150),
	CPF Varchar (14),
	DataCadastro DATE

--Constraints

	Primary Key (Id_Cliente),
	Unique (Email, CPF)
);

Insert into tbl_cliente(Id_Cliente, NomeCompleto, Email, CPF, DataCadastro)Values

	(0071,'Edinaldo Pereira','Edinaldão@gmail.com','123.321.456-50', '22/10/2022'),
	(0073, 'Carlos Eduardo Silva', 'carlos.silva@hotmail.com', '789.456.123-99', '10/07/2023'),
	(0074, 'Beatriz Oliveira', 'bia.oli@outlook.com', '321.654.987-11', '05/11/2023'),
	(0075, 'Marcos Vinícius Santos', 'marcos.v@gmail.com', '654.321.789-22', '18/01/2024'),
	(0076, 'Juliana Almeida', 'ju.almeida@yahoo.com', '159.753.486-33', '30/09/2024');

Select * from tbl_cliente;



--Pedido

CREATE table tbl_pedido(

	Id_Pedido int,
	DataHora DateTime,
	ValorTotal Decimal(10,2),
	Id_Cliente int,

--Constraints

	Primary Key (Id_Pedido),
	Foreign key (Id_Cliente) references tbl_cliente(Id_Cliente)
);

	Insert Into tbl_pedido(Id_Pedido, DataHora, ValorTotal, Id_Cliente)VALUES
	(1562,'22-10-2026 13:22', 52.20, 0071),
	(1563,'11-12-2025 14:42', 216.50, 0073),
	(1564,'09-07-2025 15:03', 567.49, 0074),
	(1565,'05-04-2026 15:14', 42.67, 0075),
	(1566,'29-11-2026 17:12', 37.95, 0076);

Select * from tbl_pedido;

--Item Pedido

CREATE table tbl_ItemPedido(

	Id_ItemPedido int,
	Quantidade int,
	PreçoUnitarioVenda decimal(10,2),
	Id_pedido int,
	ISBN Varchar(20),

--Constraints
	Primary key(Id_ItemPedido),
	Foreign key (Id_pedido) references tbl_pedido(Id_pedido),
	Foreign key (ISBN) references Livro(ISBN)
);

Insert into tbl_ItemPedido(Id_ItemPedido, Quantidade, PreçoUnitarioVenda, Id_pedido, ISBN)values
	(50002, 2,  50.20, 1562, '978-85-359-0277-8'),
	(60014, 4, 103.40, 1563, '984-62-423-1022-7'),
	(42626, 7, 140.62, 1564, '754-35-429-3456-2'),
	(67042, 6, 160.37, 1565, '845-36-552-3597-4'),
	(78213, 3, 75.50, 1566, '978-85-740-6045-3');

Select * from tbl_ItemPedido;



--Livro Autor

CREATE table tbl_livro_autor(

	ISBN Varchar (20),
	Id_autor int,

--constraints
	Primary key (ISBN, Id_autor),
	Foreign key (ISBN) references Livro(ISBN),
	Foreign key (Id_autor) references tbl_autor(Id_autor)
);

Insert into tbl_livro_autor(ISBN,Id_autor)values

	('978-85-359-0277-8',164),
	('984-62-423-1022-7',165),
	('754-35-429-3456-2',166),
	('845-36-552-3597-4',167),
	('978-85-740-6045-3',168);

Select * from tbl_livro_autor;