with source_provincia_estado as (
    select * from {{ source('raw', 'person_stateprovince') }}
)

select
    cast(stateprovinceid as int) as id_estado_provincia,
    cast(stateprovincecode as string) as codigo_estado,
    cast(name as string) as nome_estado,
    cast(countryregioncode as string) as codigo_regiao_pais
from source_provincia_estado