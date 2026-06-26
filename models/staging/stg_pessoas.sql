with source_pessoas as (
    select * from {{ source('raw', 'person_person') }}
)

select
    cast(businessentityid as int) as id_pessoa,
    cast(firstname as string) as primeiro_nome,
    cast(middlename as string) as nome_do_meio,
    cast(lastname as string) as sobrenome,
    trim(concat(coalesce(firstname, ''), ' ', coalesce(middlename, ''), ' ', coalesce(lastname, ''))) as nome_completo
from source_pessoas