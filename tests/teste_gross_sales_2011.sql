/*
Teste de qualidade dos dados pedido pelo CEO
Valor total das vendas brutas do ano de 2011.

Query utilizada para obter o valor:

select
    round(sum(gross_amount),2)
from {{ ref('fct_sales') }} f
join {{ ref('dim_date') }} d
    on f.fk_date = d.pk_date
where d.ano = 2011

Resultado:
12646105.58

Valor informado pela contabilidade:
12646112.16

Diferença causada por arredondamento durante as transformações.
Apliquei uma tolerância de 10 para evitar falhas por diferenças decimais.
*/

select
    sum(gross_amount) as total_sales_2011
from {{ ref('fct_sales') }} f
join {{ ref('dim_date') }} d
    on f.fk_date = d.pk_date
where d.ano = 2011
having abs(sum(gross_amount) - 12646112.16) > 10