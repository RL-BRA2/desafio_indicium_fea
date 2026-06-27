with enderecos as (
    select * from {{ ref('stg_enderecos') }}
),

estados as (
    select * from {{ ref('stg_estados') }}
),

paises as (
    select * from {{ ref('stg_paises') }}
)

select
    enderecos.id_endereco,
    enderecos.endereco_linha1 as endereco,
    enderecos.cidade,
    estados.nome_estado as estado,
    estados.codigo_estado as sigla_estado,
    paises.nome_pais as pais
from enderecos
left join estados on enderecos.id_estado = estados.id_estado_provincia
left join paises on estados.codigo_regiao_pais = paises.codigo_regiao_pais