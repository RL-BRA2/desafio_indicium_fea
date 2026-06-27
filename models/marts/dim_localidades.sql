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
    end.id_endereco,
    end.endereco_linha1 as endereco,
    end.cidade,
    est.nome_estado as estado,
    est.codigo_estado as sigla_estado,
    pa.nome_pais as pais
from enderecos end
left join estados est on end.id_estado = est.id_estado_provincia
left join paises pa on est.codigo_regiao_pais = pa.codigo_regiao_pais