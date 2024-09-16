{% macro select_present_complete_with_missing_columns(
    relation, required_column_names, required_column_types
) %}
    {# relation as Relation; required_columns_names as list #}
    {%- set present_columns = adapter.get_columns_in_relation(relation) -%}
    {%- set present_column_names = [] -%}
    {%- for column in present_columns -%}
        {%- set present_column_names = present_column_names.append(column.name) -%}
    {%- endfor -%}

    {% for (field_name, field_type) in zip(required_column_names, required_column_types) -%}
        {% if field_name in present_column_names -%} cast({{ field_name }} as {{ field_type }}) as {{ field_name }},
        {% else -%} cast(null as {{ field_type }}) as {{ field_name }},
        {% endif -%}
    {%- endfor -%}

{% endmacro %}
