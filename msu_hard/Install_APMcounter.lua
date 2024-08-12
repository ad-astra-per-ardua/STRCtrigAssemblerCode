function Install_APMcounter()

    for i = 0, 3 do
        Trigger2X(i, {Deaths(i, AtLeast, 1, 140),Deaths(i, Exactly, 0, 209),Deaths(i, Exactly, 0, 187),LocalPlayerID(i)}, {
            DisplayText("MOM BOOM", 4),
            DisplayText("MOM BOOM", 4),
            DisplayText("MOM BOOM", 4),
            DisplayText("MOM BOOM", 4),
            DisplayText("MOM BOOM", 4),
            DisplayText("MOM BOOM", 4),
            DisplayText("MOM BOOM", 4),
            DisplayText("MOM BOOM", 4),
            DisplayText("MOM BOOM", 4),
            DisplayText("MOM BOOM", 4),
            DisplayText("MOM BOOM", 4),
            DisplayText("MOM BOOM", 4),
            DisplayText("MOM BOOM", 4),
            DisplayText("MOM BOOM", 4),
            DisplayText("MOM BOOM", 4),
            DisplayText("MOM BOOM", 4),
            DisplayText("MOM BOOM", 4),
            DisplayText("MOM BOOM", 4),
            DisplayText("MOM BOOM", 4),
            SetCp(P12);
            RunAIScript("Turn ON Shared Vision for Player 1");
            RunAIScript("Turn ON Shared Vision for Player 2");
            RunAIScript("Turn ON Shared Vision for Player 3");
            RunAIScript("Turn ON Shared Vision for Player 4");
            RunAIScript("Turn ON Shared Vision for Player 5");
            RunAIScript("Turn ON Shared Vision for Player 6");
            RunAIScript("Turn ON Shared Vision for Player 7");
            RunAIScript("Turn ON Shared Vision for Player 8");
        })

        TriggerX(i, {Deaths(i, AtLeast, 1, 140),Deaths(i, Exactly, 0, 209),Deaths(i, Exactly, 0, 187)}, {
            RotatePlayer({DisplayTextX(StrDesignX("누군가가 \x08천인공노할 짓\x04을 하여 \x11드랍\x04되었습니다."), 4)},Force1,i)
        })
        
        TriggerX(FP, {Deaths(i, AtLeast, 1, 187)}, {SetDeaths(i, Subtract, 1, 187)},preserved)
    end
    TriggerX(FP, Always(), {
        SetMemory(0x59CC78, SetTo, -1048576),
        SetMemory(0x59CC80, SetTo, 2),
    }, preserved)

    
    
end