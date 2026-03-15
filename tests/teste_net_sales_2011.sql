/*
Teste de qualidade dos dados pedido pelo CEO
Valor total das vendas brutas do ano de 2011.

Query utilizada para obter o valor:

select
    round(sum(net_amount),2)
from {{ ref('fct_sales') }} f
join {{ ref('dim_date') }} d
    on f.fk_date = d.pk_date
where d.ano = 2011

Resultado :
12641665.61

Seguindo o mesmo padrão, que fiz nas vendas brutas,apliquei uma tolerância de 10 para evitar falhas por diferenças decimais.

*/

select
    sum(net_amount) as total_sales_2011
from {{ ref('fct_sales') }} f
join {{ ref('dim_date') }} d
    on f.fk_date = d.pk_date
where d.ano = 2011
having abs(sum(net_amount) - 12641665.61) > 10