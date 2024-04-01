# Desafio SQL

## Objetivo

A partir da seguinte necessidade, é necessário projetar um DER que responda ao modelo de negócios. Em seguida, deve-se responder a diferentes perguntas por meio de SQL.

## Descrição da necessidade

Levando em consideração o modelo de comércio eletrônico que gerenciamos, temos algumas entidades básicas que queremos representar: Cliente, Pedido, Item e Categoria.

#### Cliente:<br>
É a entidade onde estão todos os nossos usuários, sejam eles Compradores ou Vendedores do Site. Os principais atributos são e-mail, nome, sobrenome, sexo, endereço, data de nascimento, telefone, entre outros.

#### Item:<br>
É a entidade onde estão os produtos publicados em nosso marketplace. O volume é muito grande porque contém todos os produtos que foram publicados em algum momento. Através do estado do item ou da data de desativação, é possível identificar os itens ativos do marketplace.

#### Categoria:<br>
É a entidade onde está a descrição de cada categoria com seu respectivo caminho. Cada item está associado a uma categoria.

#### Pedido:<br>
O pedido é a entidade que reflete as transações geradas dentro do site (cada compra é um pedido). Neste caso, não teremos um fluxo de carrinho de compras, portanto, cada item vendido será refletido em um pedido, independentemente da quantidade comprada.

## Desenvolvimento do DER

#### Cliente:<br> 
Guarda informações dos usuários, tanto compradores quanto vendedores.

#### Item:<br>
Representa produtos no marketplace, vinculado a categorias.

#### Categoria:<br>
Categorias para organizar os itens.

#### Pedido:<br>
Transações de compra de itens específicos por clientes.

As relações seriam:

Um Cliente pode ter múltiplos Pedidos.<br>
Cada Pedido está associado a um Item.<br>
Cada Item pertence a uma Categoria.<br>
Um Cliente pode listar múltiplos Itens como vendedor.<br>

## Diagrama
![3](https://raw.githubusercontent.com/thalesbregantin/Challenge---Analytics-Engineer-/main/img/diagrama.PNG)

Link:<br>
https://dbdiagram.io/d/DER-Challenge-Analytics-Engineer-6608ae0737b7e33fd71f43bc


