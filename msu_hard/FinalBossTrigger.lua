function FinalBossTrigger()
    ----------- After 4 MBoss ---------
    BGM_SplitTL = {0.03, 16.238, 32.161, 33.865, 89.304, 92.109, 123.352, 125.331, 156.213, 158.496}
    BGM_Gentimeplot = {
        23.8, 27.6, 37.4, 47.8, 61.8, 75.8, 88.9, -- End of palm island
        92.14, 92.63, 123.3, -- End of rhegb 
        125.33, 129.8, 133.6, 141.2, 148.9
    }
    PalmGenTime = {
        40.5, 42.6, 47.8, 51.3, 54.6, 61.8, 64.6, 68.5, 72.3, 75.8, 78.6, 82.5
    }


    MemGenTime2 = {
        158.5, 172.5, 173.8, -- Circulation gen and palm gen
        187.8, 188.8,
        204, 218.3, 219.2, 220, 230.3
    }

    TriggerX(FP, {NVar(FnBossHP2, AtLeast, 1)}, {
        SetMinimapColor(P5, SetTo, 254),
        SetMinimapColor(P6, SetTo, 254),
        SetMinimapColor(P7, SetTo, 254),
        SetMinimapColor(P8, SetTo, 111),
        SetPlayerColor(P5, SetTo, 254),
        SetPlayerColor(P6, SetTo, 254),
        SetPlayerColor(P7, SetTo, 254),
        SetPlayerColor(P8, SetTo, 111),
    }, preserved)

    Trigger2X(FP, {
        Deaths(P6, AtLeast, 1, 202),
        Deaths(P6, AtLeast, 1, 203),
        Deaths(P6, AtLeast, 1, 204),
        Deaths(P6, AtLeast, 1, 205),
    }, {
        RotatePlayer({
        MinimapPing("HealZone"),
        MinimapPing("HealZone"),
        MinimapPing("HealZone"),
        MinimapPing("HealZone"),
        DisplayTextX("\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08 ＮＯＴＩＣＥ \x04 ● ● ●\n\x14\n\x14\n", 4),
        DisplayTextX(StrDesignX("모든 것의 근원지, \x08? ? ? ? ? ? \x04가 어딘가에 등장하였습니다 !"), 4),
        DisplayTextX("\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08 ＮＯＴＩＣＥ \x04 ● ● ●\n\x14\n\x14\n", 4),
        PlayWAVX("staredit\\wav\\CAUTION.wav"),
        PlayWAVX("staredit\\wav\\CAUTION.wav"),
        PlayWAVX("staredit\\wav\\CAUTION.wav")
    }, {Force1, Force5}, FP),
        KillUnitAt(All, 125, "Anywhere", Force1),
        KillUnitAt(All, 125, "Anywhere", P12),
        KillUnitAt(All, "Men", "Anywhere", Force2),
    })
    TriggerX(FP, {
        Deaths(P6, AtLeast, 1, 202),
        Deaths(P6, AtLeast, 1, 203),
        Deaths(P6, AtLeast, 1, 204),
        Deaths(P6, AtLeast, 1, 205),
    }, {
        Wait(100),
        CreateUnit(1, 168, "HealZone", P7),
    })

    
    
    -- TriggerX(FP, Always(), { -- Debugging Setting
    --     SetDeaths(P6, SetTo, 1, 202),
    --     SetDeaths(P6, SetTo, 1, 203),
    --     SetDeaths(P6, SetTo, 1, 204),
    --     SetDeaths(P6, SetTo, 1, 205),
    --     RemoveUnitAt(All, "Buildings", "Anywhere", Force2)
    -- })
    -- TriggerX(FP, Always(), {
    --     CreateUnit(100, 1, "neutralbunker1", P1),
    --     CreateUnit(100, 1, "neutralbunker2", P1),
    --     CreateUnit(100, 1, "neutralbunker3", P1),
    --     CreateUnit(100, 1, "neutralbunker4", P1),
    -- })
    -- CDoActions(FP, {
    --     ModifyUnitHitPoints(All, "Men", P1, "Anywhere", 100),
    -- }, preserved)

    CIf(AllPlayers, {Deaths(P7, AtLeast, 1, 168)})

    Trigger {
        players = {Force1},
        conditions = {
            Deaths(P7, AtLeast, 1, 168)
        },
        actions = {
            RunAIScript("Turn OFF Shared Vision for Player 8");
            
        },
        }

    TriggerX(FP, {Deaths(P7, AtLeast, 1, 168)}, {
        AddCD(FBOSS_Initvar, 1),
        AddCD(FBOSS_Tmpvar, 1)}, preserved)
    TriggerX(FP, {CDeaths(FP, AtLeast, 2, FBOSS_Tmpvar)}, {SetCD(FBOSS_Tmpvar, 0)}, preserved)
    Trigger2X(FP, {CDeaths(FP, AtMost, 68, FBOSS_Initvar), CDeaths(FP, AtMost, 2, FBOSS_Tmpvar)}, {SetMemoryB(0x657A9C, Subtract, 1)
    }, preserved)
    for i = 1,31 do
        TriggerX(FP, {CDeaths(FP, AtLeast, 136 + i, FBOSS_Initvar)}, {SetMemoryB(0x657A9C, SetTo, i)})
    end
    TriggerX(FP, {CDeaths(FP, AtLeast, 67, FBOSS_Initvar)}, {
        SetSpriteImage(203, 215),
        SetImageScript(215, 131)
    })
    CSPlot2(CellScattered, P8, 119, "HealZone", nil, 1, 32, FP, {CDeaths(FP, AtLeast, 100, FBOSS_Initvar)},{SetImageScript(215, 144)})

    ----- Boss HP Overflow Trigger 4 Times & Status flag NoCollide + IsGathering ------- 
    
    CIfOnce(FP,{CDeaths(FP, AtLeast, 100, FBOSS_Initvar)},{})
        f_Read(FP,0x628438,nil,TmpNextptr) -- Save 0x628438(Next unit pointer) Offset, Convert into EPD and save into Variable
        CMov(FP,FnBossPtr,TmpNextptr) -- Save FnBossPtr from TmpNextptr's 
            CDoActions(FP,{
                CreateUnit(1,122,"HealZone",P8);
                TSetMemory(Vi(TmpNextptr[2],2),SetTo,256*2000); -- Next unit pointer offset's HP set
                TSetMemoryX(Vi(TmpNextptr[2],55),SetTo,0xA00000,0xA00000); -- Next unit pointer offset's status flag set
                TSetMemory(0x62855B,SetTo,1);
                SetInvincibility(Enable, 122, P8, "Anywhere");
            })
        CMov(FP,FnBossHP,TmpNextptr,2) 
        DoActionsX(FP,{SetNVar(FnBossHP2,SetTo,2)})
    CIfEnd()

    CTrigger(FP,{
        TMemory(FnBossHP,AtMost,256*1000);
        NVar(FnBossHP2,AtLeast,1);
    },{
        TSetMemory(FnBossHP,SetTo,256*2000);
        SetNVar(FnBossHP2,Subtract,1);
    },{preserved})
    ------------ End of Boss HP Overflow Trigger ----------------------
    TriggerX(FP, {CDeaths(FP, AtLeast, 198, FBOSS_Initvar)}, {
        RotatePlayer({
            DisplayTextX("\x13\x04\n\x0D\x0D\x13\x04● ● ● ────┫\x08 ＦＩＮＡＬ ＮＯＴＩＣＥ\x04┠──── \x04 ● ● ●\n\x14\n\x14\n",4);
            DisplayTextX(StrDesignX("\x11모든 세계관의 지식\x04을 가진 \x08재앙이 \x04깨어났습니다."), 4);
            DisplayTextX(StrDesignX("\x04여기서 막지않으면, 이곳도 \x19다른 세계관처럼 \x08그\x04에게 \x10한낱 지식으로 \x08흡수\x04되어질 것 입니다."), 4);
            DisplayTextX(StrDesignX("\x04。 。 。 \x08최후의 전투를 \x1f준비하십시길 바랍니다.\x04"), 4);
            DisplayTextX("\x13\x04\n\x0D\x0D\x13\x04● ● ● ────┫\x08 ＦＩＮＡＬ ＮＯＴＩＣＥ\x04┠──── \x04● ● ● \n\x14\n\x14\n",4),
            MinimapPing("HealZone"),
        }, {Force1,Force5}, FP),
        SetInvincibility(Disable, 122, P8, "Anywhere"),  
    })
    TriggerX(FP, {NVar(FnBossHP2, Exactly, 1)}, {SetCDeaths(FP, Add, 1, Start_var1)}, preserved)
    TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtMost, 68, Start_var1)}, {
        CreateUnit(1, 72, "HealZone", P5),
        SetInvincibility(Enable, 122, P8, "HealZone")
    }, preserved)
    TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, 69, Start_var1)}, {
        KillUnit(119, Force2),
    })
    for i = 1, 15 do
    TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, 69 + (i + 3), Start_var1)}, {
        SetMemoryB(0x657A9C, SetTo, 31-i)
    })

    Trigger {
        players = {Force1},
        conditions = {
            Label(0),
            NVar(FnBossHP2, Exactly, 1)
        },
        actions = {
            RunAIScript("Turn ON Shared Vision for Player 5");
            RunAIScript("Turn ON Shared Vision for Player 6");
            RunAIScript("Turn ON Shared Vision for Player 7");
            RunAIScript("Turn ON Shared Vision for Player 8");
            PreserveTrigger();
        },
        }

    end
    TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, 170, Start_var1)}, {
        AddCD(FBOSS_BGM, 1),
    }, preserved)
    TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_SplitTL[2] * SDspeed, FBOSS_BGM)}, {SetMemoryB(0x657A9C, SetTo, 31)})


    for i = 1, 10 do
		local wav
        if i <= 9 then
            wav = "staredit\\wav\\final00"..i..".ogg"
        elseif i >= 10 then
            wav = "staredit\\wav\\final0"..i..".ogg"
        end
        TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_SplitTL[i] * SDspeed, FBOSS_BGM)}, {
            RotatePlayer({
                PlayWAVX(wav),
                PlayWAVX(wav),
            }, {Force1,Force5}, FP)
        })
    end
    CIfEnd()
