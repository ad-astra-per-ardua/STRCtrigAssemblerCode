function Define_Variable()
    SMarineArray = {16,10,1,99,100}
    HPValue = CreateVar(FP)
    ----- HP Upgrade Trigger

    for i = 0, 4 do
        f_Bread(FP, 0x58D2B0 + (i * 46) + 15, HPValue)
        CDoActions(FP, {
            TSetMemory(0x662350 + SMarineArray[i+1] * 4, SetTo, _Add(_Mul(HPValue, 250*256),5500*256))
        },preserved)
        
    end
    ----- End of HP Upgrade Trigger

    -- Healzone function
    
    DoActions(FP, AddCD(healzone, 1), preserved)
    TriggerX(FP, {CDeaths(FP, AtLeast, 204, healzone)}, {

        ModifyUnitHitPoints(All, "Men", Force1, "home", 100),
        ModifyUnitShields(All, "Men", Force1, "home", 100),
        
        ModifyUnitHitPoints(All, "Factories", Force1, "home", 100),
        ModifyUnitShields(All, "Factories", Force1, "home", 100),
        
        SetCD(healzone, 1)
    }, preserved)

    TriggerX(FP, Always(), {
        RemoveUnit("Men", P12),
        RemoveUnit(111, P12),
        RemoveUnit(122, P12),
        RemoveUnit(107, P12)
    }, preserved)

    ------- Medic Heal Trigger --- 

    --- 1 Tick heal ----
    MedicDelay = {34,21,23}
    
    for i = 0, 4 do 
        for e = 1, 3 do
            TriggerX(i, {
                Command(CurrentPlayer, AtLeast, 1, MedicDelay[e])
            }, {
                ModifyUnitHitPoints(All, "Men", CurrentPlayer, "Anywhere", 100),
                ModifyUnitShields(All, "Men", CurrentPlayer, "Anywhere", 100),
                RemoveUnitAt(All, MedicDelay[e], "MainLocation", i)
            }, preserved)
        end
    end 


    --- Time switch Phase | Trigger unit == 22 ---
    Medic_SwitchArray = {34,21,23}
    
    for i = 0 , 4 do
        TriggerX(i, {
            Always();
        }, {
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[1],SetTo,1);
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[2],SetTo,0);
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[3],SetTo,0);
        })
    end



    for i = 0, 4 do

        TriggerX(i, {
            CDeaths(i, Exactly, 0, DelayMedic),
            Bring(i, AtLeast, 1, 22, "MainLocation")
        }, {
            RemoveUnit(22, i),
            DisplayText(StrDesignX("Delay Medic 1 -> 2 Tick"), 4),
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[1],SetTo,0);
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[2],SetTo,1);
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[3],SetTo,0);
            SetCDeaths(i, SetTo, 1, DelayMedic)
        }, preserved)


        TriggerX(i, {
            CDeaths(i, Exactly, 1, DelayMedic),
            Bring(i, AtLeast, 1, 22, "MainLocation")
        }, {
            RemoveUnit(22, i),
            DisplayText(StrDesignX("Delay Medic 2 -> 3 Tick"), 4),
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[1],SetTo,0);
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[2],SetTo,0);
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[3],SetTo,1);
            SetCDeaths(i, SetTo, 2, DelayMedic)
        }, preserved)


        TriggerX(i, {
            CDeaths(i, Exactly, 2, DelayMedic),
            Bring(i, AtLeast, 1, 22, "MainLocation")
        }, {
            RemoveUnit(22, i),
            DisplayText(StrDesignX("Delay Medic 3 -> 1 Tick"), 4),
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[1],SetTo,1);
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[2],SetTo,0);
            SetMemoryBA(0x57F27C+(228*i)+Medic_SwitchArray[3],SetTo,0);
            SetCDeaths(i, SetTo, 0, DelayMedic)
        }, preserved)
    end

