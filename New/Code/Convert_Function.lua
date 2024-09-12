function Convert_Function()    
    function CSPlotToCAPlot()
        CAPlotJump = def_sIndex()
        CJump(FP, CAPlotJump)
        local Z = {}
        local c = 0
        for j,k in pairs(CSPlotShapeArr) do
            Z[k[2]] = k[1]
            c=c+1
        end
        local Y = {}
        local c = 0
        for j,k in pairs(CSPlotOShapeArr) do
            Y[k[2]] = k[1]
            c=c+1
        end

        SetCall2(FP, Call_CSPlotToCAPlot)
        CA = CAPlotOrderForward()
        --CCX,CCY= CreateVars(2, FP)
        --DCCX,DCCY = CreateVars(2, FP)
        --CCA = CreateVarArr(11, FP)
        --CALocation = CreateVar(FP)
        --CAOrderLocation = CreateVar(FP)
        --COrder = CreateVar(FP)
        --CLSize = CreateVar(FP)

            CIfX(FP, {
            CVar(FP, CCX[2], Exactly, 0xFFFFFFFF),
            CVar(FP, CCY[2], Exactly, 0xFFFFFFFF)
        })
        TGetLocCenter(CALocation,CCX,CCY)
        CIfXEnd()
        CIfX(FP, {
            CVar(FP, DCCX[2], Exactly, 0xFFFFFFFF),
            CVar(FP, DCCY[2], Exactly, 0xFFFFFFFF)
        })
        TGetLocCenter(CAOrderLocation,DCCX,DCCY)
        CIfXEnd()
        function CAFunc1()
            local CA = CAPlotDataArr
            Simple_SetLocX(FP, 250, CCX, CCY, CCX, CCY)
            Simple_SetLoc2X(FP, 250, V(CA[8]), V(CA[9]), V(CA[8]), V(CA[9]))
            Simple_SetLoc2X(FP, 250, _Neg(CLSize), _Neg(CLSize), CLSize, CLSize)
            CDoActions(FP, {TCreateUnit(CCA[7], CCA[8], 251, CCA[9])})
        end
        function CBFunc1()
            local CA = CAPlotDataArr
            Simple_SetLocX(FP, 251, DCCX, DCCY, DCCX, DCCY)
            Simple_SetLoc2X(FP, 251, V(CA[8]), V(CA[9]), V(CA[8]), V(CA[9]))
            Simple_SetLoc2X(FP, 251, _Neg(CLSize), _Neg(CLSize), CLSize, CLSize)
            CTrigger(FP, {CVar(FP, COrder[2], Exactly, Move)}, {TOrder(CCA[8], CCA[9], 251, Move, 252)}, {preserved})
            CTrigger(FP, {CVar(FP, COrder[2], Exactly, Patrol)}, {TOrder(CCA[8], CCA[9], 251, Patrol, 252)}, {preserved})
            CTrigger(FP, {CVar(FP, COrder[2], Exactly, Attack)}, {TOrder(CCA[8], CCA[9], 251, Attack, 252)}, {preserved})
        end
        CAPlotOrder(Z, FP, 184, 249, {0,0}, 1, 32, {CCA[1],0,0,0,0,1}, "CAFunc1", Y, Attack, 249, {0,0}, {CCA[10],1}, "CBFunc1", {1,1}, FP, {}, {}, {})
        CMov(FP, 0x6509B0, CRecoverCP)
        SetCallEnd2()
        CJumpEnd(FP, CAPlotJump)
        
    end

    function CallTriggerFPX(Player,Index,Condition,AddonTrigger,Flags) -- CtrigAsm 5.1
        local Y
        if Flags == nil then Y = {} elseif Flags == 1 then Y = {preserved} end
        local X = {
            SetCtrigX(nil,"X",0x4,0,SetTo,FP,Index,0x0,0,0);
            SetCtrigX(FP,Index+1,0x4,0,SetTo,nil,"X",0x0,0,1);
        }
        table.insert(X,SetCtrigX(FP,Index+1,0x158,0,SetTo,"X","X",0x4,1,0))
        table.insert(X,SetCtrigX(FP,Index+1,0x15C,0,SetTo,"X","X",0,0,1))
        table.insert(X,SetCtrig1X(FP,Index+1,0x164,0,SetTo,0x0,0x2))
        TriggerX(Player,Condition,{AddonTrigger,X},Y)
    end

    function CSPlotOrder(Shape,Owner,UnitId,Location,CenterXY,PerUnit,PlotSize,OrderShape,Direction,OrderType,OrderLocation,DestXY,SizeofLoc,PerAction,PlayerID,Condition,Action,Preserve)
        --    CA : (=CAPlotDataArr) : 1st CAPlot전용내부변수총14개
        --    CB : (=CAPlotCreateArr) : 2nd CAPlot전용내부변수총10개
        --    PlayerID: (=CAPlotPlayerID) : CAPlot전용트리거플레이어
        --    CA[1] = 그릴도형선택(k 입력시k번Shape 데이터로초기화)
        --     CA[2] = 남은대기시간(Tick 단위/ 0일때유닛소환)
        --     CA[3] = 소환후대기시간증가량(Tick 단위/ k입력시1회루프후대기시간k추가)
        --     CA[4] = 루프카운터(트리거순환당루프수를카운트함)
        --     CA[5] = 루프리미트(트리거순환당소환할유닛수/ k입력시CA[4] : 0~k-1까지루프함)
        --     CA[6] = 데이터인덱스(k입력시Shape[k+1]의데이터를출력함)
        --     CA[7] = 임시변수: ConvertArr(CA[6]) -사용금지
        --    CA[8] = 임시변수: Shape[k+1][1] -현재출력할유닛의X좌표
        --    CA[9] = 임시변수: Shape[k+1][2] -현재출력할유닛의Y좌표
        --    CA[10] = 임시변수: 선택된Shape의Max Index (k입력시CA[6] > k면Plot 종료) -k≥1
        --     CA[11] ~ CA[14] : 임시변수로자유롭게사용가능(※ 주의: CA_Rotate3D 사용시값이변경될수있음)
        --     CB[1] = PerUnit (16777216*k 입력시k마리씩소환)
        --     CB[2] = UnitId(k입력시k번유닛을소환)
        --     CB[3] = Owner (k입력시P(k+1)플레이어의유닛을소환)
        --     CB[4] ~ CB[10] : 임시변수로자유롭게사용가능(CA_ 함수에서도사용하니주의)
        --     / CB[10] > 0일경우해당점을Skip함
        --    CC[1] = 목적지도형선택(k 입력시k번OrderShape데이터로초기화)
        --     CC[2] = 목적지데이터인덱스(k입력시OrderShape[k+1]의데이터로명령내림)
        --     CC[3] = 임시변수: ConvertArr(CC[2]) -사용금지
        LSize = 0
        if PlotSize ~= nil then
            LSize = LSize+PlotSize
        end
        if SizeofLoc ~= nil then
            LSize = LSize+SizeofLoc
        end
        local LocId=ConvertLocation(Location)
        local OLocId=ConvertLocation(OrderLocation)
        if type(UnitId) == "string" then
            UnitId = ParseUnit(UnitId) -- 스트링으로 유닛이름 입력가능
        end
        --CAPlotOrderForward() = {CA[1],CA[2],CA[3],CA[4],CA[5],CA[6],CB[1],CB[2],CB[3],CC[1],CC[2]} 
    
        if CSPlotShapeArr[Shape] == nil then
            CSPlotShapeArr[Shape] = {Shape,CSPlotIndexAlloc}
            CSPlotIndexAlloc = CSPlotIndexAlloc + 1
        end
        Shape = CSPlotShapeArr[Shape][2]
    
        if CSPlotOShapeArr[OrderShape] == nil then
            CSPlotOShapeArr[OrderShape] = {OrderShape,CSPlotOrderIndexAlloc}
            CSPlotOrderIndexAlloc = CSPlotOrderIndexAlloc + 1
        end
        OrderShape = CSPlotOShapeArr[OrderShape][2]
        local ACCX = SetCVar(FP, CCX[2], SetTo, 0xFFFFFFFF)
        local ACCY = SetCVar(FP, CCY[2], SetTo, 0xFFFFFFFF)
        if CenterXY ~= nil then
            ACCX = SetCVar(FP, CCX[2], SetTo, CenterXY[1])
            ACCY = SetCVar(FP, CCY[2], SetTo, CenterXY[2])
        end
        local DACCX = SetCVar(FP, DCCX[2], SetTo, 0xFFFFFFFF)
        local DACCY = SetCVar(FP, DCCY[2], SetTo, 0xFFFFFFFF)
        if DestXY ~= nil then
            DACCX = SetCVar(FP, DCCX[2], SetTo, DestXY[1])
            DACCY = SetCVar(FP, DCCY[2], SetTo, DestXY[2])
        end
        local Act = {
            SetCVar(FP, CCA[1][2], SetTo, Shape),
            SetCVar(FP, CCA[10][2], SetTo, OrderShape),
            SetCVar(FP, CCA[9][2], SetTo, Owner),
            SetCVar(FP, CCA[8][2], SetTo, UnitId),
            SetCVar(FP, CCA[7][2], SetTo, PerUnit*16777216),
            SetCVar(FP, CALocation[2], SetTo, LocId + 1),
            SetCVar(FP, CAOrderLocation[2], SetTo, OLocId + 1),
            SetCVar(FP, CLSize[2], SetTo, LSize),
            SetCVar(FP, COrder[2], SetTo, OrderType),
            SetCVar(FP, CRecoverCP[2], SetTo,PlayerID),
            ACCX,
            ACCY,
            DACCX,
            DACCY,
    
    
        }
        CallTriggerFPX(PlayerID, Call_CSPlotToCAPlot, Condition, Act, Preserve)
    end

    


end
