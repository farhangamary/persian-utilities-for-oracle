create or replace
Function Persian_To_Gregorian (InputDate varchar) 
 -- The format for inout Persian dates is: 'YYYY/MM/DD'.
Return Date
Is
PDate varchar(10);
PYear Int;
PMonth Int;
PDay Int;
DiffY Int;
Days Int;
ReturnDate Date;

Begin
PDate := InputDate;
PDate := SUBSTR(PDate,-8);
PYear := SUBSTR(PDate,1,2);
PMonth := SUBSTR(PDate,4,2);
PDay := SUBSTR(PDate,7,2);
DiffY := PYear-50;

Days := DiffY*365.24 +
	CASE
           WHEN PMonth<7 THEN (PMonth-1)*31
           ELSE 186+(PMonth-7)*30
        END +
	PDay;

ReturnDate := TO_DATE('03/21/1971','MM/DD/YYYY');
ReturnDate := ReturnDate + Days;

Return ReturnDate;

End;
