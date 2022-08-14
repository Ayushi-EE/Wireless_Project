*********************************************************************************************************************************************************
                               
                                                                  SYSTEM REQUIREMENTS

* 1. Windows 10 (version 1909 or higher)/macOS Monterey (12)/macOS Big Sur (11.6)
/macOS Catalina (10.15.7)/Ubuntu 20.04 LTS
/Ubuntu 18.04 LTS/Debian 10/Red Hat Enterprise Linux 8 (minimum 8.1)/
Red Hat Enterprise Linux 7 (minimum 7.6)/SUSE Linux Enterprise Desktop 12 (minimum SP2)
SUSE Linux Enterprise Desktop 15/SUSE Linux Enterprise Server 12 (minimum SP2)
/SUSE Linux Enterprise Server 15
* 2. Processor Minimum: Any Intel or AMD x86-64 processor
* 3. RAM: 4 GB/8 GB 
* 4. Storage: 3.7 GB for just MATLAB
              5-8 GB for a typical installation
              30 GB for an all-products installation
              An SSD is strongly recommended

*********************************************************************************************************************************************************

                                                                     PROJECT DESCRIPTION
                                                                     
*Finding optimal association for AP-UE pair is a cumbersome task by exhaustive search. For example, in MIMO scenarios with N APs and N UEs, there are 
N^N  possible solution. So, it is computationally infeasible to obtain an optimal solution in an exhaustive way. So, here we used local search 
optimization techniques to find the optimal solution in limited iterations (i.e., reducing computational overhead). For our case, we have used 
MCMC (simulated annealing principle) which only depends upon the current state to predict the next optimal state. Here state represents the AP-UE 
index(location).

*We used the scheme to find user associations based on their location; for example, we took 100 different locations for APs and UEs and used this location 
index as a state for MCMC to iterate over. In our case, we have taken 6 APs and 6 UEs and selected locations using MCMC.



*********************************************************************************************************************************************************


                                                                          QUICK START

---------------------------------------------------------------------------------------------------------------------------------------------------------
File Name       |                                                         Functionality
---------------------------------------------------------------------------------------------------------------------------------------------------------New_AP_UE_Index | The function of this file gives the random location for the AP and UE in each iteration
---------------------------------------------------------------------------------------------------------------------------------------------------------Reject_Eq_Loc   | The function of This file helps in avoiding the same location for AP and UE, such that every AP can have a unique UE to transmit.
---------------------------------------------------------------------------------------------------------------------------------------------------------Mcmc_for_mimo   | This is the main file that calls the other files and takes input arguments to give optimal User association and their position such 
                | that the throughput of the channel is maximized.
---------------------------------------------------------------------------------------------------------------------------------------------------------

**********************************************************************************************************************************************************




