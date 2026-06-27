with staging_motivos_pedidos as (
    select * from {{ ref('stg_motivos_pedidos') }}
),

staging_motivos_venda as (
    select * from {{ ref('stg_motivos_venda') }}
)

select
    staging_motivos_pedidos.id_pedido,
    listagg(staging_motivos_venda.nome_motivo_venda, ', ') within group (order by staging_motivos_venda.nome_motivo_venda) as motivos_venda
from staging_motivos_pedidos
left join staging_motivos_venda on staging_motivos_pedidos.id_motivo_venda = staging_motivos_venda.id_motivo_venda
group by staging_motivos_pedidos.id_pedido
