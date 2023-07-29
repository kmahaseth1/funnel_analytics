with conversion_opportunity_by_industry as (
    select
        l.industry,
        l.created_date as lead_created_date,
        l.converted_date,
        o.id as opportunity_id,
        o.account_id,
        o.created_date as opportunity_created_date,
        o.closed_date,
        o.is_won
    from {{ ref('stg_leads') }} l
    left join {{ ref('stg_opportunities') }} o
        on l.converted_date = o.closed_date
)

select * from conversion_opportunity_by_industry;