with source_pedidos_cabecalhos as (
    select * from {{ source('raw', 'sales_salesorderheader') }}
)

select
    cast(salesorderid as int) as id_pedido,
    cast(customerid as int) as id_cliente,
    cast(creditcardid as int) as id_cartao_credito,
    cast(shiptoaddressid as int) as id_endereco_envio,
    cast(status as int) as codigo_status,
    cast(orderdate as timestamp) as data_pedido
from source_pedidos_cabecalhos