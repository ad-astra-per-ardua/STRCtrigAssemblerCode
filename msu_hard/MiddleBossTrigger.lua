function MiddleBossTrigger()
    Nextptr, MBossPtr11, MBossHP11, MBossHP11_2 = CreateVars(4,FP)
    MBB = {174,175,127,148}
    
    -- for i = 1 , 4 do
    --     TriggerX(FP, {Bring(Force2, AtMost, 10, "Men", "middle"..i),Bring(Force2, Exactly, 0, "Buildings", "middle"..i)}, {
    --     SetInvincibility(Disable, MBB[i-1], P7, "middle"..i);
    --     })
    -- end
    -- Use Death Value P11 160 ~
    Shape11_1 = CSMakePolygon(6,60,0,92,7)
    
    MiddleGen2 = CSMakeLine(3,32,0,22,1)
    EFT11_1 = CSMakeCircleX(6,64,30,54,6)

    MBoss11_1T = {21,81,8,12,88,96}
    MBoss11_2P = {58,62,64,104,70,7,21,75}
    
    Onlyhallucinated = {
        clocked = false,
        burrowed = false,
        intransit = false,
        hallucinated = true,
        invincible = false,
        hitpoint = 100,
        shield = 100,
        energy = 0,
        resource = 0,
        hanger = 0,
    }

    M11 = "middle1"
    M11tl = {
    12,14.7, 17.4, 20, 22.4,37.7, 41.5, 60, 
    61.7, 62.2, 62.6, 63.1, 63.6, 64.1, 64.4, 64.8,
    67,68.3, -- eft1
    71, 71.6, 72.1, 72.5, 73, 73.4, 73.7, 74.2,
    74.5, 75.2, 76.1,
    76.5, 77.9, -- eft2
    79.2, 
    92.6, 98, 
    103.4, 104, 104.6, 105.4, 106.1
}
MB1TL={24.5,25,25.5,26,26.5,27,28,28.5,29,30,30.5,
    31,34,38,42,46,50,54,58,62,66,70,74,78,82,86,90,
    96.5, 100.5, 104.5, 108.5, 112.5, 116.5, 120.5, 124.5, 128.5, 132.5, 
    136.5, 140.5, 144.5, 148.5, 152.5, 156.5, 160.6, 161.1
    }

    MB7TL = { -- gap == 0.6, 0.55, 0.55, 0.6 == 1 plot
    2.2, 6.78, 11.35,  15.94,  20.44,  
    25.08,  29.66,  34.23,  38.82,  43.32, 
    47.96,  52.54, 59.93,  64.51,  69.08, 
    73.67,  78.17,  82.81,  87.39,  91.96, 
    96.55,  101.05,  105.69,  110.27,  114.84, 
    119.43,  123.93,  128.57, 130.87
    }
    
    CreateLocation = {"patbat1","patbat2","patbat3","patbat4"}
    MB1CircleS = CSMakeCircle(6,64,0,61,1)
    MB1CircleA = CSMakeCircle(6,0,0,61,1)
    

    SnowFlake1 = CS_Convert(SnowFlake, 80)
    EnergyProp = {
        clocked = false,
        burrowed = false,
        intransit = false,
        hallucinated = false,
        invincible = false,
        hitpoint = 100,
        shield = 100,
        energy = 100,
        resource = 0,
        hanger = 0,
        }

    RealB = {"starp1","starp2","starg1","starg2"}
    RealB2 = {"mutant5","wraith1","PNG1","PNG2"}
    HiveEtf2 = CSMakeSpiral(6, 16, 1/2, 40, 0, 130, 71)
    HiveEtf2A = CSMakeSpiral(6, 16, 1/2, 0, 0, 130, 71)
    TSFL1 = CSMakeLine(1,48,0,10,1)
    

    CIfX(AllPlayers, {CDeaths(FP, Exactly, 1, Difficulty)})

    TriggerX(P7, {CommandLeastAt(174, "middle1")}, {SetDeaths(P11, Add, 1, 160)}, preserved)

    CIf(Force2, {Deaths(P11, AtMost, (M11tl[#M11tl] * SDspeed) + SDspeed, 160)})
    MemoryProp = {
        clocked = false,
        burrowed = false,
        intransit = false,
        hallucinated = false,
        invincible = false,
        hitpoint = 20,
        shield = 20,
        energy = 0,
        resource = 0,
        hanger = 0,
    }
    MiddleGen = CSMakeLine(3,32,0,13,1)
    TriggerX(FP, {
        Deaths(P11, AtLeast, 15, 160),
        Deaths(P11, AtMost, (M11tl[#M11tl] * SDspeed) + SDspeed, 160),
        Deaths(P6, Exactly, 0, 22)
    }, {
        SetDeaths(P8, SetTo, 0, 131), -- small wave
        SetDeaths(P8, Subtract, 1, 132) -- big wave
    }, preserved)

    TriggerX(FP, {Deaths(P11, AtLeast, M11tl[1] * SDspeed, 160)}, {SetInvincibility(Enable, 22, P6, "middle1")})
    TriggerX(FP, {Deaths(P11, AtLeast, 1, 225)}, {SetInvincibility(Enable, 22, P6, "middle1")}, preserved)
    TriggerX(FP, {Deaths(P11, AtLeast, 1, 225)}, {SetDeaths(P11, Subtract, 1, 225)}, preserved)
    TriggerX(FP, {Deaths(P11, Exactly, 0, 225)}, {SetInvincibility(Disable, 22, P6, "middle1")}, preserved)
    TriggerX(FP, {Deaths(P11, AtLeast, 1, 225)}, {SetSpriteImage(227, 983)})

    CIfOnce(FP,{Deaths(P11, Exactly, 10, 160)})
        f_Read(FP,0x628438,nil,Nextptr) -- Save 0x628438(Next unit pointer) Offset, Convert into EPD and save into Variable
        DoActions(FP,SetImageColor(237,16))
        CMov(FP,MBossPtr11,Nextptr) -- Save FBossPtr from Nextptr's 
            CDoActions(FP,{
                CreateUnit(1,22,"nuke3",P6);
                SetInvincibility(Enable, 22, P6, "nuke3");
                TSetMemory(Vi(MBossPtr11[2],2),SetTo,256*6500000); -- Next unit pointer offset's HP set
                TSetMemoryX(Vi(MBossPtr11[2], 55), SetTo, 0xA08000, 0xA08000); -- Next unit pointer offset's status flag set
            })
        CMov(FP,MBossHP11,Nextptr,2) 
        DoActionsX(FP,{SetNVar(MBossHP11_2,SetTo,15)})
        DoActions(FP,SetImageColor(237,0))
    CIfEnd()
    CTrigger(FP,{
        TMemory(MBossHP11,AtMost,256*2000000);
        NVar(MBossHP11_2,AtLeast,1);
    },{
        TSetMemory(MBossHP11,SetTo,256*6500000);
        SetNVar(MBossHP11_2,Subtract,1);
        SetDeaths(P12, SetTo, 102, 225);
    },{preserved})

    TriggerX(Force1, {Deaths(P11, Exactly, 20, 160)}, {
        MinimapPing("middle1"),
        MinimapPing("middle1"),
        MinimapPing("middle1"),
        PlayWAV("sound\\Terran\\KERRIGAN\\UKePss04.wav"),
        PlayWAV("sound\\Terran\\KERRIGAN\\UKePss04.wav"),
        PlayWAV("sound\\Terran\\KERRIGAN\\UKePss04.wav"),
        TalkingPortrait(16, 1000)
    })

    TriggerX(Force1, {Deaths(P11, Exactly, 22, 160)},{MoveUnit(1, 22, P6, "nuke3", "middle1")})
    local n = #MBoss11_1T
    for i = 1 ,32 do
        local index = (i - 1) % n + 1
        CSPlotWithProperties(CS_Rotate3D(MiddleGen,(360-11.25*i),(11.25*i),(360-11.25*i)), P5, MBoss11_1T[index], "middle1", {495,351}, 1, 32, FP, {Deaths(P11, AtLeast, (M11tl[1]*SDspeed) + (12 + i*11),160)}, nil, nil, MemoryProp)
    end
    CAPlot(Shape11_1, P6, 3, M11, {495,351}, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P11, AtLeast, M11tl[1] * SDspeed, 160)})
    CAPlot(CS_Reverse(Shape11_1), P6, 89, M11, {495,351}, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P11, AtLeast, M11tl[2] * SDspeed, 160)})
    CAPlot(CS_Shuffle(Shape11_1), P6, 88, M11, {495,351}, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P11, AtLeast, M11tl[3] * SDspeed, 160)})
    CAPlot(CS_Shuffle(Shape11_1), P6, 77, M11, {495,351}, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P11, AtLeast, M11tl[4] * SDspeed, 160)})
    CSPlotWithProperties(Shape11_1, P5, 27, M11, {495,351}, 1, 32, P6, {Deaths(P11, AtLeast, M11tl[5] * SDspeed, 160)}, nil,nil, Onlyhallucinated)
    for i = 1, 4 do 
        TriggerX(FP, {Deaths(P11, AtLeast, M11tl[5] * SDspeed, 160)}, CreateUnit(1, 27, RealB[i], P5))
    end
    for i = 1, 4 do
        TriggerX(FP, {Deaths(P11, AtLeast, M11tl[5] * SDspeed, 160)},CreateUnit(1, 27, RealB2[i], P5))
    end
    TriggerX(FP,{Deaths(P11, AtLeast, M11tl[6] * SDspeed - 10, 160)}, {RemoveUnit(27, Force2),SetImageColor(137, 16)})
    for i = 1, 4 do
        TriggerX(FP,{Deaths(P11, AtLeast, M11tl[6] * SDspeed, 160)}, {CreateUnit(1, 57, RealB[i], P5),CreateUnit(1, 57, RealB2[i], P5)})
    end
    TriggerX(FP,{Deaths(P11, AtLeast, M11tl[6] * SDspeed + 1, 160)}, {SetImageColor(137, 0)})
    
    CAPlotWithProperties(CS_Reverse(CS_SortR(HiveEtf2,1)), P5, 11, M11, {495,351}, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P11, AtLeast, M11tl[6] * SDspeed, 160)}, nil, nil, StargateProperties)
    -- CSPlotOrderWithProperties(CSMakeSpiral(6, 16, 1/2, 0, 0, 130, 71), P5, 11, "nuke3", nil, 1, 32, HiveEtf2, nil, Attack, "middle1", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[6] * SDspeed, 160)}, nil, nil,StargateProperties)
    TriggerX(Force2,{Deaths(P11, AtLeast, M11tl[12] * SDspeed, 160)})

    for i = 1 ,64 do
        local index = (i - 1) % n + 1
        CSPlotWithProperties(CS_Rotate3D(MiddleGen2,(360-11.25*i),(11.25*i),(360-11.25*i)), P5, MBoss11_1T[index], "middle1", {495,351}, 1, 32, FP, {Deaths(P11, AtLeast, (M11tl[7]*SDspeed) + (12 + i*11),160)}, nil, nil, MemoryProp)
    end
    TriggerX(Force2,{Deaths(P11, AtLeast, M11tl[8] * SDspeed, 160)}, {KillUnitAt(All, 11, "Anywhere", P5)})
    CSPlotOrder(HiveEtf2, P6, 72, M11, {495,351}, 1, 32, HiveEtf2A, nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[8] * SDspeed, 160)})
    CSPlotOrder(HiveEtf2, P6, 76, M11, {495,351}, 1, 32, HiveEtf2A, nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[8] * SDspeed, 160)})
    CSPlotOrder(HiveEtf2, P6, 93, M11, {495,351}, 1, 32, HiveEtf2A, nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[8] * SDspeed, 160)})
    CSPlotOrder(HiveEtf2, P6, 64, M11, {495,351}, 1, 32, HiveEtf2A, nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[8] * SDspeed, 160)})
    for i = 1, 8 do
        CSPlotOrder(CS_Rotate(TSFL1, 51.4*(i-1)), P6, MBoss11_2P[i], M11, {495,351}, 1, 32, CSMakeLine(1,0,0,10,1), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[i+8] * SDspeed, 160)})
    end
    CSPlot(CS_RatioXY(CS_Rotate3D(sixline,45,45,45),2,2), P6, 72, M11, {495,351}, 1, 32, P7, {Deaths(P11, AtLeast, M11tl[17] * SDspeed, 160)})
    CSPlotOrder(CS_Convert(CSMakePolygon(6,60,0,85,0),45), P6, 58, M11, {495,351}, 1, 32,CSMakePolygon(6,60,0,45,0),nil, Attack, "nuke3", nil, 32, nil, P7,{Deaths(P11, AtLeast, (M11tl[17] + 0.6) * SDspeed, 160)})
    CSPlot(CS_RatioXY(CS_Rotate3D(sixline,45,0,45),2,2), P6, 72, M11, {495,351}, 1, 32, P7, {Deaths(P11, AtLeast, M11tl[18] * SDspeed, 160)})
    CSPlotOrder(CS_Convert(CSMakePolygon(6,60,0,85,0),45), P6, 69, M11, {495,351}, 1, 32,CSMakePolygon(6,60,0,45,0),nil, Attack, "nuke3", nil, 32, nil, P7,{Deaths(P11, AtLeast, (M11tl[18] + 0.6) * SDspeed, 160)})

    for i = 1, 8 do
        CSPlotOrder(CS_Rotate(TSFL1, 360-51.4*(i-1)), P6, MBoss11_2P[i], M11, {495,351}, 1, 32, CSMakeLine(1,0,0,10,1), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[i+18] * SDspeed, 160)})
    end
    TriggerX(Force2,{Deaths(P11, AtLeast, M11tl[26] * SDspeed, 160)})
    for i = 1 ,64 do
        local index = (i - 1) % n + 1
        CSPlotWithProperties(CS_Rotate3D(MiddleGen2,(360-11.25*i),(11.25*i),(360-11.25*i)), P6, MBoss11_1T[index], "middle1", {495,351}, 1, 32, FP, {Deaths(P11, AtLeast, (M11tl[26]*SDspeed) + (12 + i*11),160)}, nil, nil, MemoryProp)
    end
    CSPlotOrder(Shape11_1, P6, 16, M11, {495,351}, 1, 32, CSMakePolygon(6,0,0,92,7), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[27] * SDspeed, 160)})
    CSPlotOrder(Shape11_1, P6, 25, M11, {495,351}, 1, 32, CSMakePolygon(6,0,0,92,7), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[28] * SDspeed, 160)})
    CSPlotOrder(Shape11_1, P6, 60, M11, {495,351}, 1, 32, CSMakePolygon(6,0,0,92,7), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[29] * SDspeed, 160)})

    CSPlot(CS_RatioXY(CS_Rotate3D(sixline,45,45,45),2,2), P6, 72, M11, {495,351}, 1, 32, P7, {Deaths(P11, AtLeast, M11tl[30] * SDspeed, 160)})
    CSPlotOrder(CS_Convert(CSMakePolygon(6,60,0,92,0),45), P6, 58, M11, {495,351}, 1, 32,CSMakePolygon(6,60,0,45,0),nil, Attack, "nuke3", nil, 32, nil, P7,{Deaths(P11, AtLeast, (M11tl[30] + 0.6) * SDspeed, 160)})
    CSPlot(CS_RatioXY(CS_Rotate3D(sixline,45,0,45),2,2), P6, 72, M11, {495,351}, 1, 32, P7, {Deaths(P11, AtLeast, M11tl[31] * SDspeed, 160)})
    CSPlotOrder(CS_Convert(CSMakePolygon(6,60,0,92,0),45), P6, 69, M11, {495,351}, 1, 32,CSMakePolygon(6,60,0,45,0),nil, Attack, "nuke3", nil, 32, nil, P7,{Deaths(P11, AtLeast, (M11tl[31] + 0.6) * SDspeed, 160)})
    CSPlotOrder(Shape11_1, P6, 23, M11, {495,351}, 1, 32, CSMakePolygon(6,0,0,92,7), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[32] * SDspeed, 160)})
    TriggerX(Force2,{Deaths(P11, AtLeast, M11tl[32] * SDspeed, 160)})
    CAPlot(Shape11_1, P6, 60, M11, {495,351}, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P11, AtLeast, M11tl[33] * SDspeed, 160)})
    CAPlot(Shape11_1, P6, 3, M11, {495,351}, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P11, AtLeast, M11tl[34] * SDspeed, 160)})
    CSPlotOrder(Shape11_1, P6, 3, M11, {495,351}, 1, 32, CSMakePolygon(6,0,0,92,7), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[35] * SDspeed, 160)})
    CSPlotOrder(Shape11_1, P6, 21, M11, {495,351}, 1, 32, CSMakePolygon(6,0,0,92,7), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[36] * SDspeed, 160)})
    CSPlotOrder(Shape11_1, P6, 62, M11, {495,351}, 1, 32, CSMakePolygon(6,0,0,92,7), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[37] * SDspeed, 160)})
    CSPlotOrder(Shape11_1, P6, 76, M11, {495,351}, 1, 32, CSMakePolygon(6,0,0,92,7), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[38] * SDspeed, 160)})
    CSPlotOrder(Shape11_1, P6, 28, M11, {495,351}, 1, 32, CSMakePolygon(6,0,0,92,7), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[39] * SDspeed, 160)})
    TriggerX(Force2,{Deaths(P11, AtLeast, M11tl[39] * SDspeed, 160)})

    CAPlot(CS_SortR(PE,0), P7, 72, "nuke3", nil, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P11, AtLeast, M11tl[39] * SDspeed, 160), Deaths(P6, Exactly, 1, 22)})
    TriggerX(Force1, {Deaths(P11, AtLeast, M11tl[39] * SDspeed, 160), Deaths(P6, Exactly, 1, 22)}, {
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        DisplayText(StrDesignX("기억의 세계선의 주인, † \x07【 \x04光 \x07】 \x02†을 격파하였습니다 ! "), 4),
        DisplayText(StrDesignX("+ \x1f322,322 Ore 획득 !"), 4),
        SetResources(CurrentPlayer, Add, 322322, Ore),
        SetDeaths(P6, SetTo, 1, 205)
    })
    CIfEnd()
    ------ End of 11 Middle boss trigger -----
    

    ------ Start of 1 Middle boss trigger ----- + plot death value = 161 | skill death value = 162
    MBossPtr1, MBossHP1, MBossHP1_2 = CreateVars(3,FP)
    TriggerX(P7, {CommandLeastAt(175, "middle2")}, {SetDeaths(P11, Add, 1, 161),SetDeaths(P11, Add, 1, 162)}, preserved)

    CIf(Force2, {Deaths(P11, AtMost, (MB1TL[#MB1TL] * SDspeed) + SDspeed, 161)})
    TriggerX(FP, {
        Deaths(P11, AtLeast, 10, 161),
        Deaths(P11, AtMost, (MB1TL[#MB1TL] * SDspeed) + SDspeed, 161),
        Deaths(P6, AtLeast, 0, 68)
    }, {
        SetDeaths(P8, SetTo, 0, 131), -- small wave
        SetDeaths(P8, Subtract, 1, 132) -- big wave
    }, preserved)
    TriggerX(FP, Deaths(P11, AtLeast, 1500, 162), {SetDeaths(P11, SetTo, 1, 162)}, preserved)


    CIfOnce(FP,{CommandLeastAt(175, "middle2"),Deaths(P11, AtLeast, 10, 161)})
        f_Read(FP,0x628438,nil,Nextptr) -- Save 0x628438(Next unit pointer) Offset, Convert into EPD and save into Variable
        CMov(FP,MBossHP1,Nextptr) -- Save FBossPtr from Nextptr's 
            CDoActions(FP,{
                CreateUnit(1,68,"middle2",P6);
                TSetMemory(Vi(MBossHP1[2],2),SetTo,256*7000000); -- Next unit pointer offset's HP set
                TSetMemoryX(Vi(MBossHP1[2], 55), SetTo, 0xA00000, 0xA00000); -- Next unit pointer offset's status flag set
            })
        CMov(FP,MBossHP1,Nextptr,2) 
        DoActionsX(FP,{SetNVar(MBossHP1_2,SetTo,20)})
    CIfEnd()
    CTrigger(FP,{
        TMemory(MBossHP1,AtMost,256*2000000);
        NVar(MBossHP1_2,AtLeast,1);
    },{
        TSetMemory(MBossHP1,SetTo,256*7000000);
        SetNVar(MBossHP1_2,Subtract,1);
    },{preserved})

    ------- Start of Bullet function ------
    BulletTimer = CreateCcode()
    Temp, Bangle, RandomRange, ScatteredAngle = CreateVars(4,FP)
    Bimage = 973
    Bscript = 242
    Bcolor = 16
    BulletInitSetting(FP,{195,123,284},87,208,516,Bimage,Bscript,Bcolor,5000,10,7,1,1,3,{10,10,10},0)

    CDoActions(FP,{
        TSetNVar(RandomRange,SetTo,_Add(_Mod(_Rand(),92),8));
        SetCDeathsX("X",Add,1*16777216,BulletTimer,0xFF000000);
    })

    TriggerX(FP,{NVar(Bangle,Exactly,0)},{SetNVar(Temp,Add,2*256)},{Preserved})
    TriggerX(FP,{NVar(Bangle,Exactly,1)},{SetNVar(Temp,Add,-2*256)},{Preserved})
    
    TriggerX(FP,{CDeathsX("X",Exactly,0*16777216,BulletTimer,0xFF000000)},{SetImageColor(440,0),SetImageColor(Bimage,0)},{Preserved}) -- Yellow
    TriggerX(FP,{CDeathsX("X",Exactly,1*16777216,BulletTimer,0xFF000000)},{SetImageColor(440,16),SetImageColor(Bimage,16)},{Preserved}) -- Blue
    TriggerX(FP,{CDeathsX("X",Exactly,2*16777216,BulletTimer,0xFF000000)},{SetImageColor(440,13),SetImageColor(Bimage,13)},{Preserved}) -- Green
    SpreadBullet = InitCFunc(FP)
    CFunc(SpreadBullet)
        CreateBullet(FP,P8,195,3,ScatteredAngle,1024,RandomRange,{"middle2",3632,335},{Deaths(P11, AtLeast, 750, 162),Deaths(P6, Exactly, 0, 68)})
    CFuncEnd()
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,0*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,21*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,43*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,64*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,85*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,107*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,128*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,149*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,171*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,192*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,213*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,235*256))})
        CallCFuncX(FP,SpreadBullet)

    TriggerX(FP,{NVar(Bangle,Exactly,0),NVar(Temp,AtLeast,4*255*256)},{SetNVar(Bangle,SetTo,1)},{Preserved}) 
    TriggerX(FP,{NVar(Bangle,Exactly,1),NVar(Temp,Exactly,0*256)},{SetNVar(Bangle,SetTo,0)},{Preserved}) 

    TriggerX(FP,{CDeathsX("X",Exactly,3*16777216,BulletTimer,0xFF000000)},{SetCDeathsX("X",SetTo,0*16777216,BulletTimer,0xFF000000)},{Preserved}) -- ResetColor
    --------End of Bullet function ------

    ------Start of Trigger function ----
    GenerateRandomIndex,RandomIndex = CreateVars(2,FP)
    

    
    PE = CSMakeCircle(6,64,0,61,1)
    PEA = CSMakeCircle(6,0,0,61,1)
    -- CS_BMPGraph(Triangle4, {"0xFF0000"}, "1", nil, nil, 1, nil, nil, nil, 3, 1, 1, 1)
    -- CDoActions(FP, f_Rand(FP,GenerateRandomIndex), preserved)
    -- CDoActions(FP,CMov(FP, RandomIndex, GenerateRandomIndex),preserved)

    LocM1 = "middle2"
    local A1 = 0.5
    local A2 = 1
    TriggerX(Force1, {Deaths(P11, Exactly, 20, 161)}, {
        MinimapPing("middle2"),
        MinimapPing("middle2"),
        MinimapPing("middle2"),
        PlayWAV("sound\\Protoss\\ARCHON\\PArYes00.wav"),
        PlayWAV("sound\\Protoss\\ARCHON\\PArYes00.wav"),
        PlayWAV("sound\\Protoss\\ARCHON\\PArYes00.wav"),
        TalkingPortrait(68, 1000)
    })

    

    Tier1G = {8, 17 ,77, 78, 16, 25, 52, 3, 89, 104, 89, 95, 75, 3, 23}
    Tier2H = {3, 25, 44, 75, 76, 77, 78, 93, 104, 96, 75, 78, 29, 81, 7}
    Tier3H = {7, 21, 58, 62, 60, 64, 69, 28, 86, 60, 64, 69, 89, 88, 102}
    TriggerX(FP, {Deaths(P11, Exactly, (MB1TL[1]-1) * SDspeed , 161)},{SetScanImage(214)})

    CSPlot(MB1CircleS, P6, 33, LocM1, nil, 1, 32, FP,{Deaths(P11, Exactly, (MB1TL[1]) * SDspeed , 161)})
    CSPlot(MB1CircleS, P6, 33, LocM1, nil, 1, 32, FP,{Deaths(P11, Exactly, (MB1TL[2]) * SDspeed , 161)},{SetScanImage(928)})
    CSPlot(MB1CircleS, P6, 33, LocM1, nil, 1, 32, FP,{Deaths(P11, Exactly, (MB1TL[3]) * SDspeed , 161)},{SetScanImage(546)})

    CSPlotOrder(MB1CircleS, P6, 77, LocM1, nil, 1, 32, MB1CircleA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[4]) * SDspeed , 161)})
    CSPlotOrder(MB1CircleS, P6, 8, LocM1, nil, 1, 32, MB1CircleA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[5]) * SDspeed , 161)})
    CSPlotOrder(MB1CircleS, P6, 104, LocM1, nil, 1, 32, MB1CircleA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[6]) * SDspeed , 161)})

    CSPlotOrder(MB1CircleS, P6, 16, LocM1, nil, 1, 32, MB1CircleA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[7]) * SDspeed , 161)})
    CSPlotOrder(MB1CircleS, P6, 96, LocM1, nil, 1, 32, MB1CircleA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[8]) * SDspeed , 161)})
    CSPlotOrder(MB1CircleS, P6, 76, LocM1, nil, 1, 32, MB1CircleA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[9]) * SDspeed , 161)})

    CSPlotOrder(MB1CircleS, P6, 52, LocM1, nil, 1, 32, MB1CircleA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[10]) * SDspeed , 161)})
    CSPlotOrder(MB1CircleS, P6, 58, LocM1, nil, 1, 32, MB1CircleA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[11]) * SDspeed , 161)})
    CSPlotOrder(MB1CircleS, P6, 76, LocM1, nil, 1, 32, MB1CircleA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[12]) * SDspeed , 161)})

    local len1 = #Tier1G
    local len2 = #Tier2H
    local len3 = #Tier3H

    for i = 13, 43 do
        local idx1 = ((i - 13) % len1) + 1
        local idx2 = ((i - 13) % len2) + 1
        local idx3 = ((i - 13) % len3) + 1
        CSPlotOrder(MB1CircleS, P6, Tier1G[idx1], LocM1, nil, 1, 32, MB1CircleA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[i]) * SDspeed , 161)})
        CSPlotOrder(MB1CircleS, P6, Tier2H[idx2], LocM1, nil, 1, 32, MB1CircleA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[i] + A1) * SDspeed , 161)})
        CSPlotOrder(MB1CircleS, P5, Tier3H[idx3], LocM1, nil, 1, 32, MB1CircleA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[i] + A2) * SDspeed , 161)})
    end
    CSPlotOrder(MB1CircleS, P6, 3, LocM1, nil, 1, 32, MB1CircleA, nil, Attack, "emp3", nil, 32, nil, FP, {Deaths(P11, Exactly, (MB1TL[44]) * SDspeed , 161)})
    CSPlotOrder(MB1CircleS, P6, 7, LocM1, nil, 1, 32, MB1CircleA, nil, Attack, "emp3", nil, 32, nil, FP, {Deaths(P11, Exactly, (MB1TL[45]) * SDspeed , 161)})

    CAPlot(CS_SortR(PE,0), P7, 72, "middle2", nil, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P11, AtLeast, (MB1TL[45] + 3) * SDspeed , 161), Deaths(P6, AtLeast, 1, 68)})
    TriggerX(Force1, {Deaths(P6, AtLeast, 1, 68),Deaths(P11, AtLeast, (MB1TL[45] + 3) * SDspeed,161)}, {
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        DisplayText(StrDesignX("Palm Island 세계선의 주인, ＣｈｅｅＺｅ를 격파하였습니다 ! "), 4),
        DisplayText(StrDesignX("+ \x1f300,000 Ore 획득 !"), 4),
        SetResources(CurrentPlayer, Add, 300000, Ore),
        SetDeaths(P6, SetTo, 1, 204)
    })
    CIfEnd()

    -------- End of 1 Middle Boss trigger -------

    --[[
    1리젠 후 1화홀 + 3초무적
    일정 데스값마다 안밖 스킬사용
    ]]
    -------- Start of 5 Middle Boss Trigger ------ DeathValue = 163 | BossGenerate Trigger = 165
    TriggerX(P7, {Deaths(P7, AtLeast, 1, 148)}, {SetDeaths(P11, Add, 1, 163)}, preserved)

    CIf(Force2, {Deaths(P11, AtLeast, 10, 163),Deaths(P6, AtMost, 0, 116)})

    

    CLX = CAPlotOrderForward()
    Circulation1 = CSMakeCircleX(6,115,30,54,24)
    TempPerAction = {9,10,13,15,16,17}
    M5GenPlot = CSMakeCircle(6,64,0,61,1)
    M5GenPlotA = CSMakeCircle(6,0,0,61,1)
    M5GenG = {30, 52, 17, 95, 93, 78, 81, 75, 23, 104, 74, 25, 76, 81, 3}
    M5GenS = {44, 8, 88, 89, 96, 62, 60, 58, 29, 64, 70, 7, 21, 69, 28}

    TriggerX(FP, {
        Deaths(P11, AtLeast, 0, 116)
    }, {
        SetDeaths(P8, SetTo, 0, 131), -- small wave
        SetDeaths(P8, Subtract, 1, 132) -- big wave
    }, preserved)
    
    TriggerX(FP, {Deaths(P11, AtLeast, 2060, 163)}, {SetDeaths(P11, SetTo, 1, 163)}, preserved)
    TriggerX(FP, {Deaths(P11, AtLeast, 1, 164)}, {SetInvincibility(Enable, 116, P6, "middle4")}, preserved)
    TriggerX(FP, {Deaths(P11, AtLeast, 1, 164)}, {SetDeaths(P11, Subtract, 1, 164)}, preserved)
    TriggerX(FP, {Deaths(P11, Exactly, 0, 164)}, {SetInvincibility(Disable, 116, P6, "middle4")}, preserved)

    TriggerX(FP, {Bring(P6, AtLeast, 50, 150, "Anywhere")}, {KillUnitAt(All, 50, "middle4", P6)}, preserved)
    TriggerX(Force1, {Deaths(P11, Exactly, 798, 163),Deaths(P6, Exactly, 0, 116)}, {
        PlayWAV("sound\\Zerg\\BUGGUY\\ZBGRdy00.wav"),
        PlayWAV("sound\\Zerg\\BUGGUY\\ZBGRdy00.wav"),
        PlayWAV("sound\\Zerg\\BUGGUY\\ZBGRdy00.wav")
    },{Preserved})

    CAPlot(Circulation1, P6, 84, "middle4", nil, 1, 32, {1,0,0,0,1,0}, nil, P7, {Deaths(P11, AtMost, 900, 163),Deaths(P6, Exactly, 0, 116)}, nil,1)
    CAPlot(Circulation1, P6, 63, "middle4", nil, 1, 32, {1,0,0,0,1,0}, nil, P7, {Deaths(P11, AtLeast, 901, 163),Deaths(P6, Exactly, 0, 116)}, nil,1)
    CAPlotOrder(CS_Convert(Circulation1,12), P6, 50, "middle4", nil, 1, 32, {1,0,0,0,1,0}, nil,CSMakeCircleX(6,0,30,54,24) , Patrol, "unrevealer2", nil, {1,0}, nil, {0,32}, FP, {Deaths(P11, AtLeast, 2040, 163),Deaths(P6, Exactly, 0, 116)},nil,{})
    
    CAPlot(CS_Rotate(CS_Reverse(Circulation1),5), P6, 84, "middle4", nil, 1, 32, {1,0,0,0,1,0}, nil, P7, {Deaths(P11, AtMost, 900, 163),Deaths(P6, Exactly, 0, 116)}, nil,1)
    CAPlot(CS_Rotate(CS_Reverse(Circulation1),5), P6, 63, "middle4", nil, 1, 32, {1,0,0,0,1,0}, nil, P7, {Deaths(P11, AtLeast, 901, 163),Deaths(P6, Exactly, 0, 116)}, nil,1) 
    CAPlotOrder(CS_Convert(CS_Rotate(CS_Reverse(Circulation1),5),12), P6, 50, "middle4", nil, 1, 32, {1,0,0,0,1,0},nil,CSMakeCircleX(6,0,30,54,24), Patrol, "unrevealer2", nil, {1,0}, nil, {0,32}, FP, {Deaths(P11, AtLeast, 901, 163),Deaths(P6, Exactly, 0, 116)}, nil, {})

    for i = 1, 12 do
        local arrayLength = #M5GenG
        local genIndex = ((i - 1) % arrayLength) + 1
        CSPlotOrder2(PE, P6, M5GenG[genIndex], "middle4", nil, 1, 32, PEA, nil, Patrol, "unrevealer2", nil, 32, nil, P7, {Deaths(P11, AtLeast, 1, 165)})
        CSPlotOrder2(PE, P6, M5GenS[genIndex], "middle4", nil,1, 32, PEA, nil, Patrol, "unrevealer2", nil, 32, nil, P7, {Deaths(P11, AtLeast, 1, 165)},{SetDeaths(P11, SetTo, 0, 165)})
    end
    
    
    ----- Boss HP Overflow Trigger 4 Times & Status flag NoCollide + IsGathering ------- 
    MBossPtr5, MBossHP5, MBossHP5_2, MBoss5_EPD = CreateVars(4,FP)
    CIfOnce(FP,{Deaths(P11, AtLeast, 10, 163)})
        f_Read(FP,0x628438,nil,Nextptr) -- Save 0x628438(Next unit pointer) Offset, Convert into EPD and save into Variable
        CMov(FP,MBossPtr5,Nextptr) -- Save FBossPtr from Nextptr's 
            CDoActions(FP,{
                RotatePlayer({
                    PlayWAVX("sound\\Protoss\\TEMPLAR\\PTePss01.WAV"),
                    PlayWAVX("sound\\Protoss\\TEMPLAR\\PTePss01.WAV"),
                    TalkingPortrait(79, 1000),
                    MinimapPing("middle4")
                }, {Force1, Force5}, FP),
                CreateUnit(1,116,"middle4",P6);
                TSetMemory(Vi(MBossPtr5[2],2),SetTo,256*7000000); -- Next unit pointer offset's HP set
                TSetMemoryX(Vi(MBossPtr5[2],55),SetTo,0xA00000,0xA00000); -- Next unit pointer offset's status flag set

            })
        CMov(FP,MBossHP5,Nextptr,2) 
        DoActionsX(FP,{SetNVar(MBossHP5_2,SetTo,12)})
    CIfEnd()

    CTrigger(FP,{
        TMemory(MBossHP5,AtMost,256*2000000);
        NVar(MBossHP5_2,AtLeast,1);
    },{
        TSetMemory(MBossHP5,SetTo,256*7000000);
        SetNVar(MBossHP5_2,Subtract,1);
        SetDeaths(P11, SetTo, 1, 165);
        SetDeaths(P11, SetTo, 102, 164);
    },{preserved})

    CAPlot(CS_SortR(PE,0), P7, 72, "middle4", nil, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P6, Exactly, 1, 116)})
    TriggerX(Force1, {Deaths(P6, Exactly, 1, 116)}, {
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        DisplayText(StrDesignX("몰아치는 감정 속 세계선의 주인, \x0eＴ\x1cｉｄａｌ \x1fＷａｖｅ\x04를 격파하였습니다 ! "), 4),
        DisplayText(StrDesignX("+ \x1f300,000 Ore 획득 !"), 4),
        SetResources(CurrentPlayer, Add, 300000, Ore),
        SetDeaths(P6, SetTo, 1, 203)
    })
    CIfEnd()
    ------------ End of Boss HP Overflow Trigger ----------------------
    ------------ End of 5 Middle Boss Trigger  -------------------


    ------------- Start of 7 Middle Boss Trigger ------------------- Death vaule = 166 , vision death value = P11, 100
    -- + Timeline plot + 0.5
    
    -- 82 -- Last gen