--------------- End of Final Boss Initial Setup -------------

    CIfX(Force2, {CDeaths(FP, Exactly, 1, Difficulty)})

    CSPlotOrder(FBossMainplot, P5, 77, "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, BGM_SplitTL[2] * SDspeed, FBOSS_BGM)},{MoveUnit(1, 122, P8, "HealZone", "battlegen7")})
    CSPlotOrder(FBossMainplot, P5, 78, "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, BGM_SplitTL[2] * SDspeed, FBOSS_BGM)})
    CSPlotOrder(FBossMainplot, P5, 88, "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, BGM_SplitTL[2] * SDspeed, FBOSS_BGM)})

    CSPlotOrder(FBossMainplot, P5, 3, "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, BGM_Gentimeplot[1] * SDspeed, FBOSS_BGM)})
    CSPlotOrder(FBossMainplot, P5, 8, "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, BGM_Gentimeplot[1] * SDspeed, FBOSS_BGM)})
    CSPlotOrder(FBossMainplot, P5, 12, "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, BGM_Gentimeplot[1] * SDspeed, FBOSS_BGM)})

    CAPlot(Ellipse12, P8, 70, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, BGM_Gentimeplot[2] * SDspeed, FBOSS_BGM)})
    CAPlot(Ellipse6, P8, 23, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, BGM_Gentimeplot[2] * SDspeed, FBOSS_BGM)})

    CAPlot(Ellipse1, P8, 58, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, (BGM_Gentimeplot[2]+1) * SDspeed, FBOSS_BGM)})
    CAPlot(Ellipse7, P8, 7, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, (BGM_Gentimeplot[2] +1)* SDspeed, FBOSS_BGM)})

    CAPlot(Ellipse2, P8, 60, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, (BGM_Gentimeplot[2]+2) * SDspeed, FBOSS_BGM)})
    CAPlot(Ellipse8, P8, 3, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, (BGM_Gentimeplot[2]+2) * SDspeed, FBOSS_BGM)})

    CAPlot(Ellipse3, P8, 86, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, (BGM_Gentimeplot[2] +3)* SDspeed, FBOSS_BGM)})
    CAPlot(Ellipse9, P8, 64, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, (BGM_Gentimeplot[2]+3) * SDspeed, FBOSS_BGM)})

    CAPlot(Ellipse4, P8, 28, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, (BGM_Gentimeplot[2] +4)* SDspeed, FBOSS_BGM)})
    CAPlot(Ellipse10, P8, 69, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, (BGM_Gentimeplot[2] +4)* SDspeed, FBOSS_BGM)})

    CAPlot(Ellipse5, P8, 29, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, (BGM_Gentimeplot[2]+5) * SDspeed, FBOSS_BGM)})
    CAPlot(Ellipse11, P8, 74, "HealZone", nil, 1, 32, {1,0,0,0,1,0}, nil, FP, {CDeaths(FP, AtLeast, (BGM_Gentimeplot[2] +5)* SDspeed, FBOSS_BGM)})

    TriggerX(FP, {CDeaths(FP, AtLeast, BGM_Gentimeplot[3] * SDspeed, FBOSS_BGM)}, {SetInvincibility(Enable, "Men", P8, "Anywhere")})

    function PalmPhase(Timeplot, Mainunit, Battlelocation)
        TriggerX(FP, {CDeaths(FP, AtLeast, Timeplot * SDspeed, FBOSS_BGM)}, {
            GiveUnits(All, Mainunit, P8, "Anywhere", P5),
            SetInvincibility(Disable, Mainunit, P5, "Anywhere"),
            CreateUnit(1, 27, Battlelocation, P5),
            Order(Mainunit, P5, "Anywhere", Attack, "callArrival"),
            Order(27, P5, "Anywhere", Attack, "callArrival"),
        })
    end

    TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (BGM_Gentimeplot[2] +5)* SDspeed, FBOSS_BGM)}, {
        SetCDeaths(FP, Add, 1, BattleGen)
    }, preserved)

    TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, 17, BattleGen)}, {
        SetCDeaths(FP, SetTo, 1, BattleGen)
    },preserved)

    function PalmBattlegen(StartVar, EndVar, Unitid)
        Trigger2X(P6, {
        CDeaths(FP, AtLeast, 16, BattleGen), 
        CDeaths(FP, AtLeast, StartVar * SDspeed, FBOSS_BGM), 
        CDeaths(FP, AtMost, (EndVar - 1) * SDspeed, FBOSS_BGM)
    }, {
            RotatePlayer({
                DisplayTextX("\x04Battle Gen Initiated.", 4)
            }, {Force1,Force5}, FP),
            CreateUnit(1, 72, "battlegen1", P6),
            CreateUnit(1, Unitid, "battlegen1", P6),
            CreateUnit(1, 72, "battlegen2", P6),
            CreateUnit(1, Unitid, "battlegen2", P6),
            CreateUnit(1, 72, "battlegen3", P6),
            CreateUnit(1, Unitid, "battlegen3", P6),
            CreateUnit(1, 72, "battlegen4", P6),
            CreateUnit(1, Unitid, "battlegen4", P6),
            CreateUnit(1, 72, "battlegen5", P6),
            CreateUnit(1, Unitid, "battlegen5", P6),
            CreateUnit(1, 72, "battlegen6", P6),
            CreateUnit(1, Unitid, "battlegen6", P6),
            CreateUnit(1, 72, "battlegen7", P6),
            CreateUnit(1, Unitid, "battlegen7", P6),
            CreateUnit(1, 72, "battlegen8", P6),
            CreateUnit(1, Unitid, "battlegen8", P6),
        },preserved)
    end

    PalmBattlegen(BGM_Gentimeplot[3], BGM_Gentimeplot[4], 12)
    PalmBattlegen(BGM_Gentimeplot[4], BGM_Gentimeplot[5], 89)
    PalmBattlegen(BGM_Gentimeplot[5], BGM_Gentimeplot[6], 96)
    PalmBattlegen(BGM_Gentimeplot[6], BGM_Gentimeplot[7], 89)

    PalmPhase(PalmGenTime[1], 70, "celebrate2")
    PalmPhase(PalmGenTime[2], 58, "hive7")
    PalmPhase(PalmGenTime[3], 60, "hive4")
    PalmPhase(PalmGenTime[4], 86, "admin1")
    PalmPhase(PalmGenTime[5], 28, "starg8")
    PalmPhase(PalmGenTime[6], 29, "hive5")
    PalmPhase(PalmGenTime[7], 23, "celebrate1")
    PalmPhase(PalmGenTime[8], 7, "hive10")
    PalmPhase(PalmGenTime[9], 3, "hive3")
    PalmPhase(PalmGenTime[10], 64, "mainLocation")
    PalmPhase(PalmGenTime[11], 69, "starg3")
    PalmPhase(PalmGenTime[12], 74, "hive8")

    Palm_gen_tier1 = {51,93,3,52,3,46,95}
    Palm_gen_tier2 = {78,104,23,60,23,104,25}
    Palm_gen_tier3 = {88,58,89,7,86,28,58}
    
    local j = 1
    for i = 1, 12, 2 do
        if PalmGenTime[i] then
            if Palm_gen_tier1[j] and Palm_gen_tier2[j] and Palm_gen_tier3[j] then
                CSPlotOrder(FBossMainplot, P5, Palm_gen_tier1[j], "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, PalmGenTime[i] * SDspeed, FBOSS_BGM)})
                CSPlotOrder(FBossMainplot, P5, Palm_gen_tier2[j], "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, PalmGenTime[i] * SDspeed, FBOSS_BGM)})
                CSPlotOrder(FBossMainplot, P5, Palm_gen_tier3[j], "HealZone", nil, 1, 32, FBossMainplotA, nil, Attack, "callArrival", nil, 32, nil, FP, {CDeaths(FP, AtLeast, PalmGenTime[i] * SDspeed, FBOSS_BGM)})
            end
        end
        j = j + 1
    end
    ------------------- Start of rhegb part -----------------------
    
CIf(Force2, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (BGM_Gentimeplot[8] * SDspeed) - 1, FBOSS_BGM)})
    
    TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[9] * SDspeed, FBOSS_BGM)}, {CreateUnit(1, 32, "battlegen7", P5)})


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



