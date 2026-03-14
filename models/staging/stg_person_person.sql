with
    fonte_person as (
        select *
        from {{ source('adventure_works', 'person_person') }}

    )

    , renomeado as (
        select
            cast(businessentityid as int) as pk_pessoa
            , persontype as tipo_pessoa
            , namestyle as flg_estilo_nome
            , title as titulo_pessoa
            , firstname as primeiro_nome
            , middlename as nome_meio
            , lastname as sobrenome
            , suffix as sufixo_nome
            , emailpromotion as flg_promocao_email
            , additionalcontactinfo as info_contato_adicional
            , demographics as dados_demograficos
            , rowguid as guid_registro
            , cast(modifieddate as timestamp) as ts_modificacao
        from fonte_person
    )

select *
from renomeado