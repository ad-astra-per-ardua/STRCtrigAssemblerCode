function Install_SpecialGunPlotShape()
    

    CIfX(Force2, {CDeaths(FP, AtLeast, 1, Difficulty)})

    Trigger2X(FP, {Deaths(P11, Exactly, 1, 100)}, {CopyCpAction({SetAllianceStatus(Force1, Ally)}, Force2, FP),CopyCpAction({
        RunAIScript('Turn ON Shared Vision for Player 5'),
        RunAIScript('Turn ON Shared Vision for Player 6'),
        RunAIScript('Turn OFF Shared Vision for Player 7'),
        RunAIScript('Turn ON Shared Vision for Player 8')}, Force1, FP)}, preserved)
        
    
    Trigger2X(FP, {Deaths(P11, Exactly, 0, 100)}, {CopyCpAction({SetAllianceStatus(Force1, Enemy)}, {P5,P6,P7}, FP),CopyCpAction({
        RunAIScript('Turn OFF Shared Vision for Player 5'),
        RunAIScript('Turn OFF Shared Vision for Player 6'),
        RunAIScript('Turn OFF Shared Vision for Player 7'),
        RunAIScript('Turn ON Shared Vision for Player 8')}, Force1, FP)}, preserved)

    ------ End of Disable invincibility condition trigger -------




--     -- Cerebrate from palm1 
--     function SHBF(Y) return Y end
--     TriggerX(P7, {CommandLeastAt(151, "celebrate1")}, {SetDeaths(P10, Add, 1, 60)},preserved);

--     for i = 1, 24 do
--         Circular = CSMakeLineX(1,60,0+15*i,7,1) -- Circle
--         CSPlot(Circular,P6,84,"celebrate1",nil,1,48,P7,{Deaths(P10,Exactly,4*i+102,60)})
--         CSPlot(Circular,P6,55,"celebrate1",nil,1,48,P7,{Deaths(P10,Exactly,4*i+102,60)})
--         CSPlot(Circular,P6,56,"celebrate1",nil,1,48,P7,{Deaths(P10,Exactly,800+4*i+102,60)})
--         CSPlot(Circular,P6,84,"celebrate1",nil,1,48,P7,{Deaths(P10,Exactly,800+4*i+102,60)})
--     end
--     CSPlot(CX2,P6,51,"celebrate1",nil,1,32,P7,{Deaths(P10,Exactly,96+102,60)}) --외접원
--     CSPlot(CX2,P6,46,"celebrate1",nil,1,32,P7,{Deaths(P10,Exactly,896+102,60)}) --외접원

--     TriggerX(P7, {CommandLeastAt(151, "celebrate1"),Deaths(P10, AtLeast, 100+(3*SDspeed), 60)}, {
--         Order(55, Force2, "celebrate1", Attack, "HealZone"),Order(51, Force2, "celebrate1", Attack, "HealZone")})
--     TriggerX(P7, {CommandLeastAt(151, "celebrate1"),Deaths(P10, AtLeast, 900+(3*SDspeed), 60)}, {
--         Order(56, Force2, "celebrate1", Attack, "HealZone"),Order(46, Force2, "celebrate1", Attack, "HealZone")})
--     for j = 1, 24 do
--         GLj = CSMakeLineX(1,60,360-15*j,11,1) -- 원그리기 2
--         CSPlot(GLj,P6,84,"celebrate1",nil,1,64,P7,{Deaths(P10,Exactly,400+4*j+102,60)})
--         CSPlot(GLj,P6,8,"celebrate1",nil,1,64,P7,{Deaths(P10,Exactly,400+4*j+102,60)})
--         CSPlot(GLj,P6,88,"celebrate1",nil,1,64,P7,{Deaths(P10,Exactly,1200+4*j+102,60)})
--         CSPlot(GLj,P6,84,"celebrate1",nil,1,64,P7,{Deaths(P10,Exactly,1200+4*j+102,60)})
--     end
--     CSPlot(CX2,P6,65,"celebrate1",nil,1,48,P7,{Deaths(P10,Exactly,496+102,60)})
--     CSPlot(CX2,P6,17,"celebrate1",nil,1,48,P7,{Deaths(P10,Exactly,1296+102,60)})
--     TriggerX(P7, {CommandLeastAt(151, "celebrate1"),Deaths(P10, AtLeast, 500+(3*SDspeed), 60)}, {
--         Order(8, Force2, "celebrate1", Attack, "HealZone"),Order(65, Force2, "celebrate1", Attack, "HealZone")})
--     TriggerX(P7, {CommandLeastAt(151, "celebrate1"),Deaths(P10, AtLeast, 1300+(3*SDspeed), 60)}, {
--         Order(88, Force2, "celebrate1", Attack, "HealZone"),Order(17, Force2, "celebrate1", Attack, "HealZone")})

--     GA1 = CS_MoveXY(CS_InvertXY(CS_FillGradA(0,{0,512},270,18,"SHBF",0),270),-500,0) --A그라데이션
--     GA1D = CS_RatioXY(CS_MoveXY(CS_InvertXY(CS_FillGradA(0,{0,512},270,18,"SHBF",0),270),-500,0),0.1,0.1) --도착지 도형
--     CSPlotOrder(spiral1,P6,84,"celebrate1",nil,1,64,CSMakeSpiral(4, 1, 1/1.2, 40, 0, 37, 5),0,Attack,"HealZone",nil,64,nil,P6,{Deaths(P10,Exactly,1500+(3*SDspeed),60)})
--     CSPlotOrder(spiral1,P6,30,"celebrate1",nil,1,64,CSMakeSpiral(4, 1, 1/1.2, 40, 0, 37, 5),0,Attack,"HealZone",nil,64,nil,P6,{Deaths(P10,Exactly,1500+(3*SDspeed),60)})
--     CSPlotOrder(GA1,P7,96,"celebrate1",nil,1,64,GA1D,0,Attack,"HealZone",nil,64,nil,P7,{Deaths(P10,Exactly,1500+(3*SDspeed),60)})
--     ----------- End of celebrate plot shape functions

