with contacts as (
    select
        *,
        to_date(created_at, 'YYYY-MM-DD') as created_date,
        to_char(date_trunc('week', created_date) + interval '1 day', 'yyyy-mm-dd') as created_week,
        to_char(created_date, 'YYYY-MM') as created_month
    from {{ ref('contacts')}}
)

select * from contacts;