{% macro get_unpivot_columns(source_table) %}
    {% set columns = adapter.get_columns_in_relation(source_table) %}
    {% set unpivot_cols = [] %}
    
    {% for col in columns %}
        {% if col.name not in ['Ecosystem_Croptype', 'Geolocation'] %}
            {# Isasama lang natin kung string ang data type o kung ito ay taon/quarter #}
            {% if col.data_type in ['string', 'STRING', 'text', 'TEXT'] %}
                {% do unpivot_cols.append("`" ~ col.name ~ "`") %}
            {% endif %}
        {% endif %}
    {% endfor %}

    {{ return(unpivot_cols | join(', ')) }}
{% endmacro %}