function Initial_Setting()

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





end