----------- Marine Create and movelocation + Convert Trigger ----------

    --- Create Marine and SCV ---

    TriggerX(Force1, {
        Bring(CurrentPlayer, AtLeast, 1, 0, "MainLocation");
        
    }, {
        CreateUnit(1, 0, "home", CurrentPlayer);
        RemoveUnitAt(1, 0, "MainLocation", CurrentPlayer);
    }, preserved)


    
    TriggerX(Force1, {
        Bring(CurrentPlayer, AtLeast, 1, 20, "MainLocation");
    }, {
        CreateUnit(1, 20, "home", CurrentPlayer);
        RemoveUnitAt(1, 20, "MainLocation", CurrentPlayer);
    }, preserved)
    


for i = 0 , 4 do
    CIfX(Force1, CDeaths(i, AtLeast, 12, Combine_marine))

    TriggerX(Force1, { -- Check instant create phase
        Bring(CurrentPlayer, AtLeast, 1, 16, "MainLocation");
    }, {
        DisplayText(StrDesign2X("Instant SMarine Created"), 4);
        CreateUnit(1, 16, "home", CurrentPlayer);
        RemoveUnitAt(1, 16, "MainLocation", CurrentPlayer);
    }, preserved)

    CElseX()

    TriggerX(Force1, { -- Check instant create phase
        Bring(CurrentPlayer, AtLeast, 1, 16, "MainLocation");
    }, {
        DisplayText(StrDesign2X("Instant SMarine Create failed flag. Resource Returned. "), 4);
        RemoveUnitAt(1, 16, "MainLocation", CurrentPlayer);
        SetResources(CurrentPlayer, Add, 32500, Ore);
    }, preserved)

    CIfXEnd()


    TriggerX(Force1, {
        Bring(CurrentPlayer, AtLeast, 1, 7, "MainLocation");
    }, {
        CreateUnit(1, 7, "home", CurrentPlayer);
        RemoveUnitAt(1, 7, "MainLocation", CurrentPlayer);
    }, preserved)

    --- Instant create Special marine Algorithm ---

    --- Convert Marine Trigger

    TriggerX(Force1, { -- Marine > Hmarine
        Accumulate(CurrentPlayer, AtLeast, 7500, Ore);
        Bring(CurrentPlayer, AtLeast, 1, 0, "convertH");
    }, {
        SetResources(CurrentPlayer, Subtract, 7500, Ore);
        CreateUnit(1, 20, "home", CurrentPlayer);
        RemoveUnitAt(1, 0, "convertH", CurrentPlayer);
    }, preserved)


    TriggerX(Force1, { -- Hmarine > Smarine
        Accumulate(CurrentPlayer, AtLeast, 15000, Ore);
        Bring(CurrentPlayer, AtLeast, 1, 20, "convertH");
    }, {
        SetResources(CurrentPlayer, Subtract, 15000, Ore);
        RemoveUnitAt(1, 20, "convertH", CurrentPlayer);
        CreateUnit(1, 16, "home", CurrentPlayer);
        SetCDeaths(i, Add, 1, Combine_marine);
    }, preserved)

end

------------------------ Exchange Trigger

TriggerX(FP, {Memory(0x58F44C, AtLeast, 390)},{SetMemory(0x58F44C, SetTo, 0x00000000)},preserved);
TriggerX(FP, {Always()},{SetMemory(0x58F44C, Add, 0x00000001)},preserved);
TriggerX(FP, {Always()}, {LeaderBoardComputerPlayers(Disable)})

TriggerX(FP, {Memory(0x58F44C, Exactly, 1)},{LeaderBoardScore(Kills, "\x04P\x04oints -- 【Ver。Develop \x07P\x04ast\x04】")},preserved);
TriggerX(FP, {Memory(0x58F44C, Exactly, 131)},{LeaderBoardScore(Custom, "\x08D\x04eaths -- 【Ver。Develop \x07P\x04ast\x04】")},preserved);
TriggerX(FP, {Memory(0x58F44C, Exactly, 261)},{LeaderBoardKills("Any unit", "\x04K\x04ills -- 【Ver。Develop \x07P\x04ast\x04】")},preserved);

for i = 0, 4 do
    TriggerX(FP, {Command(Force1,Exactly,i+1,111)},{SetNDeaths(FP,SetTo,i+1,P_Count)},preserved)
