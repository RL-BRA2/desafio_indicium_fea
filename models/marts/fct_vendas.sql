with pedidos_cabecalhos as (
    select * from {{ ref('stg_pedidos_cabecalhos') }}
),

vendas_ajustadas as (
    select * from {{ ref('int_vendas_ajustadas') }}
),

motivos_pedidos as (
    select * from {{ ref('int_motivos_pedidos') }}
)

select
    vendas_ajustadas.id_pedido_detalhe,
    vendas_ajustadas.id_pedido,
  
    pedidos_cabecalhos.id_cliente,
    vendas_ajustadas.id_produto,
    pedidos_cabecalhos.id_cartao_credito,
    pedidos_cabecalhos.id_endereco_envio as id_localidade,
    
    pedidos_cabecalhos.data_pedido,
    pedidos_cabecalhos.codigo_status,
    coalesce(motivos_pedidos.motivos_venda, 'Não Informado') as motivos_venda,
    
    vendas_ajustadas.quantidade_comprada,
    vendas_ajustadas.preco_unitario,
    vendas_ajustadas.desconto_unitario,
    vendas_ajustadas.faturamento_bruto,
    vendas_ajustadas.total_desconto,
    vendas_ajustadas.faturamento_liquido as valor_total_negociado

from vendas_ajustadas
left join pedidos_cabecalhos on vendas_ajustadas.id_pedido = pedidos_cabecalhos.id_pedido
left join motivos_pedidos on vendas_ajustadas.id_pedido = motivos_pedidos.id_pedido