--     ----------- Start of Daggoth plot shape functions
--     TriggerX(P7, {CommandLeastAt(152, "celebrate2")}, {SetDeaths(P10, Add, 1, 61)}, preserved);
    
--     for i = 1, 24 do
--         Circular = CSMakeLineX(1,60,0+15*i,7,1) -- Circle
--         CSPlot(Circular,P6,84,"celebrate2",nil,1,48,P7,{Deaths(P10,Exactly,4*i+102,61)})
--         CSPlot(Circular,P6,55,"celebrate2",nil,1,48,P7,{Deaths(P10,Exactly,4*i+102,61)})
--         CSPlot(Circular,P6,56,"celebrate2",nil,1,48,P7,{Deaths(P10,Exactly,800+4*i+102,61)})
--         CSPlot(Circular,P6,84,"celebrate2",nil,1,48,P7,{Deaths(P10,Exactly,800+4*i+102,61)})
--     end
--     CSPlot(CX2,P6,51,"celebrate2",nil,1,32,P7,{Deaths(P10,Exactly,96+102,61)}) --외접원
--     CSPlot(CX2,P6,46,"celebrate2",nil,1,32,P7,{Deaths(P10,Exactly,896+102,61)}) --외접원
--     TriggerX(P7, {CommandLeastAt(152, "celebrate2"),Deaths(P10, AtLeast, 100+(3*SDspeed), 61)}, {
--         Order(55, Force2, "celebrate2", Attack, "HealZone"),Order(51, Force2, "celebrate2", Attack, "HealZone")})
--     TriggerX(P7, {CommandLeastAt(152, "celebrate2"),Deaths(P10, AtLeast, 900+(3*SDspeed), 61)}, {
--         Order(56, Force2, "celebrate2", Attack, "HealZone"),Order(46, Force2, "celebrate2", Attack, "HealZone")})
--     for j = 1, 24 do
--         GLj = CSMakeLineX(1,60,360-15*j,11,1) -- 원그리기 2
--         CSPlot(GLj,P6,84,"celebrate2",nil,1,64,P7,{Deaths(P10,Exactly,400+4*j+102,61)})
--         CSPlot(GLj,P6,8,"celebrate2",nil,1,64,P7,{Deaths(P10,Exactly,400+4*j+102,61)})
--         CSPlot(GLj,P6,88,"celebrate2",nil,1,64,P7,{Deaths(P10,Exactly,1200+4*j+102,61)})
--         CSPlot(GLj,P6,84,"celebrate2",nil,1,64,P7,{Deaths(P10,Exactly,1200+4*j+102,61)})
--     end
--     CSPlot(CX2,P6,65,"celebrate2",nil,1,48,P7,{Deaths(P10,Exactly,496+102,61)})
--     CSPlot(CX2,P6,17,"celebrate2",nil,1,48,P7,{Deaths(P10,Exactly,1296+102,61)})
--     TriggerX(P7, {CommandLeastAt(152, "celebrate2"),Deaths(P10, AtLeast, 500+(3*SDspeed), 61)}, {
--         Order(8, Force2, "celebrate2", Attack, "HealZone"),Order(65, Force2, "celebrate2", Attack, "HealZone")})
--     TriggerX(P7, {CommandLeastAt(152, "celebrate2"),Deaths(P10, AtLeast, 1300+(3*SDspeed), 61)}, {
--         Order(88, Force2, "celebrate2", Attack, "HealZone"),Order(17, Force2, "celebrate2", Attack, "HealZone")})

--     GA1 = CS_MoveXY(CS_InvertXY(CS_FillGradA(0,{0,512},270,18,"SHBF",0),270),-500,0) --A그라데이션
--     GA1D = CS_RatioXY(CS_MoveXY(CS_InvertXY(CS_FillGradA(0,{0,512},270,18,"SHBF",0),270),-500,0),0.1,0.1) --도착지 도형
--     CSPlotOrder(spiral1,P6,84,"celebrate2",nil,1,64,CSMakeSpiral(4, 1, 1/1.2, 40, 0, 37, 5),0,Attack,"HealZone",nil,64,nil,P6,{Deaths(P10,Exactly,1500+(3*SDspeed),61)})
--     CSPlotOrder(spiral1,P6,30,"celebrate2",nil,1,64,CSMakeSpiral(4, 1, 1/1.2, 40, 0, 37, 5),0,Attack,"HealZone",nil,64,nil,P6,{Deaths(P10,Exactly,1500+(3*SDspeed),61)})
--     CSPlotOrder(GA1,P7,96,"celebrate2",nil,1,64,GA1D,0,Attack,"HealZone",nil,64,nil,P7,{Deaths(P10,Exactly,1500+(3*SDspeed),61)})
--     ----------- End of Daggoth plot shape functions

