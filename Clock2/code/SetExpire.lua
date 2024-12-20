function SetExpire()
    
    TriggerX(FP,{UnixTime(AtLeast,{year = 2024, month = 10, day = 10, hour = 17, min = 00, sec = 00})},{
        CopyCpAction({Defeat()},{Force1},FP);
    },{Preserved})
end