BackupCp, BPosXY, BPosX, BPosY = CreateVars(4,FP)
LocSize = 128

CunitCtrig_Part1(FP)
MoveCp("X",25*4)

NJumpX(FP,0x1,DeathsX(CurrentPlayer,Exactly,32,0,0xFF))

ClearCalc()

NJumpXEnd(FP,0x1)

DoActions(FP,MoveCp(Subtract,15*4))
SaveCp(FP,BackupCp)
CMov(FP,BPosXY,_Read(BackupCp))
CMov(FP,BPosX,_Mov(BPosXY,0xFFFF))
CMov(FP,BPosY,_Div(_Mov(BPosXY,0xFFFF0000),65536))
Simple_TSetLoc(FP,"emp2",_Sub(BPosX,LocSize),_Sub(BPosY,LocSize),_Add(BPosX,LocSize),_Add(BPosY,LocSize))
LoadCp(FP,BackupCp)
DoActions(FP,MoveCp(Add,15*4))

TriggerX(FP,{DeathsX(CurrentPlayer,Exactly,32,0,0xFF),CDeaths(FP, AtMost, (BGM_Gentimeplot[10] * SDspeed) - 10, FBOSS_BGM)},{
	CreateUnit(2,32,"emp2",P7);
	CreateUnit(1,84,"emp2",P6);
},{Preserved})

