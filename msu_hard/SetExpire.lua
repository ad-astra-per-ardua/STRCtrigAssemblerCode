function SetExpire()
    
    TriggerX(FP,{UnixTime(AtLeast,{year = 2024, month = 10, day = 9, hour = 12, min = 00, sec = 00})},{
        CopyCpAction({Defeat()},{P1,P2,P3,P4,P5},FP);
    },{Preserved})
end