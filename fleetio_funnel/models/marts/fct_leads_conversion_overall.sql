with leads_conversion as (
    select
        created_date,
        created_week,
        created_month,
        count(*) as total_leads,
        count(case when converted_date is not null then 1 end) as converted_leads,
        converted_leads::float / total_leads as conversion_rate
    from {{ ref('stg_leads') }}
    group by 1, 2, 3
)

select * from leads_conversion;