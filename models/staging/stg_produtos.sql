with source_produtos_producao as (
    select * from {{ source('raw', 'production_product') }}
)

select
    cast(productid as int) as id_produto,
    cast(name as string) as nome_produto,
    cast(productnumber as string) as codigo_produto,
    cast(safetystocklevel as int) as nivel_estoque_seguranca,
    cast(reorderpoint as int) as ponto_pedido,
    cast(standardcost as numeric) as custo_padrao,
    cast(listprice as numeric) as preco_listado
from source_produtos_producao
