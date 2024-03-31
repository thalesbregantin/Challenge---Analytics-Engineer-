-- Criação da tabela Categoria
CREATE TABLE Categoria (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    caminho VARCHAR(255)
);

-- Criação da tabela Cliente
CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    email VARCHAR(255),
    nome VARCHAR(255),
    sobrenome VARCHAR(255),
    sexo CHAR(1),
    endereco VARCHAR(255),
    data_nascimento DATE,
    telefone VARCHAR(20)
);

-- Criação da tabela Item
CREATE TABLE Item (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    descricao TEXT,
    preco DECIMAL(10, 2),
    status VARCHAR(50),
    data_cancelamento DATE,
    categoria_id INT,
    vendedor_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id),
    FOREIGN KEY (vendedor_id) REFERENCES Vendedor(id)
);

-- Criação da tabela Pedido
CREATE TABLE Pedido (
    id INT PRIMARY KEY,
    data_pedido DATE,
    cliente_id INT,
    item_id INT,
    quantidade INT,
    preco_total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
    FOREIGN KEY (item_id) REFERENCES Item(id)
);

-- Criação da tabela Vendedor
CREATE TABLE Vendedor (
    id INT PRIMARY KEY,
    email VARCHAR(255),
    nome VARCHAR(255),
    sobrenome VARCHAR(255),
    sexo CHAR(1),
    endereco VARCHAR(255),
    data_nascimento DATE,
    telefone VARCHAR(20),
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id))
