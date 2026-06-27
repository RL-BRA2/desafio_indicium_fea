with staging_pedidos_detalhes as (
    select * from {{ ref('stg_pedidos_detalhes') }}
)

select
    id_pedido,
    id_pedido_detalhe,
    id_produto,
    quantidade_comprada,
    preco_unitario,
    desconto_unitario,
    
    (quantidade_comprada * preco_unitario) as faturamento_bruto,
    
    (quantidade_comprada * preco_unitario * desconto_unitario) as total_desconto,

    ((quantidade_comprada * preco_unitario) - (quantidade_comprada * preco_unitario * desconto_unitario)) as faturamento_liquido
from staging_pedidos_detalhes
