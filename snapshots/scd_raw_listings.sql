{% snapshot scd_raw_listings %}

    {{
        config(
            target_schema="dbt_test",
            unique_key="id",
            strategy="timestamp",
            updated_at="updated_at",
            invalidate_hard_deletes=True,
        )
    }}

    select *
    from {{ source("dbt_test", "listings") }}

{% endsnapshot %}