end

ExRate = {18,19,21,23,24}
ExRate2 = {16,17,19,20,21}
ExRate3 = {14,15,17,18,19}

-------- End of Exchange Trigger ------------


------<  기부 트리거  >--------------------------------------------- [ GiveRateUnit = 8  ]
GText1 = StrDesign2X("\x04기부금액 단위가 \x1F5,000 Ore \x04로 \x11변경\x04되었습니다.")
GText2 = StrDesign2X("\x04기부금액 단위가 \x1F10,000 Ore \x04로 \x11변경\x04되었습니다.")
GText3 = StrDesign2X("\x04기부금액 단위가 \x1F50,000 Ore \x04로 \x11변경\x04되었습니다.")
GText4 = StrDesign2X("\x04기부금액 단위가 \x1F100,000 Ore \x04로 \x11변경\x04되었습니다.")
GText5 = StrDesign2X("\x04기부금액 단위가 \x1F500,000 Ore \x04로 \x11변경\x04되었습니다.")
GText6 = StrDesign2X("\x04기부금액 단위가 \x1F1,000 Ore \x04로 \x11변경\x04되었습니다.")
-- 1000 = 0 // 5000 = 1 // 10000 = 2 // 50000 = 3 // 100000 = 4 // 500000 = 5
GTable = {{0,1,GText1},{1,2,GText2},{2,3,GText3},{3,4,GText4},{4,5,GText5},{5,0,GText6}}
--Give Trig -- [ GiveUnit (58,60,69,71,72) ]
--GiveRate 0~5 [ 5000, 10000, 50000, 100000, 500000, 1000 ]


GiveRate2 = {1000,5000,10000,50000,100000,500000}
GiveUnitID = {58,60,69,71,72}
PlayerArr = {"\x08P1","\x0EP2","\x0FP3","\x10P4","\x11P5"}

CIf(Force1,{Bring(CurrentPlayer,AtLeast,1,11,"Anywhere")})

for i = 0, 4 do
for j = 1, 6 do
Trigger {
    players = {i},
    conditions = {
            Label(0);
            NDeaths(i,Exactly,GTable[j][1],GiveRate);
            Bring(CurrentPlayer,AtLeast,1,11,"Anywhere")
        },
    actions = {
            GiveUnits(all,11,i,"Anywhere",P12);
            ModifyUnitEnergy(all, 11, P12, "Anywhere", 0);
            RemoveUnit(11,P12);
            DisplayText(GTable[j][3],4);
            SetNDeaths(i,SetTo,GTable[j][2],GiveRate);
            PreserveTrigger();
        }
}
    end
end 

CIfEnd()

