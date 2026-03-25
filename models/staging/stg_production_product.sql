with fonte_product as (

    select *
    from {{ source('adventure_works', 'production_product') }}

),

renomeado as (

    select
        cast(productid as int) as pk_product
        , name as nome_produto
        , productnumber as numero_produto
        , makeflag as flg_producao_interna
        , finishedgoodsflag as flg_produto_finalizado
        , color as cor
        , cast(safetystocklevel as int) as nivel_estoque_seguranca
        , cast(reorderpoint as int) as ponto_reposicao
        , cast(standardcost as decimal(18,2)) as custo_padrao
        , cast(listprice as decimal(18,2)) as preco_lista
        , size as tamanho
        , sizeunitmeasurecode as unidade_tamanho
        , weightunitmeasurecode as unidade_peso
        , cast(weight as decimal(18,2)) as peso
        , cast(daystomanufacture as int) as dias_para_fabricacao
        , productline as linha_produto
        , class as classe_produto
        , style as estilo_produto
        , cast(productsubcategoryid as int) as fk_product_subcategory
        , cast(productmodelid as int) as fk_product_model
        , cast(sellstartdate as timestamp) as dt_inicio_venda
        , cast(sellenddate as timestamp) as dt_fim_venda
        , cast(discontinueddate as timestamp) as dt_descontinuacao
        , rowguid as guid_registro
        , cast(modifieddate as timestamp) as ts_modificacao
    from fonte_product

)

select *
from renomeado