ClearCalc()
CJumpEnd(FP,0x2)
CunitCtrig_Part2()
CunitCtrig_Part3X()
for i = 0, 1699 do
CunitCtrig_Part4X(i,{
	DeathsX(EPDF(0x628298-0x150*i+(40*4)),AtLeast,1*16777216,0,0xFF000000),
	DeathsX(EPDF(0x628298-0x150*i+(19*4)),Exactly,0*256,0,0xFF00),
},
{	SetDeathsX(EPDF(0x628298-0x150*i+(40*4)),SetTo,0*16777216,0,0xFF000000);
	MoveCp(Add,25*4);})
end
CunitCtrig_End()
CSPlot(Final_rhegb_Eft, P5, 84, "callArrival", nil, 1, 32, FP,{NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[8] * SDspeed, FBOSS_BGM)})
TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[10] * SDspeed, FBOSS_BGM)}, {KillUnit(32, Force2),RotatePlayer({
    DisplayTextX("\x04End of rhegb Part.\nStart of 4vs4 Part", 4)
}, {Force1,Force5}, FP),})
CIfEnd()
-- Todo : PerAction == SetInvincibility Enable to Spawn tables | SetPlayerColor and SetMinimapColor of P8 and plotting

------------ Start of 4vs4 -------------


SHB26a =
{172,{385.74441182587,-185.98207998183},{424.14082849253,-119.47753548658},{293.78220450555,-255.66529543679},{329.2250506594,-194.27648513348},{364.66789681325,-132.88767483017},{400.11074296709,-71.498864526865},{209.41489278964,-312.19376582676},{242.32610707535,-255.18987054512},{275.23732136107,-198.18597526347},{308.14853564678,-141.18207998183},{341.05974993249,-84.178184700184},{373.97096421821,-27.174289418541},{406.88217850392,29.829605863103},{100.4063642239,-411.40207576093},{131.12349755724,-358.19844016473},{161.84063089057,-304.99480456853},{192.5577642239,-251.79116897233},{223.27489755724,-198.58753337613},{253.99203089057,-145.38389777993},{284.7091642239,-92.180262183728},{315.42629755724,-38.976626587527},{346.14343089057,14.227009008674},{376.8605642239,67.430644604875},{28.971471967694,-445.5309385819},{57.768784467694,-395.65253021046},{86.566096967694,-345.77412183902},{115.36340946769,-295.89571346758},{144.16072196769,-246.01730509614},{172.95803446769,-196.1388967247},{201.75534696769,-146.26048835327},{230.55265946769,-96.382079981828},{259.34997196769,-46.50367161039},{288.14728446769,3.3747367610484},{316.94459696769,53.253145132487},{345.74190946769,103.13155350393},{15.582927260504,-379.12057825416},{42.68628020168,-332.17619390457},{69.789633142857,-285.23180955498},{96.892986084033,-238.28742520539},{123.99633902521,-191.3430408558},{151.09969196639,-144.39865650621},{178.20304490756,-97.454272156623},{205.30639784874,-50.509887807034},{232.40975078992,-3.5655034574448},{259.51310373109,43.378880892144},{286.61645667227,90.323265241733},{313.71980961345,137.26764959132},{340.82316255462,184.21203394091},{24.968727733053,-273.263894966},{50.566338844164,-228.92753196916},{76.163949955275,-184.59116897233},{101.76156106639,-140.2548059755},{127.3591721775,-95.918442978662},{152.95678328861,-51.582079981828},{178.55439439972,-7.2457169849942},{204.15200551083,37.09064601184},{229.74961662194,81.427009008674},{255.34722773305,125.76337200551},{280.94483884416,170.09973500234},{306.54244995527,214.43609799918},{332.14006106639,258.77246099601},{5.0321873043284,-218.1949959157},{29.282555725381,-176.19212570817},{53.532924146434,-134.18925550065},{77.783292567486,-92.186385293119},{102.03366098854,-50.183515085592},{126.28402940959,-8.1806448780649},{150.53439783064,33.822225329462},{174.7847662517,75.825095536989},{199.03513467275,117.82796574452},{223.2855030938,159.83083595204},{247.53587151485,201.83370615957},{271.78623993591,243.8365763671},{296.03660835696,285.83944657462},{6.2473571095224,-126.49026007328},{29.285207109522,-86.58753337613},{52.323057109522,-46.684806678979},{75.360907109522,-6.7820799818284},{98.398757109522,33.120646715322},{121.43660710952,73.023373412473},{144.47445710952,112.92610010962},{167.51230710952,152.82882680677},{190.55015710952,192.73155350392},{213.58800710952,232.63428020108},{236.62585710952,272.53700689823},{259.66370710952,312.43973359538},{282.70155710952,352.34246029253},{3.6517547342653,-41.385975263472},{25.592564258075,-3.3833784090429},{47.533373781884,34.619218445386},{69.474183305694,72.621815299815},{91.414992829503,110.62441215424},{113.35580235331,148.62700900867},{135.29661187712,186.6296058631},{157.23742140093,224.63220271753},{179.17823092474,262.63479957196},{201.11904044855,300.63739642639},{223.05984997236,338.63999328082},{18.708530930437,74.29312610649},{39.652030930437,110.56833219481},{60.595530930437,146.84353828313},{81.539030930437,183.11874437145},{102.48253093044,219.39395045977},{123.42603093044,255.66915654808},{144.36953093044,291.9443626364},{-251.37849411563,-303.91132373842},{9.0493754495895,147.16297805546},{29.082288493068,181.86100127037},{49.115201536546,216.55902448528},{-291.01113691532,-282.95707470571},{-271.81292858198,-249.70480245808},{-22.236220248649,182.57473676105},{-3.0380119153157,215.82700900867},{-312.14672333819,-229.96498423789},{-293.71644333819,-198.04280288017},{-109.41364333819,121.17901069703},{-90.983363338192,153.10119205475},{-72.553083338192,185.02337341247},{-54.122803338192,216.94555477019},{-35.692523338192,248.86773612791},{-17.262243338192,280.78991748563},{-352.36237527389,-210.02053665003},{-334.64095219697,-179.32613149837},{-316.91952912004,-148.63172634672},{-192.86956758158,66.229109714863},{-175.14814450466,96.923514866517},{-157.42672142773,127.61792001817},{-139.70529835081,158.31232516983},{-121.98387527389,189.00673032148},{-104.26245219697,219.70113547313},{-86.541029120042,250.39554062479},{-68.819606043119,281.08994577644},{-51.098182966196,311.7843509281},{-33.376759889273,342.47875607975},{-15.65533681235,373.17316123141},{-392.47301136913,-189.89419629089},{-375.40793729506,-160.33662095967},{-358.34286322098,-130.77904562844},{-341.27778914691,-101.22147029722},{-324.21271507283,-71.663894965999},{-290.08256692468,-12.548744303553},{-273.01749285061,17.00883102767},{-255.95241877654,46.566406358892},{-238.88734470246,76.123981690115},{-221.82227062839,105.68155702134},{-204.75719655431,135.23913235256},{-187.69212248024,164.79670768378},{-170.62704840617,194.35428301501},{-153.56197433209,223.91185834623},{-136.49690025802,253.46943367745},{-119.43182618394,283.02700900867},{-102.36675210987,312.5845843399},{-432.48988332111,-169.60545167169},{-416.03427617825,-141.10350403087},{-399.57866903539,-112.60155639005},{-333.75624046396,1.4062341732403},{-317.30063332111,29.908181814062},{-300.84502617825,58.410129454884},{-284.38941903539,86.912077095706},{-267.93381189253,115.41402473653},{-251.47820474968,143.91597237735},{-235.02259760682,172.41792001817},{-218.56699046396,200.91986765899},{-202.11138332111,229.42181529982},{-185.65577617825,257.92376294064},{-345.31731155843,70.981871647704},{-329.42913914464,98.500993507808},{-313.54096673085,126.02011536791},{-297.65279431705,153.53923722802},{-281.76462190326,181.05835908812},{-374.05274045257,110.81064882577},{-358.69417378591,137.41246662387}}