for k = 0, 4 do
    for j = 0, 4 do
        if k~=j then
        CIf(k,Bring(k,AtLeast,1,GiveUnitID[j+1],"Anywhere"))
                for i = 0, 5 do
                Trigger {
                        players = {k},
                        conditions = {
                                Label(0);
                                Bring(k,AtLeast,1,GiveUnitID[j+1],"Anywhere");
                                PlayerCheck(j,1);
                                NDeaths(k,Exactly,i,GiveRate);
                                Accumulate(k,AtMost,GiveRate2[i+1],Ore);
                            },
                        actions = {
                                ModifyUnitEnergy(all, GiveUnitID[j+1], k, "Anywhere", 0);
                                RemoveUnitAt(1,GiveUnitID[j+1],"Anywhere",k);
                                DisplayText(StrDesign2X("\x12\x1F잔액\x04이 부족합니다."),4);
                                PreserveTrigger()
                            },
                    }
                Trigger {
                        players = {k},
                        conditions = {
                                Label(0);
                                Bring(k,AtLeast,1,GiveUnitID[j+1],"Anywhere");
                                PlayerCheck(j,1);
                                NDeaths(k,Exactly,i,GiveRate);
                                Accumulate(k,AtLeast,GiveRate2[i+1],Ore);
                                Accumulate(k,AtMost,0x7FFFFFFF,Ore);
                            },
                        actions = {
                                SetResources(k,Subtract,GiveRate2[i+1],Ore);
                                SetResources(j,Add,GiveRate2[i+1],Ore);
                                ModifyUnitEnergy(all, GiveUnitID[j+1], k, "Anywhere", 0);
                                RemoveUnitAt(1,GiveUnitID[j+1],"Anywhere",k);
                                DisplayText(StrDesign2X("\x12"..PlayerArr[j+1].."\x04에게 \x1F"..GiveRate2[i+1].." Ore\x04를 기부하였습니다."),4);
                                SetMemory(0x6509B0,SetTo,j);
                                DisplayText(StrDesign2X("\x12"..PlayerArr[k+1].."\x04에게 \x1F"..GiveRate2[i+1].." Ore\x04를 기부받았습니다."),4);
                                SetMemory(0x6509B0,SetTo,k);
                                PreserveTrigger();
                            },
                    }
                end
            Trigger {
                players = {k},
                conditions = {
                        Label(0);
                        Bring(k,AtLeast,1,GiveUnitID[j+1],"Anywhere");
                        PlayerCheck(j,0);
                    },
                actions = {
                        DisplayText(StrDesign2X("\x12"..PlayerArr[j+1].."\x04이(가) 존재하지 않습니다."),4);
                        ModifyUnitEnergy(all, GiveUnitID[j+1], k, "Anywhere", 0);
                        RemoveUnitAt(1,GiveUnitID[j+1],"Anywhere",k);
                        PreserveTrigger();
                            },
                    }
            
        CIfEnd()
                elseif k==j then
                    TriggerX(k,{Bring(k,AtLeast,1,GiveUnitID[j+1],"Anywhere")},{
                        DisplayText(StrDesign2X("\x08본인에게 통큰 기부를~"),4);
                        ModifyUnitEnergy(all, GiveUnitID[j+1], k, "Anywhere", 0);
                        RemoveUnitAt(1,GiveUnitID[j+1],"Anywhere",k);
                    },{Preserved})

        end 

    end 

end

--------------------- Ban Trigger ------------------------

BanText = "\x04당신은 \x11방장에 의해 \x08강제퇴장 \x04당하였습니다."
BanLocArr = {"banP1","banP2","banP3","banP4","banP5"}
for i = 0, 4 do
Trigger {
    players = {FP},
    conditions = {
            Label(0);
            Bring(Force1,AtLeast,1,15,BanLocArr[i+1]);
        },
    actions = {
            RotatePlayer({DisplayTextX(StrDesignX(BanText))},{i},FP);
            RotatePlayer({Defeat()},{i},FP);
        }
}
end



CIfX(AllPlayers, {CDeaths(FP, Exactly, 1, Difficulty)}) --- Normal plot (Past)

TriggerX(FP, {Memory(0x58F44C, Exactly, 1)},{LeaderBoardScore(Kills, "\x04P\x04oints -- 【Ver。Develop \x07P\x04ast\x04】")},preserved);
TriggerX(FP, {Memory(0x58F44C, Exactly, 131)},{LeaderBoardScore(Custom, "\x08D\x04eaths -- 【Ver。Develop \x07P\x04ast\x04】")},preserved);
TriggerX(FP, {Memory(0x58F44C, Exactly, 261)},{LeaderBoardKills("Any unit", "\x04K\x04ills -- 【Ver。Develop \x07P\x04ast\x04】")},preserved);


    for i = 0, 4 do 
        for j = 15, 0, -1 do
            TriggerX(Force1, {
                Score(CurrentPlayer, Kills, AtLeast, 2^j*100);
                Bring(CurrentPlayer, AtLeast, 1, "Men", "exl");
                NDeaths(FP, Exactly, i+1, P_Count);
            }, {
                SetScore(CurrentPlayer,Subtract,2^j*100,Kills);
                SetResources(CurrentPlayer, Add, 2^j*ExRate[i+1], Ore)
            }, preserved)
        end
    end

    for i = 0, 4 do 
        for j = 15, 0, -1 do
            TriggerX(Force1, {
                Score(CurrentPlayer, Kills, AtLeast, 2^j*100);
                Bring(CurrentPlayer, AtLeast, 1, "Men", "exr");
                NDeaths(FP, Exactly, i+1, P_Count);
            }, {
                SetScore(CurrentPlayer,Subtract,2^j*100,Kills);
                SetResources(CurrentPlayer, Add, 2^j*ExRate[i+1], Ore)
            }, preserved)
        end 
    end