GTL1 = {104,17,65,66,30,81,95,74,76,3,74}
STL1 = {21,7,12,58,70,89,64,96,29,88,28}
    TriggerX(P7, {CommandLeastAt(127, "middle3")}, {SetDeaths(P11, Add, 1, 166)}, preserved)
    VerifLoc = {"patbat1","patbat2","patbat3","patbat4"}
    CIf(Force2, {Deaths(P11, AtMost, (MB7TL[#MB7TL] * SDspeed) + SDspeed, 166)})
    TriggerX(Force1, {Deaths(P11, AtLeast, 10, 166), Deaths(P6, AtLeast, 0, 126)},{
        SetAllianceStatus(P8, Ally)
    })
    TriggerX(FP, {
        Deaths(P11, AtLeast, 10, 166),
        Deaths(P11, AtMost, (MB7TL[#MB7TL] * SDspeed) + SDspeed, 166),

    }, {
        SetDeaths(P8, SetTo, 0, 131), -- small wave
        SetDeaths(P8, Subtract, 1, 132) -- big wave
    }, preserved)
    function VerifingPatternL(location, deathvar) -- Fatal = 9, Safe = 98
        ---- Setting verification section ---
        TriggerX(FP, {Deaths(P11, AtLeast, deathvar * SDspeed, 166),Deaths(P6, Exactly, 0, 126)}, {
            CreateUnit(1, 47, location, P8),
            Order(47, P8, location, Move, "unrevealer1")
        })

        Trigger2X(FP, {
            Bring(P8, AtLeast, 1, 47, "unrevealer1")
        }, {
            RotatePlayer({
            PlayWAVX("staredit\\wav\\7effects.ogg"),
            }, {Force1, force5}, FP),
            KillUnitAt(All, 47, "unrevealer1", P8),
            CreateUnit(1, 72, "unrevealer1", P8),
            CreateUnit(7, 99, "unrevealer1", P6)
        },preserved)
    end 

    function VerifingPatternS(location, deathvar) -- Fatal = 9, Safe = 98
        ---- Setting verification section ---
        TriggerX(FP, {Deaths(P11, AtLeast, deathvar * SDspeed, 166),Deaths(P6, Exactly, 0, 126)}, {
            CreateUnit(1, 179, location, P8),
            Order(179, P8, location, Move, "unrevealer1")
        })

        Trigger2X(FP, {
            Bring(P8, AtLeast, 1, 179, "unrevealer1")
        }, {
            RotatePlayer({
            PlayWAVX("staredit\\wav\\7effects.ogg"),
            }, {Force1, force5}, FP),
            KillUnitAt(All, 179, "unrevealer1", P8),
            CreateUnit(1, 72, "unrevealer1", P8),
            CreateUnit(7, 71, "unrevealer1", P6),
            SetInvincibility(Disable, "Men", Force1, "middle3")
        },preserved)
    end 

    function VerifingPatternI(location, deathvar) -- Fatal = 9, Safe = 98
        ---- Setting verification section ---
        TriggerX(FP, {Deaths(P11, AtLeast, deathvar * SDspeed, 166),Deaths(P6, Exactly, 0, 126)}, {
            CreateUnit(1, 180, location, P8),
            Order(180, P8, location, Move, "unrevealer1")
        })

        Trigger2X(FP, {
            Bring(P8, AtLeast, 1, 180, "unrevealer1")
        }, {
            RotatePlayer({
            PlayWAVX("staredit\\wav\\7effects.ogg"),
            }, {Force1, force5}, FP),
            KillUnitAt(All, 180, "unrevealer1", P8),
            CreateUnit(1, 72, "unrevealer1", P8),
            CreateUnit(7, 50, "unrevealer1", P6)
        },preserved)
    end 

    function VerifingPatternE(location, deathvar) -- Fatal = 9, Safe = 98
        ---- Setting verification section ---
        TriggerX(FP, {Deaths(P11, AtLeast, deathvar * SDspeed, 166),Deaths(P6, Exactly, 0, 126)}, {
            CreateUnit(1, 181, location, P8),
            Order(181, P8, location, Move, "unrevealer1")
        })

        Trigger2X(FP, {
            Bring(P8, AtLeast, 1, 181, "unrevealer1")
        }, {
            RotatePlayer({
            PlayWAVX("staredit\\wav\\7effects.ogg"),
            }, {Force1, force5}, FP),
            KillUnitAt(All, 181, "unrevealer1", P8),
            CreateUnit(1, 72, "unrevealer1", P8),
            CreateUnit(7, 45, "unrevealer1", P6)
        },preserved)
    end 

    VerifingPatternS(VerifLoc[1], MB7TL[2])
    VerifingPatternI(VerifLoc[1], MB7TL[6])
    VerifingPatternI(VerifLoc[2], MB7TL[10])
    VerifingPatternE(VerifLoc[3], MB7TL[14])
    VerifingPatternL(VerifLoc[2], MB7TL[18])
    VerifingPatternI(VerifLoc[1], MB7TL[22])
    VerifingPatternI(VerifLoc[4], MB7TL[26])
    VerifingPatternS(VerifLoc[2], MB7TL[29])





    for i = 1 , #MB7TL do --- Length == 32
        local arrayLength = #GTL1
        local genIndex = ((i - 1) % arrayLength) + 1
        CSPlotOrder(MB1CircleS, P6, GTL1[genIndex], "middle3", nil, 1, 32, MB1CircleA, nil, Attack, "unrevealer1", nil, 32, nil, FP, {Deaths(P11, AtLeast, MB7TL[i] * SDspeed, 166)})
        CSPlotOrder(MB1CircleS, P6, STL1[genIndex], "middle3", nil, 1, 32, MB1CircleA, nil, Attack, "unrevealer1", nil, 32, nil, FP, {Deaths(P11, AtLeast, (MB7TL[i] + 0.5) * SDspeed , 166)})
    end
    CSPlotOrder(MB1CircleS, P6, 28, "middle3", nil, 1, 32, MB1CircleA, nil, Attack, "unrevealer1", nil, 32, nil, FP, {Deaths(P11, AtLeast, 131.3 * SDspeed, 166)})
    CSPlotOrder(MB1CircleS, P6, 102, "middle3", nil, 1, 32, MB1CircleA, nil, Attack, "unrevealer1", nil, 32, nil, FP, {Deaths(P11, AtLeast, 131.9 * SDspeed , 166)})



    CAPlot(CS_SortR(PE,0), P7, 72, "middle3", nil, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P11, AtLeast, 82 * SDspeed, 166), Deaths(P6, Exactly, 1, 126)})
    TriggerX(Force1, {CommandLeastAt(127, "middle3"),Deaths(P11, AtLeast, 131.9 * SDspeed, 166), Deaths(P6, Exactly, 1, 126)}, {
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        DisplayText(StrDesignX("\x07절경\x04과 \x08공포\x04의 세계선의 주인, \x08Φ ό β ο ς\x04를 격파하였습니다 ! "), 4),
        DisplayText(StrDesignX("+ \x1f 300,000 Ore 획득 !"), 4),
        SetResources(CurrentPlayer, Add, 300000, Ore),
        SetDeaths(P6, SetTo, 1, 202)
    })
    

    ----- Boss HP Overflow Trigger 4 Times & Status flag NoCollide + IsGathering ------- 5746
    MBossPtr7, MBossHP7, MBossHP7_2 = CreateVars(3,FP)
    CIfOnce(FP,{CommandLeastAt(127, "middle3"), Deaths(P11, AtLeast, 10, 166)})
        f_Read(FP,0x628438,nil,Nextptr) -- Save 0x628438(Next unit pointer) Offset, Convert into EPD and save into Variable
        CMov(FP,MBossPtr7,Nextptr) -- Save FBossPtr from Nextptr's 
            CDoActions(FP,{
                RotatePlayer({
                    PlayWAVX("staredit\\wav\\7Start.ogg");
                    MinimapPing("middle3"),
                }, {Force1,Force5}, FP),
                CreateUnit(1,126,"middle3",P6);
                TSetMemory(Vi(MBossPtr7[2],2),SetTo,256*6500000); -- Next unit pointer offset's HP set
                TSetMemoryX(Vi(MBossPtr7[2],55),SetTo,0xA00000,0xA00000); -- Next unit pointer offset's status flag set
            })
        CMov(FP,MBossHP7,Nextptr,2) 
        DoActionsX(FP,{SetNVar(MBossHP7_2,SetTo,10)})
    CIfEnd()

    CTrigger(FP,{
        TMemory(MBossHP7,AtMost,256*1200000);
        NVar(MBossHP7_2,AtLeast,1);
    },{
        TSetMemory(MBossHP7,SetTo,256*8000000);
        SetNVar(MBossHP7_2,Subtract,1);
    },{preserved})
    CIfEnd()
----------------------------------------------------------------------------------------------------
CElseX()
----------------------------------------------------------------------------------------------------
    TriggerX(P7, {CommandLeastAt(174, "middle1")}, {SetDeaths(P11, Add, 1, 160)}, preserved)

    CIf(Force2, {Deaths(P11, AtMost, (M11tl[#M11tl] * SDspeed) + SDspeed, 160)})
    MemoryProp = {
        clocked = false,
        burrowed = false,
        intransit = false,
        hallucinated = false,
        invincible = false,
        hitpoint = 80,
        shield = 80,
        energy = 0,
        resource = 0,
        hanger = 0,
    }
    MiddleGen = CSMakeLine(3,32,0,22,1)


    TriggerX(FP, {
        Deaths(P11, AtLeast, 15, 160),
        Deaths(P11, AtMost, (M11tl[#M11tl] * SDspeed) + SDspeed, 160),
        Deaths(P6, Exactly, 0, 22)
    }, {
        SetDeaths(P8, SetTo, 0, 131), -- small wave
        SetDeaths(P8, Subtract, 1, 132) -- big wave
    }, preserved)

    TriggerX(FP, {Deaths(P11, AtLeast, M11tl[1] * SDspeed, 160)}, {SetInvincibility(Enable, 22, P6, "middle1")})
    TriggerX(FP, {Deaths(P11, AtLeast, 1, 225)}, {SetInvincibility(Enable, 22, P6, "middle1")}, preserved)
    TriggerX(FP, {Deaths(P11, AtLeast, 1, 225)}, {SetDeaths(P11, Subtract, 1, 225)}, preserved)
    TriggerX(FP, {Deaths(P11, Exactly, 0, 225)}, {SetInvincibility(Disable, 22, P6, "middle1")}, preserved)
    TriggerX(FP, {Deaths(P11, AtLeast, 1, 225)}, {SetSpriteImage(227, 983)})

    CIfOnce(FP,{Deaths(P11, Exactly, 10, 160)})
        f_Read(FP,0x628438,nil,Nextptr) -- Save 0x628438(Next unit pointer) Offset, Convert into EPD and save into Variable
        DoActions(FP,SetImageColor(237,16))
        CMov(FP,MBossPtr11,Nextptr) -- Save FBossPtr from Nextptr's 
            CDoActions(FP,{
                CreateUnit(1,22,"nuke3",P6);
                SetInvincibility(Enable, 22, P6, "nuke3");
                TSetMemory(Vi(MBossPtr11[2],2),SetTo,256*6500000); -- Next unit pointer offset's HP set
                TSetMemoryX(Vi(MBossPtr11[2], 55), SetTo, 0xA08000, 0xA08000); -- Next unit pointer offset's status flag set
            })
        CMov(FP,MBossHP11,Nextptr,2) 
        DoActionsX(FP,{SetNVar(MBossHP11_2,SetTo,40)})
        DoActions(FP,SetImageColor(237,0))
    CIfEnd()
    CTrigger(FP,{
        TMemory(MBossHP11,AtMost,256*2000000);
        NVar(MBossHP11_2,AtLeast,1);
    },{
        TSetMemory(MBossHP11,SetTo,256*6500000);
        SetNVar(MBossHP11_2,Subtract,1);
        SetDeaths(P12, SetTo, 102, 225);
    },{preserved})

    TriggerX(Force1, {Deaths(P11, Exactly, 20, 160)}, {
        MinimapPing("middle1"),
        MinimapPing("middle1"),
        MinimapPing("middle1"),
        PlayWAV("sound\\Terran\\KERRIGAN\\UKePss04.wav"),
        PlayWAV("sound\\Terran\\KERRIGAN\\UKePss04.wav"),
        PlayWAV("sound\\Terran\\KERRIGAN\\UKePss04.wav"),
        TalkingPortrait(16, 1000)
    })

    TriggerX(Force1, {Deaths(P11, Exactly, 22, 160)},{MoveUnit(1, 22, P6, "nuke3", "middle1")})
    local n = #MBoss11_1T
    for i = 1 ,32 do
        local index = (i - 1) % n + 1
        CSPlotWithProperties(CS_Rotate3D(MiddleGen,(360-11.25*i),(11.25*i),(360-11.25*i)), P5, MBoss11_1T[index], "middle1", {495,351}, 1, 32, FP, {Deaths(P11, AtLeast, (M11tl[1]*SDspeed) + (12 + i*11),160)}, nil, nil, MemoryProp)
    end
    CAPlot(Shape11_1, P6, 3, M11, {495,351}, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P11, AtLeast, M11tl[1] * SDspeed, 160)})
    CAPlot(CS_Reverse(Shape11_1), P6, 89, M11, {495,351}, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P11, AtLeast, M11tl[2] * SDspeed, 160)})
    CAPlot(CS_Shuffle(Shape11_1), P6, 88, M11, {495,351}, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P11, AtLeast, M11tl[3] * SDspeed, 160)})
    CAPlot(CS_Shuffle(Shape11_1), P6, 77, M11, {495,351}, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P11, AtLeast, M11tl[4] * SDspeed, 160)})
    CSPlotWithProperties(Shape11_1, P5, 27, M11, {495,351}, 1, 32, P6, {Deaths(P11, AtLeast, M11tl[5] * SDspeed, 160)}, nil,nil, Onlyhallucinated)
    for i = 1, 4 do 
        TriggerX(FP, {Deaths(P11, AtLeast, M11tl[5] * SDspeed, 160)}, CreateUnit(1, 27, RealB[i], P5))
    end
    for i = 1, 4 do
        TriggerX(FP, {Deaths(P11, AtLeast, M11tl[5] * SDspeed, 160)},CreateUnit(1, 27, RealB2[i], P5))
    end
    TriggerX(FP,{Deaths(P11, AtLeast, M11tl[6] * SDspeed - 10, 160)}, {RemoveUnit(27, Force2),SetImageColor(137, 16)})
    for i = 1, 4 do
        TriggerX(FP,{Deaths(P11, AtLeast, M11tl[6] * SDspeed, 160)}, {CreateUnit(1, 57, RealB[i], P5),CreateUnit(1, 57, RealB2[i], P5)})
    end
    TriggerX(FP,{Deaths(P11, AtLeast, M11tl[6] * SDspeed + 1, 160)}, {SetImageColor(137, 0)})
    
    CAPlotWithProperties(CS_Reverse(CS_SortR(HiveEtf2,1)), P5, 11, M11, {495,351}, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P11, AtLeast, M11tl[6] * SDspeed, 160)}, nil, nil, StargateProperties)
    -- CSPlotOrderWithProperties(CSMakeSpiral(6, 16, 1/2, 0, 0, 130, 71), P5, 11, "nuke3", nil, 1, 32, HiveEtf2, nil, Attack, "middle1", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[6] * SDspeed, 160)}, nil, nil,StargateProperties)
    TriggerX(Force2,{Deaths(P11, AtLeast, M11tl[12] * SDspeed, 160)})

    for i = 1 ,64 do
        local index = (i - 1) % n + 1
        CSPlotWithProperties(CS_Rotate3D(MiddleGen2,(360-11.25*i),(11.25*i),(360-11.25*i)), P5, MBoss11_1T[index], "middle1", {495,351}, 1, 32, FP, {Deaths(P11, AtLeast, (M11tl[7]*SDspeed) + (12 + i*11),160)}, nil, nil, MemoryProp)
    end
    TriggerX(Force2,{Deaths(P11, AtLeast, M11tl[8] * SDspeed, 160)}, {KillUnitAt(All, 11, "Anywhere", P5)})
    CSPlotOrder(HiveEtf2, P6, 72, M11, {495,351}, 1, 32, HiveEtf2A, nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[8] * SDspeed, 160)})
    CSPlotOrder(HiveEtf2, P6, 76, M11, {495,351}, 1, 32, HiveEtf2A, nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[8] * SDspeed, 160)})
    CSPlotOrder(HiveEtf2, P6, 93, M11, {495,351}, 1, 32, HiveEtf2A, nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[8] * SDspeed, 160)})
    CSPlotOrder(HiveEtf2, P6, 64, M11, {495,351}, 1, 32, HiveEtf2A, nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[8] * SDspeed, 160)})
    for i = 1, 8 do
        CSPlotOrder(CS_Rotate(TSFL1, 51.4*(i-1)), P6, MBoss11_2P[i], M11, {495,351}, 1, 32, CSMakeLine(1,0,0,10,1), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[i+8] * SDspeed, 160)})
    end
    CSPlot(CS_RatioXY(CS_Rotate3D(sixline,45,45,45),2,2), P6, 72, M11, {495,351}, 1, 32, P7, {Deaths(P11, AtLeast, M11tl[17] * SDspeed, 160)})
    CSPlotOrder(CS_Convert(CSMakePolygon(6,60,0,85,0),45), P6, 58, M11, {495,351}, 1, 32,CSMakePolygon(6,60,0,45,0),nil, Attack, "nuke3", nil, 32, nil, P7,{Deaths(P11, AtLeast, (M11tl[17] + 0.6) * SDspeed, 160)})
    CSPlot(CS_RatioXY(CS_Rotate3D(sixline,45,0,45),2,2), P6, 72, M11, {495,351}, 1, 32, P7, {Deaths(P11, AtLeast, M11tl[18] * SDspeed, 160)})
    CSPlotOrder(CS_Convert(CSMakePolygon(6,60,0,85,0),45), P6, 69, M11, {495,351}, 1, 32,CSMakePolygon(6,60,0,45,0),nil, Attack, "nuke3", nil, 32, nil, P7,{Deaths(P11, AtLeast, (M11tl[18] + 0.6) * SDspeed, 160)})

    for i = 1, 8 do
        CSPlotOrder(CS_Rotate(TSFL1, 360-51.4*(i-1)), P6, MBoss11_2P[i], M11, {495,351}, 1, 32, CSMakeLine(1,0,0,10,1), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[i+18] * SDspeed, 160)})
    end
    TriggerX(Force2,{Deaths(P11, AtLeast, M11tl[26] * SDspeed, 160)})
    for i = 1 ,64 do
        local index = (i - 1) % n + 1
        CSPlotWithProperties(CS_Rotate3D(MiddleGen2,(360-11.25*i),(11.25*i),(360-11.25*i)), P6, MBoss11_1T[index], "middle1", {495,351}, 1, 32, FP, {Deaths(P11, AtLeast, (M11tl[26]*SDspeed) + (12 + i*11),160)}, nil, nil, MemoryProp)
    end
    CSPlotOrder(Shape11_1, P6, 16, M11, {495,351}, 1, 32, CSMakePolygon(6,0,0,92,7), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[27] * SDspeed, 160)})
    CSPlotOrder(Shape11_1, P6, 25, M11, {495,351}, 1, 32, CSMakePolygon(6,0,0,92,7), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[28] * SDspeed, 160)})
    CSPlotOrder(Shape11_1, P6, 60, M11, {495,351}, 1, 32, CSMakePolygon(6,0,0,92,7), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[29] * SDspeed, 160)})

    CSPlot(CS_RatioXY(CS_Rotate3D(sixline,45,45,45),2,2), P6, 72, M11, {495,351}, 1, 32, P7, {Deaths(P11, AtLeast, M11tl[30] * SDspeed, 160)})
    CSPlotOrder(CS_Convert(CSMakePolygon(6,60,0,92,0),45), P6, 58, M11, {495,351}, 1, 32,CSMakePolygon(6,60,0,45,0),nil, Attack, "nuke3", nil, 32, nil, P7,{Deaths(P11, AtLeast, (M11tl[30] + 0.6) * SDspeed, 160)})
    CSPlot(CS_RatioXY(CS_Rotate3D(sixline,45,0,45),2,2), P6, 72, M11, {495,351}, 1, 32, P7, {Deaths(P11, AtLeast, M11tl[31] * SDspeed, 160)})
    CSPlotOrder(CS_Convert(CSMakePolygon(6,60,0,92,0),45), P6, 69, M11, {495,351}, 1, 32,CSMakePolygon(6,60,0,45,0),nil, Attack, "nuke3", nil, 32, nil, P7,{Deaths(P11, AtLeast, (M11tl[31] + 0.6) * SDspeed, 160)})
    CSPlotOrder(Shape11_1, P6, 23, M11, {495,351}, 1, 32, CSMakePolygon(6,0,0,92,7), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[32] * SDspeed, 160)})
    TriggerX(Force2,{Deaths(P11, AtLeast, M11tl[32] * SDspeed, 160)})
    CAPlot(Shape11_1, P6, 60, M11, {495,351}, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P11, AtLeast, M11tl[33] * SDspeed, 160)})
    CAPlot(Shape11_1, P6, 3, M11, {495,351}, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P11, AtLeast, M11tl[34] * SDspeed, 160)})
    CSPlotOrder(Shape11_1, P6, 3, M11, {495,351}, 1, 32, CSMakePolygon(6,0,0,92,7), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[35] * SDspeed, 160)})
    CSPlotOrder(Shape11_1, P6, 21, M11, {495,351}, 1, 32, CSMakePolygon(6,0,0,92,7), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[36] * SDspeed, 160)})
    CSPlotOrder(Shape11_1, P6, 102, M11, {495,351}, 1, 32, CSMakePolygon(6,0,0,92,7), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[37] * SDspeed, 160)})
    CSPlotOrder(Shape11_1, P6, 76, M11, {495,351}, 1, 32, CSMakePolygon(6,0,0,92,7), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[38] * SDspeed, 160)})
    CSPlotOrder(Shape11_1, P6, 28, M11, {495,351}, 1, 32, CSMakePolygon(6,0,0,92,7), nil, Attack, "nuke3", nil, 32, nil, P7, {Deaths(P11, AtLeast, M11tl[39] * SDspeed, 160)})
    TriggerX(Force2,{Deaths(P11, AtLeast, M11tl[39] * SDspeed, 160)})

    CAPlot(CS_SortR(PE,0), P7, 72, "nuke3", nil, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P11, AtLeast, M11tl[39] * SDspeed, 160), Deaths(P6, Exactly, 1, 22)})
    TriggerX(Force1, {Deaths(P11, AtLeast, M11tl[39] * SDspeed, 160), Deaths(P6, Exactly, 1, 22)}, {
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        DisplayText(StrDesignX("기억의 세계선의 주인, † \x07【 \x04光 \x07】 \x02†을 격파하였습니다 ! "), 4),
        DisplayText(StrDesignX("+ \x1f322,322 Ore 획득 !"), 4),
        SetResources(CurrentPlayer, Add, 322322, Ore),
        SetDeaths(P6, SetTo, 1, 205)
    })
    CIfEnd()
    ------ End of 11 Middle boss trigger -----
    

    ------ Start of 1 Middle boss trigger ----- + plot death value = 161 | skill death value = 162
    MBossPtr1, MBossHP1, MBossHP1_2 = CreateVars(3,FP)
    TriggerX(P7, {CommandLeastAt(175, "middle2")}, {SetDeaths(P11, Add, 1, 161),SetDeaths(P11, Add, 1, 162)}, preserved)

    CIf(Force2, {Deaths(P11, AtMost, (MB1TL[#MB1TL] * SDspeed) + SDspeed, 161)})
    TriggerX(FP, {
        Deaths(P11, AtLeast, 10, 161),
        Deaths(P11, AtMost, (MB1TL[#MB1TL] * SDspeed) + SDspeed, 161),
        Deaths(P6, AtLeast, 0, 68)
    }, {
        SetDeaths(P8, SetTo, 0, 131), -- small wave
        SetDeaths(P8, Subtract, 1, 132) -- big wave
    }, preserved)
    TriggerX(FP, Deaths(P11, AtLeast, 1500, 162), {SetDeaths(P11, SetTo, 1, 162)}, preserved)


    CIfOnce(FP,{CommandLeastAt(175, "middle2"),Deaths(P11, AtLeast, 10, 161)})
        f_Read(FP,0x628438,nil,Nextptr) -- Save 0x628438(Next unit pointer) Offset, Convert into EPD and save into Variable
        CMov(FP,MBossHP1,Nextptr) -- Save FBossPtr from Nextptr's 
            CDoActions(FP,{
                CreateUnit(1,68,"middle2",P6);
                TSetMemory(Vi(MBossHP1[2],2),SetTo,256*8000000); -- Next unit pointer offset's HP set
                TSetMemoryX(Vi(MBossHP1[2], 55), SetTo, 0xA00000, 0xA00000); -- Next unit pointer offset's status flag set
            })
        CMov(FP,MBossHP1,Nextptr,2) 
        DoActionsX(FP,{SetNVar(MBossHP1_2,SetTo,35)})
    CIfEnd()
    CTrigger(FP,{
        TMemory(MBossHP1,AtMost,256*2000000);
        NVar(MBossHP1_2,AtLeast,1);
    },{
        TSetMemory(MBossHP1,SetTo,256*8000000);
        SetNVar(MBossHP1_2,Subtract,1);
    },{preserved})

    ------- Start of Bullet function ------
    BulletTimer = CreateCcode()
    Temp, Bangle, RandomRange, ScatteredAngle = CreateVars(4,FP)
    Bimage = 973
    Bscript = 242
    Bcolor = 16
    BulletInitSetting(FP,{195,123,284},87,208,516,Bimage,Bscript,Bcolor,5000,10,7,1,1,3,{10,10,10},0)

    CDoActions(FP,{
        TSetNVar(RandomRange,SetTo,_Add(_Mod(_Rand(),92),8));
        SetCDeathsX("X",Add,1*16777216,BulletTimer,0xFF000000);
    })

    TriggerX(FP,{NVar(Bangle,Exactly,0)},{SetNVar(Temp,Add,2*256)},{Preserved})
    TriggerX(FP,{NVar(Bangle,Exactly,1)},{SetNVar(Temp,Add,-2*256)},{Preserved})
    
    TriggerX(FP,{CDeathsX("X",Exactly,0*16777216,BulletTimer,0xFF000000)},{SetImageColor(440,0),SetImageColor(Bimage,0)},{Preserved}) -- Yellow
    TriggerX(FP,{CDeathsX("X",Exactly,1*16777216,BulletTimer,0xFF000000)},{SetImageColor(440,16),SetImageColor(Bimage,16)},{Preserved}) -- Blue
    TriggerX(FP,{CDeathsX("X",Exactly,2*16777216,BulletTimer,0xFF000000)},{SetImageColor(440,13),SetImageColor(Bimage,13)},{Preserved}) -- Green
    SpreadBullet = InitCFunc(FP)
    CFunc(SpreadBullet)
        CreateBullet(FP,P8,195,3,ScatteredAngle,1024,RandomRange,{"middle2",3632,335},{Deaths(P11, AtLeast, 750, 162),Deaths(P6, Exactly, 0, 68)})
    CFuncEnd()
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,0*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,21*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,43*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,64*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,85*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,107*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,128*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,149*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,171*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,192*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,213*256))})
        CallCFuncX(FP,SpreadBullet)
        CDoActions(FP,{TSetNVar(ScatteredAngle,SetTo,_Add(Temp,235*256))})
        CallCFuncX(FP,SpreadBullet)

    TriggerX(FP,{NVar(Bangle,Exactly,0),NVar(Temp,AtLeast,4*255*256)},{SetNVar(Bangle,SetTo,1)},{Preserved}) 
    TriggerX(FP,{NVar(Bangle,Exactly,1),NVar(Temp,Exactly,0*256)},{SetNVar(Bangle,SetTo,0)},{Preserved}) 

    TriggerX(FP,{CDeathsX("X",Exactly,3*16777216,BulletTimer,0xFF000000)},{SetCDeathsX("X",SetTo,0*16777216,BulletTimer,0xFF000000)},{Preserved}) -- ResetColor
    --------End of Bullet function ------

    ------Start of Trigger function ----
    GenerateRandomIndex,RandomIndex = CreateVars(2,FP)
    

    
    PE = CSMakeCircle(6,64,0,61,1)
    PEA = CSMakeCircle(6,0,0,61,1)
    -- CS_BMPGraph(Triangle4, {"0xFF0000"}, "1", nil, nil, 1, nil, nil, nil, 3, 1, 1, 1)
    -- CDoActions(FP, f_Rand(FP,GenerateRandomIndex), preserved)
    -- CDoActions(FP,CMov(FP, RandomIndex, GenerateRandomIndex),preserved)

    LocM1 = "middle2"
    local A1 = 0.5
    local A2 = 1
    TriggerX(Force1, {Deaths(P11, Exactly, 20, 161)}, {
        MinimapPing("middle2"),
        MinimapPing("middle2"),
        MinimapPing("middle2"),
        PlayWAV("sound\\Protoss\\ARCHON\\PArYes00.wav"),
        PlayWAV("sound\\Protoss\\ARCHON\\PArYes00.wav"),
        PlayWAV("sound\\Protoss\\ARCHON\\PArYes00.wav"),
        TalkingPortrait(68, 1000)
    })

    

    Tier1G = {8, 17 ,77, 78, 16, 25, 52, 3, 102, 104, 89, 95, 74, 3, 23}
    Tier2H = {3, 25, 23, 75, 76, 77, 78, 93, 104, 96, 75, 78, 29, 23, 7}
    Tier3H = {7, 21, 58, 60, 62, 64, 69, 28, 86, 60, 64, 69, 89, 88, 102}
    TriggerX(FP, {Deaths(P11, Exactly, (MB1TL[1]-1) * SDspeed , 161)},{SetScanImage(214)})

    CSPlot(PE, P6, 33, LocM1, nil, 1, 32, FP,{Deaths(P11, Exactly, (MB1TL[1]) * SDspeed , 161)})
    CSPlot(PE, P6, 33, LocM1, nil, 1, 32, FP,{Deaths(P11, Exactly, (MB1TL[2]) * SDspeed , 161)},{SetScanImage(928)})
    CSPlot(PE, P6, 33, LocM1, nil, 1, 32, FP,{Deaths(P11, Exactly, (MB1TL[3]) * SDspeed , 161)},{SetScanImage(546)})

    CSPlotOrder(PE, P6, 77, LocM1, nil, 1, 32, PEA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[4]) * SDspeed , 161)})
    CSPlotOrder(PE, P6, 8, LocM1, nil, 1, 32, PEA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[5]) * SDspeed , 161)})
    CSPlotOrder(PE, P6, 104, LocM1, nil, 1, 32, PEA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[6]) * SDspeed , 161)})

    CSPlotOrder(PE, P6, 16, LocM1, nil, 1, 32, PEA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[7]) * SDspeed , 161)})
    CSPlotOrder(PE, P6, 96, LocM1, nil, 1, 32, PEA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[8]) * SDspeed , 161)})
    CSPlotOrder(PE, P6, 76, LocM1, nil, 1, 32, PEA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[9]) * SDspeed , 161)})

    CSPlotOrder(PE, P6, 52, LocM1, nil, 1, 32, PEA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[10]) * SDspeed , 161)})
    CSPlotOrder(PE, P6, 58, LocM1, nil, 1, 32, PEA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[11]) * SDspeed , 161)})
    CSPlotOrder(PE, P6, 76, LocM1, nil, 1, 32, PEA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[12]) * SDspeed , 161)})

    local len1 = #Tier1G
    local len2 = #Tier2H
    local len3 = #Tier3H

    for i = 13, 43 do
        local idx1 = ((i - 13) % len1) + 1
        local idx2 = ((i - 13) % len2) + 1
        local idx3 = ((i - 13) % len3) + 1
        CSPlotOrder(PE, P6, Tier1G[idx1], LocM1, nil, 1, 32, PEA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[i]) * SDspeed , 161)})
        CSPlotOrder(PE, P6, Tier2H[idx2], LocM1, nil, 1, 32, PEA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[i] + A1) * SDspeed , 161)})
        CSPlotOrder(PE, P5, Tier3H[idx3], LocM1, nil, 1, 32, PEA, nil, Attack, "emp3", nil,32, nil, FP, {Deaths(P11, Exactly, (MB1TL[i] + A2) * SDspeed , 161)})
    end
    CSPlotOrder(PE, P6, 3, LocM1, nil, 1, 32, PEA, nil, Attack, "emp3", nil, 32, nil, FP, {Deaths(P11, Exactly, (MB1TL[44]) * SDspeed , 161)})
    CSPlotOrder(PE, P6, 7, LocM1, nil, 1, 32, PEA, nil, Attack, "emp3", nil, 32, nil, FP, {Deaths(P11, Exactly, (MB1TL[45]) * SDspeed , 161)})

    CAPlot(CS_SortR(PE,0), P7, 72, "middle2", nil, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P11, AtLeast, (MB1TL[45] + 3) * SDspeed , 161), Deaths(P6, AtLeast, 1, 68)})
    TriggerX(Force1, {Deaths(P6, AtLeast, 1, 68),Deaths(P11, AtLeast, MB1TL[45] * SDspeed,161)}, {
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        DisplayText(StrDesignX("Palm Island 세계선의 주인, ＣｈｅｅＺｅ를 격파하였습니다 ! "), 4),
        DisplayText(StrDesignX("+ \x1f300,000 Ore 획득 !"), 4),
        SetResources(CurrentPlayer, Add, 300000, Ore),
        SetDeaths(P6, SetTo, 1, 204)
    })
    CIfEnd()

    -------- End of 1 Middle Boss trigger -------

    --[[
    1리젠 후 1화홀 + 3초무적
    일정 데스값마다 안밖 스킬사용
    ]]
    -------- Start of 5 Middle Boss Trigger ------ DeathValue = 163 | BossGenerate Trigger = 165
    TriggerX(P7, {Deaths(P7, AtLeast, 1, 148)}, {SetDeaths(P11, Add, 1, 163)}, preserved)

    CIf(Force2, {Deaths(P11, AtLeast, 10, 163),Deaths(P6, AtMost, 0, 116)})
    CLX = CAPlotOrderForward()
    Circulation1 = CSMakeCircleX(6,115,30,54,24)
    TempPerAction = {9,10,13,15,16,17}
    M5GenPlot = CSMakeCircle(6,64,0,61,1)
    M5GenPlotA = CSMakeCircle(6,0,0,61,1)
    M5GenG = {30, 52, 17, 95, 93, 78, 81, 75, 23, 104, 74, 25, 76, 81, 3}
    M5GenS = {44, 8, 88, 89, 96, 62, 60, 58, 29, 64, 70, 7, 21, 69, 28}


    
    TriggerX(FP, {Deaths(P11, AtLeast, 2060, 163)}, {SetDeaths(P11, SetTo, 1, 163)}, preserved)
    TriggerX(FP, {Deaths(P11, AtLeast, 1, 164)}, {SetInvincibility(Enable, 116, P6, "middle4")}, preserved)
    TriggerX(FP, {Deaths(P11, AtLeast, 1, 164)}, {SetDeaths(P11, Subtract, 1, 164)}, preserved)
    TriggerX(FP, {Deaths(P11, Exactly, 0, 164)}, {SetInvincibility(Disable, 116, P6, "middle4")}, preserved)

    TriggerX(FP, {Bring(P6, AtLeast, 50, 150, "middle4")}, {KillUnitAt(All, 50, "middle4", P6)}, preserved)
    TriggerX(Force1, {Deaths(P11, Exactly, 798, 163),Deaths(P6, Exactly, 0, 116)}, {PlayWAV("sound\\Zerg\\BUGGUY\\ZBGRdy00.wav"),PlayWAV("sound\\Zerg\\BUGGUY\\ZBGRdy00.wav"),PlayWAV("sound\\Zerg\\BUGGUY\\ZBGRdy00.wav")},{Preserved})

    CAPlot(Circulation1, P6, 84, "middle4", nil, 1, 32, {1,0,0,0,1,0}, nil, P7, {Deaths(P11, AtMost, 900, 163),Deaths(P6, Exactly, 0, 116)}, nil,1)
    CAPlot(Circulation1, P6, 63, "middle4", nil, 1, 32, {1,0,0,0,1,0}, nil, P7, {Deaths(P11, AtLeast, 901, 163),Deaths(P6, Exactly, 0, 116)}, nil,1)
    CAPlotOrder(Circulation1, P6, 50, "middle4", nil, 1, 32, {1,0,0,0,1,0}, nil,CSMakeCircleX(6,0,30,54,24) , Patrol, "unrevealer2", nil, {1,0}, nil, {0,32}, FP, {Deaths(P11, AtLeast, 2040, 163),Deaths(P6, Exactly, 0, 116)},nil,{})
    
    CAPlot(CS_Rotate(CS_Reverse(Circulation1),5), P6, 84, "middle4", nil, 1, 32, {1,0,0,0,1,0}, nil, P7, {Deaths(P11, AtMost, 900, 163),Deaths(P6, Exactly, 0, 116)}, nil,1)
    CAPlot(CS_Rotate(CS_Reverse(Circulation1),5), P6, 63, "middle4", nil, 1, 32, {1,0,0,0,1,0}, nil, P7, {Deaths(P11, AtLeast, 901, 163),Deaths(P6, Exactly, 0, 116)}, nil,1) 
    CAPlotOrder(CS_Rotate(CS_Reverse(Circulation1),5), P6, 50, "middle4", nil, 1, 32, {1,0,0,0,1,0},nil,CSMakeCircleX(6,0,30,54,24), Patrol, "unrevealer2", nil, {1,0}, nil, {0,32}, FP, {Deaths(P11, AtLeast, 901, 163),Deaths(P6, Exactly, 0, 116)}, nil, {})

    for i = 1, 25 do
        local arrayLength = #M5GenG
        local genIndex = ((i - 1) % arrayLength) + 1
        CSPlotOrder2(Generator_shape, P6, M5GenG[genIndex], "middle4", nil, 1, 32, Generator_shapeA, nil, Patrol, "unrevealer2", nil, 32, nil, P7, {Deaths(P11, AtLeast, 1, 165)})
        CSPlotOrder2(Generator_shape, P6, M5GenS[genIndex], "middle4", nil,1, 32, Generator_shapeA, nil, Patrol, "unrevealer2", nil, 32, nil, P7, {Deaths(P11, AtLeast, 1, 165)},{SetDeaths(P11, SetTo, 0, 165)})
    end
    
    
    ----- Boss HP Overflow Trigger 4 Times & Status flag NoCollide + IsGathering ------- 
    MBossPtr5, MBossHP5, MBossHP5_2, MBoss5_EPD = CreateVars(4,FP)
    CIfOnce(FP,{Deaths(P11, AtLeast, 10, 163)})
        f_Read(FP,0x628438,nil,Nextptr) -- Save 0x628438(Next unit pointer) Offset, Convert into EPD and save into Variable
        CMov(FP,MBossPtr5,Nextptr) -- Save FBossPtr from Nextptr's 
            CDoActions(FP,{
                RotatePlayer({
                    PlayWAVX("sound\\Protoss\\TEMPLAR\\PTePss01.WAV"),
                    PlayWAVX("sound\\Protoss\\TEMPLAR\\PTePss01.WAV"),
                    TalkingPortrait(79, 1000),
                    MinimapPing("middle4")
                }, {Force1, Force5}, FP),
                CreateUnit(1,116,"middle4",P6);
                TSetMemory(Vi(MBossPtr5[2],2),SetTo,256*8300000); -- Next unit pointer offset's HP set
                TSetMemoryX(Vi(MBossPtr5[2],55),SetTo,0xA00000,0xA00000); -- Next unit pointer offset's status flag set

            })
        CMov(FP,MBossHP5,Nextptr,2) 
        DoActionsX(FP,{SetNVar(MBossHP5_2,SetTo,25)})
    CIfEnd()

    CTrigger(FP,{
        TMemory(MBossHP5,AtMost,256*1500000);
        NVar(MBossHP5_2,AtLeast,1);
    },{
        TSetMemory(MBossHP5,SetTo,256*8300000);
        SetNVar(MBossHP5_2,Subtract,1);
        SetDeaths(P11, SetTo, 1, 165);
        SetDeaths(P11, SetTo, 102, 164);
    },{preserved})

    CAPlot(CS_SortR(PE,0), P7, 72, "middle4", nil, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P6, Exactly, 1, 116)})
    TriggerX(Force1, {Deaths(P6, Exactly, 1, 116)}, {
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        DisplayText(StrDesignX("몰아치는 감정 속 세계선의 주인, \x0eＴ\x1cｉｄａｌ \x1fＷａｖｅ\x04를 격파하였습니다 ! "), 4),
        DisplayText(StrDesignX("+ \x1f300,000 Ore 획득 !"), 4),
        SetResources(CurrentPlayer, Add, 300000, Ore),
        SetDeaths(P6, SetTo, 1, 203)
    })
    CIfEnd()
    ------------ End of Boss HP Overflow Trigger ----------------------
    ------------ End of 5 Middle Boss Trigger  -------------------


    ------------- Start of 7 Middle Boss Trigger ------------------- Death vaule = 166 , vision death value = P11, 100
    -- + Timeline plot + 0.5
    
    -- 82 -- Last gen


