-- Кожен раз коли в таблицю region додають новий регіон, його заглавна літера стає великою
CREATE OR REPLACE FUNCTION capitalize_first_letter()
RETURNS TRIGGER AS $$
BEGIN
    NEW.region_name = INITCAP(NEW.region_name);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER capitalize_region_name
BEFORE INSERT ON region
FOR EACH ROW
EXECUTE FUNCTION capitalize_first_letter();

-- Принцип роботи: функція - повертає нове значенняя деякого слова з заглавною буквою, 
--				   виклик трігера - кожен раз перед INSERT для кожного рядка запускається тригерна функція