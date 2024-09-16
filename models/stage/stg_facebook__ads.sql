with base as (
    select
        *,
        views + comments + clicks + likes + shares as engagements,
    from {{ ref('base_facebook__ads') }}
)

select *
from base