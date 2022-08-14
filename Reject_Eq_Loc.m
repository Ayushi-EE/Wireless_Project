function Output = Reject_Eq_Loc (AP_loc,Num_of_loc )
Num_AP_loc = length(AP_loc) ;
for i = 2:Num_AP_loc
    for j = 1:i-1
        while AP_loc(i) == AP_loc
          l = randi(Num_of_loc);
            for i = 1:j
                if AP_loc(k)==l
                    break
                end
                if k == j
                    AP_loc(i) = l;
                end
            end
         end
     end
end
Output = AP_loc;