--     ----------- Start of 12 Clock Infested Command Center functions 
    
    -- Inf1timeline = {5.3, 21.8, 24.6, 27.3, 30.1, 44}
    
    -- TriggerX(P7, {CommandLeastAt(130, "nuke1")}, {SetDeaths(P10, Add, 1, 62)},preserved);
    -- TriggerX(Force2, {Deaths(P10, AtLeast, 5, 62)}, {SetDeaths(P11, SetTo, 1, 100)})

    -- CAPlotWithProperties(Shell_Arc1, P5, 64,"HealZone", nil, 1, 32, {1,0,0,0,2,0}, nil, FP, {Deaths(P10, AtLeast, 10, 62)},nil, nil, StargateProperties)
    -- CAPlotWithProperties(Shell_Arc2, P6, 70,"HealZone", nil, 1, 32, {1,0,0,0,2,0}, nil, FP, {Deaths(P10, AtLeast, 10, 62)},nil, nil, StargateProperties)
    -- CAPlotWithProperties(Shell_Arc3, P5, 89,"HealZone", nil, 1, 32, {1,0,0,0,2,0}, nil, FP, {Deaths(P10, AtLeast, 10, 62)},nil, nil, StargateProperties)
    -- CAPlotWithProperties(Shell_Arc4, P6, 58,"HealZone", nil, 1, 32, {1,0,0,0,2,0}, nil, FP, {Deaths(P10, AtLeast, 10, 62)},nil, nil, StargateProperties)

    -- CAPlotWithProperties(SH_Arc1, P5, 64,"HealZone", nil, 1, 32, {1,0,0,0,2,0}, nil, FP, {Deaths(P10, AtLeast, 70, 62)},nil, nil, StargateProperties)
    -- CAPlotWithProperties(SH_Arc2, P6, 70,"HealZone", nil, 1, 32, {1,0,0,0,2,0}, nil, FP, {Deaths(P10, AtLeast, 70, 62)},nil, nil, StargateProperties)
    -- CAPlotWithProperties(SH_Arc3, P5, 89,"HealZone", nil, 1, 32, {1,0,0,0,2,0}, nil, FP, {Deaths(P10, AtLeast, 70, 62)},nil, nil, StargateProperties)
    -- CAPlotWithProperties(SH_Arc4, P6, 58,"HealZone", nil, 1, 32, {1,0,0,0,2,0}, nil, FP, {Deaths(P10, AtLeast, 70, 62)},nil, nil, StargateProperties)

    -- TriggerX(FP, {Deaths(P10, AtLeast, Inf1timeline[1] * SDspeed, 62)}, {Order(64, P5, "Anywhere", Move, "hive4")})
    -- TriggerX(FP, {Deaths(P10, AtLeast, Inf1timeline[1] * SDspeed, 62)}, {Order(70, P6, "Anywhere", Move, "starg8")})
    -- TriggerX(FP, {Deaths(P10, AtLeast, Inf1timeline[1] * SDspeed, 62)}, {Order(89, P5, "Anywhere", Move, "hive3")})
    -- TriggerX(FP, {Deaths(P10, AtLeast, Inf1timeline[1] * SDspeed, 62)}, {Order(58, P6, "Anywhere", Move, "starg3")})

    -- TriggerX(FP, {Deaths(P10, AtLeast, Inf1timeline[2] * SDspeed - 20, 62)}, {GiveUnits(All, 64, P5, "hive4", P6)})
    -- TriggerX(FP, {Deaths(P10, AtLeast, Inf1timeline[2] * SDspeed - 20, 62)}, {GiveUnits(All, 70, P6, "starg8", P6)})
    -- TriggerX(FP, {Deaths(P10, AtLeast, Inf1timeline[2] * SDspeed - 20, 62)}, {GiveUnits(All, 89, P5, "hive3", P6)})
    -- TriggerX(FP, {Deaths(P10, AtLeast, Inf1timeline[2] * SDspeed - 20, 62)}, {GiveUnits(All, 58, P6, "starg3", P6)})

    -- TriggerX(Force2, {Deaths(P10, AtLeast, Inf1timeline[2] * SDspeed - 5, 62)}, {SetInvincibility(Disable, 64, Force2, "Anywhere")})
    -- TriggerX(Force2, {Deaths(P10, AtLeast, Inf1timeline[2] * SDspeed - 5, 62)}, {SetInvincibility(Disable, 70, Force2, "Anywhere")})
    -- TriggerX(Force2, {Deaths(P10, AtLeast, Inf1timeline[2] * SDspeed - 5, 62)}, {SetInvincibility(Disable, 89, Force2, "Anywhere")})
    -- TriggerX(Force2, {Deaths(P10, AtLeast, Inf1timeline[2] * SDspeed - 5, 62)}, {SetInvincibility(Disable, 58, Force2, "Anywhere")})

    -- TriggerX(Force2, {Deaths(P10, AtLeast, Inf1timeline[2] * SDspeed, 62)}, {RunAIScriptAt(JYD, "hive3")})
    -- TriggerX(Force2, {Deaths(P10, AtLeast, Inf1timeline[3] * SDspeed, 62)}, {RunAIScriptAt(JYD, "starg3")})
    -- TriggerX(Force2, {Deaths(P10, AtLeast, Inf1timeline[4] * SDspeed, 62)}, {RunAIScriptAt(JYD, "starg8")})
    -- TriggerX(Force2, {Deaths(P10, AtLeast, Inf1timeline[5] * SDspeed, 62)}, {RunAIScriptAt(JYD, "hive4")})

    -- TriggerX(P5, {Deaths(P10, AtLeast, Inf1timeline[6] * SDspeed, 62)}, {
    --     Order(64, P6, "Anywhere", Attack, "HealZone"),
    --     Order(70, P6, "Anywhere", Attack, "HealZone"),
    --     Order(89, P6, "Anywhere", Attack, "HealZone"),
    --     Order(58, P6, "Anywhere", Attack, "HealZone")
    -- })

--     ----- Turn on pulling trigger and call trigger
--     TriggerX(FP, {Deaths(P10, AtLeast, 32 * SDspeed, 62)}, {SetDeaths(P11, SetTo, 0, 100),RunAIScript("Turn ON Shared Vision for Player 6")})
--     for i = 0, 3 do
--         TriggerX(P8, {Deaths(P10, AtLeast, 32 * SDspeed, 62)}, {SetAllianceStatus(i, Ally)})
--     end
--     TriggerX(Force1, {Deaths(P10, AtLeast, 80 * SDspeed, 62)}, {
--         RunAIScript("Turn OFF Shared Vision for Player 5"),
--         RunAIScript("Turn OFF Shared Vision for Player 6"),
--         RunAIScript("Turn OFF Shared Vision for Player 7")
--     })

--     --------- End of 12 Clock Infested Command Center fuctions

--     --------- Start of 6 Clock Infested Command Center functions
--     --[[
--     12 : (2048,0) inf1 = width
--     3 : (4096,2048) inf2 = height
--     6 : (2048,4096) inf3 = width
--     9 : (0,2048) inf4 = height
--     plot size : 96
--     CSMakeLine(2,96,0,40,0)
--     ]]
--     Height = CSMakeLine(2,96,0,40,0)
--     Width = CSMakeLine(2,96,90,40,0)
--     DestinLoc = CSMakeLine(2,0,0,40,0)
--     Locinf = {"inf1","inf2","inf3","inf4"}

