#1
select concat(FIRSTNAME,' ',LASTNAME) as "Costumer Name", STR_TO_DATE(cont.Date, '%Y-%m-%d') Date, p.Property_type as "Product Bought" from costumer cost, contract cont, properties p where cont.costumer_id = cost.Costumer_ID and p.property_id = cont.property_id and cont.Date between '2020-01-01' AND '2020-08-01';

#2
select concat(FIRSTNAME,' ',LASTNAME) as "Costumer Name", sum(Price) as "Total" from costumer co, contract cont,properties p where co.costumer_id = cont.costumer_id and p.property_id = cont.property_id group by concat(FIRSTNAME) order by sum(Price) DESC limit 3;

#3
select round(sum(price)/24,2) as "Sales by month", sum(price)/2 as "Sales by year" from contract cont, properties p where p.property_id = cont.property_id;

#4
select sum(price) "Total Sales", l.town Town from contract cont,properties p, location l where p.property_id = cont.property_id and l.zipcode = p.zipcode group by l.town;

#5
select distinct l.town Town from location l, contract cont, properties p where l.zipcode = p.zipcode and cont.Property_ID = p.Property_ID and cont.costumerrating is not null;


#view
create view INVOICE as 
select cont.contract_id Invoice_Number, STR_TO_DATE(cont.Date, '%Y-%m-%d') "Date of Issue", 'Socially anxious Real Estate' as "Company Name", 'Rua Julio Costa, 1020-351' as "Company Address", 'socialanxiousre@gmail.com' as "Company Email", 'socialanxiousre.pt' as "Company Website", 
c.firstname as "Client Name", c.address as "Client Address", c.zipcode "ZipCode", lo_cost.city "City", lo_cost.town "Town", concat(p.Property_Type,'(T',p.NumberOfRooms,')',' - ', lo_pro.town,', ', lo_pro.city) as "Item Description", p.price as "Unit Cost"  
from costumer c, contract cont, properties p, location lo_pro, location lo_cost where cont.costumer_id = c.Costumer_ID
and lo_pro.zipcode = p.zipcode and lo_cost.zipcode = c.zipcode and cont.property_id = p.Property_ID; 

select * from INVOICE;

select * from INVOICE where Invoice_Number = 1;
