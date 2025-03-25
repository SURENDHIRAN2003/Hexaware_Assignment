select pname,pprice from product where pprice>=
(select avg(pprice) from product)