-- InfcomTimeline = {2, 3, 4.1, 5.2, 6.3, 7.4, 8.5, 9.6, 10.7, 11.8, 12.9, 14.0, 15.1, 16.2, 17.3, 18.4, 
--         19.5, 20.6, 21.7, 22.8, 23.9, 25, 26.1, 27.2, 28.3, 29.4, 30.5, 31.6, 32.7,
--           --- Phase 1
--           37, 41.2, 46.1, 50, 54.3, 58.6, 63, 
--           71.7
--         }

--     TriggerX(P7, {CommandLeastAt(106, "nuke2")}, {SetDeaths(P10, Add, 1, 63)},preserved)
--     TriggerX(Force1, {CommandLeastAt(106, "nuke2"),Deaths(P10, AtLeast, 10, 63)}, {
--         RunAIScript("Turn ON Shared Vision for Player 6")
--     })

--     function Inf12(unitid, timeplot)
--         CSPlot(Width, P6, 72, Locinf[1], nil, 1, 96, P6, {CommandLeastAt(106, "nuke2"),Deaths(P10, AtLeast, InfcomTimeline[timeplot] * SDspeed, 63)})
--         CSPlotOrder(Width, P6, unitid, Locinf[1], nil, 1, 96, DestinLoc, 0, Attack, "HealZone", nil, 32, nil, P6, {CommandLeastAt(106, "nuke2"),Deaths(P10, AtLeast, InfcomTimeline[timeplot] * SDspeed, 63)})
--     end

--     function Inf3(unitid, timeplot)
--         CSPlot(Height, P6, 72, Locinf[2], nil, 1, 96, P6, {CommandLeastAt(106, "nuke2"),Deaths(P10, AtLeast, InfcomTimeline[timeplot] * SDspeed, 63)})
--         CSPlotOrder(Height, P6, unitid, Locinf[2], nil, 1, 96, DestinLoc, 0, Attack, "HealZone", nil, 32, nil, P6, {CommandLeastAt(106, "nuke2"),Deaths(P10, AtLeast, InfcomTimeline[timeplot] * SDspeed, 63)})
--     end

--     function Inf6(unitid, timeplot)
--         CSPlot(Width, P6, 72, Locinf[3], nil, 1, 96, P6, {CommandLeastAt(106, "nuke2"),Deaths(P10, AtLeast, InfcomTimeline[timeplot] * SDspeed, 63)})
--         CSPlotOrder(Width, P6, unitid, Locinf[3], nil, 1, 96, DestinLoc, 0, Attack, "HealZone", nil, 32, nil, P6, {CommandLeastAt(106, "nuke2"),Deaths(P10, AtLeast, InfcomTimeline[timeplot] * SDspeed, 63)})
--     end

--     function Inf9(unitid, timeplot)
--         CSPlot(Height, P6, 72, Locinf[4], nil, 1, 96, P6, {CommandLeastAt(106, "nuke2"),Deaths(P10, AtLeast, InfcomTimeline[timeplot] * SDspeed, 63)})
--         CSPlotOrder(Height, P6, unitid, Locinf[4], nil, 1, 96, DestinLoc, 0, Attack, "HealZone", nil, 32, nil, P6, {CommandLeastAt(106, "nuke2"),Deaths(P10, AtLeast, InfcomTimeline[timeplot] * SDspeed, 63)})
--     end

--     Inf12(55, 1) Inf3(55, 2) Inf6(55, 3) Inf9(55, 4) 
--     Inf12(56, 5)Inf9(56, 6) Inf6(56, 7)Inf3(56, 8) 
--     Inf12(43, 9)Inf3(8, 10)Inf9(8, 10) Inf12(8, 11)Inf6(8, 11) 
--     Inf9(12, 12)Inf6(12, 12) Inf12(12, 13)Inf3(12, 13) 
--     Inf6(17, 14) Inf12(17, 15) Inf3(17, 16) Inf9(17, 17) 
--     Inf12(96, 18)Inf6(96, 18) Inf9(96, 19)Inf3(96, 19)
--     Inf12(88, 20)Inf6(88, 20) Inf9(88, 21)Inf3(88, 21)
--     Inf12(89, 22)Inf6(89, 23) Inf9(89, 24)Inf3(89, 25)
--     Inf12(21, 29)Inf6(21, 28) Inf9(21, 27)Inf3(21, 26)

--     -- Climax
--     Inf2GenArray = {8, 69, 89, 88, 21, 7, 64, 29}
--     for i = 1 , 8 do
--         Inf12(Inf2GenArray[i], i + 29)Inf6(Inf2GenArray[i], i + 29)Inf9(Inf2GenArray[i], i + 29)Inf3(Inf2GenArray[i], i + 29)
--     end
--     TriggerX(Force1, {CommandLeastAt(106, "nuke2"),Deaths(P10, AtLeast, 80 * SDspeed, 63)}, {
--         RunAIScript("Turn OFF Shared Vision for Player 6")
--     })

--     function Generator(location, Deathvar)
--         TriggerX(P7, {CommandLeastAt(200, location)}, SetCDeaths(FP, Add, 1, Deathvar),preserved)
--         -- TriggerX(P7, {CommandLeastAt(127, "middle3"),CDeaths(FP, Exactly, Value, Deathvar)}, Actions, Flags, Index)
        
--         -- function verifingpatgen1(Deathvar)
            
--         -- end

