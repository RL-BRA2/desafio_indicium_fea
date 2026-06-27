with source_lojas as (
    select * from {{ source('raw', 'sales_store') }}
)

select
    cast(businessentityid as int) as id_loja,
    cast(name as string) as nome_loja
from source_lojas
