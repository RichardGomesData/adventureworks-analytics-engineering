with fonte_employee as (

    select *
    from {{ source('adventure_works', 'humanresources_employee') }}

),

renomeado as (

    select
        cast(businessentityid as int) as pk_employee
        , nationalidnumber as numero_identificacao
        , loginid as login_usuario
        , jobtitle as cargo
        , cast(birthdate as timestamp) as dt_nascimento
        , maritalstatus as estado_civil
        , gender as genero
        , cast(hiredate as timestamp) as dt_contratacao
        , salariedflag as flg_salario_fixo
        , cast(vacationhours as int) as horas_ferias
        , cast(sickleavehours as int) as horas_licenca_medica
        , currentflag as flg_funcionario_ativo
        , rowguid as guid_registro
        , cast(modifieddate as timestamp) as ts_modificacao
        , organizationnode as no_organizacional

    from fonte_employee

)

select *
from renomeado