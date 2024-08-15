function Install_initial_system_setting()
    TriggerX(FP, Always(), {SetMemoryBA(0x657A9C, SetTo, 31)});
    DoActions(FP, SetInvincibility(Enable, "Buildings", P12, "Anywhere"),preserved)
    DoActions(FP, {KillUnit(94, Force2),KillUnit(84, Force2),KillUnit(42, Force2),KillUnit(72, Force2),RemoveUnit(35, Force2)}, preserved)
    TriggerX(FP, Always(), {SetCDeaths(FP, SetTo, 1, Waveswitch)})

    ------ Color Setting ----- 
    DoActions(FP, SetDeaths(P11, Add, 1, 1), preserved)
    TriggerX(FP, Deaths(P11, AtLeast, 17, 1), {SetDeaths(P11, SetTo, 1, 1)}, preserved)
    local P5_Color = {40, 41, 42, 121}
    local P6_Color = {57, 58, 59, 60}
    local P7_Color = {65, 66, 67, 68}
    local P8_Color = {86, 87, 89, 88}

    local ts = {
        {Deaths(P11, Exactly, 0, 1), 1},
        {Deaths(P11, Exactly, 3, 1), 2},
        {Deaths(P11, Exactly, 6, 1), 3},
        {Deaths(P11, Exactly, 9, 1), 4},
        {Deaths(P11, Exactly, 12, 1), 3},
        {Deaths(P11, Exactly, 15, 1), 2}
    }

    for i, t in ipairs(ts) do
        local c, cin = table.unpack(t)
        TriggerX(FP, {c}, {
            SetPlayerColor(4, SetTo, P5_Color[cin]),
            SetPlayerColor(5, SetTo, P6_Color[cin]),
            SetPlayerColor(6, SetTo, P7_Color[cin]),
            SetPlayerColor(7, SetTo, P8_Color[cin]),
            SetMinimapColor(4, SetTo, P5_Color[cin]),
            SetMinimapColor(5, SetTo, P6_Color[cin]),
            SetMinimapColor(6, SetTo, P7_Color[cin]),
            SetMinimapColor(7, SetTo, P8_Color[cin])
        }, preserved)
    end

    Temparray = {ExRate , HDrate}
    DiffTextArray = {"\x07노멀 \x04모드","\x08하드 \x04모드"}
