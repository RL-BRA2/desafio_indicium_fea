with cartoes_credito as (
    select * from {{ ref('stg_cartoes_credito') }}
)

select
    cartoes_credito.id_cartao_credito,
    cartoes_credito.tipo_cartao
from cartoes_credito