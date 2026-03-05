 Desafio DIO – Índices e Procedures em Banco de Dados (MySQL)

- Descrição do Projeto

Este projeto foi desenvolvido como parte de um desafio prático de **Banco de Dados SQL**, com o objetivo de aplicar conceitos de **otimização de consultas através de índices** e **manipulação de dados utilizando Stored Procedures**.

O banco de dados utilizado representa um cenário simplificado de **e-commerce**, contendo tabelas relacionadas a clientes, pedidos, produtos, vendedores, fornecedores e estoque.

O foco do desafio foi melhorar o desempenho das consultas SQL e centralizar operações de manipulação de dados diretamente no banco.

-- Objetivos do Desafio

* Criar **índices em tabelas relevantes** para otimizar consultas.
* Desenvolver **queries SQL** para recuperação de informações.
* Implementar **Stored Procedures** para manipulação de dados.
* Utilizar **estruturas condicionais (IF)** dentro da procedure.
* Documentar as decisões de otimização no repositório.

-- Estrutura do Banco de Dados

O banco utilizado no projeto foi o **ecommerce**, contendo as seguintes tabelas principais:

* `client`
* `orders`
* `product`
* `productorder`
* `productpstorage`
* `productseller`
* `productstorage`
* `productsupplier`
* `seller`
* `supplier`

Essas tabelas representam os principais elementos de um sistema de comércio eletrônico, incluindo clientes, pedidos, produtos, vendedores e fornecedores.

-- Criação de Índices

Os índices foram criados considerando:

* Colunas utilizadas em **JOIN**
* Colunas utilizadas em **consultas frequentes**
* Colunas utilizadas em **agrupamentos ou filtros**

-- Índices implementados

**Pedidos**

* `idx_orders_client` → melhora a busca de pedidos por cliente.

**Relacionamento pedido-produto**

* `idx_productorder_order`
* `idx_productorder_product`

Esses índices aceleram consultas de pedidos e relatórios de vendas.

**Vendedores**

* `idx_seller_location` → otimiza consultas de vendedores por cidade.
* `idx_seller_id` → melhora buscas diretas pelo identificador do vendedor.

**Relacionamento vendedor-produto**

* `idx_productseller_seller` → melhora operações de JOIN entre tabelas.

Todos os índices utilizam **B-Tree**, que é o tipo padrão do MySQL e adequado para buscas, filtros e agrupamentos.

---

-- Exemplos de Consultas

As consultas SQL permitem recuperar informações relevantes do banco de dados, como:

* pedidos realizados por clientes
* relacionamento entre vendedores e produtos
* dados agregados para relatórios

Os índices criados ajudam a reduzir o tempo de execução dessas consultas.

-- Stored Procedure

Foi criada a procedure **`manage_product`**, responsável por manipular os dados da tabela `product`.

Ela utiliza uma **variável de controle (`p_action`)** para definir qual operação será executada.

### Operações disponíveis

| Ação | Operação |
| ---- | -------- |
| 1    | SELECT   |
| 2    | INSERT   |
| 3    | UPDATE   |
| 4    | DELETE   |

Essa abordagem permite centralizar diferentes operações dentro de uma única procedure, facilitando manutenção e reutilização do código.

-- Exemplos de Execução

Selecionar produtos:

```sql
CALL manage_product(1, NULL, NULL, NULL, NULL);
```

Inserir produto:

```sql
CALL manage_product(2, 10, 'Mouse', 'Electronico', 120);
```

Atualizar produto:

```sql
CALL manage_product(3, 10, 'MouseRGB', 'Electronico', 150);
```

Remover produto:

```sql
CALL manage_product(4, 10, NULL, NULL, NULL);
```

---

-- Tecnologias Utilizadas

* MySQL
* SQL
* MySQL Workbench
* Git / GitHub

-- Conclusão

A utilização de **índices em colunas estratégicas** melhora significativamente a performance das consultas, especialmente em tabelas com grande volume de dados.

Já as **Stored Procedures** permitem centralizar operações de manipulação de dados dentro do banco, garantindo maior organização, reutilização e segurança.

Este projeto demonstra a aplicação prática desses conceitos em um cenário de **banco de dados para e-commerce**.


✍️ Projeto desenvolvido para fins educacionais na plataforma **DIO (Digital Innovation One)**.
