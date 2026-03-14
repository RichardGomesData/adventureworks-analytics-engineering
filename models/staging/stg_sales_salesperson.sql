with
    fonte_salesperson as (
        select *
        from {{ source('adventure_works', 'sales_salesperson') }}

    )

    , renomeado as (
        select
            cast(businessentityid as int) as pk_vendedor
            , cast(territoryid as int) as fk_territorio
            , cast(salesquota as double) as vl_meta_vendas
            , cast(bonus as double) as vl_bonus
            , cast(commissionpct as double) as pct_comissao
            , cast(salesytd as double) as vl_vendas_ano_atual
            , cast(saleslastyear as double) as vl_vendas_ano_anterior
            , rowguid as guid_registro
            , cast(modifieddate as timestamp) as ts_modificacao
        from fonte_salesperson
    )

select *
from renomeado