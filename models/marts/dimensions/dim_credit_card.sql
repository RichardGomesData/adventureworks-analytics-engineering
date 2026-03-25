with credit_card as (

    select *
    from {{ ref('int_credit_card') }}

)

select
    pk_cartao_credito,
    tipo_cartao
from credit_card