SHB26b =
{44,{405.14338087064,-197.18207998183},{228.81386183441,-323.39376582676},{294.63629040584,-209.38597526347},{360.45871897727,-95.378184700185},{77.167753512465,-406.85253021046},{134.76237851247,-307.09571346758},{192.35700351247,-207.3388967247},{249.95162851247,-107.58207998183},{307.54625351247,-7.8252632389517},{365.14087851247,91.931553503925},{44.367696777824,-284.463894966},{95.562919000046,-195.79116897233},{146.75814122227,-107.11844297866},{197.95336344449,-18.445716984994},{249.14858566671,70.227009008674},{300.34380788894,158.89973500234},{2.6084761542939,-177.59298677043},{48.684176154294,-97.78753337613},{94.759876154294,-17.982079981828},{140.83557615429,61.823373412473},{186.91127615429,141.62882680677},{232.98697615429,221.43428020108},{279.06267615429,301.23973359538},{38.107499975208,63.09312610649},{79.994499975208,135.64353828313},{121.88149997521,208.19395045977},{163.76849997521,280.7443626364},{-332.96340622912,-221.22053665003},{-297.52056007527,-159.83172634672},{-155.74917545989,85.723514866517},{-120.30632930604,147.11232516983},{-84.863483152194,208.50113547313},{-49.420636998348,269.88994577644},{-13.977790844502,331.27875607975},{-413.09091427633,-180.80545167169},{-380.17969999062,-123.80155639005},{-347.26848570491,-66.797661108403},{-314.35727141919,-9.7937658267597},{-281.44605713348,47.210129454884},{-248.53484284776,104.21402473653},{-215.62362856205,161.21792001817},{-182.71241427633,218.22181529982},{-149.80119999062,275.22571058146},{-339.29520474113,126.21246662387}}


