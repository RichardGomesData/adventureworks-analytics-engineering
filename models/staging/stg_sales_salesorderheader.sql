with
    fonte_salesorderheader as (
        select *
        from {{ source('adventure_works', 'sales_salesorderheader') }}

    )

    , renomeado as (
        select
            cast(salesorderid as int) as pk_pedido
            , cast(revisionnumber as int) as revisao_pedido
            , cast(orderdate as date) as dt_pedido
            , cast(duedate as date) as dt_vencimento
            , cast(shipdate as date) as dt_envio
            , cast(status as int) as status_pedido
            , onlineorderflag as flg_pedido_online
            , purchaseordernumber as numero_pedido_compra
            , accountnumber as numero_conta_cliente
            , cast(customerid as int) as fk_cliente
            , cast(salespersonid as int) as fk_vendedor
            , cast(territoryid as int) as fk_territorio
            , cast(billtoaddressid as int) as fk_endereco_cobranca
            , cast(shiptoaddressid as int) as fk_endereco_entrega
            , cast(shipmethodid as int) as fk_metodo_envio
            , cast(creditcardid as int) as fk_cartao_credito
            , creditcardapprovalcode as codigo_aprovacao_cartao
            , cast(currencyrateid as int) as fk_taxa_cambio
            , cast(subtotal as double) as vl_subtotal
            , cast(taxamt as double) as vl_imposto
            , cast(freight as double) as vl_frete
            , cast(totaldue as double) as vl_total_pedido
            , comment as comentario_pedido
            , rowguid as guid_registro
            , cast(modifieddate as timestamp) as ts_modificacao
        from fonte_salesorderheader
    )

select *
from renomeado
