with source_pedidos_detalhes as (
    select * from {{ source('raw', 'sales_salesorderdetail') }}
)

select
    cast(salesorderid as int) as id_pedido,
    cast(salesorderdetailid as int) as id_pedido_detalhe,
    cast(productid as int) as id_produto,
    cast(orderqty as int) as quantidade_comprada,
    cast(unitprice as numeric) as preco_unitario,
    cast(unitpricediscount as numeric) as desconto_unitario
from source_pedidos_detalhes