CSPlotOrder(SHB26a, P5, 70, "callArrival", nil, 1, 32, SHB26a, nil, Attack, "HealZone", nil, 32, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[11] * SDspeed, FBOSS_BGM)})
CSPlotOrder(CS_Rotate(SHB26b,30), P5, 102, "callArrival", nil, 1, 32, SHB26b, nil, Attack, "HealZone", nil, 32, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[11] * SDspeed, FBOSS_BGM)})
CSPlotOrder(CS_Rotate(SHB26a,45), P5, 104, "callArrival", nil, 1, 32, SHB26a, nil, Attack, "HealZone", nil, 32, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[11] * SDspeed, FBOSS_BGM)})
TriggerX(FP,{NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[11] * SDspeed, FBOSS_BGM)} , {
    RotatePlayer({
        DisplayTextX("\x04CAPlot, R-Time Rotation Successfully Executed.", 4)
    }, {Force1,Force5}, FP)
})

CSPlotOrder(SHB26a, P5, 70, "callArrival", nil, 1, 32, SHB26a, nil, Attack, "HealZone", nil, 32, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[12] * SDspeed, FBOSS_BGM)})
CSPlotOrder(CS_Rotate3D(SHB26b,30,30,30), P5, 102, "callArrival", nil, 1, 32, SHB26b, nil, Attack, "HealZone", nil, 32, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[12] * SDspeed, FBOSS_BGM)})
CSPlotOrder(CS_Rotate3D(SHB26a,45,45,45), P5, 104, "callArrival", nil, 1, 32, SHB26a, nil, Attack, "HealZone", nil, 32, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[12] * SDspeed, FBOSS_BGM)})
TriggerX(FP,{NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[12] * SDspeed, FBOSS_BGM)} , {
    RotatePlayer({
        DisplayTextX("\x04CAPlot, R-Time Rotation Successfully Executed.", 4)
    }, {Force1,Force5}, FP)
})

CSPlotOrder(SHB26a, P5, 70, "callArrival", nil, 1, 32, SHB26a, nil, Attack, "HealZone", nil, 32, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[13] * SDspeed, FBOSS_BGM)})
CSPlotOrder(CS_Rotate3D(SHB26b,45,45,45), P5, 102, "callArrival", nil, 1, 32, SHB26b, nil, Attack, "HealZone", nil, 32, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[13] * SDspeed, FBOSS_BGM)})
CSPlotOrder(CS_Rotate3D(SHB26a,60,60,60), P5, 104, "callArrival", nil, 1, 32, SHB26a, nil, Attack, "HealZone", nil, 32, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[13] * SDspeed, FBOSS_BGM)})
TriggerX(FP,{NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[13] * SDspeed, FBOSS_BGM)} , {
    RotatePlayer({
        DisplayTextX("\x04CAPlot, R-Time Rotation Successfully Executed.", 4)
    }, {Force1,Force5}, FP)
})