--         TriggerX(P7, {CDeaths(FP, AtLeast, 1 * SDspeed, Deathvar)}, {SetSpriteImage(227, 503)})
--         CSPlot2(HiveEtf1, P6, 92, location, nil, 1,32, FP, {CDeaths(FP, AtLeast, 1 * SDspeed, Deathvar)})
--         TriggerX(P7, {CDeaths(FP, AtLeast, gene_tl[1] * SDspeed, Deathvar)}, {RemoveUnit(92, P6)})
--         CSPlotOrder2(HiveEtf1, P6, 69, location, nil, 1, 32, HiveEtf1, nil, Attack, location, nil, 32, nil, FP, {CDeaths(FP, AtLeast, gene_tl[1] * SDspeed, Deathvar)})
--         for i = 1, 55 do
--             local arrayLength = #gene_spawntb_air
--             local genIndex = ((i - 1) % arrayLength) + 1
--             CSPlotOrder2(Generator_shape, P6, gene_spawntb_gnd1[genIndex], location, nil, 1, 32, CSMakePolygon(6,0,0,127,1), nil, Attack, location, nil, 32, nil, FP, {CDeaths(FP, AtLeast,gene_tl[i] * SDspeed, Deathvar)})
--             CSPlotOrder2(Generator_shape, P6, gene_spawntb_air1[genIndex], location, nil, 1, 32, CSMakePolygon(6,0,0,127,1), nil, Attack, location, nil, 32, nil, FP, {CDeaths(FP, AtLeast,gene_tl[i] * SDspeed, Deathvar)})
--         end
--     end

