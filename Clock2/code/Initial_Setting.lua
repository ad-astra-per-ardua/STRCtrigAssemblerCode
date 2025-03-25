function Initial_Setting()
    PB = CSMakePolygon(6,80,0,37,1)
    CSPlotOrder(PB, P1, 16, "home", nil, 1, 32, PB, nil, Attack, "mainclock", nil, 32, nil, FP, {Always()})

    CIfOnce(Force1, Always())

    for i = 0, 227 do
        SetUnitDefUpType(i,60) -- 방업 적용 방지
        SetToUnitDef(i,0) -- 방어력 전부 0으로 설정 
        SetUnitAdvFlag(i,0,0x4000) -- 모든유닛 어드밴스드 플래그 중 로보틱 전부제거
        
    end
    InitialMArray = {0,20,16,10,1,99,100}

    for i = 1, #InitialMArray do
        SetUnitAdvFlag(InitialMArray[i], 0x4000, 0x4000)
        UnitSizePatch(InitialMArray[i],6,9,6,10)
    end

    CIfEnd()

    function UnitLimit(Player,UID,Limit,Text,ReturnResources)
        Trigger {
            players = {Player},
            conditions = {
                Label();
                Bring(Player,AtLeast,Limit+1,UID,64);
                },
            
            actions = {
                KillUnitAt(1,UID,"Anywhere",Player);
                DisplayText(StrDesign("\x04"..Text.." "..Limit.."기를 넘어서 소지할 수 없습니다. \x1C자원 반환 \x1F+ "..ReturnResources.." Ore\x07"),4);
                SetResources(Player,Add,ReturnResources,Ore);
                PreserveTrigger();
            },
        }
    end

    -- function Install_CText1(StrPtr,CText1,CText2,PlayerVArr)

    --     f_Memcpy(FP,StrPtr,_TMem(Arr(CText1[3],0),"X","X",1),CText1[2])
    --     f_Movcpy(FP,_Add(StrPtr,CText1[2]),VArr(PlayerVArr,0),4*5)
    --     f_Memcpy(FP,_Add(StrPtr,CText1[2]+(4*6)+3),_TMem(Arr(CText2[3],0),"X","X",1),CText2[2])
    
    -- end

    -- SMarineArray = {16,10,1,99,100}
    -- ColorCode = {0x08, 0x0E, 0x0F, 0x10, 0x11}
    -- MarTblPtr = CreateVarArr(5,FP)
    -- SetPlayers = CreateVar(FP)
    -- PLength = CreateVArrArr(5, 5, FP)
    -- Names = CreateVArrArr(5,5,FP)
    -- Color = {"\x08","\x0E","\x0F","\x10","\x11"}
    -- Str122 = CreateCText(FP,"\x07·\x11·\x08·\x07【 ")
    -- Str02 = {}

    -- for i = 0, 4 do
	-- 	table.insert(Str02,CreateCText(FP,"\x04's "..Color[i+1].."\x1fTime \x19K\x04eeper "..Color[i+1].."S "..Color[i+1].."\x07】\x08·\x11·\x07·"))
	-- end

	-- for i = 0, 4 do
    --     TriggerX(FP,{HumanCheck(i,1)},{SetCVar(FP,SetPlayers[2],Add,1)})
    --     ItoName(FP,i,VArr(Names[i+1],0),ColorCode[i+1])
    --     f_GetTblptr(FP,MarTblPtr[i+1],SMarineArray[i+1]+1)
    --     _0DPatchforVArr(FP,Names[i+1],5)
    --     Install_CText1(MarTblPtr[i+1],Str122,Str02[i+1],Names[i+1])
	-- end

    
    TriggerX(FP, Always(),{
        RotatePlayer({RunAIScriptAt("Expansion Zerg Campaign Insane", "duskHive6"),RunAIScriptAt("Value This Area Higher","mainclock")}, {P6}, FP),
        RotatePlayer({RunAIScriptAt("Expansion Zerg Campaign Insane", "noonHive1"),RunAIScriptAt("Value This Area Higher","mainclock")}, {P7}, FP),
        RotatePlayer({RunAIScriptAt("Expansion Zerg Campaign Insane", "morHive5"),RunAIScriptAt("Value This Area Higher","mainclock")}, {P8}, FP),
        RotatePlayer({CenterView("mainclock")}, {Force1,Force5}, FP);
    })
    
TriggerX(Force2, Always(), {
    SetResources(P6, SetTo, 0xFFFFF, Ore);
    SetResources(P7, SetTo, 0xFFFFF, Ore);
    SetResources(P8, SetTo, 0xFFFFF, Ore);
    SetResources(P6, SetTo, 0xFFFFF, Gas);
    SetResources(P7, SetTo, 0xFFFFF, Gas);
    SetResources(P8, SetTo, 0xFFFFF, Gas);
    SetAllianceStatus(Force1, Enemy);
    SetAllianceStatus(Force2, Ally);
    RunAIScript('Turn ON Shared Vision for Player 1');
    RunAIScript('Turn ON Shared Vision for Player 2');
    RunAIScript('Turn ON Shared Vision for Player 3');
    RunAIScript('Turn ON Shared Vision for Player 4');
    RunAIScript('Turn ON Shared Vision for Player 5');
}, preserved)


