with accounts as (
    select * from {{ ref('accounts')}}
)

select * from accounts;