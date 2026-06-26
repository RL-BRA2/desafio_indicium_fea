with source_clientes_vendas as (
    select * from {{ source('raw', 'sales_customer') }}
)

select
    cast(customerid as int) as id_cliente,
    cast(personid as int) as id_pessoa,
    cast(storeid as int) as id_loja,
    cast(territoryid as int) as id_territorio
from source_clientes_vendas
