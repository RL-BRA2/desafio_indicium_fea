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
    clientes.id_cliente,
    coalesce(pessoas.nome_completo, lojas.nome_loja, 'Não Informado') as nome_cliente
from clientes
left join pessoas on clientes.id_pessoa = pessoas.id_pessoa
left join lojas on clientes.id_loja = lojas.id_loja
