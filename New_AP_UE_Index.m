function [ AP_loc , UE_loc ] = New_AP_UE_Index ( AP_loc , UE_loc, Num_of_loc )
Num_AP_loc = length ( AP_loc ) ;
Num_UE_loc = length (UE_loc ) ;
AP_loc_index = randi(Num_AP_loc);
UE_loc_index =  randi(Num_UE_loc);
m = fix ( 2*rand) ;
if m == 0
m = -1;
end
Upt_AP_index = AP_loc(AP_loc_index ) + m ;
if Upt_AP_index == Num_of_loc+1
AP_loc ( AP_loc_index ) = 1 ;
elseif Upt_AP_index == 0
AP_loc ( AP_loc_index ) = Num_of_loc ;
else
AP_loc ( AP_loc_index ) = Upt_AP_index ;
end
n = fix(2*rand) ;
if n == 0
n = -1;
end
Upt_UE_index = UE_loc ( UE_loc_index ) + n ;
if Upt_UE_index == Num_of_loc+1
UE_loc(UE_loc_index ) = 1 ;
elseif Upt_UE_index == 0
UE_loc(UE_loc_index) = Num_of_loc ;
else
UE_loc(UE_loc_index) = Upt_UE_index ;
end
