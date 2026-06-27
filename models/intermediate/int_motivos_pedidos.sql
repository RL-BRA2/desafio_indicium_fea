with staging_motivos_pedidos as (
    select * from {{ ref('stg_motivos_pedidos') }}
),

staging_motivos_venda as (
    select * from {{ ref('stg_motivos_venda') }}
)

select
    pm.id_pedido,
    listagg(mv.nome_motivo_venda, ', ') within group (order by mv.nome_motivo_venda) as motivos_venda
from staging_motivos_pedidos pm
left join staging_motivos_venda mv on pm.id_motivo_venda = mv.id_motivo_venda
group by pm.id_pedido
