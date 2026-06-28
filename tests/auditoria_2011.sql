with auditoria_vendas as (
    select
        sum(faturamento_bruto) as total_vendas_brutas_2011
    from {{ ref('fct_vendas') }}

    where date_part('year', data_pedido) = 2011
)

select
    total_vendas_brutas_2011
from auditoria_vendas
where round(total_vendas_brutas_2011, 2) != 12646112.16
