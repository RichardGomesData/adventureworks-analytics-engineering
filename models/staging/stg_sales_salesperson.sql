with fonte_salesperson as (

    select *
    from {{ source('adventure_works', 'sales_salesperson') }}

),

renomeado as (

    select
        cast(businessentityid as int) as pk_salesperson
        , cast(territoryid as int) as fk_territory
        , cast(salesquota as decimal(18,2)) as vl_meta_vendas
        , cast(bonus as decimal(18,2)) as vl_bonus
        , cast(commissionpct as decimal(10,4)) as pct_comissao
        , cast(salesytd as decimal(18,2)) as vl_vendas_ano_atual
        , cast(saleslastyear as decimal(18,2)) as vl_vendas_ano_anterior
        , rowguid as guid_registro
        , cast(modifieddate as timestamp) as ts_modificacao

    from fonte_salesperson

)

select *
from renomeado