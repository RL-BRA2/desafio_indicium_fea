with source_cartoes_credito as (
    select * from {{ source('raw', 'sales_creditcard') }}
)

select
    cast(creditcardid as int) as id_cartao_credito,
    cast(cardtype as string) as tipo_cartao
from source_cartoes_credito