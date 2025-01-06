function N_Gunplot()

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
    -----------------
    
    NJumpX(FP,0x1,DeathsX(CurrentPlayer,Exactly,134,0,0xFF))
    NJumpX(FP,0x1,DeathsX(CurrentPlayer,Exactly,135,0,0xFF))
    NJumpX(FP,0x1,DeathsX(CurrentPlayer,Exactly,136,0,0xFF))
    NJumpX(FP,0x1,DeathsX(CurrentPlayer,Exactly,137,0,0xFF))
    NJumpX(FP,0x1,DeathsX(CurrentPlayer,Exactly,138,0,0xFF))
    NJumpX(FP,0x1,DeathsX(CurrentPlayer,Exactly,139,0,0xFF))
    NJumpX(FP,0x1,DeathsX(CurrentPlayer,Exactly,140,0,0xFF))
    NJumpX(FP,0x1,DeathsX(CurrentPlayer,Exactly,142,0,0xFF))

    
    -----------------

    ClearCalc()
    
    NJumpXEnd(FP,0x1)
    
    DoActions(FP,MoveCp(Subtract,15*4))
    SaveCp(FP,BackupCp)
    CMov(FP,BPosXY,_Read(BackupCp))
    CMov(FP,BPosX,_Mov(BPosXY,0xFFFF))
    CMov(FP,BPosY,_Div(_Mov(BPosXY,0xFFFF0000),65536))
    Simple_TSetLoc(FP,"248",_Sub(BPosX,LocSize),_Sub(BPosY,LocSize),_Add(BPosX,LocSize),_Add(BPosY,LocSize))
    LoadCp(FP,BackupCp)
    DoActions(FP,MoveCp(Add,15*4))


    
    TriggerX(FP, {DeathsX(CurrentPlayer,Exactly,134,0,0xFF)}, {
        CreateUnit(10, 37, "248", P6);
        Order(37, P6, "248", Attack, "home");
    },preserved)


    
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

    PB = CSMakePolygon(6,80,0,37,1)
    CSPlotOrder(PB, P1, 16, "home", nil, 1, 32, PB, nil, Attack, "mainclock", nil, 32, nil, FP, {Always()})

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
        10. synthion : Aurora
        11. ARforest : Relics
        12. cgdct : bang
        13. '' : heart connect
        14. '' : infinite
        15. kakera
    ]]
    

    CAShapeArr = {DHSH1T1}
    GunMaxAmount = 50 -- 최대건작갯수 ( 넘어가면 컴파일오류 )

    -- 데스,변수 설정 // CAPlot 공통변수설정 -- 
    CD = CreateCcodeArr(3*GunMaxAmount)
    GVar = CreateVarArr(4*GunMaxAmount)
    
    GPosX, GPosY, Gun_LoopLimit, Gun_DataIndex, Gun_Shape, Gun_Unit, Gun_Player, ShapeNum = CreateVars(8,FP)
    UV = CreateVarArr(16)
    ShapeVar = CreateVarArr(12)

    ----< CAFunc , CAPlot CFunc >----
    CallCAPlot = InitCFunc(FP)
    CFunc(CallCAPlot)
        CAPlot(DHSH1T1,P2,193,"248",{GPosX,GPosY},1,32,{Gun_Shape,0,0,0,600,Gun_DataIndex},nil,FP,nil
        ,{SetNext("X",0x2001),SetNext(0x2002,"X",1)},nil)
        --[[ PerAction 부분 (현재트리거의 Next트리거를 0x2001로 설정 // 0x2002의 Next트리거를 현재트리거의 다음트리거로 설정)
    작동순서 : 193유닛생성(로케만이동) -> PerActions(다음트리거 0x2001로설정) -> CJump(0x100)~CJumpEnd(0x100) 단락으로 진입후 유닛생성 -> 0x2002
                -> 트리거0x2002의 Next를 CAPlot트리거로 설정 -> 점 다찍힐때까지 위 과정반복 -> CAPlot 종료
        ]]--
    CFuncEnd()
    ----< 유닛생성단락 >----
    CJump(FP,0x100)
    SetLabel(0x2001) -- CAPlot PerActions 도착지점

    NIf(FP,{Memory(0x628438,AtLeast,1)})
        CDoActions(FP,{ -- 유닛생성단락
            TCreateUnit(1,Gun_Unit,"248",Gun_Player);
        })
    NIfEnd()

    SetLabel(0x2002)
    CJumpEnd(FP,0x100)

    -- 여기에 대충 난이도 변수 정의 조건에 따라서 도형바꾸기 어쩌고

    --------------- End of Initialization function of gunplot Enigne -----
    
    --- 대충 여기서부터 함수화 시작하면됨
    DoActions(FP, {
        KillUnit(84, Force2),
        KillUnit(63, Force2),
        KillUnit(68, Force2)
    }, preserved)

    function sethatgun(Player,GIndex,X,Y,GLoc,ShapeNumber,UnitArray)
        ----< 데스, 변수 할당 >----
        CStage = CD[3*GIndex-2] -- 타이머1
        CTimer = CD[3*GIndex-1] -- 타이머2
        COrder = CD[3*GIndex] -- 0xFF ( 오더 & CallCFuncX ) // 0xFF00 ( 건작잠금 ) 
        CDataIndex = GVar[4*GIndex-3] -- 데이터인덱스변수
        CUnitType = GVar[4*GIndex-2] -- 유닛변수
        CShapeType = GVar[4*GIndex-1] -- 도형데이터변수
        CPlayer = GVar[4*GIndex] -- 플레이어변수
        ----< 건작제어 단락 >----

        CIf(FP,{Bring(Player,Exactly,0,131,GLoc),CDeathsX("X",Exactly,0*256,COrder,0xFF00)})
        TriggerX(FP,{},{
            CopyCpAction({DisplayTextX(StrDesignX("Hatchery Destroyed! + 30,000 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 30000,Kills);
            SetNVar(BGMArray[1], SetTo, 1);
            SetNVar(BGMArray[2], SetTo, 1);
            SetNVar(BGMArray[3], SetTo, 1);
            SetNVar(BGMArray[4], SetTo, 1);
            SetNVar(BGMArray[5], SetTo, 1);
            SetNVar(OB_BGMArray, SetTo, 1);}) -- 대충여따가 건작텍스트 브금변수 한번만 실행
            -- Typical IBGM_EPD, Text output phase

            
        DoActionsX(FP,{SetNVar(GPosX,SetTo,X),SetNVar(GPosY,SetTo,Y),SetNVar(CDataIndex,SetTo,999)})
            -- ↑↑건작좌표 상시세팅 // 데이터인덱스999고정 ( 유닛안나오게설정)
        for i = 1, #duskhatTL do -- 젠 타이밍 맞추는곳
        TriggerX(FP,{CDeaths("X",Exactly,i-1,CStage),CDeaths("X",Exactly,0,CTimer)},{
            SetNVar(CUnitType,SetTo,UnitArray[i]); -- unit id
            SetNVar(CShapeType,SetTo,3*ShapeNumber); -- shape index
            SetNVar(CPlayer,SetTo,Player); -- owner
            SetNVar(CDataIndex,SetTo,1); -- 데이터인덱스 초기화
            SetCDeaths("X",SetTo,duskhatTL[i]*SDspeed,CTimer); -- Create unit Timer
            SetCDeaths("X",SetTo,i,CStage); -- Generate counter
            SetCDeathsX("X",SetTo,1,COrder,0xFF); -- Mask to condition for control gunplot
        })
        end
        TriggerX(FP,{CDeaths("X",Exactly,#duskhatTL,CStage),CDeaths("X",Exactly,0,CTimer)},{
            SetCDeaths("X",SetTo,#duskhatTL+1,CStage); -- Total length of array + 1 == End of unit generation. Thus, Set to them means, end of plot. 
            SetCDeathsX("X",SetTo,1*256,COrder,0xFF00); -- 건작잠금, Mask to condition for control gunplot
        })
        CIf(FP,{CDeathsX("X",Exactly,1,COrder,0xFF)},{SetCDeathsX("X",SetTo,0,COrder,0xFF)}) -- CAPlot / 오더

        CMov(FP,Gun_Unit,CUnitType) -- 공통변수에 각 건작변수값 대입 ( UnitID )
        CMov(FP,Gun_Shape,CShapeType) -- 공통변수에 각 건작변수값 대입 ( Shape )
        CMov(FP,Gun_DataIndex,CDataIndex) -- 공통변수에 각 건작변수값 대입 ( DataIndex )
        CMov(FP,Gun_Player,CPlayer) -- 공통변수에 각 건작변수값 대입 ( Player )

        OrderLocSize = 512
            CallCFuncX(FP,CallCAPlot) -- CAPlot 호출
            Simple_SetLocX(FP,"249",GPosX,GPosY,GPosX,GPosY) -- 로케 복사
            Simple_CalcLocX(FP,"249",-OrderLocSize,-OrderLocSize,OrderLocSize,OrderLocSize) -- 로케크기설정
            CDoActions(FP,{TOrder(CUnitType,CPlayer,"249",Attack,"home")})
        CIfEnd()

        DoActionsX(FP,{SetCDeaths("X",Subtract,1,CTimer),SetCDeathsX("X",Subtract,1,COrder,0xFF)})

        CIfEnd()
    end

    sethatgun(P6, 1, 2079, 1391, "duskHat2",1, {37,38,39,40,43,44,54,55,56,65,66,39,40,55})

    Deathvar = CreateCcode()
    TriggerX(FP, {Bring(P6,Exactly,0,131,"duskHat2")}, {AddCD(Deathvar, 1)}, preserved)

    CAPlotOrder(CS_SortA(CS_Rotate(baseCircle, 45),0), P6, 84, "duskHat2", nil, 1, 32, {1,0,0,0,2,0}, nil,baseCircle, Attack, "home", nil, {1,0}, nil, {0,32}, FP, {CDeaths(FP, AtLeast, duskhatTLeft[1] * SDspeed, Deathvar)})

    CAPlotOrder(CS_SortA(baseStar,0), P6, 84, "duskHat2", nil, 1, 32, {1,0,0,0,2,0}, nil,basestar, Attack, "home", nil, {1,0}, nil, {0,32}, FP, {CDeaths(FP, AtLeast, duskhatTLeft[2] * SDspeed, Deathvar)})


    CAPlotOrder(CS_SortA(CS_Rotate(baseCircle, -45),0), P6, 84, "duskHat2", nil, 1, 32, {1,0,0,0,2,0}, nil,baseCircle, Attack, "home", nil, {1,0}, nil, {0,32}, FP, {CDeaths(FP, AtLeast, duskhatTLeft[3] * SDspeed, Deathvar)})

    CSPlot(DHSH1T1, P6, 63, "duskHat2", nil, 1, 32, FP, {CDeaths(FP, AtLeast, duskhatTLeft[4] * SDspeed, Deathvar)})
    CSPlot(DHSH1T1, P6, 68, "duskHat2", nil, 1, 32, FP, {CDeaths(FP, AtLeast, 15.09 * SDspeed, Deathvar)})
    CSPlot(DHSH1T1, P6, 63, "duskHat2", nil, 1, 32, FP, {CDeaths(FP, AtLeast, 15.65 * SDspeed, Deathvar)})
    CSPlot(DHSH1T1, P6, 68, "duskHat2", nil, 1, 32, FP, {CDeaths(FP, AtLeast, 15.94 * SDspeed, Deathvar)})

    CAPlotOrder(CS_SortA(baseStar,1), P6, 84, "duskHat2", nil, 1, 32, {1,0,0,0,2,0}, nil,basestar, Attack, "home", nil, {1,0}, nil, {0,32}, FP, {CDeaths(FP, AtLeast, duskhatTLeft[5] * SDspeed, Deathvar)})

    CAPlotOrder(CS_SortA(CS_Rotate(baseCircle, 45),0), P6, 84, "duskHat2", nil, 1, 32, {1,0,0,0,2,0}, nil,baseCircle, Attack, "home", nil, {1,0}, nil, {0,32}, FP, {CDeaths(FP, AtLeast, duskhatTLeft[6] * SDspeed, Deathvar)})

    CAPlotOrder(CS_SortA(Heart,1), P6, 84, "duskHat2", nil, 1, 32, {1,0,0,0,2,0}, nil,baseCircle, Attack, "home", nil, {1,0}, nil, {0,32}, FP, {CDeaths(FP, AtLeast, duskhatTLeft[7] * SDspeed, Deathvar)})

    



end