for k = 1, 2 do
    CIf(Force1, {CDeaths(FP, Exactly, k, Difficulty)})
    for i=1, 4 do
        Trigger { -- 미션 오브젝트
            players = {Force1},
            conditions = {
                Command(AllPlayers,Exactly,i,111);
            },
            actions = {
                SetMissionObjectives(StrDesignX("\x04MSF Universe\x07\x04 v1.0 플레이 중입니다.").."\n"..StrDesignX("\x04현재 "..DiffTextArray[k].."\x17 "..i.."명 \x04플레이 중").."\n"..StrDesignX("\x04환전률 : \x1F"..Temparray[k][i].."% \x04 적용 중 입니다").."\n"..StrDesignX("\x19【 해금 조건 】").."\n"..StrDesignX("\x13\x04양쪽 \x08적진의 수뇌부에서 \x10희망의 빛\x04이 \x19희미하게 \x04보이는 것 같다...?").."\n\n"..StrDesignX("\x19플레이 해주셔서 감사합니다.(_ _)"));
            },
        }
        end
        CIfEnd()
    end
    Trigger { -- 싱글 플레이 지원금
	players = {Force1},
	conditions = {
		Command(AllPlayers,AtMost,1,111);
		Command(CurrentPlayer,AtLeast,1,111);
	},
	actions = {
		CreateUnit(2,20,"HealZone",CurrentPlayer);
		SetResources(CurrentPlayer,Add,30000,Ore);
        DisplayText(StrDesignX("\x04싱글 플레이 인식"), 4);
        DisplayText(StrDesignX("\x07+ 30,000 Ore, \x04영마 \x072마리 \x04추가 지급"), 4);
		},
	}
    for i = 0, 3 do
    Trigger {
        players = {i},
        conditions = {
            Void(i+1,Exactly,0);
            Bring(CurrentPlayer,AtLeast,1,12,"mainLocation")
        },
        actions = {
            RemoveUnitAt(1,12,"mainLocation",CurrentPlayer);
            DisplayText(StrDesign2X("BGM을 듣지 않습니다 (ㅠ_ㅠ)"));
            SetVoid(i+1,SetTo,1);
            PreserveTrigger()
        },
    }
    
    Trigger { -- off
        players = {i},
        conditions = {
            Void(i+1,Exactly,1);
            Bring(CurrentPlayer,AtLeast,1,12,"mainLocation")
        },
        actions = {
            RemoveUnitAt(1,12,"mainLocation",CurrentPlayer);
            DisplayText(StrDesign2X("BGM을 다시 듣습니다 (^_^)"));
            SetVoid(i+1,SetTo,0);
            PreserveTrigger()
        },
    }


    Trigger { -- 스팀팩 / 21
	players = {i},
	conditions = {
		Label(0);
		Command(i,AtLeast,1,21);
	},
	actions = {
		SetCD(CUnitFlag,1);
		SetDeaths(i,Add,1,21);
		ModifyUnitEnergy(1,21,i,64,0);
		RemoveUnitAt(1,21,"Anywhere",i);
		DisplayText(StrDesign("\x04멀티 \x1B스팀팩\x04기능을 사용합니다."),4);
		SetCDeaths(FP,Add,1,CUnitRefresh);
		PreserveTrigger();
	},
	}
	Trigger { -- 스탑 order 1 / 7
	players = {i},
	conditions = {
		Label(0);
		Command(i,AtLeast,1,7);
	},
	actions = {
		SetCD(CUnitFlag,1);
		SetDeaths(i,Add,1,7);
		ModifyUnitEnergy(1,7,i,64,0);
		RemoveUnitAt(1,7,"Anywhere",i);
		DisplayText(StrDesign("\x04멀티 \x07스탑\x04기능을 사용합니다."),4);
		SetCDeaths(FP,Add,1,CUnitRefresh);
		PreserveTrigger();
	},
	}
	Trigger { -- 홀드 order 107 / 30
	players = {i},
	conditions = {
		Label(0);
		Command(i,AtLeast,1,30);
	},
	actions = {
		SetCD(CUnitFlag,1);
		SetDeaths(i,Add,1,30);
		ModifyUnitEnergy(1,30,i,64,0);
		RemoveUnitAt(1,30,"Anywhere",i);
		DisplayText(StrDesign("\x04멀티 \x11홀드\x04기능을 사용합니다."),4);
		SetCDeaths(FP,Add,1,CUnitRefresh);
		PreserveTrigger();
	},
	}
    ------------------ 
    CIf(FP,CDeaths(FP,AtLeast,1,CUnitFlag)) -- 원격
		CMov(FP,0x6509B0,19025+19)
		CWhile(FP,Memory(0x6509B0,AtMost,19025+19 + (84*1699)))
			CIf(FP,{DeathsX(CurrentPlayer,AtMost,3,0,0xFF),DeathsX(CurrentPlayer,AtLeast,256,0,0xFF00)})
			DoActions(FP,MoveCp(Add,6*4))

			CIf(FP,{TTOR({
				DeathsX(CurrentPlayer,Exactly,0,0,0xFF),
				DeathsX(CurrentPlayer,Exactly,1,0,0xFF),
				DeathsX(CurrentPlayer,Exactly,20,0,0xFF)})})
				DoActions(FP,MoveCp(Subtract,6*4))

			for i = 0, 3 do
			CTrigger(FP,{Deaths(i,AtLeast,1,21),DeathsX(CurrentPlayer,Exactly,i,0,0xFF)},{
				MoveCp(Add,50*4);
				SetDeathsX(CurrentPlayer,SetTo,30*256,0,0xFF00);
				MoveCp(Subtract,50*4);},{preserved})

			CTrigger(FP,{Deaths(i,AtLeast,1,7),DeathsX(CurrentPlayer,Exactly,i,0,0xFF),TTDeathsX(CurrentPlayer,NotSame,5*256,0,0xFF00)},{ -- Stop
				SetDeathsX(CurrentPlayer,SetTo,1*256,0,0xFF00),},{preserved})
				
			CIf(FP,{Deaths(i,AtLeast,1,30),DeathsX(CurrentPlayer,Exactly,i,0,0xFF),TTDeathsX(CurrentPlayer,NotSame,5*256,0,0xFF00)}) -- Hold
                f_SaveCp()
				f_Read(FP,_Sub(BackupCp,9),TempPos)
				CDoActions(FP,{
					TSetDeaths(_Add(BackupCp,4),SetTo,0,0),
					TSetDeathsX(BackupCp,SetTo,107*256,0,0xFF00),
					TSetDeaths(_Sub(BackupCp,13),SetTo,TempPos,0),
					TSetDeaths(_Add(BackupCp,3),SetTo,TempPos,0),
					TSetDeaths(_Sub(BackupCp,15),SetTo,TempPos,0)})
				f_LoadCp()
			CIfEnd()
                end
                DoActions(FP,MoveCp(Add,6*4))
                CIfEnd()
                DoActions(FP,MoveCp(Subtract,6*4))
                CIfEnd()
            CAdd(FP,0x6509B0,84)
        CWhileEnd()
    CIfEnd()
