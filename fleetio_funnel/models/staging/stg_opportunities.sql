with opportunities as (
    select
        *,
        to_date(created_at, 'YYYY-MM-DD') as created_date,
        to_char(date_trunc('week', created_date) + interval '1 day', 'yyyy-mm-dd') as created_week,
        to_char(created_date, 'YYYY-MM') as created_month,
        to_date(closed_at, 'YYYY-MM-DD') as closed_date,
        to_char(date_trunc('week', closed_date) + interval '1 day', 'yyyy-mm-dd') as closed_week,
        to_char(closed_date, 'YYYY-MM') as closed_month
    from {{ ref('opportunities')}}
)

select * from opportunities;