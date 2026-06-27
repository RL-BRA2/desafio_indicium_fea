with clientes as (
    select * from {{ ref('stg_clientes') }}
),

pessoas as (
    select * from {{ ref('stg_pessoas') }}
),

lojas as (
    select * from {{ ref('stg_lojas') }}
)

select
    cl.id_cliente,
    coalesce(pe.nome_completo, lj.nome_loja, 'Não Informado') as nome_cliente
from clientes cl
left join pessoas pe on cl.id_pessoa = pe.id_pessoa
left join lojas lj on cl.id_loja = lj.id_loja
