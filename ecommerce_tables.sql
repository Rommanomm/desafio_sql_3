DROP DATABASE IF EXISTS ecommerce;
CREATE DATABASE ecommerce;
USE ecommerce;

-- Cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    identificacao VARCHAR(45),
    endereco VARCHAR(45),
    tipoPessoa VARCHAR(45)
);

INSERT INTO Cliente (nome, identificacao, endereco, tipoPessoa) VALUES
('João Silva', '12345678901', 'Rua A, 100', 'PF'),
('Empresa XPTO', '9876543210001', 'Av. Central, 200', 'PJ'),
('Maria Souza', '45678912300', 'Rua B, 150', 'PF');

-- Pagamento
CREATE TABLE Pagamento (
    idPagamento INT AUTO_INCREMENT PRIMARY KEY,
    tipoPagamento VARCHAR(45)
);

INSERT INTO Pagamento (tipoPagamento) VALUES
('Cartão'),
('Boleto'),
('Pix');

-- Entrega
CREATE TABLE Entrega (
    idEntrega INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(45),
    codigoRastreamento VARCHAR(45)
);

INSERT INTO Entrega (status, codigoRastreamento) VALUES
('Em trânsito', 'BR123456789'),
('Entregue', 'BR987654321'),
('Cancelado', 'BR111222333');

-- Pedido
CREATE TABLE Pedido (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(45),
    descricao VARCHAR(45),
    frete FLOAT,
    Cliente_idCliente INT,
    Pagamento_idPagamento INT,
    Entrega_idEntrega INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente) ON UPDATE CASCADE,
    FOREIGN KEY (Pagamento_idPagamento) REFERENCES Pagamento(idPagamento) ON UPDATE CASCADE,
    FOREIGN KEY (Entrega_idEntrega) REFERENCES Entrega(idEntrega) ON UPDATE CASCADE
);

INSERT INTO Pedido (status, descricao, frete, Cliente_idCliente, Pagamento_idPagamento, Entrega_idEntrega) VALUES
('Confirmado', 'Pedido de eletrônicos', 20.00, 1, 1, 1),
('Pendente', 'Pedido de roupas', 15.50, 2, 2, 2),
('Enviado', 'Pedido de brinquedos', 10.00, 1, 3, 3);

-- Produto
CREATE TABLE Produtos (
    idProdutos INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(45),
    descricao VARCHAR(45),
    valor DECIMAL(10,2)
);

INSERT INTO Produtos (categoria, descricao, valor) VALUES
('Eletrônicos', 'Notebook', 3500.00),
('Vestimenta', 'Camisa Polo', 120.00),
('Brinquedos', 'Carrinho controle remoto', 250.00);

-- Estoque
CREATE TABLE Estoque (
    idEstoque INT AUTO_INCREMENT PRIMARY KEY,
    local VARCHAR(45)
);

INSERT INTO Estoque (local) VALUES
('Galpão Zona Norte'),
('Galpão Zona Sul');

-- Produtos_has_Estoque (N:N)
CREATE TABLE Produtos_has_Estoque (
    Produtos_idProdutos INT,
    Estoque_idEstoque INT,
    quantidade INT,
    PRIMARY KEY (Produtos_idProdutos, Estoque_idEstoque),
    FOREIGN KEY (Produtos_idProdutos) REFERENCES Produtos(idProdutos) ON UPDATE CASCADE,
    FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque) ON UPDATE CASCADE
);

INSERT INTO Produtos_has_Estoque VALUES
(1, 1, 10),
(2, 2, 5),
(3, 1, 20);

-- Fornecedor
CREATE TABLE Fornecedor (
    idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razaoSocial VARCHAR(45),
    CNPJ VARCHAR(45)
);

INSERT INTO Fornecedor (razaoSocial, CNPJ) VALUES
('TecnoDistribuidora', '12345678000101'),
('ModaLog', '22334455000122');

-- Disponibilizando (Fornecedor x Produtos - N:N)
CREATE TABLE Disponibilizando (
    _idFornecedor INT,
    _idProdutos INT,
    PRIMARY KEY (_idFornecedor, _idProdutos),
    FOREIGN KEY (_idFornecedor) REFERENCES Fornecedor(idFornecedor) ON UPDATE CASCADE,
    FOREIGN KEY (_idProdutos) REFERENCES Produtos(idProdutos) ON UPDATE CASCADE
);

INSERT INTO Disponibilizando VALUES
(1, 1),
(2, 2);

-- Vendedor externo
CREATE TABLE VendedorExterno (
    idVendedorExterno INT AUTO_INCREMENT PRIMARY KEY,
    razaoSocial VARCHAR(45),
    local VARCHAR(45)
);

INSERT INTO VendedorExterno (razaoSocial, local) VALUES
('Loja Parceira 1', 'Centro'),
('Loja Parceira 2', 'Bairro Industrial');

-- Produto por Vendedor Externo (N:N)
CREATE TABLE Produto_VendedorExterno (
    VendedorExterno_idVendedorExterno INT,
    Produtos_idProdutos INT,
    quantidade INT,
    PRIMARY KEY (VendedorExterno_idVendedorExterno, Produtos_idProdutos),
    FOREIGN KEY (VendedorExterno_idVendedorExterno) REFERENCES VendedorExterno(idVendedorExterno) ON UPDATE CASCADE,
    FOREIGN KEY (Produtos_idProdutos) REFERENCES Produtos(idProdutos) ON UPDATE CASCADE
);

INSERT INTO Produto_VendedorExterno VALUES
(1, 1, 5),
(1, 2, 3),
(2, 3, 2);

-- Pedido_has_Produtos (N:N)
CREATE TABLE Pedido_has_Produtos (
    Pedido_idPedido INT,
    Produtos_idProdutos INT,
    quantidade INT,
    PRIMARY KEY (Pedido_idPedido, Produtos_idProdutos),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido) ON UPDATE CASCADE,
    FOREIGN KEY (Produtos_idProdutos) REFERENCES Produtos(idProdutos) ON UPDATE CASCADE
);

INSERT INTO Pedido_has_Produtos VALUES
(1, 1, 1),
(1, 2, 2),
(2, 2, 1),
(3, 3, 1);

SHOW TABLES;
