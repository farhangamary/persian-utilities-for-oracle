create or replace
FUNCTION Gregorian_To_Persian  (Md Date) 

return varchar 

is  

IGregorianMonth int;
IGregorianDay int;
IGregorianYear int;
 
DayCount  number(19);

FarvardinDaydiff  number(19);

DeyDayDiff number(19);

PersianMonth  int;
Persianday  int;
PersianYear  int;

y1 varchar(4);
m1 varchar(2);
d1 varchar(2);

ReturnDate varchar(10);

begin

IGregorianYear := extract(year from Md);
IGregorianMonth := extract(month from Md);
IGregorianDay := extract(day from Md);
FarvardinDaydiff := 79;



if ((IGregorianYear mod  100=0  and IGregorianYear mod 400=0)  or (IGregorianYear mod  100<>0  and IGregorianYear mod 4=0))
then
     DayCount := case IGregorianMonth  
                                    when 1 then 0
                                    when 2 then 31
                                    when 3 then 60
                                    when 4  then 91
                                    when 5  then 121
                                    when 6  then 152
                                    when 7  then 182
                                    when 8  then 213
                                    when 9  then 244
                                    when 10  then 274
                                    when 11  then 305
                                    when 12  then 335
                                end;
else
     DayCount := case IGregorianMonth  
                                    when 1 then 0
                                    when 2 then 31
                                    when 3 then 59
                                    when 4  then 90
                                    when 5  then 120
                                    when 6  then 151
                                    when 7  then 181
                                    when 8  then 212
                                    when 9  then 243
                                    when 10  then 273
                                    when 11  then 304
                                    when 12  then 334
                                end;
end if;
                                
DayCount := DayCount+IGregorianDay;
---------------
if (((IGregorianYear-1) mod  100=0  and (IGregorianYear-1) mod 400=0)  or ((IGregorianYear -1)mod  100<>0  and (IGregorianYear -1)mod 4=0))
then
  DeyDayDiff := 11;
else
  DeyDayDiff := 10;
end if;
---------------
If (DayCount > FarvardinDaydiff) 
then
            DayCount := DayCount - FarvardinDaydiff;
            If (DayCount <= 186)
            then
                  if (DayCount mod  31 = 0) 
                  then    
                       PersianMonth := DayCount / 31;
                       Persianday := 31;
		          else
                       PersianMonth := (DayCount / 31) + 1;
                       Persianday := (DayCount mod 31);
                  end if;
                  PersianYear := IGregorianYear - 621;
            Else
                DayCount := DayCount - 186;
                if  (DayCount mod 30 =0 )
                then 
                       PersianMonth := (DayCount / 30) + 6;
                       Persianday := 30;
                Else
                       PersianMonth := (DayCount / 30) + 7;
                       Persianday := (DayCount mod 30);
                end if; 
                PersianYear := IGregorianYear - 621;
            end if; 
else
           DayCount := DayCount + DeyDayDiff;
           if (DayCount mod 30 =0)
           then
                    PersianMonth := (DayCount / 30) + 9;
                    Persianday := 30;
           else
                    PersianMonth := (DayCount / 30) + 10;
                    Persianday := (DayCount mod 30);
           end if;
           PersianYear := IGregorianYear - 622;
end if;
        y1 := cast(PersianYear as varchar);
        If (length(cast(PersianMonth as varchar)) = 1 )
        then  
            m1 := '0' || cast(PersianMonth as varchar);
        Else
            m1 :=  cast(PersianMonth as varchar);
        end if;
        If (length (cast(Persianday as varchar)) = 1) 
        then
             d1 := '0' || cast(Persianday as varchar);
        Else
             d1 := cast(Persianday as varchar);
        end if;
        ReturnDate := y1 || '/' || m1 || '/' || d1;
        return ReturnDate;
End;
