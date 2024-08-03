function Install_BGMPhase()
Fixedtime = 1000
BGMArray = CreateVarArr(4,FP)
OB_BGMArray = CreateVar(FP)
    for i = 0, 3 do

        TriggerX(FP,{
                LocalPlayerID(i);
                Void(i+1,Exactly,1);
            },{
                SetNVar(BGMArray[i+1],SetTo,0);
            },{Preserved})

        IBGM_EPD(FP, {i}, BGMArray[i+1], {
        {1, "staredit\\wav\\hat.ogg", 32 * Fixedtime},
        {2, "staredit\\wav\\Lair.ogg", 28 * Fixedtime},
        {3, "staredit\\wav\\hive.ogg", 31 * Fixedtime},
        {4, "staredit\\wav\\terran1.ogg", 35 * Fixedtime},
        {5, "staredit\\wav\\stargate.ogg", 60 * Fixedtime},
        {6, "staredit\\wav\\inf1.ogg", 79 * Fixedtime},
        {7, "staredit\\wav\\inf2.ogg", 85 * Fixedtime},
        {8, "staredit\\wav\\psychopathy.ogg", 56 * Fixedtime},
        {9, "staredit\\wav\\11MB.ogg", 111 * Fixedtime},
        {10, "staredit\\wav\\FBoss3.ogg", 145 * Fixedtime},
        {11, "staredit\\wav\\M5BOSS.ogg", 171 * Fixedtime},
        {12, "staredit\\wav\\M7BOSS.ogg", 95 * Fixedtime},
        {13, "staredit\\wav\\overme.ogg", 64 * Fixedtime},
        {14, "staredit\\wav\\envyofthedead.ogg", 33 * Fixedtime},
        {15, "staredit\\wav\\foolme.ogg", 27 * Fixedtime},
        {16, "staredit\\wav\\betterworld.ogg", 37 * Fixedtime},
        {17, "staredit\\wav\\spPlot1.ogg", 145 * Fixedtime}
        })
    end
    IBGM_EPD(FP, {Force5}, OB_BGMArray, {
        {1, "staredit\\wav\\hat.ogg", 32 * Fixedtime},
        {2, "staredit\\wav\\Lair.ogg", 28 * Fixedtime},
        {3, "staredit\\wav\\hive.ogg", 31 * Fixedtime},
        {4, "staredit\\wav\\terran1.ogg", 35 * Fixedtime},
        {5, "staredit\\wav\\stargate.ogg", 60 * Fixedtime},
        {6, "staredit\\wav\\inf1.ogg", 79 * Fixedtime},
        {7, "staredit\\wav\\inf2.ogg", 85 * Fixedtime},
        {8, "staredit\\wav\\psychopathy.ogg", 56 * Fixedtime},
        {9, "staredit\\wav\\11MB.ogg", 111 * Fixedtime},
        {10, "staredit\\wav\\FBoss3.ogg", 145 * Fixedtime},
        {11, "staredit\\wav\\M5BOSS.ogg", 171 * Fixedtime},
        {12, "staredit\\wav\\M7BOSS.ogg", 95 * Fixedtime},
        {13, "staredit\\wav\\overme.ogg", 64 * Fixedtime},
        {14, "staredit\\wav\\envyofthedead.ogg", 33 * Fixedtime},
        {15, "staredit\\wav\\foolme.ogg", 27 * Fixedtime},
        {16, "staredit\\wav\\betterworld.ogg", 37 * Fixedtime},
        {17, "staredit\\wav\\spPlot1.ogg", 145 * Fixedtime}
        })
    
    ----------- Hat BGM ----------
    CIf(FP, {Deaths(P6, AtLeast, 1, 131)})
        TriggerX(FP,{},{
            CopyCpAction({DisplayTextX(StrDesignX("Hatchery Destroyed! + 30,000 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 30000,Kills);
            SetNVar(BGMArray[1], SetTo, 1);
            SetNVar(BGMArray[2], SetTo, 1);
            SetNVar(BGMArray[3], SetTo, 1);
            SetNVar(BGMArray[4], SetTo, 1);
            SetNVar(OB_BGMArray, SetTo, 1);
        },preserved)
    CIfEnd({SetDeaths(P6, SetTo, 0, 131)})
    ---------- Lair BGM ----------
    CIf(FP, {Deaths(P6, AtLeast, 1, 132)})
        TriggerX(FP,{},{
            CopyCpAction({DisplayTextX(StrDesignX("Lair Destroyed! + 40,000 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 40000,Kills);
            SetNVar(BGMArray[1], SetTo, 2);
            SetNVar(BGMArray[2], SetTo, 2);
            SetNVar(BGMArray[3], SetTo, 2);
            SetNVar(BGMArray[4], SetTo, 2);
            SetNVar(OB_BGMArray, SetTo, 2);
        },preserved)
    CIfEnd({SetDeaths(P6, SetTo, 0, 132)})
    ---------- Hive BGM ----------
    CIf(FP, {Deaths(P6, AtLeast, 1, 133)})
        TriggerX(FP,{},{
            CopyCpAction({DisplayTextX(StrDesignX("Hive Destroyed! + 50,000 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 50000,Kills);
            SetNVar(BGMArray[1], SetTo, 3);
            SetNVar(BGMArray[2], SetTo, 3);
            SetNVar(BGMArray[3], SetTo, 3);
            SetNVar(BGMArray[4], SetTo, 3);
            SetNVar(OB_BGMArray, SetTo, 3);
        },preserved)
    CIfEnd({SetDeaths(P6, SetTo, 0, 133)})
    ---------- Starport BGM ----------
    CIf(FP, {Deaths(P6, AtLeast, 1, 114)})
        TriggerX(FP,{},{
            CopyCpAction({DisplayTextX(StrDesignX("Starport Destroyed! + 75,000 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 75000,Kills);
            SetNVar(BGMArray[1], SetTo, 4);
            SetNVar(BGMArray[2], SetTo, 4);
            SetNVar(BGMArray[3], SetTo, 4);
            SetNVar(BGMArray[4], SetTo, 4);
            SetNVar(OB_BGMArray, SetTo, 4);
        },preserved)
    CIfEnd({SetDeaths(P6, SetTo, 0, 114)})
    ---------- Stargate BGM ----------
    CIf(FP, {Deaths(P6, AtLeast, 1, 167)})
        TriggerX(FP,{},{
            CopyCpAction({DisplayTextX(StrDesignX("Stargate Destroyed! + 75,000 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 75000,Kills);
            SetNVar(BGMArray[1], SetTo, 5);
            SetNVar(BGMArray[2], SetTo, 5);
            SetNVar(BGMArray[3], SetTo, 5);
            SetNVar(BGMArray[4], SetTo, 5);
            SetNVar(OB_BGMArray, SetTo, 5);
        },preserved)
    CIfEnd({SetDeaths(P6, SetTo, 0, 167)})
    ---------- Inf1 BGM ----------
    CIf(FP, {Deaths(P7, AtLeast, 1, 130)})
        TriggerX(FP,{},{
            CopyCpAction({DisplayTextX(StrDesignX("평행세계의\x11 무한한 \x07만개, \x11Eternal \x07Blossom \x04Destroyed! + 100,000 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 100000,Kills);
            SetNVar(BGMArray[1], SetTo, 6);
            SetNVar(BGMArray[2], SetTo, 6);
            SetNVar(BGMArray[3], SetTo, 6);
            SetNVar(BGMArray[4], SetTo, 6);
            SetNVar(OB_BGMArray, SetTo, 6);
            SetDeaths(P1, SetTo, 1, 130);
        },preserved)
    CIfEnd({SetDeaths(P7, SetTo, 0, 130)})
    ---------- Inf2 BGM ----------
    CIf(FP, {Deaths(P7, AtLeast, 1, 106)})
        TriggerX(FP,{},{
            CopyCpAction({DisplayTextX(StrDesignX("평행세계의 \x08분개, \x17Fierceness \x04Destroyed! + 100,000 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 100000,Kills);
            SetNVar(BGMArray[1], SetTo, 7);
            SetNVar(BGMArray[2], SetTo, 7);
            SetNVar(BGMArray[3], SetTo, 7);
            SetNVar(BGMArray[4], SetTo, 7);
            SetNVar(OB_BGMArray, SetTo, 7);
            SetDeaths(P1, SetTo, 1, 106);
        },preserved)
    CIfEnd({SetDeaths(P7, SetTo, 0, 106)})

    -------- psychopathy BGM ---- 
    CIfOnce(FP, {CommandLeastAt(114, "celebrate1"),Deaths(P7, AtLeast, 1, 151)})
        TriggerX(FP,{},{
            CopyCpAction({DisplayTextX(StrDesignX("평행세계의 \x08수뇌부, \x17Cerebrate \x04Destroyed! + 70,000 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 70000,Kills);
            SetNVar(BGMArray[1], SetTo, 8);
            SetNVar(BGMArray[2], SetTo, 8);
            SetNVar(BGMArray[3], SetTo, 8);
            SetNVar(BGMArray[4], SetTo, 8);
            SetNVar(OB_BGMArray, SetTo, 8);
        })
    CIfEnd()

    CIfOnce(FP, {CommandLeastAt(114, "celebrate2"),Deaths(P7, AtLeast, 1, 152)})
        TriggerX(FP,{},{
            CopyCpAction({DisplayTextX(StrDesignX("평행세계의 \x08군단숙주, \x1DDaggoth \x04Destroyed! + 70,000 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 70000,Kills);
            SetNVar(BGMArray[1], SetTo, 8);
            SetNVar(BGMArray[2], SetTo, 8);
            SetNVar(BGMArray[3], SetTo, 8);
            SetNVar(BGMArray[4], SetTo, 8);
            SetNVar(OB_BGMArray, SetTo, 8);
        })
    CIfEnd()

    ------ Easter Egg
    CIf(FP, {CommandLeastAt(146, "fcky1"),Deaths(P6, AtLeast, 1, 146)})
        TriggerX(FP,{},{
            CopyCpAction({DisplayTextX(StrDesignX("어느 평행세계에서 \x08잘못 \x04찾아온 파티의 현장, \x1DOver Me \x04Destroyed! + 16,974 Points"), 4)}, {Force1,Force5}, FP);
            SetScore(Force1, Add, 16974,Kills);
            SetNVar(BGMArray[1], SetTo, 13);
            SetNVar(BGMArray[2], SetTo, 13);
            SetNVar(BGMArray[3], SetTo, 13);
            SetNVar(BGMArray[4], SetTo, 13);
            SetNVar(OB_BGMArray, SetTo, 13);
        })
    CIfEnd(SetDeaths(P6, SetTo, 0, 146))

        -------- 11 middle boss bgm
        
            TriggerX(FP,{Deaths(P7, AtLeast, 1, 174)},{
                CopyCpAction({DisplayTextX(StrDesignX("어느 평행세계에서 전송된 기억의 세계선").."\n"..StrDesignX("\x07B\x04orderline \x11O\x04f \x19M\x04emory Destroyed ! + 200,000 Points"),4)},{Force1,Force5}, FP);
                SetScore(Force1, Add, 2000000,Kills);
                SetNVar(BGMArray[1], SetTo, 9);
                SetNVar(BGMArray[2], SetTo, 9);
                SetNVar(BGMArray[3], SetTo, 9);
                SetNVar(BGMArray[4], SetTo, 9);
                SetNVar(OB_BGMArray, SetTo, 9);
            })
        

    -------- 1 middle boss bgm
        
            TriggerX(FP,{Deaths(P7, AtLeast, 1, 175)},{
                CopyCpAction({DisplayTextX(StrDesignX("어느 평행세계에서 남아있는 희미한 추억").."\n"..StrDesignX("\x0fR\x04eminiscence \x11O\x04f \x1cI\x04sland Destroyed ! + 200,000 Points"),4)},{Force1,Force5}, FP);
                SetScore(Force1, Add, 2000000,Kills);
                SetNVar(BGMArray[1], SetTo, 10);
                SetNVar(BGMArray[2], SetTo, 10);
                SetNVar(BGMArray[3], SetTo, 10);
                SetNVar(BGMArray[4], SetTo, 10);
                SetNVar(OB_BGMArray, SetTo, 10);
            })

    
        ------- 7 middle boss bgm
        
            TriggerX(FP,{Deaths(P7, AtLeast, 1, 127)},{
                CopyCpAction({DisplayTextX(StrDesignX("어느 평행세계에서 느껴지는 황홀한 공포감").."\n"..StrDesignX("\x10M\x04agnificent \x11O\x04f \x08F\x04rightness Destroyed ! + 200,000 Points"),4)},{Force1,Force5}, FP);
                SetScore(Force1, Add, 2000000,Kills);
                SetNVar(BGMArray[1], SetTo, 12);
                SetNVar(BGMArray[2], SetTo, 12);
                SetNVar(BGMArray[3], SetTo, 12);
                SetNVar(BGMArray[4], SetTo, 12);
                SetNVar(OB_BGMArray, SetTo, 12);
            })
        

        --------- 5 middle boss bgm
        
            TriggerX(FP,{Deaths(P7, AtLeast, 1, 148)},{
                CopyCpAction({DisplayTextX(StrDesignX("어느 평행세계에서 느껴지는 감정의 해일").."\n"..StrDesignX("\x0ET\x04idal \x11O\x04f \x18E\x04motions Destroyed ! + 200,000 Points"),4)},{Force1,Force5}, FP);
                SetScore(Force1, Add, 2000000,Kills);
                SetNVar(BGMArray[1], SetTo, 11);
                SetNVar(BGMArray[2], SetTo, 11);
                SetNVar(BGMArray[3], SetTo, 11);
                SetNVar(BGMArray[4], SetTo, 11);
                SetNVar(OB_BGMArray, SetTo, 11);
            })
        

        CIf(FP, {Deaths(P7, AtLeast, 1, 132)})
            TriggerX(FP,{},{
                CopyCpAction({DisplayTextX(StrDesignX("Lair Destroyed! + 40,000 Points"),4)},{Force1,Force5}, FP);
                SetScore(Force1, Add, 40000,Kills);
                SetNVar(BGMArray[1], SetTo, 15);
                SetNVar(BGMArray[2], SetTo, 15);
                SetNVar(BGMArray[3], SetTo, 15);
                SetNVar(BGMArray[4], SetTo, 15);
                SetNVar(OB_BGMArray, SetTo, 15);
            },preserved)
        CIfEnd(SetDeaths(P7, SetTo, 0, 132))

        CIf(FP, {Deaths(P7, AtLeast, 1, 114)})
            TriggerX(FP,{},{
                CopyCpAction({DisplayTextX(StrDesignX("Starport Destroyed! + 75,000 Points"),4)},{Force1,Force5}, FP);
                SetScore(Force1, Add, 75000,Kills);
                SetNVar(BGMArray[1], SetTo, 16);
                SetNVar(BGMArray[2], SetTo, 16);
                SetNVar(BGMArray[3], SetTo, 16);
                SetNVar(BGMArray[4], SetTo, 16);
                SetNVar(OB_BGMArray, SetTo, 16);
            },preserved)
        CIfEnd(SetDeaths(P7, SetTo, 0, 114))

        CIf(FP, {Deaths(P7, AtLeast, 1, 200)})
            TriggerX(FP,{},{
                CopyCpAction({DisplayTextX(StrDesignX("Generator Destroyed! + 100,000 Points"),4)},{Force1,Force5}, FP);
                SetScore(Force1, Add, 100000,Kills);
                SetNVar(BGMArray[1], SetTo, 17);
                SetNVar(BGMArray[2], SetTo, 17);
                SetNVar(BGMArray[3], SetTo, 17);
                SetNVar(BGMArray[4], SetTo, 17);
                SetNVar(OB_BGMArray, SetTo, 17);
            },preserved)
        CIfEnd(SetDeaths(P7, SetTo, 0, 200))

end