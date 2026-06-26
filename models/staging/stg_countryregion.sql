with source_countryregion as (
    select * from {{ source('raw', 'person_countryregion') }}
)

select
    cast(countryregioncode as string) as codigo_regiao_pais,
    cast(name as string) as nome_pais
from source_countryregion