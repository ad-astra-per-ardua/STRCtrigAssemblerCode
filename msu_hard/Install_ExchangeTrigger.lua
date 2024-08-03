function Install_ExchangeTrigger()
    for i = 0, 3 do
        TriggerX(P8,{Command(Force1,Exactly,i+1,111)},{SetNDeaths(FP,SetTo,i+1,P_Count)},{Preserved}) -- 상시 플레이어수 체크
    end
    
    
    CIfX(Force1, CDeaths(FP, Exactly, 1, Difficulty))
        for i = 0, 3 do
            for j = 15, 0, -1 do
            Trigger {
                    players = {Force1},
                    conditions = {
                            Label(0);
                            Score(CurrentPlayer,Kills,AtLeast,2^j*100); 
                            NDeaths(FP,Exactly,i+1,P_Count); 
                        },
                    actions = {
                            SetScore(CurrentPlayer,Subtract,2^j*100,Kills);
                            SetResources(CurrentPlayer,Add,2^j*ExRate[i+1],Ore);
                            PreserveTrigger()
                            }
            }
            end 
        end
        CElseIfX(CDeaths(FP, Exactly, 2, Difficulty))
        for i = 0, 3 do
            for j = 15, 0, -1 do
            Trigger {
                    players = {Force1},
                    conditions = {
                            Label(0);
                            Score(CurrentPlayer,Kills,AtLeast,2^j*100); 
                            NDeaths(FP,Exactly,i+1,P_Count); 
                        },
                    actions = {
                            SetScore(CurrentPlayer,Subtract,2^j*100,Kills);
                            SetResources(CurrentPlayer,Add,2^j*HDrate[i+1],Ore);
                            PreserveTrigger()
                            }
            }
            end 
        end
        CIfXEnd()
    end