CSPlotOrder(SHB26a, P5, 70, "callArrival", nil, 1, 32, SHB26a, nil, Attack, "HealZone", nil, 32, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[14] * SDspeed, FBOSS_BGM)})
CSPlotOrder(CS_Rotate(SHB26b,60,60,60), P5, 102, "callArrival", nil, 1, 32, SHB26b, nil, Attack, "HealZone", nil, 32, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[14] * SDspeed, FBOSS_BGM)})
CSPlotOrder(CS_Rotate(SHB26a,75,75,75), P5, 104, "callArrival", nil, 1, 32, SHB26a, nil, Attack, "HealZone", nil, 32, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[14] * SDspeed, FBOSS_BGM)})
TriggerX(FP,{NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[14] * SDspeed, FBOSS_BGM)} , {
    RotatePlayer({
        DisplayTextX("\x04CAPlot, R-Time Rotation Successfully Executed.", 4)
    }, {Force1,Force5}, FP)
})

CSPlotOrder(SHB26a, P5, 70, "callArrival", nil, 1, 32, SHB26a, nil, Attack, "HealZone", nil, 32, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[15] * SDspeed, FBOSS_BGM)})
CSPlotOrder(CS_Rotate(SHB26b,75,75,75), P5, 102, "callArrival", nil, 1, 32, SHB26b, nil, Attack, "HealZone", nil, 32, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[15] * SDspeed, FBOSS_BGM)})
CSPlotOrder(CS_Rotate(SHB26a,90,90,90), P5, 104, "callArrival", nil, 1, 32, SHB26a, nil, Attack, "HealZone", nil, 32, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[15] * SDspeed, FBOSS_BGM)})
TriggerX(FP,{NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, BGM_Gentimeplot[15] * SDspeed, FBOSS_BGM)} , {
    RotatePlayer({
        DisplayTextX("\x04CAPlot, R-Time Rotation Successfully Executed.", 4)
    }, {Force1,Force5}, FP)
})


------------- Start of Final Memory2 Part ----------------

TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[1] * SDspeed) - 1, FBOSS_BGM)}, {SetImageScript(148, 165)})
CAPlot(CS_SortR(Finale_mem,0), P5, 84, "callArrival", nil, 1, 32, {1,0,0,0,6,0}, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[1] * SDspeed), FBOSS_BGM)})
local MemArray = {Mem_CAplot1, Mem_CAplot2,Mem_CAplot3,Mem_CAplot4,Mem_CAplot5,Mem_CAplot6,Mem_CAplot7,Mem_CAplot8}
for i = 1, 8 do 
    CSPlotOrder(MemArray[i], P6, 21, "HealZone", nil, 1, 32, MemArray[i], nil, Attack, "callArrival", nil, 32, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[2] * SDspeed) + (7 * i), FBOSS_BGM)})
end

CAPlotOrder(Circulation1, P6, 62, "callArrival", nil, 1, 32, {1,3,0,0,3,0}, nil,CSMakeCircleX(6,0,30,54,24) , Attack, "HealZone", nil, {1,0}, nil, {0,32}, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[3] * SDspeed), FBOSS_BGM), CDeaths(FP, AtMost, (MemGenTime2[4] * SDspeed), FBOSS_BGM)},nil,{})
-- CAPlotOrder(CS_Rotate(Circulation1,180), P6, 64, "callArrival", nil, 1, 32, {1,3,0,0,2,0}, nil,CSMakeCircleX(6,0,30,54,24) , Attack, "HealZone", nil, {1,0}, nil, {0,32}, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[3] * SDspeed), FBOSS_BGM), CDeaths(FP, AtMost, (MemGenTime2[4] * SDspeed), FBOSS_BGM)},nil,{})

PalmBattlegen(MemGenTime2[3], MemGenTime2[4], 102)

TriggerX(FP, {
    NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[4] * SDspeed) - 2, FBOSS_BGM)
}, {
    SetScanImage(391)
})
TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[5] * SDspeed), FBOSS_BGM)}, {
    SetScanImage(546)
})
CAPlot(CS_SortR(MemEft,1),P6,33,"callArrival",nil,1,32,{1,0,0,0,MemEft[1]/8,0},nil,P6,{NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[4] * SDspeed), FBOSS_BGM)})

CAPlot(CS_SortR(Finale_mem,0), P5, 84, "callArrival", nil, 1, 32, {1,0,0,0,6,0}, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[5] * SDspeed), FBOSS_BGM)})

-- CAPlotOrder(Circulation1, P6, 62, "callArrival", nil, 1, 32, {1,9,0,0,9,0}, nil,CSMakeCircleX(6,0,30,54,24) , Attack, "HealZone", nil, {1,0}, nil, {0,32}, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[5] * SDspeed), FBOSS_BGM),CDeaths(FP, AtMost, (MemGenTime2[6] * SDspeed), FBOSS_BGM)},nil,{})
-- CAPlotOrder(Circulation2, P6, 64, "callArrival", nil, 1, 32, {1,9,0,0,3,0}, nil,CSMakeCircleX(6,0,30,54,24) , Attack, "HealZone", nil, {1,0}, nil, {0,32}, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[5] * SDspeed), FBOSS_BGM),CDeaths(FP, AtMost, (MemGenTime2[6] * SDspeed), FBOSS_BGM)},nil,{})
CAPlotOrder(Circulation3, P6, 8, "callArrival", nil, 1, 32, {1,9,0,0,9,0}, nil,CSMakeCircleX(6,0,30,54,24) , Attack, "HealZone", nil, {1,0}, nil, {0,32}, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[5] * SDspeed), FBOSS_BGM), CDeaths(FP, AtMost, (MemGenTime2[6] * SDspeed), FBOSS_BGM)},nil,{})
-- CAPlotOrder(Circulation4, P6, 56, "callArrival", nil, 1, 32, {1,9,0,0,3,0}, nil,CSMakeCircleX(6,0,30,54,24) , Attack, "HealZone", nil, {1,0}, nil, {0,32}, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[5] * SDspeed), FBOSS_BGM), CDeaths(FP, AtMost, (MemGenTime2[6] * SDspeed), FBOSS_BGM)},nil,{})

