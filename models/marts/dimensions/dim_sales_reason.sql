with base as (

    select *
    from {{ ref('int_sales_reason') }}

),

final as (

    select distinct

        pk_sales_reason,
        nome_motivo_venda,
        tipo_motivo_venda

    from base

)

select *
from final