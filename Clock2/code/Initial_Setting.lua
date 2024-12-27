function Initial_Setting()
    
    TriggerX(Force2, Always(), {
        SetResources(P6, SetTo, 0xFFFF, Ore);
        SetResources(P7, SetTo, 0xFFFF, Ore);
        SetResources(P8, SetTo, 0xFFFF, Ore);
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



end