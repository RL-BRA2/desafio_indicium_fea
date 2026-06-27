with source_enderecos as (
    select * from {{ source('raw', 'person_address') }}
)

select
    cast(addressid as int) as id_endereco,
    cast(addressline1 as string) as endereco_linha1,
    cast(city as string) as cidade,
    cast(stateprovinceid as int) as id_estado
from source_enderecos