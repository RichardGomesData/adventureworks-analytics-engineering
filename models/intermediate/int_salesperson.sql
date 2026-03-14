with salespersons as (

    select *
    from {{ ref('stg_sales_salesperson') }}

),

employees as (

    select *
    from {{ ref('stg_humanresources_employee') }}

),

persons as (

    select *
    from {{ ref('stg_person_person') }}

),

joined as (

    select

        salespersons.pk_salesperson

        , concat_ws(
            ' ',
            persons.primeiro_nome,
            persons.nome_meio,
            persons.sobrenome
        ) as nome_completo

        , employees.cargo
        , employees.dt_contratacao

        , salespersons.fk_territory
        , salespersons.vl_meta_vendas
        , salespersons.vl_bonus
        , salespersons.pct_comissao
        , salespersons.vl_vendas_ano_atual
        , salespersons.vl_vendas_ano_anterior

    from salespersons

    left join employees
        on salespersons.pk_salesperson = employees.pk_employee

    left join persons
        on salespersons.pk_salesperson = persons.pk_person

)

select *
from joined