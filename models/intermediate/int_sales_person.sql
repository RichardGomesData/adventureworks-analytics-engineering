with sales_person as (

    select *
    from {{ ref('stg_sales_person') }}

),

employee as (

    select *
    from {{ ref('stg_human_resources_employee') }}

),

person as (

    select *
    from {{ ref('stg_person') }}

),

joined as (

    select

        sales_person.pk_sales_person

        , concat_ws(
            ' ',
            person.primeiro_nome,
            person.nome_meio,
            person.sobrenome
        ) as nome_completo

        , employee.cargo
        , employee.dt_contratacao

        , sales_person.fk_territory
        , sales_person.vl_meta_vendas
        , sales_person.vl_bonus
        , sales_person.pct_comissao
        , sales_person.vl_vendas_ano_atual
        , sales_person.vl_vendas_ano_anterior

    from sales_person

    left join employee
        on sales_person.pk_sales_person = employee.pk_employee

    left join person
        on sales_person.pk_sales_person = person.pk_person

)

select *
from joined