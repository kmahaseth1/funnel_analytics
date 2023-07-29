with leads as (
    select
        *,
        to_date(created_at, 'YYYY-MM-DD') as created_date,
        to_char(date_trunc('week', created_date) + interval '1 day', 'yyyy-mm-dd') as created_week,
        to_char(created_date, 'YYYY-MM') as created_month,
        to_date(converted_at, 'YYYY-MM-DD') as converted_date,
        to_char(date_trunc('week', converted_date) + interval '1 day', 'yyyy-mm-dd') as converted_week,
        to_char(converted_date, 'YYYY-MM') as converted_month
    from {{ ref('leads')}}
)

select * from leads;