GTL1 = {104,17,77,78,25,81,95,93,76,3,78}
STL1 = {21,7,12,58,70,89,64,96,58,88,28}
    TriggerX(P7, {CommandLeastAt(127, "middle3")}, {SetDeaths(P11, Add, 1, 166)}, preserved)
    VerifLoc = {"patbat1","patbat2","patbat3","patbat4"}
    CIf(AllPlayers, {Deaths(P11, AtMost, (MB7TL[#MB7TL] * SDspeed) + SDspeed, 166)})
    DoActions(FP, {
        SetInvincibility(Disable, "Men", Force1, "middle3")
    }, preserved)
    TriggerX(Force1, {Deaths(P11, AtLeast, 10, 166), Deaths(P6, AtLeast, 0, 126)},{
        SetAllianceStatus(P8, Ally)
    })
    TriggerX(FP, {
        Deaths(P11, AtLeast, 10, 166),
        Deaths(P11, AtMost, (MB7TL[#MB7TL] * SDspeed) + SDspeed, 166),

    }, {
        SetDeaths(P8, SetTo, 0, 131), -- small wave
        SetDeaths(P8, Subtract, 1, 132) -- big wave
    }, preserved)
    function VerifingPatternL(location, deathvar) -- Fatal = 9, Safe = 98
        ---- Setting verification section ---
        TriggerX(FP, {Deaths(P11, AtLeast, deathvar * SDspeed, 166),Deaths(P6, Exactly, 0, 126)}, {
            RotatePlayer({
                MinimapPing(location);
            }, {Force1, Force5}, FP),
            CreateUnit(1, 47, location, P8),
            Order(47, P8, location, Move, "unrevealer1")
        })

        Trigger2X(FP, {
            Bring(P8, AtLeast, 1, 47, "unrevealer1")
        }, {
            RotatePlayer({
            PlayWAVX("staredit\\wav\\7effects.ogg"),
            }, {Force1, force5}, FP),
            KillUnitAt(All, 47, "unrevealer1", P8),
            CreateUnit(1, 72, "unrevealer1", P8),
            CreateUnit(7, 99, "unrevealer1", P6)
        },preserved)
    end 

    function VerifingPatternS(location, deathvar) -- Fatal = 9, Safe = 98
        ---- Setting verification section ---
        TriggerX(FP, {Deaths(P11, AtLeast, deathvar * SDspeed, 166),Deaths(P6, Exactly, 0, 126)}, {
            RotatePlayer({
                MinimapPing(location);
            }, {Force1, Force5}, FP),
            CreateUnit(1, 179, location, P8),
            Order(179, P8, location, Move, "unrevealer1")
        })

        Trigger2X(FP, {
            Bring(P8, AtLeast, 1, 179, "unrevealer1")
        }, {
            RotatePlayer({
            PlayWAVX("staredit\\wav\\7effects.ogg"),            
            }, {Force1, force5}, FP),
            KillUnitAt(All, 179, "unrevealer1", P8),
            CreateUnit(1, 72, "unrevealer1", P8),
            CreateUnit(7, 71, "unrevealer1", P6),
            SetInvincibility(Disable, "Men", Force1, "middle3")
        },preserved)
    end 

    function VerifingPatternI(location, deathvar) -- Fatal = 9, Safe = 98
        --- Setting verification section ---
        TriggerX(FP, {Deaths(P11, AtLeast, deathvar * SDspeed, 166),Deaths(P6, Exactly, 0, 126)}, {
            RotatePlayer({
                MinimapPing(location);
            }, {Force1, Force5}, FP),
            CreateUnit(1, 180, location, P8),
            Order(180, P8, location, Move, "unrevealer1")
        })

        Trigger2X(FP, {
            Bring(P8, AtLeast, 1, 180, "unrevealer1")
        }, {
            RotatePlayer({
            PlayWAVX("staredit\\wav\\7effects.ogg"),
            }, {Force1, force5}, FP),
            KillUnitAt(All, 180, "unrevealer1", P8),
            CreateUnit(1, 72, "unrevealer1", P8),
            CreateUnit(7, 50, "unrevealer1", P6)
        },preserved)
    end 

    function VerifingPatternE(location, deathvar) -- Fatal = 9, Safe = 98
        ---- Setting verification section ---
        TriggerX(FP, {Deaths(P11, AtLeast, deathvar * SDspeed, 166),Deaths(P6, Exactly, 0, 126)}, {
            RotatePlayer({
                MinimapPing(location);
            }, {Force1, Force5}, FP),
            CreateUnit(1, 181, location, P8),
            Order(181, P8, location, Move, "unrevealer1")
        })

        Trigger2X(FP, {
            Bring(P8, AtLeast, 1, 181, "unrevealer1")
        }, {
            RotatePlayer({
            PlayWAVX("staredit\\wav\\7effects.ogg"),
            }, {Force1, force5}, FP),
            KillUnitAt(All, 181, "unrevealer1", P8),
            CreateUnit(1, 72, "unrevealer1", P8),
            CreateUnit(7, 45, "unrevealer1", P6)
        },preserved)
    end 

    VerifingPatternS(VerifLoc[1], MB7TL[2])
    VerifingPatternL(VerifLoc[3], MB7TL[4])
    VerifingPatternI(VerifLoc[1], MB7TL[6])
    VerifingPatternE(VerifLoc[4], MB7TL[8])
    VerifingPatternI(VerifLoc[2], MB7TL[10])
    VerifingPatternS(VerifLoc[4], MB7TL[12])
    VerifingPatternE(VerifLoc[3], MB7TL[14])
    VerifingPatternI(VerifLoc[1], MB7TL[16])
    VerifingPatternL(VerifLoc[2], MB7TL[18])
    VerifingPatternE(VerifLoc[4], MB7TL[20])
    VerifingPatternI(VerifLoc[1], MB7TL[22])
    VerifingPatternL(VerifLoc[2], MB7TL[24])
    VerifingPatternI(VerifLoc[4], MB7TL[26])
    VerifingPatternE(VerifLoc[1], MB7TL[28])
    VerifingPatternS(VerifLoc[2], MB7TL[29])





    for i = 1 , #MB7TL do --- Length == 32
        local arrayLength = #GTL1
        local genIndex = ((i - 1) % arrayLength) + 1
        CSPlotOrder(PE, P6, GTL1[genIndex], "middle3", nil, 1, 32, PEA, nil, Attack, "unrevealer1", nil, 32, nil, FP, {Deaths(P11, AtLeast, MB7TL[i] * SDspeed, 166)})
        CSPlotOrder(PE, P6, STL1[genIndex], "middle3", nil, 1, 32, PEA, nil, Attack, "unrevealer1", nil, 32, nil, FP, {Deaths(P11, AtLeast, (MB7TL[i] + 0.5) * SDspeed , 166)})
    end
    CSPlotOrder(PE, P6, 28, "middle3", nil, 1, 32, PEA, nil, Attack, "unrevealer1", nil, 32, nil, FP, {Deaths(P11, AtLeast, 131.3 * SDspeed, 166)})
    CSPlotOrder(PE, P6, 102, "middle3", nil, 1, 32, PEA, nil, Attack, "unrevealer1", nil, 32, nil, FP, {Deaths(P11, AtLeast, 131.9 * SDspeed , 166)})



    CAPlot(CS_SortR(PE,0), P7, 72, "middle3", nil, 1, 32, {1,0,0,0,6,0}, nil, P7, {Deaths(P11, AtLeast, 131.3 * SDspeed, 166), Deaths(P6, Exactly, 1, 126)})
    TriggerX(Force1, {CommandLeastAt(127, "middle3"),Deaths(P11, AtLeast, 131.3 * SDspeed, 166),Deaths(P6, Exactly, 1, 126)}, {
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        PlayWAV("staredit\\wav\\BOSSClear.ogg"),
        DisplayText(StrDesignX("\x07절경\x04과 \x08공포\x04의 세계선의 주인, \x08Φ ό β ο ς\x04를 격파하였습니다 ! "), 4),
        DisplayText(StrDesignX("+ \x1f 300,000 Ore 획득 !"), 4),
        SetResources(CurrentPlayer, Add, 300000, Ore),
        SetDeaths(P6, SetTo, 1, 202)
    })
    

    ----- Boss HP Overflow Trigger 4 Times & Status flag NoCollide + IsGathering ------- 5746
    MBossPtr7, MBossHP7, MBossHP7_2 = CreateVars(3,FP)
    CIfOnce(FP,{CommandLeastAt(127, "middle3"), Deaths(P11, AtLeast, 10, 166)})
        f_Read(FP,0x628438,nil,Nextptr) -- Save 0x628438(Next unit pointer) Offset, Convert into EPD and save into Variable
        CMov(FP,MBossPtr7,Nextptr) -- Save FBossPtr from Nextptr's 
            CDoActions(FP,{
                RotatePlayer({
                    PlayWAVX("staredit\\wav\\7Start.ogg"),
                    MinimapPing("middle3"),
                    MinimapPing("middle3"),
                    TalkingPortrait(89, 1000)
                }, {Force1,Force5}, FP),
                CreateUnit(1,126,"middle3",P6);
                TSetMemory(Vi(MBossPtr7[2],2),SetTo,256*8000000); -- Next unit pointer offset's HP set
                TSetMemoryX(Vi(MBossPtr7[2],55),SetTo,0xA00000,0xA00000); -- Next unit pointer offset's status flag set
            })
        CMov(FP,MBossHP7,Nextptr,2) 
        DoActionsX(FP,{SetNVar(MBossHP7_2,SetTo,45)})
    CIfEnd()

    CTrigger(FP,{
        TMemory(MBossHP7,AtMost,256*2500000);
        NVar(MBossHP7_2,AtLeast,1);
    },{
        TSetMemory(MBossHP7,SetTo,256*8000000);
        SetNVar(MBossHP7_2,Subtract,1);
    },{preserved})
    

    CIfEnd()
    
    CIfXEnd()
    
    ------------ End of Boss HP Overflow Trigger ----------------------

    ------- Boss HP Overflow Trigger 4 Times & Status flag NoCollide + IsGathering ------- 

    -- CIfOnce(FP,Always(),{Wait(10000)})
    --     f_Read(FP,0x628438,nil,Nextptr) -- Save 0x628438(Next unit pointer) Offset, Convert into EPD and save into Variable
    --     CMov(FP,FBossPtr,Nextptr) -- Save FBossPtr from Nextptr's 
    --         CDoActions(FP,{
    --             CreateUnit(1,68,"HealZone",P7);
    --             TSetMemory(Vi(Nextptr[2],2),SetTo,256*6500000); -- Next unit pointer offset's HP set
    --             TSetMemoryX(Vi(Nextptr[2],55),SetTo,0xA00000,0xA00000); -- Next unit pointer offset's status flag set
    --         })
    --     CMov(FP,FBossHP,Nextptr,2) 
    --     DoActionsX(FP,{SetNVar(FBossHP2,SetTo,4)})
    -- CIfEnd()

    -- CTrigger(FP,{
    --     TMemory(FBossHP,AtMost,256*300000);
    --     NVar(FBossHP2,AtLeast,1);
    -- },{
    --     TSetMemory(FBossHP,SetTo,256*6500000);
    --     SetNVar(FBossHP2,Subtract,1);
    -- },{preserved})
    -------------- End of Boss HP Overflow Trigger ----------------------
    
end