CElseIfX({CDeaths(FP, Exactly, 2, Difficulty)}) --- Hard plot (Present)

TriggerX(FP, {Memory(0x58F44C, Exactly, 1)},{LeaderBoardScore(Kills, "\x04P\x04oints -- 【Ver。Develop \x1cP\x04resent\x04】")},preserved);
TriggerX(FP, {Memory(0x58F44C, Exactly, 131)},{LeaderBoardScore(Custom, "\x08D\x04eaths -- 【Ver。Develop \x1cP\x04resent\x04】")},preserved);
TriggerX(FP, {Memory(0x58F44C, Exactly, 261)},{LeaderBoardKills("Any unit", "\x04K\x04ills -- 【Ver。Develop \x1cP\x04resent\x04】")},preserved);

for i = 0, 4 do 
    for j = 15, 0, -1 do
        TriggerX(Force1, {
            Score(CurrentPlayer, Kills, AtLeast, 2^j*100);
            Bring(CurrentPlayer, AtLeast, 1, "Men", "exl");
            NDeaths(FP, Exactly, i+1, P_Count);
        }, {
            SetScore(CurrentPlayer,Subtract,2^j*100,Kills);
            SetResources(CurrentPlayer, Add, 2^j*ExRate[i+1], Ore)
        }, preserved)
    end
end

for i = 0, 4 do 
    for j = 15, 0, -1 do
        TriggerX(Force1, {
            Score(CurrentPlayer, Kills, AtLeast, 2^j*100);
            Bring(CurrentPlayer, AtLeast, 1, "Men", "exr");
            NDeaths(FP, Exactly, i+1, P_Count);
        }, {
            SetScore(CurrentPlayer,Subtract,2^j*100,Kills);
            SetResources(CurrentPlayer, Add, 2^j*ExRate[i+1], Ore)
        }, preserved)
    end 
end





CElseIfX({CDeaths(FP, Exactly, 3, Difficulty)}) --- Lunatic Plot (Future)

TriggerX(FP, {Memory(0x58F44C, Exactly, 1)},{LeaderBoardScore(Kills, "\x04P\x04oints -- 【Ver。Develop \x08F\x04uture\x04】")},preserved);
TriggerX(FP, {Memory(0x58F44C, Exactly, 131)},{LeaderBoardScore(Custom, "\x08D\x04eaths -- 【Ver。Develop \x08F\x04uture\x04】")},preserved);
TriggerX(FP, {Memory(0x58F44C, Exactly, 261)},{LeaderBoardKills("Any unit", "\x04K\x04ills -- 【Ver。Develop \x08F\x04uture\x04】")},preserved);

for i = 0, 4 do 
    for j = 15, 0, -1 do
        TriggerX(Force1, {
            Score(CurrentPlayer, Kills, AtLeast, 2^j*100);
            Bring(CurrentPlayer, AtLeast, 1, "Men", "exl");
            NDeaths(FP, Exactly, i+1, P_Count);
        }, {
            SetScore(CurrentPlayer,Subtract,2^j*100,Kills);
            SetResources(CurrentPlayer, Add, 2^j*ExRate2[i+1], Ore)
        }, preserved)
    end
end

for i = 0, 4 do 
    for j = 15, 0, -1 do
        TriggerX(Force1, {
            Score(CurrentPlayer, Kills, AtLeast, 2^j*100);
            Bring(CurrentPlayer, AtLeast, 1, "Men", "exr");
            NDeaths(FP, Exactly, i+1, P_Count);
        }, {
            SetScore(CurrentPlayer,Subtract,2^j*100,Kills);
            SetResources(CurrentPlayer, Add, 2^j*ExRate3[i+1], Ore)
        }, preserved)
    end 
end



CIfXEnd()

end