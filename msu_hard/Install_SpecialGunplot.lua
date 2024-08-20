function Install_SpecialGunplot()

    MBBuildingArray = {174,175,127,148}
    Utext1 = {
        "좌측 상단, \x07기억의 \x04세계선", "우측 상단, \x1c섬의 \x0f추억","좌측 하단, \x08공포의 \x10절경","우측 하단, \x18감정의 \x0e해일"}
    Utext2 = {"\x07B\x04orderline \x11O\x04f \x19M\x04emory","\x0fR\x04eminiscence \x11O\x04f \x1cI\x04sland","\x10M\x04agnificent \x11O\x04f \x08F\x04rightness","\x0ET\x04idal \x11O\x04f \x18E\x04motions"}
    Utext3 = {
    "좌측 상단, \x08평행우주의 \x03동력원, \x11｡˙+ﾟ\x08Parallel's \x03Generator \x11 ﾟ.+｡",
    "우측 상단, \x08평행우주의 \x03동력원, \x11｡˙+ﾟ\x08Parallel's \x03Generator \x11 ﾟ.+｡",
    "좌측 하단, \x08평행우주의 \x03동력원, \x11｡˙+ﾟ\x08Parallel's \x03Generator \x11 ﾟ.+｡",
    "우측 하단, \x08평행우주의 \x03동력원, \x11｡˙+ﾟ\x08Parallel's \x03Generator \x11 ﾟ.+｡"
}

    CIfX(Force2, {CDeaths(FP, Exactly, 1, Difficulty)})

    ----------- Normal plot

    TriggerX(FP, Always(), {
        CreateUnit(1, 151, "celebrate1", P7);
        CreateUnit(1, 152, "celebrate2", P7);
        CreateUnit(1, 130,"nuke1", P7);
        CreateUnit(1, 106,"nuke2", P7);
        CreateUnit(1, 174,"middle1", P7);
        CreateUnit(1, 175,"middle2", P7);
        CreateUnit(1, 127,"middle3", P7);
        CreateUnit(1, 148,"middle4", P7);
        -- SetInvincibility(Enable, 127, P7, "Anywhere");
        -- SetInvincibility(Enable, 148, P7, "Anywhere");
        -- SetInvincibility(Enable, 174, P7, "Anywhere");
        -- SetInvincibility(Enable, 175, P7, "Anywhere");
})

------ Start of Disable invincibility condition trigger -------

-- for i = 1 , 4 do 
--     Unlock1 = "\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08 ＮＯＴＩＣＥ \x04 ● ● ●\n\x14\n\x14\n"
--     Unlock2 = StrDesignX(Utext3[i].."의 무적이 \x07해제\x04되었습니다 !").."\n\n"
--     Unlock3 = "\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08 ＮＯＴＩＣＥ \x04 ● ● ●\n\x14\n\x14\n"
--     TriggerX(FP, {
--         Bring(Force2, AtMost, 1, "Any unit", "middle"..i),
--     }, {
--         RotatePlayer({
--             PlayWAVX("staredit\\wav\\CAUTION.wav"),
--             PlayWAVX("staredit\\wav\\CAUTION.wav"),
--             DisplayTextX(Unlock1, 4),
--             DisplayTextX(Unlock2, 4),
--             DisplayTextX(Unlock3, 4),
--             MinimapPing("generator"..i)
        
--         }, {Force1, Force5}, FP),
--         SetInvincibility(Disable, 200, P7, "generator"..i)
--     })
-- end

for i = 1 , 4 do 
    Unlock1 = "\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08 ＮＯＴＩＣＥ \x04 ● ● ●\n\x14\n\x14\n"
    Unlock2 = StrDesignX(Utext1[i]).."\n"..StrDesignX(Utext2[i].."의 무적이 \x07해제\x04되었습니다 !").."\n\n"
    Unlock3 = "\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08 ＮＯＴＩＣＥ \x04 ● ● ●\n\x14\n\x14\n"
    TriggerX(FP, {
        Bring(Force2, AtMost, 1, "Any unit", "middle"..i),
        Deaths(P1, AtLeast, 1, 106),
        Deaths(P1, AtLeast, 1, 130),
        -- Bring(P7, Exactly, 0, 200, "generator"..i)
    }, {
        RotatePlayer({
        DisplayTextX(Unlock1, 4),
        DisplayTextX(Unlock2, 4),
        DisplayTextX(Unlock3, 4),
        MinimapPing("middle"..i),
        PlayWAVX("staredit\\wav\\CAUTION.wav"),
        PlayWAVX("staredit\\wav\\CAUTION.wav")
        }, {Force1,Force5}, FP),
        SetInvincibility(Disable, MBBuildingArray[i], P7, "middle"..i)
    })
