with dates as (

    select explode(
        sequence(
            to_date('2000-01-01'),
            to_date('2030-01-01'),
            interval 1 day
        )
    ) as pk_date

)

select

    pk_date

    , day(pk_date) as dia
    , month(pk_date) as mes
    , year(pk_date) as ano
    , quarter(pk_date) as trimestre

    , date_format(pk_date, 'MMMM') as nome_mes
    , date_format(pk_date, 'EEEE') as nome_dia_semana

    , weekofyear(pk_date) as semana_ano

    , case
        when dayofweek(pk_date) in (1,7) then true
        else false
      end as fim_de_semana

    , concat(year(pk_date), '-', lpad(month(pk_date),2,'0')) as ano_mes

from dates