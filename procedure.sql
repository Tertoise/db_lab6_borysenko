-- Процедура отримує на вхід назву і опис нового регіону і додає в таблицю region
CREATE OR REPLACE PROCEDURE add_region(
    region_name_in VARCHAR(30),
    region_description_in VARCHAR(50)
)
AS $$
BEGIN
    INSERT INTO region(region_name, region_description)
    VALUES (region_name_in, region_description_in);
END;
$$ LANGUAGE plpgsql;