TriggerX(Force1, Always(), {
    RunAIScript('Turn ON Shared Vision for Player 1');
    RunAIScript('Turn ON Shared Vision for Player 2');
    RunAIScript('Turn ON Shared Vision for Player 3');
    RunAIScript('Turn ON Shared Vision for Player 4');
    RunAIScript('Turn ON Shared Vision for Player 5');
}, preserved)

TriggerX(Force1, {
    Command(AllPlayers,AtMost,1,111);
    Command(CurrentPlayer,AtLeast,1,111);
}, {
    CreateUnit(2,20,"home",CurrentPlayer);
    SetResources(CurrentPlayer,Add,30000,Ore);
    DisplayText(StrDesignX("\x04싱글 플레이 인식"), 4);
    DisplayText(StrDesignX("\x07+ 30,000 Ore, \x04영마 \x072마리 \x04추가 지급"), 4);
})

for i = 0, 3 do
    Trigger {
        players = {i},
        conditions = {
            Void(i+1,Exactly,0);
            Bring(CurrentPlayer,AtLeast,1,12,"MainLocation")
        },
        actions = {
            RemoveUnitAt(1,12,"MainLocation",CurrentPlayer);
            DisplayText(StrDesign2X("BGM을 듣지 않습니다 (ㅠ_ㅠ)"));
            SetVoid(i+1,SetTo,1);
            PreserveTrigger()
        },
    }
    
    Trigger { -- off
        players = {i},
        conditions = {
            Void(i+1,Exactly,1);
            Bring(CurrentPlayer,AtLeast,1,12,"MainLocation")
        },
        actions = {
            RemoveUnitAt(1,12,"MainLocation",CurrentPlayer);
            DisplayText(StrDesign2X("BGM을 다시 듣습니다 (^_^)"));
            SetVoid(i+1,SetTo,0);
            PreserveTrigger()
        },
    }
    end
    --[[
        0x515B84 +0x14× WepType + 0x4 × TakeDMGType
        Percentage DMG type Weapon Type == 2 number And True DMG Type Weapon Type == 0 number
        퍼뎀 == 2번(진동형) , 노말 == 0번(독립형)
    
    ]]
    TriggerX(FP, Always(), { -- 0번무기 Section == 노말 트루데미지 
        SetMemory(0x515B84+0x14*0+0x4*1,SetTo,0); -- Mineral Chunk == Independence type
        SetMemory(0x515B84+0x14*0+0x4*2,SetTo,256);
        SetMemory(0x515B84+0x14*0+0x4*3,SetTo,256);
        SetMemory(0x515B84+0x14*0+0x4*4,SetTo,256);
        SetMemory(0x515B84+0x14*0+0x4*5,SetTo,256);
        SetMemory(0x515B84+0x14*0+0x4*6,SetTo,256);
        SetMemory(0x515B84+0x14*0+0x4*7,SetTo,256);
        SetMemory(0x515B84+0x14*0+0x4*8,SetTo,256);
        SetMemory(0x515B84+0x14*0+0x4*9,SetTo,256);
    },preserved)

    CTriggerX(FP, Always(), { --  퍼뎀 무기 2번 할당 | 스마 : P1 = 16, P2 = 10, P3 = 1, P4 = 99 , P5 = 100 | 
        SetMemory(0x515B88+0x14*2+0x4*0,SetTo,256); -- Mineral Chunk == Independence type vs Percentage | Plague, Storm
        SetMemory(0x515B88+0x14*2+0x4*7,SetTo,2100 * 256 / 1000); -- 일마
        SetMemory(0x515B88+0x14*2+0x4*1,SetTo,3900 * 256 / 1000); -- 영마
        TSetMemory(0x515B88+0x14*2+0x4*2,SetTo,_Div(_ReadF(0x662350 + 16*4),1000)); -- 스마 1P
        TSetMemory(0x515B88+0x14*2+0x4*3,SetTo,_Div(_ReadF(0x662350 + 10*4),1000)); -- 스마 2P
        TSetMemory(0x515B88+0x14*2+0x4*4,SetTo,_Div(_ReadF(0x662350 + 1*4),1000)); -- 스마 3P
        TSetMemory(0x515B88+0x14*2+0x4*5,SetTo,_Div(_ReadF(0x662350 + 99*4),1000)); -- 스마 4P
        TSetMemory(0x515B88+0x14*2+0x4*6,SetTo,_Div(_ReadF(0x662350 + 100*4),1000)); -- 스마 5P
    }, preserved)

end