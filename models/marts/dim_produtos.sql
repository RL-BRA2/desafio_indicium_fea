with produtos as (
    select * from {{ ref('stg_produtos') }}
)

select
    produtos.id_produto,
    produtos.nome_produto,
    produtos.codigo_produto,
    produtos.nivel_estoque_seguranca,
    produtos.ponto_pedido,
    produtos.custo_padrao,
    produtos.preco_listado
from produtos
