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