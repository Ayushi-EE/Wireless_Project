%initializations
tic ;
NoisePower = 1; 
SignalPower = 30; 
iter = 10; %Number of iteration
time_len = 100; 
Th_max = 0 ; % intializing throughput
Tempstart = 200; 
Tempstop = 0.0001 ; 
Temp_i= Tempstart ; 
Temp_c = 10.^(log10(Tempstop / Tempstart) /time_len ) ; %Temprature coefficient
Th_vec = zeros ( iter , 1 ) ; % intializing output vector
Th_Mean = zeros ( time_len , 1 ) ;
Time_vec = zeros ( time_len , 1 ) ;
Sample_Num = iter / 10;
Sample_point = fix ( 1:Sample_Num/(iter-1):Sample_Num ) ; 
Th_vecdoc = zeros (Sample_Num, 1 ) ;
AP_Num = 6 ;
UE_Num = 6 ;
Num_of_loc = 100;
Channel_mat = randn( Num_of_loc )+randn( Num_of_loc )*1i ; %Chanel Matrices
AP_loc = randi(Num_of_loc,[1,AP_Num]) ;
UE_loc = randi(Num_of_loc,[1,UE_Num]) ; 
for i = 1 : time_len
      Temp_i = Temp_i*Temp_c ;
      for j = 1 : iter
          [AP_loc,UE_loc] = New_AP_UE_Index ( AP_loc,UE_loc,Num_of_loc ) ;
            AP_loc = Reject_Eq_Loc ( AP_loc , Num_of_loc ) ;
            UE_loc = Reject_Eq_Loc (UE_loc , Num_of_loc ) ;
            Channel_mat_m= Channel_mat( AP_loc , UE_loc ) ; 
            Th_m = log10(det((eye (AP_Num)+( SignalPower / NoisePower ) *(Channel_mat_m*Channel_mat_m' ))));
        % Optimal throghput assignment
           if Th_m > Th_max          
               AP_loc_optimal = AP_loc ;
               UE_loc_optimal = UE_loc ;
               Th_max = Th_m;
         %accepting throghput based on mcmc
           elseif exp((Th_m - Th_max)/Temp_i) > rand
            AP_loc_optimal = AP_loc ;
            UE_loc_optimal = UE_loc ;
            Th_max = Th_m;
          end
         Th_vec (j) = real(Th_max) ;
      end
      %reducing the number of samples
    Th_vecdoc((i*Sample_Num)-(Sample_Num-1) : i *Sample_Num) = Th_vec(Sample_point);
    Time_vec(i) = Temp_i;
    Th_Mean(i) = mean(Th_vec) ;
end
i = toc ;
disp('time_instances') , disp(i)
disp('The_Best_Location_for_The_AP_UE_with_association : ' ),disp(AP_loc_optimal) ;
disp(UE_loc_optimal)
subplot( 2 , 2 , 4 )
plot(Th_Mean)
subplot ( 2 , 2 , 3 )
plot(Time_vec)
subplot( 2 , 2 , 1 : 2 )
plot (Th_vecdoc)