--     for i = 1, 4 do
--         Generator(generator_spot[i], generator_dvarr[i])
--     end
    
    
    -- Cerebrate from palm1 
    function SHBF(Y) return Y end
    TriggerX(P7, {CommandLeastAt(151, "celebrate1")}, {SetDeaths(P10, Add, 1, 60)},preserved);

    for i = 1, 24 do
        Circular = CSMakeLineX(1,60,0+15*i,7,1) -- Circle
        CSPlot(Circular,P6,62,"celebrate1",nil,1,48,P7,{Deaths(P10,Exactly,4*i+102,60)})
        CSPlot(Circular,P6,55,"celebrate1",nil,1,48,P7,{Deaths(P10,Exactly,4*i+102,60)})
        CSPlot(Circular,P6,56,"celebrate1",nil,1,48,P7,{Deaths(P10,Exactly,800+4*i+102,60)})
        CSPlot(Circular,P6,84,"celebrate1",nil,1,48,P7,{Deaths(P10,Exactly,800+4*i+102,60)})
    end
    
    CSPlot(Trdline,P6,62,"celebrate1",nil,1,48,P7,{Deaths(P10,Exactly,800+102,60)})
    CSPlot(CX2,P6,51,"celebrate1",nil,1,32,P7,{Deaths(P10,Exactly,96+102,60)}) --외접원
    CSPlot(CX2,P6,46,"celebrate1",nil,1,32,P7,{Deaths(P10,Exactly,896+102,60)}) --외접원

    TriggerX(P7, {CommandLeastAt(151, "celebrate1"),Deaths(P10, AtLeast, 100+(3*SDspeed), 60)}, {
        Order(55, Force2, "celebrate1", Attack, "HealZone"),Order(51, Force2, "celebrate1", Attack, "HealZone")})
    TriggerX(P7, {CommandLeastAt(151, "celebrate1"),Deaths(P10, AtLeast, 900+(3*SDspeed), 60)}, {
        Order(56, Force2, "celebrate1", Attack, "HealZone"),Order(46, Force2, "celebrate1", Attack, "HealZone")})
    for j = 1, 24 do
        GLj = CSMakeLineX(1,60,360-15*j,11,1) -- 원그리기 2
        CSPlot(GLj,P6,84,"celebrate1",nil,1,64,P7,{Deaths(P10,Exactly,400+4*j+102,60)})
        CSPlot(GLj,P6,8,"celebrate1",nil,1,64,P7,{Deaths(P10,Exactly,400+4*j+102,60)})
        CSPlot(GLj,P6,88,"celebrate1",nil,1,64,P7,{Deaths(P10,Exactly,1200+4*j+102,60)})
        CSPlot(GLj,P6,84,"celebrate1",nil,1,64,P7,{Deaths(P10,Exactly,1200+4*j+102,60)})
        
    end
    CSPlot(Trdline,P6,69,"celebrate1",nil,1,48,P7,{Deaths(P10,Exactly,1200+102,60)})
    CSPlot(Trdline,P6,12,"celebrate1",nil,1,48,P7,{Deaths(P10,Exactly,102,60)})
    CSPlot(CX2,P6,65,"celebrate1",nil,1,48,P7,{Deaths(P10,Exactly,496+102,60)})
    CSPlot(CX2,P6,17,"celebrate1",nil,1,48,P7,{Deaths(P10,Exactly,1296+102,60)})
    TriggerX(P7, {CommandLeastAt(151, "celebrate1"),Deaths(P10, AtLeast, 500+(3*SDspeed), 60)}, {
        Order(8, Force2, "celebrate1", Attack, "HealZone"),Order(65, Force2, "celebrate1", Attack, "HealZone")})
    TriggerX(P7, {CommandLeastAt(151, "celebrate1"),Deaths(P10, AtLeast, 1300+(3*SDspeed), 60)}, {
        Order(88, Force2, "celebrate1", Attack, "HealZone"),Order(17, Force2, "celebrate1", Attack, "HealZone")})

    GA1 = CS_MoveXY(CS_InvertXY(CS_FillGradA(0,{0,512},270,18,"SHBF",0),270),-500,0) --A그라데이션
    GA1D = CS_RatioXY(CS_MoveXY(CS_InvertXY(CS_FillGradA(0,{0,512},270,18,"SHBF",0),270),-500,0),0.1,0.1) --도착지 도형
    CSPlotOrder(spiral1,P6,84,"celebrate1",nil,1,64,CSMakeSpiral(4, 1, 1/1.2, 40, 0, 37, 5),0,Attack,"HealZone",nil,64,nil,P6,{Deaths(P10,Exactly,1500+(3*SDspeed),60)})
    CSPlotOrder(spiral1,P6,30,"celebrate1",nil,1,64,CSMakeSpiral(4, 1, 1/1.2, 40, 0, 37, 5),0,Attack,"HealZone",nil,64,nil,P6,{Deaths(P10,Exactly,1500+(3*SDspeed),60)})
    CSPlotOrder(GA1,P7,96,"celebrate1",nil,1,64,GA1D,0,Attack,"HealZone",nil,64,nil,P7,{Deaths(P10,Exactly,1500+(3*SDspeed),60)})
    ----------- End of celebrate plot shape functions

    ----------- Start of Daggoth plot shape functions
    TriggerX(P7, {CommandLeastAt(152, "celebrate2")}, {SetDeaths(P10, Add, 1, 61)}, preserved);
    
    for i = 1, 24 do
        Circular = CSMakeLineX(1,60,0+15*i,7,1) -- Circle
        CSPlot(Circular,P6,84,"celebrate2",nil,1,48,P7,{Deaths(P10,Exactly,4*i+102,61)})
        CSPlot(Circular,P6,55,"celebrate2",nil,1,48,P7,{Deaths(P10,Exactly,4*i+102,61)})
        CSPlot(Circular,P6,56,"celebrate2",nil,1,48,P7,{Deaths(P10,Exactly,800+4*i+102,61)})
        CSPlot(Circular,P6,84,"celebrate2",nil,1,48,P7,{Deaths(P10,Exactly,800+4*i+102,61)})
    end
    CSPlot(CX2,P6,51,"celebrate2",nil,1,32,P7,{Deaths(P10,Exactly,96+102,61)}) --외접원
    CSPlot(CX2,P6,46,"celebrate2",nil,1,32,P7,{Deaths(P10,Exactly,896+102,61)}) --외접원
    TriggerX(P7, {CommandLeastAt(152, "celebrate2"),Deaths(P10, AtLeast, 100+(3*SDspeed), 61)}, {
        Order(55, Force2, "celebrate2", Attack, "HealZone"),Order(51, Force2, "celebrate2", Attack, "HealZone")})
    TriggerX(P7, {CommandLeastAt(152, "celebrate2"),Deaths(P10, AtLeast, 900+(3*SDspeed), 61)}, {
        Order(56, Force2, "celebrate2", Attack, "HealZone"),Order(46, Force2, "celebrate2", Attack, "HealZone")})
    for j = 1, 24 do
        GLj = CSMakeLineX(1,60,360-15*j,11,1) -- 원그리기 2
        CSPlot(GLj,P6,84,"celebrate2",nil,1,64,P7,{Deaths(P10,Exactly,400+4*j+102,61)})
        CSPlot(GLj,P6,8,"celebrate2",nil,1,64,P7,{Deaths(P10,Exactly,400+4*j+102,61)})
        CSPlot(GLj,P6,88,"celebrate2",nil,1,64,P7,{Deaths(P10,Exactly,1200+4*j+102,61)})
        CSPlot(GLj,P6,84,"celebrate2",nil,1,64,P7,{Deaths(P10,Exactly,1200+4*j+102,61)})
    end
    CSPlot(CX2,P6,65,"celebrate2",nil,1,48,P7,{Deaths(P10,Exactly,496+102,61)})
    CSPlot(CX2,P6,17,"celebrate2",nil,1,48,P7,{Deaths(P10,Exactly,1296+102,61)})
    TriggerX(P7, {CommandLeastAt(152, "celebrate2"),Deaths(P10, AtLeast, 500+(3*SDspeed), 61)}, {
        Order(8, Force2, "celebrate2", Attack, "HealZone"),Order(65, Force2, "celebrate2", Attack, "HealZone")})
    TriggerX(P7, {CommandLeastAt(152, "celebrate2"),Deaths(P10, AtLeast, 1300+(3*SDspeed), 61)}, {
        Order(88, Force2, "celebrate2", Attack, "HealZone"),Order(17, Force2, "celebrate2", Attack, "HealZone")})

    GA1 = CS_MoveXY(CS_InvertXY(CS_FillGradA(0,{0,512},270,18,"SHBF",0),270),-500,0) --A그라데이션
    GA1D = CS_RatioXY(CS_MoveXY(CS_InvertXY(CS_FillGradA(0,{0,512},270,18,"SHBF",0),270),-500,0),0.1,0.1) --도착지 도형
    CSPlotOrder(spiral1,P6,84,"celebrate2",nil,1,64,CSMakeSpiral(4, 1, 1/1.2, 40, 0, 37, 5),0,Attack,"HealZone",nil,64,nil,P6,{Deaths(P10,Exactly,1500+(3*SDspeed),61)})
    CSPlotOrder(spiral1,P6,30,"celebrate2",nil,1,64,CSMakeSpiral(4, 1, 1/1.2, 40, 0, 37, 5),0,Attack,"HealZone",nil,64,nil,P6,{Deaths(P10,Exactly,1500+(3*SDspeed),61)})
    CSPlotOrder(GA1,P7,96,"celebrate2",nil,1,64,GA1D,0,Attack,"HealZone",nil,64,nil,P7,{Deaths(P10,Exactly,1500+(3*SDspeed),61)})
    ----------- End of Daggoth plot shape functions
    


    --------- Start of 12 Clock Infested Command Center functions 
    
    Inf1timeline = {5.3, 21.8, 24.6, 27.3, 30.1, 44}
    
    TriggerX(P7, {CommandLeastAt(130, "nuke1")}, {SetDeaths(P10, Add, 1, 62)},preserved);
    TriggerX(P7, {Deaths(P10, AtLeast, 5, 62)}, {SetDeaths(P11, SetTo, 1, 100)})

    CAPlotWithProperties(Shell_Arc1, P5, 64,"HealZone", nil, 1, 32, {1,0,0,0,2,0}, nil, FP, {Deaths(P10, AtLeast, 10, 62)},nil, nil, StargateProperties)
    CAPlotWithProperties(Shell_Arc2, P6, 70,"HealZone", nil, 1, 32, {1,0,0,0,2,0}, nil, FP, {Deaths(P10, AtLeast, 10, 62)},nil, nil, StargateProperties)
    CAPlotWithProperties(Shell_Arc3, P5, 102,"HealZone", nil, 1, 32, {1,0,0,0,2,0}, nil, FP, {Deaths(P10, AtLeast, 10, 62)},nil, nil, StargateProperties)
    CAPlotWithProperties(Shell_Arc4, P6, 60,"HealZone", nil, 1, 32, {1,0,0,0,2,0}, nil, FP, {Deaths(P10, AtLeast, 10, 62)},nil, nil, StargateProperties)

    CAPlotWithProperties(SH_Arc1, P5, 64,"HealZone", nil, 1, 32, {1,0,0,0,2,0}, nil, FP, {Deaths(P10, AtLeast, 70, 62)},nil, nil, StargateProperties)
    CAPlotWithProperties(SH_Arc2, P6, 70,"HealZone", nil, 1, 32, {1,0,0,0,2,0}, nil, FP, {Deaths(P10, AtLeast, 70, 62)},nil, nil, StargateProperties)
    CAPlotWithProperties(SH_Arc3, P5, 102,"HealZone", nil, 1, 32, {1,0,0,0,2,0}, nil, FP, {Deaths(P10, AtLeast, 70, 62)},nil, nil, StargateProperties)
    CAPlotWithProperties(SH_Arc4, P6, 60,"HealZone", nil, 1, 32, {1,0,0,0,2,0}, nil, FP, {Deaths(P10, AtLeast, 70, 62)},nil, nil, StargateProperties)

    TriggerX(FP, {Deaths(P10, AtLeast, Inf1timeline[1] * SDspeed, 62)}, {Order(64, P5, "Anywhere", Move, "hive4")})
    TriggerX(FP, {Deaths(P10, AtLeast, Inf1timeline[1] * SDspeed, 62)}, {Order(70, P6, "Anywhere", Move, "starg8")})
    TriggerX(FP, {Deaths(P10, AtLeast, Inf1timeline[1] * SDspeed, 62)}, {Order(102, P5, "Anywhere", Move, "hive3")})
    TriggerX(FP, {Deaths(P10, AtLeast, Inf1timeline[1] * SDspeed, 62)}, {Order(60, P6, "Anywhere", Move, "starg3")})

    TriggerX(FP, {Deaths(P10, AtLeast, Inf1timeline[2] * SDspeed - 20, 62)}, {GiveUnits(All, 64, P5, "hive4", P6)})
    TriggerX(FP, {Deaths(P10, AtLeast, Inf1timeline[2] * SDspeed - 20, 62)}, {GiveUnits(All, 70, P6, "starg8", P6)})
    TriggerX(FP, {Deaths(P10, AtLeast, Inf1timeline[2] * SDspeed - 20, 62)}, {GiveUnits(All, 102, P5, "hive3", P6)})
    TriggerX(FP, {Deaths(P10, AtLeast, Inf1timeline[2] * SDspeed - 20, 62)}, {GiveUnits(All, 60, P6, "starg3", P6)})

    TriggerX(Force2, {Deaths(P10, AtLeast, Inf1timeline[2] * SDspeed - 5, 62)}, {SetInvincibility(Disable, 64, Force2, "Anywhere")})
    TriggerX(Force2, {Deaths(P10, AtLeast, Inf1timeline[2] * SDspeed - 5, 62)}, {SetInvincibility(Disable, 70, Force2, "Anywhere")})
    TriggerX(Force2, {Deaths(P10, AtLeast, Inf1timeline[2] * SDspeed - 5, 62)}, {SetInvincibility(Disable, 102, Force2, "Anywhere")})
    TriggerX(Force2, {Deaths(P10, AtLeast, Inf1timeline[2] * SDspeed - 5, 62)}, {SetInvincibility(Disable, 60, Force2, "Anywhere")})

    TriggerX(Force2, {Deaths(P10, AtLeast, Inf1timeline[2] * SDspeed, 62)}, {RunAIScriptAt(JYD, "hive3")})
    TriggerX(Force2, {Deaths(P10, AtLeast, Inf1timeline[3] * SDspeed, 62)}, {RunAIScriptAt(JYD, "starg3")})
    TriggerX(Force2, {Deaths(P10, AtLeast, Inf1timeline[4] * SDspeed, 62)}, {RunAIScriptAt(JYD, "starg8")})
    TriggerX(Force2, {Deaths(P10, AtLeast, Inf1timeline[5] * SDspeed, 62)}, {RunAIScriptAt(JYD, "hive4")})

    TriggerX(P5, {Deaths(P10, AtLeast, Inf1timeline[6] * SDspeed, 62)}, {
        Order(64, P6, "Anywhere", Attack, "HealZone"),
        Order(70, P6, "Anywhere", Attack, "HealZone"),
        Order(102, P6, "Anywhere", Attack, "HealZone"),
        Order(60, P6, "Anywhere", Attack, "HealZone")
    })

    ----- Turn on pulling trigger and call trigger

    for i = 0, 3 do
        TriggerX(P8, {Deaths(P10, AtLeast, 32 * SDspeed, 62)}, {SetAllianceStatus(i, Ally)})
    end

    TriggerX(FP, {Deaths(P10, AtLeast, 80 * SDspeed, 62)}, {SetDeaths(P11, SetTo, 0, 100)})



    --------- End of 12 Clock Infested Command Center fuctions
    

    

    --------- Start of 6 Clock Infested Command Center functions
    --[[
    12 : (2048,0) inf1 = width
    3 : (4096,2048) inf2 = height
    6 : (2048,4096) inf3 = width
    9 : (0,2048) inf4 = height
    plot size : 96
    CSMakeLine(2,96,0,40,0)
    ]]
    Height = CSMakeLine(2,96,0,40,0)
    Width = CSMakeLine(2,96,90,40,0)
    DestinLoc = CSMakeLine(2,0,0,40,0)
    Locinf = {"inf1","inf2","inf3","inf4"}