DoActionsX(FP,{SetCp(FP),SetDeaths(Force1,SetTo,0,21),SetDeaths(Force1,SetTo,0,7),SetDeaths(Force1,SetTo,0,30),SetCDeaths(FP,SetTo,0,CUnitFlag)})

end 
    CIfX(AllPlayers, {CDeaths(FP, Exactly, 1, Difficulty)})
    -- 업그레이드 관련 -- 
    TriggerX(Force2, {CDeaths(FP, Exactly, 1, Difficulty)}, {SetMemoryB(0x657258+103,SetTo,1),SetMemoryB(0x657258+100,SetTo,1)})
    for i = 4,7 do
        TriggerX(i, {CDeaths(FP, Exactly, 1, Difficulty)}, {SetMemory(0x58CE24 + (24 * i) + 10, SetTo, 0)})
    end
    ---- 1시 보스 데미지 ----
    TriggerX(P6, {CDeaths(FP, Exactly, 1, Difficulty)}, {SetMemoryW(0x656EB0 + 127 * 2, SetTo, 11000)})
    
    -- TriggerX(Force2, {CDeaths(FP, Exactly, 1, Difficulty)}, {SetMemory(0x662350 + (), modtype, number)}, Flags, Index) -- max hp
    --- LeaderBoardControl
    TriggerX(FP, {Memory(0x58F44C, Exactly, 1)},{LeaderBoardResources(Ore, "\x1fM\x04inerals 【Ver。1.2 \x07N\x04ormal】")},preserved);
    TriggerX(FP, {Memory(0x58F44C, Exactly, 131)},{LeaderBoardScore(Custom, "\x08D\x04eaths -- 【Ver。1.2 \x07N\x04ormal】")},preserved);
    TriggerX(FP, {Memory(0x58F44C, Exactly, 261)},{LeaderBoardKills("Any unit", "\x04K\x04ills -- 【Ver。1.2 \x07N\x04ormal】")},preserved);
    TriggerX(FP, {Memory(0x58F44C, AtLeast, 390)},{SetMemory(0x58F44C, SetTo, 0x00000000)},preserved);
    TriggerX(FP, {Always()},{SetMemory(0x58F44C, Add, 0x00000001)},preserved);
    TriggerX(FP, {Always()}, {LeaderBoardComputerPlayers(Disable)})

    CElseX() -------------------------- 하드모드 분기점

    TriggerX(Force2, {CDeaths(FP, Exactly, 2, Difficulty)}, {SetMemoryB(0x657258+103,SetTo,2),SetMemoryB(0x657258+100,SetTo,2)})
    for i = 0, 3 do -- 원격 스팀, 스탑, 홀드 비활성화 | cp * 288 + unit
        TriggerX(FP, {CDeaths(FP, Exactly, 2, Difficulty)}, {
            SetMemoryB(0x57F27C+(228*i)+21,SetTo,0),
            SetMemoryB(0x57F27C+(228*i)+7,SetTo,0),
            SetMemoryB(0x57F27C+(228*i)+30,SetTo,0),
        })
    end
    

    TriggerX(FP, {Memory(0x58F44C, Exactly, 1)},{LeaderBoardResources(Ore, "\x1fM\x04inerals 【Ver。1.2 \x07N\x04ormal】")},preserved);
    TriggerX(FP, {Memory(0x58F44C, Exactly, 131)},{LeaderBoardScore(Custom, "\x08D\x04eaths -- 【Ver。1.2 \x08H\x04ard】")},preserved);
    TriggerX(FP, {Memory(0x58F44C, Exactly, 261)},{LeaderBoardKills("Any unit", "\x04K\x04ills -- 【Ver。1.2 \x08H\x04ard】")},preserved);
    TriggerX(FP, {Memory(0x58F44C, AtLeast, 390)},{SetMemory(0x58F44C, SetTo, 0x00000000)},preserved);
    TriggerX(FP, {Always()},{SetMemory(0x58F44C, Add, 0x00000001)},preserved);
    TriggerX(FP, {Always()}, {LeaderBoardComputerPlayers(Disable)})

    CIfXEnd()
    TriggerX(FP, CDeaths(FP, AtLeast, 1, BGMdeathVar), {SetCDeaths(FP, Subtract, 1,BGMdeathVar)}, preserved)
    TriggerX(FP, CDeaths(FP, AtLeast, 1, BGMtimedeath), {SetCDeaths(FP, Subtract, 1,BGMtimedeath)}, preserved)
    ColorArray = {"\x08","\x0E","\x0F","\x10"};
    for i = 0 , 3 do
        -- TriggerX(FP, {Deaths(i, AtLeast, 1, 0)}, {
        --     RotatePlayer({
        --         DisplayTextX("\x12\x1F【"..ColorArray[i+1].." ["..(i+1).." Player]\x04의 \x19｡˙+ﾟ \x1DPrivate \x1FGuardians of \x19Galaxy ﾟ.+｡\x04가 \x06사망\x04하였습니다.\x1F】", 4);
        --         PlayWAVX("staredit\\wav\\DEAD.wav");
        --     }, {Force1,Force5}, FP),
        --     SetScore(i, Add, 1, Custom),
        -- },preserved); -- 일마
        TriggerX(FP, {Deaths(i, Exactly, 1, 20),CDeaths(FP, AtMost, 10, BGMdeathVar),CDeaths(FP, Exactly, 0, BGMtimedeath)}, {
            RotatePlayer({
                PlayWAVX("staredit\\wav\\DEAD.wav");
            }, {Force1, Force5}, FP),
            SetCDeaths(FP, Add, 1, BGMdeathVar),
            SetCD(BGMtimedeath, 34),
        }, preserved)

        Trigger2X(FP, {Deaths(i, AtLeast, 1, 20)}, {
            RotatePlayer({
                DisplayTextX("\x12\x1F【"..ColorArray[i+1].." ["..(i+1).." Player]\x04의 \x19｡˙+ﾟ \x07Hero \x1FGuardians of \x19Galaxy ﾟ.+｡\x04가 \x06사망\x04하였습니다.\x1F】", 4);
            }, {Force1, Force5}, FP),
            SetScore(i, Add, 2, Custom),
        }, preserved); -- 영마

        
        TriggerX(FP, {Deaths(i, Exactly, 1, 20),CDeaths(FP, AtMost, 10, BGMdeathVar),CDeaths(FP, Exactly, 0, BGMtimedeath)}, {
            RotatePlayer({
                PlayWAVX("staredit\\wav\\DEAD.wav");
            }, {Force1, Force5}, FP),
            SetCDeaths(FP, Add, 1, BGMdeathVar),
            SetCD(BGMtimedeath, 34),
        }, preserved)

        Trigger2X(FP, {Deaths(i, AtLeast, 1, 1)}, {
            RotatePlayer({
                DisplayTextX("\x12\x1F【"..ColorArray[i+1].." ["..(i+1).." Player]\x04의 \x19｡˙+ﾟ \x11Special \x1FGuardians of \x19Galaxy ﾟ.+｡\x04가  \x06사망\x04하였습니다.\x1F】", 4);
            }, {Force1,Force5}, FP),
            SetScore(i, Add, 3, Custom),
        }, preserved); -- 스마
    end

    for i = 0 , 3 do -- initial start setup
        TriggerX(FP, Always(), SetDeaths(i, Subtract, 1, 0), preserved);
        TriggerX(FP, Always(), SetDeaths(i, Subtract, 1, 1), preserved);
        TriggerX(FP, Always(), SetDeaths(i, Subtract, 1, 20), preserved);

        TriggerX(i, Always(), {
            Wait(100),
            CreateUnit(3, 20, "neutralbunker"..i+1, i),
            CreateUnit(5, 0, "neutralbunker"..i+1, i),
            SetResources(i, Add, 100000, Ore),
            RunAIScriptAt("Enter Transport", "neutralbunker"..i+1)});
    end
    
    
    for i=0, 3 do -- 예약메딕
    
        Trigger { -- 
            players = {i},
            conditions = {
                Always()
            },
            actions = {
                SetMemoryBA(0x57F27C+(228*i)+2,SetTo,0);
                SetMemoryBA(0x57F27C+(228*i)+34,SetTo,1);
            },
        }
        
        Trigger { -- 
            players = {i},
            conditions = {
                Deaths(i,Exactly,0,"Map Revealer");
                Bring(i,AtLeast,1,17,"Anywhere");
            },
            actions = {
                RemoveUnit(17,i);
                DisplayText(StrDesign2X("\x172Tic \x04예약메딕을 사용합니다. 메딕 가격이 \x07350 Ore\x04로 조정됩니다."));
                SetMemoryBA(0x57F27C+(228*i)+2,SetTo,1);
                SetMemoryBA(0x57F27C+(228*i)+34,SetTo,0);
                SetDeaths(i,SetTo,1,"Map Revealer");
                PreserveTrigger();
            },
        }
        
        Trigger { -- 
            players = {i},
            conditions = {
                Deaths(i,Exactly,1,"Map Revealer");
                Bring(i,AtLeast,1,17,"Anywhere");
            },
            actions = {
                RemoveUnit(17,i);
                DisplayText(StrDesign2X("\x172Tic \x04예약메딕을 사용하지 않습니다. 메딕 가격이 \x07300 Ore\x04로 조정됩니다."));
                SetMemoryBA(0x57F27C+(228*i)+2,SetTo,0);
                SetMemoryBA(0x57F27C+(228*i)+34,SetTo,1);
                SetDeaths(i,SetTo,0,"Map Revealer");
                PreserveTrigger();
            },
        }
        
        end
        Trigger { -- 1틱메딕
            players = {Force1},
            conditions = {
                Command(CurrentPlayer, AtLeast, 1, "Terran Medic");
            },
            actions = {
                ModifyUnitHitPoints(All, "Men", CurrentPlayer, "Anywhere", 100);
                ModifyUnitShields(All, "Men", CurrentPlayer, "Anywhere", 100);
                RemoveUnit("Terran Medic", CurrentPlayer);
                PreserveTrigger();
            },
        }
        
        Trigger { -- 2틱메딕
            players = {Force1},
            conditions = {
                Command(CurrentPlayer, AtLeast, 1, 2);
            },
            actions = {
                ModifyUnitHitPoints(All, "Men", CurrentPlayer, "Anywhere", 100);
                ModifyUnitShields(All, "Men", CurrentPlayer, "Anywhere", 100);
                RemoveUnit(2, CurrentPlayer);
                PreserveTrigger();
            },
        }
        
        
        Trigger { -- 일마 생산
            players = {Force1},
            conditions = {
                Bring(CurrentPlayer, AtLeast, 1, 0, "mainLocation");
            },
            actions = {
                PlayWAV("staredit\\wav\\ghost_dead.ogg");
                CreateUnit(1, 0, "HealZone", CurrentPlayer);
                RemoveUnitAt(1, 0, "mainLocation", CurrentPlayer);
                PreserveTrigger();
            },
        }
        
        Trigger { -- 영마 생산
            players = {Force1},
            conditions = {
                Bring(CurrentPlayer, AtLeast, 1, 20, "mainLocation");
            },
            actions = {
                PlayWAV("staredit\\wav\\ghost_living.ogg");
                RemoveUnitAt(1, 20, "mainLocation", CurrentPlayer);
                CreateUnit(1, 20, "HealZone", CurrentPlayer);
                PreserveTrigger();
            },
        }
        
        Trigger { -- 스마 생산
            players = {Force1},
            conditions = {
                Bring(CurrentPlayer, AtLeast, 1, 1, "mainLocation");
            },
            actions = {
                PlayWAV("staredit\\wav\\ghost_nevergiveup.ogg");
                RemoveUnitAt(1, 1, "mainLocation", CurrentPlayer);
                CreateUnit(1, 1, "HealZone", CurrentPlayer);
                PreserveTrigger();
            },
        }
        -------------- CPU AI Script
        
    Trigger { -- 나간플레이어 유닛삭제
    players = {P8},
    conditions = {
            Always();
        },
    actions = {
            RemoveUnit("Men",P12);
            RemoveUnit(111,P12);
            RemoveUnit(107,P12);
            PreserveTrigger();
        },
    }

    Trigger { -- 컴퓨터동맹설정
    players = {Force2},
    conditions = {
        Always();
    },
    actions = {
        SetResources(P5, SetTo, 9999999, OreAndGas);
        SetResources(P6, SetTo, 9999999, OreAndGas);
        SetResources(P7, SetTo, 9999999, OreAndGas);
        SetAllianceStatus(Force2,AlliedVictory);
        SetAllianceStatus(Force1, Enemy);
        },
    }
    Trigger { 
    players = {Force2},
    conditions = {
        Always();
    },
    actions = {
        RunAIScript('Turn ON Shared Vision for Player 1');
        RunAIScript('Turn ON Shared Vision for Player 2');
        RunAIScript('Turn ON Shared Vision for Player 3');
        RunAIScript('Turn ON Shared Vision for Player 4');
    },
    }
    Trigger {
    players = {Force1},
    conditions = {
        Always();
    },
    actions = {
        RunAIScript("Turn ON Shared Vision for Player 8");
        PreserveTrigger();
    },
    }
    Trigger {
    players = {Force1},
    conditions = {
        Always();
    },
    actions = {
        RunAIScript('Turn ON Shared Vision for Player 1');
        RunAIScript('Turn ON Shared Vision for Player 2');
        RunAIScript('Turn ON Shared Vision for Player 3');
        RunAIScript('Turn ON Shared Vision for Player 4');
        PreserveTrigger();
    },
    }
    DoActions(FP, {
        SetCp(FP),
        SetAllianceStatus(Force1, Ally),
        SetCp(FP)
    }, preserved)
end