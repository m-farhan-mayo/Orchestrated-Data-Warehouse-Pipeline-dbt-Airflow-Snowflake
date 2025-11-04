{% macro discounted_amount(extended_price, discount, scale=2) %}
    (-1 *{{ discount }} *{{ extended_price }})::decimal(16, {{ scale }})
{% endmacro %}