end


CElseX()

------------ Hard plot 

CTrigger({FP}, {_TP(_TOR(Deaths(P7, AtLeast, 1, 130),Deaths(P7, AtLeast, 1, 106)))}, {
    SetDeaths(P8, SetTo, 1, 131),
    SetDeaths(P8, SetTo, 1, 132);
}, 1)

TriggerX(FP, Always(), {
        CreateUnit(1, 151, "celebrate1", P7);
        CreateUnit(1, 152, "celebrate2", P7);
        CreateUnit(1, 130,"nuke1", P7);
        CreateUnit(1, 106,"nuke2", P7);
        CreateUnit(1, 174,"middle1", P7);
        CreateUnit(1, 175,"middle2", P7);
        CreateUnit(1, 127,"middle3", P7);
        CreateUnit(1, 148,"middle4", P7);
        CreateUnit(1, 200, "generator1", P7);
        CreateUnit(1, 200, "generator2", P7);
        CreateUnit(1, 200, "generator3", P7);
        CreateUnit(1, 200, "generator4", P7);
        SetInvincibility(Enable, 127, P7, "Anywhere");
        SetInvincibility(Enable, 148, P7, "Anywhere");
        SetInvincibility(Enable, 174, P7, "Anywhere");
        SetInvincibility(Enable, 175, P7, "Anywhere");
        SetInvincibility(Enable, 200, P7, "Anywhere");
})


for i = 1 , 4 do 
    Unlock1 = "\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08 ＮＯＴＩＣＥ \x04 ● ● ●\n\x14\n\x14\n"
    Unlock2 = StrDesignX(Utext3[i].."의 무적이 \x07해제\x04되었습니다 !").."\n\n"
    Unlock3 = "\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08 ＮＯＴＩＣＥ \x04 ● ● ●\n\x14\n\x14\n"
    TriggerX(FP, {
        Bring(Force2, AtMost, 1, "Any unit", "middle"..i),
    }, {
        RotatePlayer({
            PlayWAVX("staredit\\wav\\CAUTION.wav"),
            PlayWAVX("staredit\\wav\\CAUTION.wav"),
            DisplayTextX(Unlock1, 4),
            DisplayTextX(Unlock2, 4),
            DisplayTextX(Unlock3, 4),
            MinimapPing("generator"..i)
        }, {Force1, Force5}, FP),
        SetInvincibility(Disable, 200, P7, "generator"..i)
    })
end

for i = 1 , 4 do 
    Unlock1 = "\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08 ＮＯＴＩＣＥ \x04 ● ● ●\n\x14\n\x14\n"
    Unlock2 = StrDesignX(Utext1[i]).."\n"..StrDesignX(Utext2[i].."의 무적이 \x07해제\x04되었습니다 !").."\n\n"
    Unlock3 = "\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08 ＮＯＴＩＣＥ \x04 ● ● ●\n\x14\n\x14\n"
    TriggerX(FP, {
        Bring(Force2, AtMost, 1, "Any unit", "middle"..i),
        Deaths(P1, AtLeast, 1, 106),
        Deaths(P1, AtLeast, 1, 130),
        Bring(P7, Exactly, 0, 200, "generator"..i)
    }, {
        RotatePlayer({
        DisplayTextX(Unlock1, 4),
        DisplayTextX(Unlock2, 4),
        DisplayTextX(Unlock3, 4),
        MinimapPing("middle"..i),
        PlayWAVX("staredit\\wav\\CAUTION.wav"),
        PlayWAVX("staredit\\wav\\CAUTION.wav")
        }, {Force1,Force5}, FP),
        SetInvincibility(Disable, MBBuildingArray[i], P7, "middle"..i)
    })
end
    


CIfXEnd()
end