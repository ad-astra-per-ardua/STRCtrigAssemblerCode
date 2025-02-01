function Install_GplotEngine()

    -- CAShapeArr2D = {
    --     {DHSH1T1},
    --     {HEFT1,HEFT2,HEFT3,HEFT4,HEFT5,HEFT6,HEFT7},
    --     {baseCircle2, baseCircle3,Heart,baseStar},
    --     {HEFT1,HEFT2,HEFT3,HEFT4,HEFT5,HEFT6,HEFT7,baseCircle, baseCircle1},
    -- }

    -- cr8Array = {}
    -- cnt = 0
    -- for K, V in pairs(CAShapeArr2D) do
    --     table.insert(cr8Array,cnt)
    --     cnt = #V + cnt
    -- end

    -- CAShapeArr = {} -- -> CAPlot 삽입
    -- for LIMIT, MODE in pairs(CAShapeArr2D) do
    --     for K, V in pairs(MODE) do
    --         table.insert(CAShapeArr,V)
    --     end
    -- end

    -- ModifyshapeArr = CreateArr(#cr8Array,FP)
    -- FshapeArr = {}
    -- for K, V in pairs(cr8Array) do
    --     table.insert(FshapeArr,SetMemX(Arr(ModifyshapeArr,K-1),SetTo,V))
    -- end
    -- DoActionsX(FP,FshapeArr,{}) -- CArray Init

    -- DMMM = CreateVar(FP)
    -- CAdd(FP,DMMM,_Read(Arr(ModifyshapeArr,(i-1))),j) -- get Shape Index (=Loc(i,j))
    


        
    GunMaxAmount = 60 -- 최대건작갯수 ( 넘어가면 컴파일오류 )
    GIndex = 0



    -- 데스,변수 설정 // CAPlot 공통변수설정 -- 
    CD = CreateCcodeArr(3*GunMaxAmount)
    GVar = CreateVarArr(6*GunMaxAmount)
    ReadXY = InitCFunc(FP)
    Para = CFunc(ReadXY)
        -- f_Read(FP,0x58DC60+0x14*TempLocID,RetX,"X",0xFFFFFFFF)
        -- f_Read(FP,0x58DC64+0x14*TempLocID,RetY,"X",0xFFFFFFFF)

    f_Read(FP,_Add(_Mul(Para[1],0x14/4),EPD(0x58DC60)),RetX,"X",0xFFFFFFFF) -- Para[1] = LocIndex
    f_Read(FP,_Add(_Mul(Para[1],0x14/4),EPD(0x58DC64)),RetY,"X",0xFFFFFFFF) -- Para[1] = LocIndex
    CAdd(FP,CalcRetX,RetX,64)
    CAdd(FP,CalcRetY,RetY,64)
CFuncEnd()

function f_ReadLocXY(Loc)
    CIfOnce(FP)
        TempLoc = ConvertLocation(Loc)
        CallCFuncX(FP,ReadXY,{TempLoc})
        CDoActions(FP,{
            TSetNVar(GunPosX,SetTo,CalcRetX);
            TSetNVar(GunPosY,SetTo,CalcRetY);
        })
    CIfEnd()
    
    end
    ----

    ----< CAFunc , CAPlot CFunc >---- SetLoopInfPlot function 
    CAShapeArr = {DHSH1T1}
    CallCAPlot = InitCFunc(FP)
    CFunc(CallCAPlot)
        CAPlot(CAShapeArr,P2,193,"248",{GPosX,GPosY},1,32,{Gun_Shape,0,0,0,600,Gun_DataIndex},nil,FP,nil
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
    ----


     ----< CAFunc , CAPlot CFunc >---- SetEffectplot1
     CAEffectshapeArr = {HEFT1,HEFT2,HEFT3,HEFT4,HEFT5,HEFT6,HEFT7,
     DLSH3SHEft1,DLSH3SHEft2
 }
    CallCAPlot2 = InitCFunc(FP)
    CFunc(CallCAPlot2)
        CAPlot(CAEffectshapeArr,P2,193,"248",{GPosX,GPosY},1,32,{Gun_Shape,0,0,0,5,Gun_DataIndex},nil,FP,nil
        ,{SetNext("X",0x2003),SetNext(0x2004,"X",1)},nil)
        --[[ PerAction 부분 (현재트리거의 Next트리거를 0x2003로 설정 // 0x2004의 Next트리거를 현재트리거의 다음트리거로 설정)
    작동순서 : 193유닛생성(로케만이동) -> PerActions(다음트리거 0x2003로설정) -> CJump(0x200)~CJumpEnd(0x200) 단락으로 진입후 유닛생성 -> 0x2003
                -> 트리거0x2004의 Next를 CAPlot트리거로 설정 -> 점 다찍힐때까지 위 과정반복 -> CAPlot 종료
        ]]--
    CFuncEnd()
    ----< 유닛생성단락 >----
    CJump(FP,0x200)
    SetLabel(0x2003) -- CAPlot PerActions 도착지점

    NIf(FP,{Memory(0x628438,AtLeast,1)})
    CDoActions(FP,{ -- 유닛생성단락
        TCreateUnit(1,Gun_Unit,"248",Gun_Player);
        TOrder(Gun_Unit,Gun_Player,"248",Attack,"home");
    })
    NIfEnd()

    SetLabel(0x2004)
    CJumpEnd(FP,0x200)



    ----< CAFunc , CAPlot CFunc >---- SetLoop2Plot
    CAShapeArr2 = {
        baseCircle2, baseCircle3,Heart,baseStar,duskHat3SF,lairShape1,
        DLSG3SH1G1,DLSH3SH5G2,DLSH3SH5G3,DLSH3SH5G4,
        DuskHive1SH1plt,DuskHive1SH2plt,DuskHive1SH5plt,DuskHive1SH6plt
    }
    CallCAPlot3 = InitCFunc(FP)
    CFunc(CallCAPlot3)
        CAPlot(CAShapeArr2,P2,193,"248",{GPosX,GPosY},1,32,{Gun_Shape,0,0,0,6,Gun_DataIndex},nil,FP,nil
        ,{SetNext("X",0x2005),SetNext(0x2006,"X",1)},nil)
        --[[ PerAction 부분 (현재트리거의 Next트리거를 0x2001로 설정 // 0x2002의 Next트리거를 현재트리거의 다음트리거로 설정)
    작동순서 : 193유닛생성(로케만이동) -> PerActions(다음트리거 0x2001로설정) -> CJump(0x100)~CJumpEnd(0x100) 단락으로 진입후 유닛생성 -> 0x2002
                -> 트리거0x2002의 Next를 CAPlot트리거로 설정 -> 점 다찍힐때까지 위 과정반복 -> CAPlot 종료
        ]]--
    CFuncEnd()
    ----< 유닛생성단락 >----
    CJump(FP,0x300)
    SetLabel(0x2005) -- CAPlot PerActions 도착지점

    NIf(FP,{Memory(0x628438,AtLeast,1)})
        CDoActions(FP,{ -- 유닛생성단락
            TCreateUnit(1,Gun_Unit,"248",Gun_Player);
            TOrder(Gun_Unit,Gun_Player,"248",Attack,"home");
        })
    NIfEnd()

    SetLabel(0x2006)
    CJumpEnd(FP,0x300)




    ----< CAFunc , CAPlot CFunc >---- SetEffectplotInf
    CAEffectshapeArr2 = {
        HEFT1,HEFT2,HEFT3,HEFT4,HEFT5,HEFT6,HEFT7,baseCircle, baseCircle1
    }
    CallCAPlot4 = InitCFunc(FP)
    CFunc(CallCAPlot4)
        CAPlot(CAEffectshapeArr2,P2,193,"248",{GPosX,GPosY},1,32,{Gun_Shape,0,0,0,998,Gun_DataIndex},nil,FP,nil
        ,{SetNext("X",0x2007),SetNext(0x2008,"X",1)},nil)
        --[[ PerAction 부분 (현재트리거의 Next트리거를 0x2001로 설정 // 0x2002의 Next트리거를 현재트리거의 다음트리거로 설정)
    작동순서 : 193유닛생성(로케만이동) -> PerActions(다음트리거 0x2001로설정) -> CJump(0x100)~CJumpEnd(0x100) 단락으로 진입후 유닛생성 -> 0x2002
                -> 트리거0x2002의 Next를 CAPlot트리거로 설정 -> 점 다찍힐때까지 위 과정반복 -> CAPlot 종료
        ]]--
    CFuncEnd()
    ----< 유닛생성단락 >----
    CJump(FP,0x400)
    SetLabel(0x2007) -- CAPlot PerActions 도착지점

    NIf(FP,{Memory(0x628438,AtLeast,1)})
        CDoActions(FP,{ -- 유닛생성단락
            TCreateUnit(1,Gun_Unit,"248",Gun_Player);
        })
    NIfEnd()

    SetLabel(0x2008)
    CJumpEnd(FP,0x400)



    -- 여기에 대충 난이도 변수 정의 조건에 따라서 도형바꾸기 어쩌고

    --------------- End of Initialization function of gunplot Enigne -----
    
    --- 대충 여기서부터 함수화 시작하면됨
    DoActions(FP, {
        KillUnit(84, Force2),
        KillUnit(63, Force2),
        KillUnit(68, Force2)
    }, preserved)


    function SetLoopInfPlot(Player,GLoc,BuildingIndex,ShapeNumber,UnitArray,TimeLine)
        ----< 데스, 변수 할당 >----
        
        GIndex = GIndex + 1
        
        CStage = CD[3*GIndex-2] -- 타이머1
        CTimer = CD[3*GIndex-1] -- 타이머2
        COrder = CD[3*GIndex] -- 0xFF ( 오더 & CallCFuncX ) // 0xFF00 ( 건작잠금 ) 
        CDataIndex = GVar[6*GIndex-5] -- 데이터인덱스변수
        CUnitType = GVar[6*GIndex-4] -- 유닛변수
        CShapeType = GVar[6*GIndex-3] -- 도형데이터변수
        CPlayer = GVar[6*GIndex-2] -- 플레이어변수
        GunPosX = GVar[6*GIndex-1]
        GunPosY = GVar[6*GIndex]

        
        ----< 건작제어 단락 >----

        CIf(FP,{Bring(Player,Exactly,0,BuildingIndex,GLoc),CDeathsX("X",Exactly,0*256,COrder,0xFF00)})

            -- Auto calc location X pos and Y pos
            f_ReadLocXY(GLoc)
            CDoActions(FP,{TSetNVar(GPosX,SetTo,GunPosX),TSetNVar(GPosY,SetTo,GunPosY),SetNVar(CDataIndex,SetTo,999)})

        for i = 1, #TimeLine do -- 젠 타이밍 맞추는곳
            if i == 1 then
                TriggerX(FP,{CDeaths("X",Exactly,i-1,CStage),CDeaths("X",Exactly,0,CTimer)},{
                    SetNVar(CUnitType,SetTo,UnitArray[i]); -- unit id
                    SetCDeaths("X",SetTo,TimeLine[i]*SDspeed,CTimer); -- Create unit Timer
                    SetCDeaths("X",SetTo,1,CStage); -- Generate counter
                })
                else

            TriggerX(FP,{CDeaths("X",Exactly,1,CStage),CDeaths("X",Exactly,0,CTimer)},{
                SetNVar(CUnitType,SetTo,UnitArray[1]); -- unit id
                SetNVar(CShapeType,SetTo,ShapeNumber[1]); -- shape index
                SetNVar(CPlayer,SetTo,Player); -- owner
                SetNVar(CDataIndex,SetTo,1); -- 데이터인덱스 초기화
                SetCDeaths("X",SetTo,(TimeLine[1])*SDspeed,CTimer); -- Create unit Timer
                SetCDeaths("X",SetTo,1,CStage); -- Generate counter
                SetCDeathsX("X",SetTo,1,COrder,0xFF); -- Mask to condition for control gunplot
            })

            TriggerX(FP,{CDeaths("X",Exactly,i-1,CStage),CDeaths("X",Exactly,0,CTimer)},{
                SetNVar(CUnitType,SetTo,UnitArray[i]); -- unit id
                SetNVar(CShapeType,SetTo,ShapeNumber[i]); -- shape index
                SetNVar(CPlayer,SetTo,Player); -- owner
                SetNVar(CDataIndex,SetTo,1); -- 데이터인덱스 초기화
                SetCDeaths("X",SetTo,(TimeLine[i] - TimeLine[i-1])*SDspeed,CTimer); -- Create unit Timer
                SetCDeaths("X",SetTo,i,CStage); -- Generate counter
                SetCDeathsX("X",SetTo,1,COrder,0xFF); -- Mask to condition for control gunplot
            })
            end
        end


        TriggerX(FP,{CDeaths("X",Exactly,#TimeLine,CStage),CDeaths("X",Exactly,0,CTimer)},{
            SetCDeaths("X",SetTo,#TimeLine+1,CStage); -- Total length of array + 1 == End of unit generation. Thus, Set to them means, end of plot. 
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


    function SetLoop2Plot(Player,GLoc,BuildingIndex,ShapeNumber,UnitArray,TimeLine)
        ----< 데스, 변수 할당 >----
        
        GIndex = GIndex + 1
        
        CStage = CD[3*GIndex-2] -- 타이머1
        CTimer = CD[3*GIndex-1] -- 타이머2
        COrder = CD[3*GIndex] -- 0xFF ( 오더 & CallCFuncX ) // 0xFF00 ( 건작잠금 ) 
        CDataIndex = GVar[6*GIndex-5] -- 데이터인덱스변수
        CUnitType = GVar[6*GIndex-4] -- 유닛변수
        CShapeType = GVar[6*GIndex-3] -- 도형데이터변수
        CPlayer = GVar[6*GIndex-2] -- 플레이어변수
        GunPosX = GVar[6*GIndex-1]
        GunPosY = GVar[6*GIndex]
        
        ----< 건작제어 단락 >----

        CIf(FP,{Bring(Player,Exactly,0,BuildingIndex,GLoc),CDeathsX("X",Exactly,0*256,COrder,0xFF00)})

            -- Auto calc location X pos and Y pos
            f_ReadLocXY(GLoc)
            CDoActions(FP,{TSetNVar(GPosX,SetTo,GunPosX),TSetNVar(GPosY,SetTo,GunPosY)})

        for i = 1, #TimeLine do -- 젠 타이밍 맞추는곳
            if i == 1 then
                TriggerX(FP,{CDeaths("X",Exactly,i-1,CStage),CDeaths("X",Exactly,0,CTimer)},{
                    SetNVar(CUnitType,SetTo,UnitArray[i]); -- unit id
                    SetCDeaths("X",SetTo,TimeLine[i]*SDspeed,CTimer); -- Create unit Timer
                    SetNVar(CDataIndex,SetTo,999); -- 데이터인덱스 초기화
                    SetCDeaths("X",SetTo,1,CStage); -- Generate counter
                })

                TriggerX(FP,{CDeaths("X",Exactly,1,CStage),CDeaths("X",Exactly,0,CTimer)},{
                    SetNVar(CUnitType,SetTo,UnitArray[1]); -- unit id
                    SetNVar(CShapeType,SetTo,ShapeNumber[1]); -- shape index
                    SetNVar(CPlayer,SetTo,Player); -- owner
                    SetNVar(CDataIndex,SetTo,0); -- 데이터인덱스 초기화
                    SetCDeaths("X",SetTo,(TimeLine[1])*SDspeed,CTimer); -- Create unit Timer
                    SetCDeaths("X",SetTo,1,CStage); -- Generate counter
                    SetCDeathsX("X",SetTo,1,COrder,0xFF); -- Mask to condition for control gunplot
                })
                else

            

            TriggerX(FP,{CDeaths("X",Exactly,i-1,CStage),CDeaths("X",Exactly,0,CTimer)},{
                SetNVar(CUnitType,SetTo,UnitArray[i]); -- unit id
                SetNVar(CShapeType,SetTo,ShapeNumber[i]); -- shape index
                SetNVar(CPlayer,SetTo,Player); -- owner
                SetNVar(CDataIndex,SetTo,0); -- 데이터인덱스 초기화
                SetCDeaths("X",SetTo,(TimeLine[i] - TimeLine[i-1])*SDspeed,CTimer); -- Create unit Timer
                SetCDeaths("X",SetTo,i,CStage); -- Generate counter
                SetCDeathsX("X",SetTo,1,COrder,0xFF); -- Mask to condition for control gunplot
            })
            end
        end


        TriggerX(FP,{CDeaths("X",Exactly,#TimeLine,CStage),CDeaths("X",Exactly,0,CTimer)},{
            SetCDeaths("X",SetTo,#TimeLine+1,CStage); -- Total length of array + 1 == End of unit generation. Thus, Set to them means, end of plot. 
            SetCDeathsX("X",SetTo,1*256,COrder,0xFF00); -- 건작잠금, Mask to condition for control gunplot
        })
        
        
        
        CMov(FP,Gun_Unit,CUnitType) -- 공통변수에 각 건작변수값 대입 ( UnitID )
        CMov(FP,Gun_Shape,CShapeType) -- 공통변수에 각 건작변수값 대입 ( Shape )
        CMov(FP,Gun_DataIndex,CDataIndex) -- 공통변수에 각 건작변수값 대입 ( DataIndex )
        CMov(FP,Gun_Player,CPlayer) -- 공통변수에 각 건작변수값 대입 ( Player )

        OrderLocSize = 512
            CallCFuncX(FP,CallCAPlot3) -- CAPlot 호출
            Simple_SetLocX(FP,"249",GPosX,GPosY,GPosX,GPosY) -- 로케 복사
            Simple_CalcLocX(FP,"249",-OrderLocSize,-OrderLocSize,OrderLocSize,OrderLocSize) -- 로케크기설정
            -- CDoActions(FP,{TOrder(CUnitType,CPlayer,"249",Attack,"home")})
        
        TriggerX(FP,{CDeaths("X",AtLeast,1,CTimer)},{SetNVar(CDataIndex,Add,6)},{Preserved})
        DoActionsX(FP,{SetCDeaths("X",Subtract,1,CTimer)})

        CIfEnd()
    end

    function SetEffectplot1(Player,GLoc,BuildingIndex,EffectUnit,ShapeNumber,Timeline)

        
        GIndex = GIndex + 1
        
        CStage = CD[3*GIndex-2]
        CTimer = CD[3*GIndex-1]
        COrder = CD[3*GIndex] 
        CDataIndex = GVar[6*GIndex-5] 
        CUnitType = GVar[6*GIndex-4] 
        CShapeType = GVar[6*GIndex-3] 
        CPlayer = GVar[6*GIndex-2] 
        GunPosX = GVar[6*GIndex-1]
        GunPosY = GVar[6*GIndex]
        
        ----< 건작제어 단락 >----

        CIf(FP,{Bring(Player,Exactly,0,BuildingIndex,GLoc),CDeathsX("X",Exactly,0*256,COrder,0xFF00)})
            -- Auto calc location X pos and Y pos
            f_ReadLocXY(GLoc)
            CDoActions(FP,{TSetNVar(GPosX,SetTo,GunPosX),TSetNVar(GPosY,SetTo,GunPosY)})

        for i = 1, #Timeline do -- 젠 타이밍 맞추는곳
            if i == 1 then
                TriggerX(FP,{CDeaths("X",Exactly,i-1,CStage),CDeaths("X",Exactly,0,CTimer)},{
                    SetNVar(CUnitType,SetTo,EffectUnit); -- unit id
                    SetNVar(CShapeType,SetTo,ShapeNumber[i]);
                    SetNVar(CDataIndex,SetTo,999);
                    SetCDeaths("X",SetTo,Timeline[i]*SDspeed,CTimer); -- Create unit Timer
                    SetCDeaths("X",SetTo,1,CStage); -- Generate counter
                })
                
                
                else

                TriggerX(FP,{CDeaths("X",Exactly,1,CStage),CDeaths("X",Exactly,0,CTimer)},{
                    SetNVar(CUnitType,SetTo,EffectUnit); 
                    SetNVar(CShapeType,SetTo,ShapeNumber[1]);
                    SetNVar(CPlayer,SetTo,Player); 
                    SetNVar(CDataIndex,SetTo,0); 
                    SetCDeaths("X",SetTo,(Timeline[1])*SDspeed,CTimer);
                    SetCDeaths("X",SetTo,1,CStage); 
                    SetCDeathsX("X",SetTo,1,COrder,0xFF); -- Mask to condition for control gunplot
                })

            TriggerX(FP,{CDeaths("X",Exactly,i-1,CStage),CDeaths("X",Exactly,0,CTimer)},{
                SetNVar(CUnitType,SetTo,EffectUnit); 
                SetNVar(CShapeType,SetTo,ShapeNumber[i]); 
                SetNVar(CPlayer,SetTo,Player); 
                SetNVar(CDataIndex,SetTo,0); 
                SetCDeaths("X",SetTo,(Timeline[i] - Timeline[i-1])*SDspeed,CTimer); 
                SetCDeaths("X",SetTo,i,CStage); 
                SetCDeathsX("X",SetTo,1,COrder,0xFF); -- Mask to condition for control gunplot
            })
            end
        end


        TriggerX(FP,{CDeaths("X",Exactly,#Timeline,CStage),CDeaths("X",Exactly,0,CTimer)},{
            SetCDeaths("X",SetTo,#Timeline+1,CStage); -- Total length of array + 1 == End of unit generation. Thus, Set to them means, end of plot. 
            SetCDeathsX("X",SetTo,1*256,COrder,0xFF00); -- 건작잠금, Mask to condition for control gunplot
        })
        
        

        CMov(FP,Gun_Unit,CUnitType) 
        CMov(FP,Gun_Shape,CShapeType) 
        CMov(FP,Gun_DataIndex,CDataIndex) 
        CMov(FP,Gun_Player,CPlayer) 

        OrderLocSize = 512
            CallCFuncX(FP,CallCAPlot2) 
            Simple_SetLocX(FP,"249",GPosX,GPosY,GPosX,GPosY) 
            Simple_CalcLocX(FP,"249",-OrderLocSize,-OrderLocSize,OrderLocSize,OrderLocSize) 
            -- CDoActions(FP,{TOrder(CUnitType,CPlayer,"249",Attack,"home")})
            TriggerX(FP,{CDeaths("X",AtLeast,1,CTimer)},{SetNVar(CDataIndex,Add,5)},{Preserved})
            DoActionsX(FP,{SetCDeaths("X",Subtract,1,CTimer)})

        CIfEnd()
    end

    function SetEffectplotInf(Player,GLoc,BuildingIndex,EffectUnit,ShapeNumber,Timeline)
        ----< 데스, 변수 할당 >----
        
        GIndex = GIndex + 1
        
        CStage = CD[3*GIndex-2] -- 타이머1
        CTimer = CD[3*GIndex-1] -- 타이머2
        COrder = CD[3*GIndex] -- 0xFF ( 오더 & CallCFuncX ) // 0xFF00 ( 건작잠금 ) 
        CDataIndex = GVar[6*GIndex-5] -- 데이터인덱스변수
        CUnitType = GVar[6*GIndex-4] -- 유닛변수
        CShapeType = GVar[6*GIndex-3] -- 도형데이터변수
        CPlayer = GVar[6*GIndex-2] -- 플레이어변수
        GunPosX = GVar[6*GIndex-1]
        GunPosY = GVar[6*GIndex]
        
        ----< 건작제어 단락 >----

        CIf(FP,{Bring(Player,Exactly,0,BuildingIndex,GLoc),CDeathsX("X",Exactly,0*256,COrder,0xFF00)})
            -- Auto calc location X pos and Y pos
            f_ReadLocXY(GLoc)
            CDoActions(FP,{TSetNVar(GPosX,SetTo,GunPosX),TSetNVar(GPosY,SetTo,GunPosY),SetNVar(CDataIndex,SetTo,999)})

        for i = 1, #Timeline do -- 젠 타이밍 맞추는곳
            if i == 1 then
                TriggerX(FP,{CDeaths("X",Exactly,i-1,CStage),CDeaths("X",Exactly,0,CTimer)},{
                    SetNVar(CUnitType,SetTo,EffectUnit); -- unit id
                    SetCDeaths("X",SetTo,Timeline[i]*SDspeed,CTimer); -- Create unit Timer
                    SetCDeaths("X",SetTo,1,CStage); -- Generate counter
                })
                else

            TriggerX(FP,{CDeaths("X",Exactly,1,CStage),CDeaths("X",Exactly,0,CTimer)},{
                SetNVar(CUnitType,SetTo,EffectUnit); -- unit id
                SetNVar(CShapeType,SetTo,ShapeNumber[1]); -- shape index
                SetNVar(CPlayer,SetTo,Player); -- owner
                SetNVar(CDataIndex,SetTo,1); -- 데이터인덱스 초기화
                SetCDeaths("X",SetTo,(Timeline[1])*SDspeed,CTimer); -- Create unit Timer
                SetCDeaths("X",SetTo,1,CStage); -- Generate counter
                SetCDeathsX("X",SetTo,1,COrder,0xFF); -- Mask to condition for control gunplot
            })

            TriggerX(FP,{CDeaths("X",Exactly,i-1,CStage),CDeaths("X",Exactly,0,CTimer)},{
                SetNVar(CUnitType,SetTo,EffectUnit); -- unit id
                SetNVar(CShapeType,SetTo,ShapeNumber[i]); -- shape index
                SetNVar(CPlayer,SetTo,Player); -- owner
                SetNVar(CDataIndex,SetTo,1); -- 데이터인덱스 초기화
                SetCDeaths("X",SetTo,(Timeline[i] - Timeline[i-1])*SDspeed,CTimer); -- Create unit Timer
                SetCDeaths("X",SetTo,i,CStage); -- Generate counter
                SetCDeathsX("X",SetTo,1,COrder,0xFF); -- Mask to condition for control gunplot
            })
            end
        end


        TriggerX(FP,{CDeaths("X",Exactly,#Timeline,CStage),CDeaths("X",Exactly,0,CTimer)},{
            SetCDeaths("X",SetTo,#Timeline+1,CStage); -- Total length of array + 1 == End of unit generation. Thus, Set to them means, end of plot. 
            SetCDeathsX("X",SetTo,1*256,COrder,0xFF00); -- 건작잠금, Mask to condition for control gunplot
        })
        TriggerX(FP,{CDeaths("X",AtLeast,1,CTimer)},{SetNVar(CDataIndex,Add,2)},{Preserved})
        

        CMov(FP,Gun_Unit,CUnitType) -- 공통변수에 각 건작변수값 대입 ( UnitID )
        CMov(FP,Gun_Shape,CShapeType) -- 공통변수에 각 건작변수값 대입 ( Shape )
        CMov(FP,Gun_DataIndex,CDataIndex) -- 공통변수에 각 건작변수값 대입 ( DataIndex )
        CMov(FP,Gun_Player,CPlayer) -- 공통변수에 각 건작변수값 대입 ( Player )

        OrderLocSize = 512
            CallCFuncX(FP,CallCAPlot4) -- CAPlot 호출
            Simple_SetLocX(FP,"249",GPosX,GPosY,GPosX,GPosY) -- 로케 복사
            Simple_CalcLocX(FP,"249",-OrderLocSize,-OrderLocSize,OrderLocSize,OrderLocSize) -- 로케크기설정
            CDoActions(FP,{TOrder(CUnitType,CPlayer,"249",Attack,"home")})

            DoActionsX(FP,{SetCDeaths("X",Subtract,1,CTimer)})

        CIfEnd()
    end

end