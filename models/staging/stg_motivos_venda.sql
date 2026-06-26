with source_motivos_venda as (
    select * from {{ source('raw', 'sales_salesreason') }}
)

select
    cast(salesreasonid as int) as id_motivo_venda,
    cast(name as string) as nome_motivo_venda,
    cast(reasontype as string) as tipo_motivo_venda
from source_motivos_venda
