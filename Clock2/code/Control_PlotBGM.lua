function Control_PlotBGM()

    function plotBGM(Player, BIndex, BLoc, BGMIndex, BScore)

        CIf(FP,{Bring(Player,Exactly,0,BIndex,BLoc)})
        TriggerX(FP, {},{
            RotatePlayer({DisplayTextX(StrDesignX("Gun Indexed : "..BIndex.." Destroyed! + "..BScore.." Points"), 4)}, {Force1,Force5}, FP);
                SetScore(Force1, Add, BScore,Kills);
                SetNVar(BGMArray[1], SetTo, BGMIndex);
                SetNVar(BGMArray[2], SetTo, BGMIndex);
                SetNVar(BGMArray[3], SetTo, BGMIndex);
                SetNVar(BGMArray[4], SetTo, BGMIndex);
                SetNVar(BGMArray[5], SetTo, BGMIndex);
                SetNVar(OB_BGMArray, SetTo, BGMIndex);
        })

        CIfEnd()
    end

    plotBGM(P6, 131, "duskHat2", 1, 30000);
    plotBGM(P6, 131, "duskHat1", 2, 30000);
    plotBGM(P6, 131, "duskHat3", 2, 30000);
    plotBGM(P6, 132, "duskLair1", 3, 40000);

end