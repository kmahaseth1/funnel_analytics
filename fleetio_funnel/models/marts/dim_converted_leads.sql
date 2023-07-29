with converted_leads as (
    select
        c.id as contact_id,
        a.id as account_id,
        c.lead_id as lead_id,
        c.created_date as lead_created_date,
        a.company as company,
        a.state as account_state,
        a.industry as industry,
        a.fleet_size as fleet_size
    from {{ ref('contacts') }} c
    left join {{ ref('accounts') }} a
        on a.id = c.account_id
)

select * from converted_leads;