InfcomTimeline = {2, 3, 4.1, 5.2, 6.3, 7.4, 8.5, 9.6, 10.7, 11.8, 12.9, 14.0, 15.1, 16.2, 17.3, 18.4, 
        19.5, 20.6, 21.7, 22.8, 23.9, 25, 26.1, 27.2, 28.3, 29.4, 30.5, 31.6, 32.7,
        --- Phase 1
        37, 41.2, 46.1, 50, 54.3, 58.6, 63, 
        71.7
        }

    TriggerX(P7, {CommandLeastAt(106, "nuke2")}, {SetDeaths(P10, Add, 1, 63)},preserved)
    CIf(Force2, {Deaths(P10, AtMost, (InfcomTimeline[#InfcomTimeline] * SDspeed) + SDspeed, 63)})
    TriggerX(Force1, {Deaths(P10, AtLeast, 10, 63)}, {
        RunAIScript("Turn ON Shared Vision for Player 6")
    })

    function Inf12(unitid, timeplot)
        CSPlot(Width, P6, 72, Locinf[1], nil, 1, 96, P6, {Deaths(P10, AtLeast, InfcomTimeline[timeplot] * SDspeed, 63)})
        CSPlotOrder(Width, P6, unitid, Locinf[1], nil, 1, 96, DestinLoc, 0, Attack, "HealZone", nil, 32, nil, P6, {Deaths(P10, AtLeast, InfcomTimeline[timeplot] * SDspeed, 63)})
    end

    function Inf3(unitid, timeplot)
        CSPlot(Height, P6, 72, Locinf[2], nil, 1, 96, P6, {Deaths(P10, AtLeast, InfcomTimeline[timeplot] * SDspeed, 63)})
        CSPlotOrder(Height, P6, unitid, Locinf[2], nil, 1, 96, DestinLoc, 0, Attack, "HealZone", nil, 32, nil, P6, {Deaths(P10, AtLeast, InfcomTimeline[timeplot] * SDspeed, 63)})
    end

    function Inf6(unitid, timeplot)
        CSPlot(Width, P6, 72, Locinf[3], nil, 1, 96, P6, {Deaths(P10, AtLeast, InfcomTimeline[timeplot] * SDspeed, 63)})
        CSPlotOrder(Width, P6, unitid, Locinf[3], nil, 1, 96, DestinLoc, 0, Attack, "HealZone", nil, 32, nil, P6, {Deaths(P10, AtLeast, InfcomTimeline[timeplot] * SDspeed, 63)})
    end

    function Inf9(unitid, timeplot)
        CSPlot(Height, P6, 72, Locinf[4], nil, 1, 96, P6, {Deaths(P10, AtLeast, InfcomTimeline[timeplot] * SDspeed, 63)})
        CSPlotOrder(Height, P6, unitid, Locinf[4], nil, 1, 96, DestinLoc, 0, Attack, "HealZone", nil, 32, nil, P6, {Deaths(P10, AtLeast, InfcomTimeline[timeplot] * SDspeed, 63)})
    end
    CIfEnd()

    Inf12(62, 1) Inf3(62, 2) Inf6(62, 3) Inf9(62, 4) 
    Inf12(46, 5)Inf9(46, 6) Inf6(46, 7)Inf3(46, 8) 
    Inf12(70, 9)Inf3(70, 10)Inf9(70, 10) Inf12(76, 11)Inf6(70, 11) 
    Inf9(76, 12)Inf6(76, 12) Inf12(21, 13)Inf3(76, 13) 
    Inf6(21, 14) Inf12(21, 15) Inf3(21, 16) Inf9(21, 17) 
    Inf12(86, 18)Inf6(86, 18) Inf9(86, 19)Inf3(86, 19)
    Inf12(60, 20)Inf6(60, 20) Inf9(60, 21)Inf3(60, 21)
    Inf12(3, 22)Inf6(3, 23) Inf9(3, 24)Inf3(3, 25)
    Inf12(21, 29)Inf6(21, 28) Inf9(21, 27)Inf3(21, 26)

    -- Climax
    Inf2GenArray = {3, 81, 86, 23,74, 28, 29, 102}
    for i = 1 , 8 do
        Inf12(Inf2GenArray[i], i + 29)Inf6(Inf2GenArray[i], i + 29)Inf9(Inf2GenArray[i], i + 29)Inf3(Inf2GenArray[i], i + 29)
    end
    TriggerX(Force1, {Deaths(P10, AtLeast, 80 * SDspeed, 63)}, {
        RunAIScript("Turn OFF Shared Vision for Player 6")
    })

    function Generator(location, Deathvar)
        TriggerX(P7, {CommandLeastAt(200, location)}, SetCDeaths(FP, Add, 1, Deathvar),preserved)
        TriggerX(P7, {CDeaths(FP, AtLeast, 20, Deathvar), CDeaths(FP, AtMost, gene_tl[55] * SDspeed, Deathvar)}, {
            SetDeaths(P8, SetTo, 0, 131), -- small wave
            SetDeaths(P8, Subtract, 1, 132) -- big wave
        }, preserved)
        -- TriggerX(P7, {CommandLeastAt(127, "middle3"),CDeaths(FP, Exactly, Value, Deathvar)}, Actions, Flags, Index)
        -- function verifingpatgen1(Deathvar)
            
        -- end

        TriggerX(P7, {CDeaths(FP, AtLeast, 1 * SDspeed, Deathvar)}, {SetSpriteImage(227, 982)})
        CSPlot2(Generator_shape2, P6, 92, location, nil, 1,32, FP, {CDeaths(FP, AtLeast, 1 * SDspeed, Deathvar)})
        TriggerX(P7, {CDeaths(FP, AtLeast, gene_tl[1] * SDspeed, Deathvar)}, {RemoveUnit(92, P6)})

        for i = 1, 55 ,2 do
            local arrayLength = #gene_spawntb_air
            local genIndex = ((i - 1) % arrayLength) + 1
            CSPlotOrder2(PE, P6, gene_spawntb_gnd[genIndex], location, nil, 1, 32, PEA, nil, Attack, location, nil, 32, nil, FP, {CDeaths(FP, AtLeast,gene_tl[i] * SDspeed, Deathvar)})
            
        end
        for i = 2 ,55 , 2 do
            local arrayLength = #gene_spawntb_air
            local genIndex = ((i // 2 - 1) % arrayLength) + 1
            CSPlotOrder2(PE, P6, gene_spawntb_air[genIndex], location, nil, 1, 32, PEA, nil, Attack, location, nil, 32, nil, FP, {CDeaths(FP, AtLeast,gene_tl[i] * SDspeed, Deathvar)})
        end
    end
    for i = 1, 4 do
        Generator(generator_spot[i], generator_dvarr[i])
    end

CIfXEnd()
end