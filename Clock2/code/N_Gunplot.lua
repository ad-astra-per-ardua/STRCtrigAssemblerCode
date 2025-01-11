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
    
    NJumpX(FP,0x1,DeathsX(CurrentPlayer,Exactly,135,0,0xFF))
    NJumpX(FP,0x1,DeathsX(CurrentPlayer,Exactly,136,0,0xFF))
    NJumpX(FP,0x1,DeathsX(CurrentPlayer,Exactly,137,0,0xFF))
    NJumpX(FP,0x1,DeathsX(CurrentPlayer,Exactly,138,0,0xFF))
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


    
    TriggerX(FP, {DeathsX(CurrentPlayer,Exactly,135,0,0xFF)}, {
        CreateUnit(10, 53, "248", P6);
        Order(53, P6, "248", Attack, "home");
    },preserved)

    TriggerX(FP, {DeathsX(CurrentPlayer,Exactly,136,0,0xFF)}, {
        CreateUnit(10, 52, "248", P6);
        Order(52, P6, "248", Attack, "home");
    },preserved)
    
    TriggerX(FP, {DeathsX(CurrentPlayer,Exactly,137,0,0xFF)}, {
        CreateUnit(5, 55, "248", P6);
        CreateUnit(5, 56, "248", P6);
        Order(55, P6, "248", Attack, "home");
        Order(56, P6, "248", Attack, "home");
    },preserved)

    TriggerX(FP, {DeathsX(CurrentPlayer,Exactly,138,0,0xFF)}, {
        CreateUnit(5, 45, "248", P6);
        CreateUnit(5, 104, "248", P6);
        Order(45, P6, "248", Attack, "home");
        Order(104, P6, "248", Attack, "home");
    },preserved)

    TriggerX(FP, {DeathsX(CurrentPlayer,Exactly,142,0,0xFF)}, {
        CreateUnit(10, 54, "248", P6);
        Order(54, P6, "248", Attack, "home");
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
    
    SetLoopInfPlot(P6, "duskHat2", 131, 1, {54,53,55,56,77,78,40,41,43,44,45,46,47,48}, duskhatTL)
    SetEffectplot1(P6, "duskHat2", 131, 84, {1,2,3,4,5,6,7,8}, duskhatTLeft)



end