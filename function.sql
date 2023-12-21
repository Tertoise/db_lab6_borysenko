-- функція отримує на вхід назву регіону і повертає назви всіх карт в цьому регіоні разом з їхньою вартістю, а також їхній тип
CREATE OR REPLACE FUNCTION get_cards_in_region(region_name_in VARCHAR)
RETURNS TABLE (
    card_type TEXT,
    card_name VARCHAR(30),
    card_cost INT
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        'unit' AS card_type,
        unit_card.name AS card_name,
        unit_card.cost AS card_cost
    FROM
        region_units
    JOIN unit_card ON region_units.unit_id = unit_card.unit_id
    WHERE
        region_units.region_name = region_name_in
    
    UNION ALL
    
    SELECT
        'spell' AS card_type,
        spell_card.name AS card_name,
        spell_card.cost AS card_cost
    FROM
        region_spells
    JOIN spell_card ON region_spells.spell_id = spell_card.spell_id
    WHERE
        region_spells.region_name = region_name_in;

END;
$$ LANGUAGE plpgsql;

-- drop function if exists get_cards_in_region(VARCHAR)
