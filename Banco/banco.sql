CREATE TABLE Produto (
	Id INT IDENTITY,
	Nome VARCHAR(100) NOT NULL,
	Descricao TEXT NOT NULL,
	PrecoUnitario DECIMAL(10, 2) NOT NULL,

	CONSTRAINT Pk_IdProduto PRIMARY KEY (Id)
);
GO

CREATE TABLE Categoria (
	Id TINYINT IDENTITY,
	Nome VARCHAR(30) NOT NULL,

	CONSTRAINT Pk_IdCategoria PRIMARY KEY (Id)
);
GO

CREATE TABLE Cliente (
	Id INT IDENTITY,
	Nome VARCHAR(80) NOT NULL,
	Email VARCHAR(255) NOT NULL,
	DataCadastro DATE NOT NULL,

	CONSTRAINT Pk_IdCliente PRIMARY KEY (Id)
);
GO

CREATE TABLE StatusPedido (
	Id TINYINT IDENTITY,
	Nome VARCHAR(20) NOT NULL,

	CONSTRAINT Pk_IdStatusPedido PRIMARY KEY (Id)
);
GO

CREATE TABLE CategoriaProduto (
	IdProduto INT NOT NULL,
	IdCategoria TINYINT NOT NULL,

	CONSTRAINT Fk_IdProduto_CategoriaProduto FOREIGN KEY (IdProduto) REFERENCES Produto (Id),
	CONSTRAINT Fk_IdCategoria_CategoriaProduto FOREIGN KEY (IdCategoria) REFERENCES Categoria (Id)
);
GO

CREATE TABLE Pedido (
	Id INT IDENTITY,
	IdCliente INT NOT NULL,
	IdStatusPedido TINYINT NOT NULL,
	DataPedido DATETIME NOT NULL,

	CONSTRAINT PK_IdPedido PRIMARY KEY (Id),
	CONSTRAINT FK_IdCliente_Pedido FOREIGN KEY (IdCliente) REFERENCES Cliente (Id),
	CONSTRAINT FK_IdStatusPedido_Pedido FOREIGN KEY (IdStatusPedido) REFERENCES StatusPedido (Id)
);
GO

CREATE TABLE ItemPedido (
	Id INT IDENTITY,
	IdProduto INT NOT NULL,
	IdPedido INT NOT NULL,
	Quantidade TINYINT NOT NULL,
	Valor DECIMAL(10, 2) NOT NULL,

	CONSTRAINT PK_IdItemPedido PRIMARY KEY (Id),
	CONSTRAINT FK_IdProduto_ItemPedido FOREIGN KEY (IdProduto) REFERENCES Produto (Id),
	CONSTRAINT FK_IdPedido_ItemPedido FOREIGN KEY (IdPedido) REFERENCES Pedido (Id)
);
GO

INSERT INTO	Produto (Nome, Descricao, PrecoUnitario)
VALUES 
	('Celular', 'Iphone 17 Pro Max', 8500.00),
	('Notebook', 'Dell Inspiron 15 Intel Core i7 16GB RAM', 4599.99),
    ('Smart TV', 'Samsung 55" 4K QLED HDR', 3299.90),
    ('Fone de Ouvido', 'Sony WH-1000XM5 Noise Cancelling Bluetooth', 1599.00),
    ('Teclado Mecânico', 'Redragon Kumara RGB Switch Red ABNT2', 349.90);

INSERT INTO Categoria (Nome)
VALUES ('SmartPhones'), ('Televisão'), ('Acessórios'), ('Notebooks');

INSERT INTO CategoriaProduto(IdProduto, IdCategoria)
VALUES (1, 1), (2, 4), (3, 2), (4, 3), (5, 3);

INSERT INTO Cliente (Nome, Email, DataCadastro)
VALUES ('Rodrigo', 'rodrigo@diniz.com', GETDATE()),
	   ('Ana Lima', 'ana@lima.com', GETDATE()),
       ('Carlos Souza', 'carlos@souza.com', GETDATE()),
       ('Fernanda Costa', 'fernanda@costa.com', GETDATE()),
       ('Marcos Oliveira', 'marcos@oliveira.com', GETDATE());

INSERT INTO StatusPedido (Nome)
VALUES ('Pendente'), ('Confirmado'), ('Em Separação'), ('Enviado'), ('Entregue'), ('Cancelado');

INSERT INTO Pedido (IdCliente, IdStatusPedido, DataPedido)
VALUES (1, 3, GETDATE()), (2, 4, GETDATE()), (3, 2, GETDATE()), (4, 5, GETDATE()), (5, 6, GETDATE());

INSERT INTO ItemPedido (IdProduto, IdPedido, Quantidade, Valor)
VALUES (1, 1, 2, 17000.00), (2, 2, 1, 4599.99), (3, 3, 2, 6600.00), (4, 4, 3, 4800.00), (5, 5, 1, 349.90);

SELECT * FROM Produto;

SELECT * FROM Categoria;

SELECT * FROM Cliente;

SELECT * FROM StatusPedido;

SELECT * FROM CategoriaProduto;

SELECT * FROM Pedido;

SELECT * FROM ItemPedido;

SELECT
    c.Nome AS Cliente,
    p.Nome AS Produto,
    p.PrecoUnitario,
	ip.Quantidade,
	(p.PrecoUnitario * ip.Quantidade) AS ValorTotal,
    cat.Nome AS Categoria,
    sp.Nome AS StatusPedido,
	ped.DataPedido
FROM Pedido ped
JOIN Cliente c ON c.Id = ped.IdCliente
JOIN StatusPedido sp ON sp.Id = ped.IdStatusPedido
JOIN ItemPedido ip ON ip.IdPedido = ped.Id
JOIN Produto p ON p.Id = ip.IdProduto
JOIN CategoriaProduto cp ON cp.IdProduto = p.Id
JOIN Categoria cat ON cat.Id = cp.IdCategoria;

SELECT
    c.Id,
    c.Nome,
    c.Email,
    c.DataCadastro,
    ped.Id AS IdPedido,
    ped.DataPedido,
    sp.Nome AS StatusPedido
FROM Cliente c
JOIN Pedido ped ON ped.IdCliente = c.Id
JOIN StatusPedido sp ON sp.Id = ped.IdStatusPedido;