CAPlotOrder(Mem_Flnale1, P5, 60, "callArrival", {2048,2048}, 1, 32, {1,0,0,0,1,0}, nil, Mem_Flnale1A, Attack, "HealZone", {2048,2048}, {1,0}, nil, {0,32}, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[6] * SDspeed), FBOSS_BGM)},nil,nil)
CAPlotOrder(Mem_Flnale2, P5, 64, "callArrival", {2048,2048}, 1, 32, {1,0,0,0,1,0}, nil, Mem_Flnale2A, Attack, "HealZone", {2048,2048}, {1,0}, nil, {0,32}, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, ((MemGenTime2[6]+2) * SDspeed), FBOSS_BGM)},nil,nil)
CAPlotOrder(Mem_Flnale3, P5, 62, "callArrival", {2048,2048}, 1, 32, {1,0,0,0,1,0}, nil, Mem_Flnale3A, Attack, "HealZone", {2048,2048}, {1,0}, nil, {0,32}, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, ((MemGenTime2[6] +5)* SDspeed), FBOSS_BGM)},nil,nil)
CAPlotOrder(Mem_Flnale4, P5, 28, "callArrival", {2048,2048}, 1, 64, {Mem_Flnale4[1],0,0,0,2,0}, nil, Mem_Flnale4A, Attack, "HealZone", {2048,2048}, {1,0}, nil, {0,32}, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, ((MemGenTime2[6]+9)* SDspeed), FBOSS_BGM)},nil,nil)
CAPlotOrder(CS_Rotate(Mem_Flnale4,20), P5, 96, "callArrival", {2048,2048}, 1, 64, {Mem_Flnale4[1],0,0,0,2,0}, nil, Mem_Flnale4A, Attack, "HealZone", {2048,2048}, {1,0}, nil, {0,32}, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, ((MemGenTime2[6]+13)* SDspeed), FBOSS_BGM)},nil,nil)
CAPlotOrder(CS_Rotate(Mem_Flnale4,40), P5, 69, "callArrival", {2048,2048}, 1, 64, {Mem_Flnale4[1],0,0,0,2,0}, nil, Mem_Flnale4A, Attack, "HealZone", {2048,2048}, {1,0}, nil, {0,32}, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, ((MemGenTime2[6]+17)* SDspeed), FBOSS_BGM)},nil,nil)

TriggerX(FP, {
    NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[7] * SDspeed) - 2, FBOSS_BGM)
}, {
    SetScanImage(391)
})
TriggerX(FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[8] * SDspeed), FBOSS_BGM)}, {
    SetScanImage(546)
})
CAPlot(CS_SortR(MemEft,1),P6,33,"HealZone",nil,1,32,{1,0,0,0,MemEft[1]/8,0},nil,P6,{NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[7] * SDspeed), FBOSS_BGM)})

CAPlot(CS_SortR(Finale_mem,0), P5, 84, "HealZone", nil, 1, 32, {1,0,0,0,6,0}, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[8] * SDspeed), FBOSS_BGM)})

CSPlotOrder(FBossMainplot, P6, 25, 'HealZone', nil, 1, 32, FBossMainplotA, nil, Attack, "HealZone", nil, 32, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[9] * SDspeed), FBOSS_BGM)})
CSPlotOrder(FBossMainplot, P6, 102, 'HealZone', nil, 1, 32, FBossMainplotA, nil, Attack, "HealZone", nil, 32, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[9] * SDspeed), FBOSS_BGM)})
CSPlotOrder(FBossMainplot, P6, 104, 'HealZone', nil, 1, 32, FBossMainplotA, nil, Attack, "HealZone", nil, 32, nil, FP, {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, (MemGenTime2[9] * SDspeed), FBOSS_BGM)})

TriggerX(FP, {
    {NVar(FnBossHP2, Exactly, 1),CDeaths(FP, AtLeast, ((MemGenTime2[10] + 3) * SDspeed), FBOSS_BGM)}
}, {
    RotatePlayer({
        MinimapPing("callArrival");
        MinimapPing("callArrival");
        MinimapPing("callArrival");
        DisplayTextX("\x04Invincibility Disable flag", 4);
    }, {Force1,Force5}, FP),
    SetInvincibility(Disable, 122, Force2, "Anywhere")
})

CAPlot(CS_SortR(Finale_mem,0), P5, 84, "HealZone", nil, 1, 32, {1,0,0,0,6,0}, nil, FP, {Deaths(FP, AtLeast, 1, 122)})
TriggerX(FP, {Deaths(FP, AtLeast, 1, 122)}, {
    RotatePlayer({
        DisplayTextX('Boss Clear text.', 4);
    }, {Force1, Force5}, FP),
    CreateUnitWithProperties(1, 122, "callArrival", P8, StargateProperties)
})

-------------------------- Start of Hard Plot --------------------
    CElseX()



    
    CIfXEnd()
end