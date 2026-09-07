{# A basic example for a project-wide macro to cast a column uniformly #}


{% macro cents_to_dollars(column_name) %}
    round(cast(({{ column_name }} / 100) as numeric), 2)
{% endmacro %}


{% macro get_vendor_name(vendor_id) %}
    case {{ vendor_id }}
        when 1 then 'Creative Mobile Technologies, LLC'
        when 2 then 'Curb Mobility, LLC'
        when 6 then 'Myle Technologies Inc'
        when 7 then 'Helix'
        else 'Unknown Company'
    end
{% endmacro %}


{% macro get_payment_type(payment_type_id) %}
    case {{ payment_type_id }}
        when 0 then 'Flex Fare trip'
        when 1 then 'Credit card'
        when 2 then 'Cash'
        when 3 then 'No charge'
        when 4 then 'Dispute'
        when 5 then 'Unknown'
        when 6 then 'Voided trip'
        else 'Unknown Payment Type'
    end
{% endmacro %}

{% macro get_rate_code_name(rate_code_id) %}
    case {{ rate_code_id }}
        when 1 then 'Standard rate'
        when 2 then 'JFK'
        when 3 then 'Newark'
        when 4 then 'Nassau or Westchester'
        when 5 then 'Negotiated fare'
        when 6 then 'Group ride'
        when 99 then 'Null/unknown'
        else 'Unknown Rate Code'
    end
{% endmacro %}
