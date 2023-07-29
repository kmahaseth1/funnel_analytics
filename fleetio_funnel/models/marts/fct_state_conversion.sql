with conversion_opportunity_by_state as (
    select
        a.state,
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
    join {{ ref('stg_accounts') }} a
        on l.company = a.company
)

select * from conversion_opportunity_by_state;