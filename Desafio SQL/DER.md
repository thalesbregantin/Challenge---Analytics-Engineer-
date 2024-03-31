Cliente: Guarda informações dos usuários, tanto compradores quanto vendedores.
Item: Representa produtos no marketplace, vinculado a categorias.
Categoria: Categorias para organizar os itens.
Pedido: Transações de compra de itens específicos por clientes.

As relações seriam:

Um Cliente pode ter múltiplos Pedidos.
Cada Pedido está associado a um Item.
Cada Item pertence a uma Categoria.
Um Cliente pode listar múltiplos Itens como vendedor.



https://dbdiagram.io/d/DER-Challenge-Analytics-Engineer-6608ae0737b7e33fd71f43bc

// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs



// Criação da tabela Categoria
TABLE Categoria {
    id integer [primary key]
    nome VARCHAR(255)
    caminho VARCHAR(255)
}

// Criação da tabela Cliente
TABLE Cliente {
    id integer [primary key]
    email VARCHAR(255)
    nome VARCHAR(255)
    sobrenome VARCHAR(255)
    sexo CHAR(1)
    endereco VARCHAR(255)
    data_nascimento DATE
    telefone VARCHAR(20)
}

// Criação da tabela Item
TABLE Item {
    id integer [primary key]
    nome VARCHAR(255)
    descricao TEXT
    preco DECIMAL(10, 2)
    status VARCHAR(50)
    data_cancelamento DATE
    categoria_id INT

}

// Criação da tabela Pedido
TABLE Pedido {
    id integer [primary key]
    data_pedido DATE
    cliente_id INT
    item_id INT
    quantidade INT
    preco_total DECIMAL(10, 2)
    vendedor_id INT
  }


// Criação da tabela Vendedor
TABLE Vendedor {
    id integer [primary key]
    email VARCHAR(255)
    nome VARCHAR(255)
    sobrenome VARCHAR(255)
    sexo CHAR(1)
    endereco VARCHAR(255)
    data_nascimento DATE
    telefone VARCHAR(20)
    
}


Ref: Cliente.id < Pedido.cliente_id // many-to-one

Ref: Item.id < Pedido.item_id // many-to-one

Ref: Item.categoria_id > Categoria.id // many-to-one

Ref: Pedido.vendedor_id > Vendedor.id // many-to-one