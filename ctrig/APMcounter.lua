function APMcounter()

    for i = 0, 3 do
        TriggerX(i, {Deaths(i, AtLeast, 1, 140),Deaths(i, Exactly, 0, 209)}, {
            DisplayText("\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08! ! ! ＡＬＥＲＴ ! ! ! \x04 ● ● ●\n\x14\n\x14\n", 4),
            DisplayText("\x13\x04Macro Warn 1 Stack", 4),
            DisplayText("\x13\x04Once again, You will be Eliminate from the Game.", 4),
            DisplayText("\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08! ! ! ＡＬＥＲＴ ! ! ! \x04 ● ● ●\n\x14\n\x14\n", 4),
            SetDeaths(i, SetTo, 340, 187),
            SetDeaths(i, SetTo, 1, 209)
        })

        Trigger2X(i, {Deaths(i, AtLeast, 1, 140),Deaths(i, Exactly, 1, 209),Deaths(i, Exactly, 0, 187),LocalPlayerID(i)}, {
            DisplayText("\x13\x08MOM BOOM", 4),
            DisplayText("\x13\x08MOM BOOM", 4),
            DisplayText("\x13\x08MOM BOOM", 4),
            DisplayText("\x13\x08MOM BOOM", 4),
            DisplayText("\x13\x08MOM BOOM", 4),
            DisplayText("\x13\x08MOM BOOM", 4),
            DisplayText("\x13\x08MOM BOOM", 4),
            DisplayText("\x13\x08MOM BOOM", 4),
            DisplayText("\x13\x08MOM BOOM", 4),
            DisplayText("\x13\x08MOM BOOM", 4),
            DisplayText("\x13\x08MOM BOOM", 4),
            DisplayText("\x13\x08MOM BOOM", 4),
            DisplayText("\x13\x08MOM BOOM", 4),
            DisplayText("\x13\x08MOM BOOM", 4),
            SetResources(i, SetTo, 0, Ore),
            KillUnit("Men", i),
            RemoveUnit("Buildings", i),
        })
        CIfX(FP,{Deaths(i, AtLeast, 1, 140),Deaths(i, Exactly, 1, 209),Deaths(i, Exactly, 0, 187),LocalPlayerID(i)})
        FastDrop(FP, i)
        CIfXEnd()



        TriggerX(i, {Deaths(i, AtLeast, 1, 140),Deaths(i, Exactly, 1, 209),Deaths(i, Exactly, 0, 187)}, {
            RotatePlayer({DisplayTextX(StrDesignX("누군가가 \x08천인공노할 짓\x04을 하여 \x11드랍\x04되었습니다."), 4)},{Force1, Force5},i)
        })
        
        TriggerX(FP, {Deaths(i, AtLeast, 1, 187)}, {SetDeaths(i, Subtract, 1, 187)},preserved)
    end
    TriggerX(FP, Always(), {
        SetMemory(0x59CC78, SetTo, -1048576),
        SetMemory(0x59CC80, SetTo, 2),
    }, preserved)

    
    
end