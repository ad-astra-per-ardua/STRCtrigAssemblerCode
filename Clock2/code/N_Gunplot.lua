function N_Gunplot()



    ----- 사망인식 건작 -----
    DuskHive3Var = CreateCcode()
    SettingFlag = CreateCcode()

    NIf(Force2, {Bring(P6, Exactly, 0, 133, "duskHive3")} )
        DoActions(FP, {AddCD(DuskHive3Var, 1)}, preserved)

        TriggerX(FP, {CDeaths(FP, AtLeast, (duskHive3TL[1]) * SDspeed -1, DuskHive3Var)}, {SetCD(SettingFlag,0)})

        CSPlot2(TriangleDuskhive1, P6, 179, "duskHive3", nil, 1, 32, FP, {CDeaths(FP, AtLeast, duskHive3TL[1] * SDspeed, DuskHive3Var)})
        CSPlot2(TriangleDuskhive2, P6, 179, "duskHive3", nil, 1, 32, FP, {CDeaths(FP, AtLeast, duskHive3TL[2] * SDspeed, DuskHive3Var)})

        TriggerX(FP, {CDeaths(FP, AtLeast, duskHive3TL[3] * SDspeed,DuskHive3Var)},{Order(179, P6, "Anywhere", Move, "duskHive3A")})
        TriggerX(Force2, {CDeaths(FP, AtLeast, duskHive3TL[4] * SDspeed,DuskHive3Var)}, {RunAIScriptAt(JYD, "duskHive3")})
        TriggerX(Force2, {CDeaths(FP, AtLeast, (duskHive3TL[4] + 0.5) * SDspeed,DuskHive3Var)}, {RunAIScriptAt(JYD, "duskHive3")})
        TriggerX(FP, {CDeaths(FP, AtLeast, duskHive3TL[5] * SDspeed,DuskHive3Var)}, {KillUnitAt(All, 179, "Anywhere", P6)})
        TriggerX(FP, {CDeaths(FP, AtLeast, (duskHive3TL[5] + 1) * SDspeed,DuskHive3Var)}, {SetCD(SettingFlag,2 )})

        CAPlot(PentagonDuskhive1, P6, 179, "duskHive3", nil, 1, 32, {PentagonDuskhive1[1],0,0,0,1/5,0}, nil, FP, {CDeaths(FP, AtLeast, duskHive3TL[6] * SDspeed, DuskHive3Var)})
        TriggerX(FP, {CDeaths(FP, AtLeast, duskHive3TL[10] * SDspeed,DuskHive3Var)}, {KillUnitAt(All, 179, "Anywhere", P6)})
        
        TriggerX(FP, {CDeaths(FP, AtLeast, (duskHive3TL[10] + 1) * SDspeed,DuskHive3Var)}, {SetCD(SettingFlag,3)})

        CSPlot2(TriangleDuskhive1, P6, 179, "duskHive3", nil, 1, 32, FP, {CDeaths(FP, AtLeast, duskHive3TL[11] * SDspeed, DuskHive3Var)})
        CSPlot2(TriangleDuskhive2, P6, 179, "duskHive3", nil, 1, 32, FP, {CDeaths(FP, AtLeast, duskHive3TL[12] * SDspeed, DuskHive3Var)})
        CSPlot2(HexagonDuskhive1, P6, 179, "duskHive3", nil, 1, 32, FP, {CDeaths(FP, AtLeast, duskHive3TL[13] * SDspeed, DuskHive3Var)})
        TriggerX(FP, {CDeaths(FP, AtLeast, duskHive3TL[13] * SDspeed,DuskHive3Var)}, {KillUnitAt(All, 179, "Anywhere", P6)})

        CSPlotOrder2(HeartV2, P6, 58, "duskHive3", nil, 1, 32, HeartV2, nil, Attack, "home", nil, 32, nil, FP, {CDeaths(FP, AtLeast, duskHive3TL[14] * SDspeed, DuskHive3Var)})
        CSPlotOrder2(HeartV2, P6, 84, "duskHive3", nil, 1, 32, HeartV2, nil, Attack, "home", nil, 32, nil, FP, {CDeaths(FP, AtLeast, duskHive3TL[14] * SDspeed, DuskHive3Var)})
        TriggerX(FP, {CDeaths(FP, AtLeast, (duskHive3TL[14] + 1) * SDspeed,DuskHive3Var)}, {SetCD(SettingFlag,4)})
        CAPlot(line1, P6, 179, "duskHive3", nil, 1, 32, {line1[1],0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, duskHive3TL[15] * SDspeed, DuskHive3Var)})

        TriggerX(FP, {CDeaths(FP, AtLeast, (duskHive3TL[15] + 1)* SDspeed, DuskHive3Var)}, {KillUnitAt(All, 179, "Anywhere", Force2)})
        
        CSPlot2(TriangleDuskhive1, P6, 30, "duskHive3", nil, 1, 32, FP, {CDeaths(FP, AtLeast, duskHive3TL[16] * SDspeed, DuskHive3Var)},{SetCD(SettingFlag,5)})
        CSPlot2(TriangleDuskhive2, P6, 30, "duskHive3", nil, 1, 32, FP, {CDeaths(FP, AtLeast, duskHive3TL[17] * SDspeed, DuskHive3Var)})
        CSPlot2(HexagonDuskhive1, P6, 30, "duskHive3", nil, 1, 32, FP, {CDeaths(FP, AtLeast, duskHive3TL[18] * SDspeed, DuskHive3Var)})
        CAPlot(line1, P6, 179, "duskHive3", nil, 1, 32, {line1[1],0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, duskHive3TL[19] * SDspeed, DuskHive3Var)})
        TriggerX(FP, {CDeaths(FP, AtLeast, (duskHive3TL[20])* SDspeed, DuskHive3Var)}, {KillUnitAt(All, 179, "Anywhere", Force2)})


    NIfEnd()

    
    ------------------------

    function Simple_TSetLoc(Player,LocID,LeftValue,UpValue,RightValue,DownValue,AddonTrigger)
        CDoActions(Player,{
            TSetLoc(LocID,0,SetTo,LeftValue);
            TSetLoc(LocID,4,SetTo,UpValue);
            TSetLoc(LocID,8,SetTo,RightValue);
            TSetLoc(LocID,12,SetTo,DownValue);
            AddonTrigger
        })
    end
    
    SpellcasterPatch = {}
    
    function SetUnitAdvFlag(UnitID,Value,Mask)
        table.insert(SpellcasterPatch,SetMemoryX(0x664080 + (UnitID*4),SetTo,Value,Mask))
    end
    for i = 0, 227 do
        SetUnitAdvFlag(i,0x200000,0x200000)
    end
    
    Trigger2(FP,{},SpellcasterPatch)
    HInfoArr = {} -- Main 1 Dim
    -- "\x07·\x11·\x08·\x07『 "
    -- "\x07』\x08·\x11·\x07·"
    -- HIndex = {2,17,15,52,58,65,66,68}
    function CreateHeroAlert(HeroIndex, HeroName, HeroPoint)
        HeroText = "\x07·\x11·\x08·\x07『 \x11시간\x04의 \x08무질서\x04 \x19【\x04 "..HeroName.." \x19】 \x04를 \x0F파괴\x04하였습니다. "..HeroPoint.." \x07만큼\x04의 \x1F원동력\x04을 \x17되찾았았습니다! \x07』\x08·\x11·\x07·"
        
        local X = {} -- Sub 1 Dim
        table.insert(X,HeroIndex)
        table.insert(X,HeroText)
        table.insert(X,HeroPoint)
        table.insert(HInfoArr,X) -- Create 2 Dim
    end
    --[[
        HInfoArr[i][1] == Index, 2 == Text, 3 == Point
    ]]
    
    CreateHeroAlert(2, "<11>Ⅰ<8>Disorderness <19>F<4>ragmentation<11>Ⅰ", 30000)
    CreateHeroAlert(15, "<11>Ⅰ<8>Disorderness <19>R<4>eservist<11>Ⅰ", 30000)
    CreateHeroAlert(17, "<11>Ⅰ<8>Disorderness <19>T<4>itan<11>Ⅰ", 32000)
    CreateHeroAlert(52, "<11>Ⅰ <8>Disorderness <19>U<4>nholy <11>Ⅰ", 30000)
    CreateHeroAlert(58, "<11>Ⅰ <8>Disorderness <19>M<4>ystic <19>D<4>ream <11>Ⅰ", 35000)
    CreateHeroAlert(65, "<11>Ⅰ <8>Disorderness <19>J<4>uggler <11>Ⅰ", 33000)
    CreateHeroAlert(66, "<11>Ⅰ <8>Disorderness <19>U<4>ndyne <11>Ⅰ", 33000)
    CreateHeroAlert(68, "<11>Ⅰ <8>Disorderness <19>B<4>ulb <11>Ⅰ", 37000)

    CreateHeroAlert(5, "<11>Ⅴ <8>Disorderness <19><4><19>T<4>heft <11>Ⅴ", 55000)
    CreateHeroAlert(21, "<11>Ⅴ <8>Disorderness <19>D<4>isturbing <19>F<4>ly <11>Ⅴ", 60000)
    CreateHeroAlert(40, "<11>Ⅴ <8>Disorderness <19>J<4>giwara <19>J<4>otyu <11>Ⅴ", 66666)
    CreateHeroAlert(60, "<11>Ⅴ <8>Disorderness <19>A<4>rc <11>Ⅴ", 65000)
    CreateHeroAlert(61, "<11>Ⅴ <8>Disorderness <19>B<4>lindness <11>Ⅴ", 63000)
    CreateHeroAlert(70, "<11>Ⅴ <8>Disorderness <19>P<4>ersonality <11>Ⅴ", 62000)

    
    BackupCp, BPosXY, BPosX, BPosY = CreateVars(4,FP)
    LocSize = 128
    
    CunitCtrig_Part1(FP)
    MoveCp("X",25*4)

    NJumpX(FP,0x1,DeathsX(CurrentPlayer,Exactly,135,0,0xFF))
    NJumpX(FP,0x1,DeathsX(CurrentPlayer,Exactly,136,0,0xFF))
    NJumpX(FP,0x1,DeathsX(CurrentPlayer,Exactly,137,0,0xFF))
    NJumpX(FP,0x1,DeathsX(CurrentPlayer,Exactly,138,0,0xFF))
    NJumpX(FP,0x1,DeathsX(CurrentPlayer,Exactly,142,0,0xFF))

    NJumpX(FP,0x1,DeathsX(CurrentPlayer,Exactly,179,0,0xFF)) -- Death gunplot unit
    
    ----------------- Hero Section
    DoActions(FP,MoveCp(Subtract,16*4))
    CIf(FP,{DeathsX(CurrentPlayer,Exactly,1*65536,0,0xFF0000)},SetDeathsX(CurrentPlayer,SetTo,0*65536,0,0xFF0000)) -- EPD 9 ( 1 = 영작유닛표식 )
        DoActions(FP,MoveCp(Add,16*4))
        for i = 1, #HInfoArr do
            CIf(FP,{DeathsX(CurrentPlayer,Exactly,HInfoArr[i][1],0,0xFF)})
            Call_SaveCp() -- EPD 25
                TriggerX(FP,{},{
                    CopyCpAction({DisplayTextX(HInfoArr[i][2],4)},{Force1,Force5},FP);
                    CopyCpAction({PlayWAVX("staredit\\wav\\HeroKill.ogg")},{Force1,Force5},FP); --Force5가 관전자 플레이어
                    SetScore(Force1,Add,HInfoArr[i][3],Kills);
                },{Preserved})
            Call_LoadCp() -- EPD 25
            CIfEnd()
        end
    CIfEnd()
    ClearCalc()
    ----------------
    

    
    -----------------

    
    
    NJumpXEnd(FP,0x1)
    
    DoActions(FP,MoveCp(Subtract,15*4))
    SaveCp(FP,BackupCp)
    CMov(FP,BPosXY,_Read(BackupCp))
    CMov(FP,BPosX,_Mov(BPosXY,0xFFFF))
    CMov(FP,BPosY,_Div(_Mov(BPosXY,0xFFFF0000),65536))
    Simple_TSetLoc(FP,"248",_Sub(BPosX,LocSize),_Sub(BPosY,LocSize),_Add(BPosX,LocSize),_Add(BPosY,LocSize))
    LoadCp(FP,BackupCp)
    DoActions(FP,MoveCp(Add,15*4))

    ---------- Hive Dth Section -----------
    
    dthGenfunc(179, {54,65,56}, {1,1,1}, P6, Attack, 0)
    dthGenfunc(179, {60,77,30}, {1,1,1}, P6, Attack, 3)
    
    

    CSPlotOrder2(DthdetectShape, P6, 54, "248", nil, 1, 32, DthdetectShape, nil, Attack, "home",nil, 32, nil, FP, {DeathsX(CurrentPlayer, Exactly, 179, 0, 0xFF),CDeaths(FP, Exactly, 1, SettingFlag)},nil,preserved)
    CSPlotOrder2(DthdetectShape2, P6, 65, "248", nil, 1, 32, DthdetectShape2, nil, Attack, "home",nil, 32, nil, FP, {DeathsX(CurrentPlayer, Exactly, 179, 0, 0xFF),CDeaths(FP, Exactly, 1, SettingFlag)},nil,preserved)
    CSPlotOrder2(DthdetectShape3, P6, 56, "248", nil, 1, 32, DthdetectShape3, nil, Attack, "home",nil, 32, nil, FP, {DeathsX(CurrentPlayer, Exactly, 179, 0, 0xFF),CDeaths(FP, Exactly, 1, SettingFlag)},nil,preserved)


    CSPlotOrder2(DthdetectShape, P6, 66, "248", nil, 1, 32, DthdetectShape, nil, Attack, "home",nil, 32, nil, FP, {DeathsX(CurrentPlayer, Exactly, 179, 0, 0xFF),CDeaths(FP, Exactly, 2, SettingFlag)},nil,preserved)
    CSPlotOrder2(DthdetectShape2, P6, 52, "248", nil, 1, 32, DthdetectShape2, nil, Attack, "home",nil, 32, nil, FP, {DeathsX(CurrentPlayer, Exactly, 179, 0, 0xFF),CDeaths(FP, Exactly, 2, SettingFlag)},nil,preserved)
    CSPlotOrder2(DthdetectShape3, P6, 58, "248", nil, 1, 32, DthdetectShape3, nil, Attack, "home",nil, 32, nil, FP, {DeathsX(CurrentPlayer, Exactly, 179, 0, 0xFF),CDeaths(FP, Exactly, 2, SettingFlag)},nil,preserved)
    
    CSPlotOrder2(line2, P6, 89, "248", nil, 1, 32, line2, nil, Attack, "home",nil, 32, nil, FP, {DeathsX(CurrentPlayer, Exactly, 179, 0, 0xFF),CDeaths(FP, Exactly, 4, SettingFlag)},nil,preserved)
    CSPlotOrder2(line2, P6, 76, "248", nil, 1, 32, line2, nil, Attack, "home",nil, 32, nil, FP, {DeathsX(CurrentPlayer, Exactly, 179, 0, 0xFF),CDeaths(FP, Exactly, 4, SettingFlag)},nil,preserved)

    CSPlot2(line2, P6, 57, "248", nil, 1, 32, FP, {DeathsX(CurrentPlayer, Exactly, 179, 0, 0xFF),CDeaths(FP, Exactly, 5, SettingFlag)},nil,preserved)

    
    

    --------- Normal plot Section ------------

    dthGenfunc(136, {52}, {10}, P6, Attack,nil)
    dthGenfunc(137, {55,56}, {5,5}, P6, Attack, nil)
    dthGenfunc(138, {45,104,3,2,1,3}, {5,5,1,1,1,3}, P6, Attack, nil)
    dthGenfunc(142, {54}, {10}, P6, Attack, nil)

    
    ClearCalc()
    CJumpEnd(FP,0x2)

    CunitCtrig_Part2()
    CunitCtrig_Part3X()
    for i = 0, 1699 do
    CunitCtrig_Part4X(i,{ -- 잡건
        DeathsX(EPDF(0x628298-0x150*i+(40*4)),AtLeast,1*16777216,0,0xFF000000),
        DeathsX(EPDF(0x628298-0x150*i+(19*4)),Exactly,0*256,0,0xFF00),
    },
    {	SetDeathsX(EPDF(0x628298-0x150*i+(40*4)),SetTo,0*16777216,0,0xFF000000);
        MoveCp(Add,25*4);})
    end

    CunitCtrig_End()

    
    

    --[[

        gunplot bgm
        Need at Least 15?

        Main BGM under below
        1. auvic : what a wonderful world
        2. pikasonic : timeleap
        3.
        
        Normal plot under below
        1. linear ring : waiting for you
        2. AAAA : Recollect Lines
        3. Hyun : Illusion of inflict
        4. linear ring : isomorph
        5. ARforest : FlashBack
        6. cute girl doing spicy things : too spicy
        7. linear ring : eden without eve
        8. Author Wind : Forest
        9. pikasonic : factory
        10. synthion :s Aurora
        11. ARforest : Relics
        12. cgdct : bang
        13. '' : heart connect
        14. '' : infinite
        15. kakera

    ]]
    
    SetLoopInfPlot(P6, "duskHat2", 131, {1,1,1,1,1,1,1,1,1,1,1,1,1,1}, {54,53,55,56,77,78,40,41,43,44,45,46,47,48}, duskhatTL)
    SetEffectplot1(P6, "duskHat2", 131, 84, {1,2,3,4,5,6,7,7}, duskhatTLeft)

    SetLoop2Plot(P6, "duskHat1", 131, {1,2,1,2,1,2,3,2,3}, {54,53,55,56,44,45,46,47,48}, duskhat2TL)
    SetEffectplotInf(P6, "duskHat1", 131, 84, {8,9,3,5,8,9,3,5,8,9,4,2}, duskhat2EftTL)

    SetEffectplotInf(P6, "duskHat3", 131, 84, {8,9,3,5,8,9,3,5,8,9,2,3}, duskhat2EftTL)
    SetLoop2Plot(P6, "duskHat3", 131, {5,1,5,2,5,1,5,2,5}, {54,55,53,56,48,55,54,56,54}, duskhat2TL)



    ------ Lair ---------
    
    L1timer = CreateCcode()
    SetLoop2Plot(P6, "duskLair1", 132, {6,6,6,6,6,6,6,6}, {54,53,65,66,54,77,78}, duskLair1TL)
    SetLoop2Plot(P6, "duskLair1", 132, {6,6,6,6,6,6,6,6}, {55,56,55,56,55,56,55}, duskLair1TL)

    CIf(FP, {Bring(P6, Exactly, 0, 132, "duskLair1")})
    DoActions(FP, {AddCD(L1timer, 1)}, preserved)
    CAPlot(lairShape1, P6, 84,"duskLair1", nil, 1, 32, {lairShape1[1],0,0,0,2,0}, nil, FP, {CDeaths(FP, AtMost, 24.2 * SDspeed, L1timer)}, nil, 1)
    CIfEnd()

    SetLoop2Plot(P6, "duskLair3", 132, {7,8,7,8,9,8,9,7,7,8,7,9,8,10}, {37,44,38,58,80,78,56,48,65,68,66,58,56,53}, duskLair3TL)
    SetEffectplot1(P6, "duskLair3", 132, 84, {8,9,8,9,9,9,9,8,8,9,8,9,9,8}, duskLair3TLEft)
    
    SetLoop2Plot(P6, "duskHive1", 133, {12,14,11,13,12,14,11,13}, {54,55,77,80,87,56,51,78}, duskHive1TLEft)
    SetLoop2Plot(P6, "duskHive1", 133, {12,12,12,12,12,12,12,12}, {84,84,84,84,84,84,84,84}, duskHive1TLEft)

    


    
end