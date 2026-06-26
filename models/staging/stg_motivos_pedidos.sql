with source_pedidos_motivos as (
    select * from {{ source('raw', 'sales_salesorderheadersalesreason') }}
)

select
    cast(salesorderid as int) as id_pedido,
    cast(salesreasonid as int) as id_motivo_venda
from source_pedidos_motivos
