function Initial_Setting()
    PB = CSMakePolygon(6,32,0,13,1)
    CSPlotOrder(PB, P1, 16, "home", nil, 1, 32, PB, nil, Attack, "mainclock", nil, 32, nil, FP, {Always()})
    -- TriggerX(FP, Always(), {
    --     CreateUnit(1, 2, "home", P5);
    --     CreateUnit(1, 17, "home", P5);
    --     CreateUnit(1, 15, "home", P5);
    --     CreateUnit(1, 21, "home", P5);
    --     CreateUnit(1, 5, "home", P5);
    --     CreateUnit(1, 19, "home", P5);
    --     CreateUnit(1, 22, "home", P5);
    --     CreateUnit(1, 25, "home", P5);
    -- })

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

    ------------- Hero placement loop --------------
    

    DoActions(FP,{
		SetInvincibility(Enable, "Any unit", P9, "Anywhere");
		SetInvincibility(Enable, "Any unit", P10, "Anywhere");
        SetInvincibility(Enable, "Any unit", P11, "Anywhere");
	})
	RepHeroIndex = CreateVar(FP) -- 재배치할 영웅 ID
	HPlayerV = CreateVar(FP) -- 미리 배치된 영웅
	SpellcasterPatch = {}
		function SetUnitAdvFlag(UnitID,Value,Mask)
			table.insert(SpellcasterPatch,SetMemoryX(0x664080 + (UnitID*4),SetTo,Value,Mask))
		end
		for i = 0, 227 do
			SetUnitAdvFlag(i,0x200000,0x200000)
		end
		SetUnitAdvFlag(204,0,0x200000) -- 204 이팩트유닛 제외
		SetUnitAdvFlag(218,0,0x200000) -- 218 이팩트유닛 제외
	DoActions2(FP,SpellcasterPatch,{}) -- 마나유닛패치
		

    BuildingArr = {130,131,132} 
    HeroArr = {2,17,15,52,58,65,66,68,4,19,21,15} 
            
        
    CIfOnce(FP,{Always()})

        CFor(FP, 19025, 19025 + (84*1700), 84)
        CI = CForVariable()

            CIf(FP,{TDeathsX(_Add(CI,19),AtLeast,1*256,0,0xFF00)})
                for i = 1 , #BuildingArr do
                    CTrigger(FP,{TDeathsX(_Add(CI,25),Exactly,BuildingArr[i],0,0xFF)},{ -- Set BID CloackedE
                        TSetMemoryX(_Add(CI,30+25),SetTo,0xB00,0xB00);
                        TSetMemoryX(_Add(CI,12+25),SetTo,0,0xFF0000);
                        TSetMemoryX(_Add(CI,32+25),SetTo,0,0xFFFFFFFF);
                    },{Preserved})
                end
            CIfEnd()
                    f_Read(FP,_Add(CI,25),RepHeroIndex,nil,0xFF,1)
                    f_Read(FP,_Add(CI,19),HPlayerV,nil,0xFF,1)
                    HPlayerV2 = CreateVar(FP)
                    local condbox = {}
                    for i = 1, #HeroArr do
                        table.insert(condbox,NVar(RepHeroIndex,Exactly,HeroArr[i]))
                    end
            CIf(FP,{TTOR(condbox)})
                    TriggerX(FP, NVar(HPlayerV, Exactly, 8),{SetNVar(HPlayerV2, SetTo, 5)},{Preserved})
                    TriggerX(FP, NVar(HPlayerV, Exactly, 9),{SetNVar(HPlayerV2, SetTo, 6)},{Preserved})
                    TriggerX(FP, NVar(HPlayerV, Exactly, 10),{SetNVar(HPlayerV2, SetTo, 7)},{Preserved})
                    f_Read(FP,0x628438,nil,Nextptr) -- 재생성될 유닛의 좌표를 지정
                CTrigger(FP,{},{  -- Replace Hero
                        TMoveLocation("248",RepHeroIndex,HPlayerV,"Anywhere");
                        TModifyUnitEnergy(1,RepHeroIndex,HPlayerV,"248",0);
                        TRemoveUnitAt(1,RepHeroIndex,"248",HPlayerV);
                        TCreateUnit(1,RepHeroIndex,"248",HPlayerV2);
                        TModifyUnitEnergy(1,RepHeroIndex,HPlayerV2,"248",100);
                        TSetMemoryX(Vi(Nextptr[2],9),SetTo,1*65536,0xFF0000); -- 영작플래그 설치 | 0x024 공메모리 offset
                        },{Preserved})
            CIfEnd()

        CForEnd()
            
    CIfEnd()




    SMarineArray = {16,10,1,99,100}
    ColorCode = {0x08, 0x0E, 0x0F, 0x10, 0x11}
    MarTblPtr = CreateVarArr(5,FP)
    SetPlayers = CreateVar(FP)
    PLength = CreateVArrArr(5, 5, FP)
    Names = CreateVArrArr(5,5,FP)
    Color = {"\x08","\x0E","\x0F","\x10","\x11"}
    Str122 = CreateCText(FP,"\x07·\x11·\x08·\x07【 ")
    Str02 = {}

    -- DisplayPrintTbl(1346, {"\x07·\x11·\x08·\x07【 ",temp123})
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
    TriggerX(FP, Always(), { -- 0번무기 Section == 노말 트루데미지 ㅅㅂ 515B88부터 시작해서 1번슬롯이 0번방어구임
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

    CTriggerX(FP, Always(), { --  퍼뎀 무기 2번 할당 | 스마 : P1 = 16, P2 = 10, P3 = 1, P4 = 99 , P5 = 100 | Only CPU
        SetMemory(0x515B88+0x14*2+0x4*0,SetTo,256); -- Independence type vs Percentage | Plague, Storm
        SetMemory(0x515B88+0x14*2+0x4*7,SetTo,2100 * 256 / 1000); -- 일마
        SetMemory(0x515B88+0x14*2+0x4*1,SetTo,3900 * 256 / 1000); -- 영마
        TSetMemory(0x515B88+0x14*2+0x4*2,SetTo,_Div(_ReadF(0x662350 + 16*4),1000)); -- 스마 1P
        TSetMemory(0x515B88+0x14*2+0x4*3,SetTo,_Div(_ReadF(0x662350 + 10*4),1000)); -- 스마 2P
        TSetMemory(0x515B88+0x14*2+0x4*4,SetTo,_Div(_ReadF(0x662350 + 1*4),1000)); -- 스마 3P
        TSetMemory(0x515B88+0x14*2+0x4*5,SetTo,_Div(_ReadF(0x662350 + 99*4),1000)); -- 스마 4P
        TSetMemory(0x515B88+0x14*2+0x4*6,SetTo,_Div(_ReadF(0x662350 + 100*4),1000)); -- 스마 5P
        SetMemory(0x515B88+0x14*2+0x4*8,SetTo,1500 * 256 / 1000); -- 삽질
    }, preserved)

end