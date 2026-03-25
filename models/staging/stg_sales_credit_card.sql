with
    fonte_credit_card as (
        select *
        from {{ source('adventure_works', 'sales_creditcard') }}

    )

    , renomeado as (
        select
            cast(creditcardid as int) as pk_cartao_credito
            , cardtype as tipo_cartao
            , cast(cardnumber as string) as numero_cartao
            , cast(expmonth as int) as mes_expiracao
            , cast(expyear as int) as ano_expiracao
            , cast(modifieddate as timestamp) as ts_modificacao
        from fonte_credit_card
    )

select *
from renomeado