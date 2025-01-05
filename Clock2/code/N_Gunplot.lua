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
    CSPlotOrder(PB, P1, 16, "home", nil, 1, 32, PB, nil, Attack, "home", nil, 32, nil, FP, {Always()})

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
    
    GunMaxAmount = 43 -- 최대건작갯수 ( 넘어가면 컴파일오류 )

    -- 데스,변수 설정 // CAPlot 공통변수설정 -- 
    CD = CreateCcodeArr(3*GunMaxAmount)
    GVar = CreateVarArr(4*GunMaxAmount)
    
    GPosX, GPosY, Gun_LoopLimit, Gun_DataIndex, Gun_Shape, Gun_Unit, Gun_Player, ShapeNum = CreateVars(8,FP)
    UV = CreateVarArr(16)
    ShapeVar = CreateVarArr(12)

    ----< CAFunc , CAPlot CFunc >----
    CallCAPlot = InitCFunc(FP)
    CFunc(CallCAPlot)
        CAPlot(CAShapeArr,P2,193,"CLoc0",{GPosX,GPosY},1,32,{Gun_Shape,0,0,0,600,Gun_DataIndex},nil,FP,nil
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
            TCreateUnit(1,Gun_Unit,"CLoc0",Gun_Player);
        })
    NIfEnd()

    SetLabel(0x2002)
    CJumpEnd(FP,0x100)




    CIf(FP,{Bring(Player,Exactly,0,BuildingID,GLoc)})
    TriggerX(FP,{},{
        CopyCpAction({DisplayTextX(LText,4)},{Force1,Force5},FP);
        SetScore(Force1,Add,20000,Kills);
        SetNVar(BGMVar[1],SetTo,1);
        SetNVar(OB_BGMVar,SetTo,1);}) -- 대충여따가 건작텍스트 브금변수 한번만 실행
        -- Typical IBGM_EPD, Text output phase

        
    DoActionsX(FP,{SetNVar(GPosX,SetTo,X),SetNVar(GPosY,SetTo,Y),SetNVar(CDataIndex,SetTo,999)})
        -- ↑↑건작좌표 상시세팅 // 데이터인덱스999고정 ( 유닛안나오게설정)
    for i = 1, #BGM_SplitTL do -- 젠 타이밍 맞추는곳
    TriggerX(FP,{CDeaths("X",Exactly,i-1,CStage),CDeaths("X",Exactly,0,CTimer)},{
        SetNVar(CUnitType,SetTo,UnitA); -- unit id
        SetNVar(CShapeType,SetTo,3*ShapeNumber); -- shape index
        SetNVar(CPlayer,SetTo,Player); -- owner
        SetNVar(CDataIndex,SetTo,1); -- 데이터인덱스 초기화
        SetCDeaths("X",SetTo,BGM_SplitTL[i]*SDspeed,CTimer); -- Create unit Timer
        SetCDeaths("X",SetTo,i,CStage); -- Generate counter
        SetCDeathsX("X",SetTo,1,COrder,0xFF); -- Mask to condition for control gunplot
    })
    end
    TriggerX(FP,{CDeaths("X",Exactly,#BGM_SplitTL,CStage),CDeaths("X",Exactly,0,CTimer)},{
        SetCDeaths("X",SetTo,#BGM_SplitTL+1,CStage); -- Total length of array + 1 == End of unit generation. Thus, Set to them means, end of plot. 
        SetCDeathsX("X",SetTo,1*256,COrder,0xFF00); -- 건작잠금, Mask to condition for control gunplot
    })
    CIf(FP,{CDeathsX("X",Exactly,1,COrder,0xFF)},{SetCDeathsX("X",SetTo,0,COrder,0xFF)}) -- CAPlot / 오더

    CMov(FP,Gun_Unit,CUnitType) -- 공통변수에 각 건작변수값 대입 ( UnitID )
    CMov(FP,Gun_Shape,CShapeType) -- 공통변수에 각 건작변수값 대입 ( Shape )
    CMov(FP,Gun_DataIndex,CDataIndex) -- 공통변수에 각 건작변수값 대입 ( DataIndex )
    CMov(FP,Gun_Player,CPlayer) -- 공통변수에 각 건작변수값 대입 ( Player )

    OrderLocSize = 512
        CallCFuncX(FP,CallCAPlot) -- CAPlot 호출
        Simple_SetLocX(FP,"CLoc1",GPosX,GPosY,GPosX,GPosY) -- 로케 복사
        Simple_CalcLocX(FP,"CLoc1",-OrderLocSize,-OrderLocSize,OrderLocSize,OrderLocSize) -- 로케크기설정
        CDoActions(FP,{TOrder(CUnitType,CPlayer,"CLoc1",Attack,"HZ")})
    CIfEnd()

    DoActionsX(FP,{SetCDeaths("X",Subtract,1,CTimer),SetCDeathsX("X",Subtract,1,COrder,0xFF)})

    CIfEnd()

end