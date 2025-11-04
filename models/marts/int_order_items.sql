SELECT 
    line_items.order_item_key,
    line_items.part_key,
    line_items.line_number,
    orders.order_key,
    orders.cust_key,
    orders.order_date,
    {{discounted_amount("line_items.extended_price", "line_items.discount")}} as discount_amount
FROM
    {{ ref('stg_tpch_orders') }} as orders 
JOIN
    {{ ref('stg_tpch_line_items') }} as line_items
    on orders.order_key = line_items.order_key
ORDER BY 
    orders.order_date