function Opening()

    Trigger2X(FP, {Always()}, {
        RotatePlayer({
            CenterView("hellselect");
            DisplayTextX("\x13\x08 ――――――――――――――――――――――――――――――――――――――――――――――――――\n\x13\x08 마\t린 \x07\t\t키\t우\t기 \t\x04 \n\x13\x05 \tR\tE\tV\tE\t\tR\tS\tE\n\x13\x08――――――――――――――――――――――――――――――――――――――――――――――――――\n\x13\x17\n\n\n\x12[Create By : rhegb] ", 4);
        }, {Force1, Force5}, FP)
    })

    ----- Start of computer slot verifing
    
        TriggerX(FP,{Memory(0x57F0B4, Exactly, 0);},{
            RotatePlayer({
            DisplayTextX(StrDesignX("\x04싱글 플레이 감지 멀티플레이 환경에서 플레이 해주세요.").."\n"..StrDesignX("\x04EUD ERROR \x080x69746977 \x04Activated."),4);
            Defeat();
            PlayWAVX("sound\\misc\\Buzz\\wav");
            SetMemory(0x968B968B,SetTo,1);
            },{Force1,Force5},FP)
        },preserved)
    
    
        for i = 5, 7 do
            TriggerX(FP, {MemoryX(0x57EEE8 + 36*i,Exactly,0,0xFF)}, {
                RotatePlayer({
                    DisplayTextX(StrDesignX("\x04컴퓨터 슬롯 변경 감지. \x08헛짓거리 그만하쇼.").."\n"..StrDesignX("\x04EUD ERROR \x080x69746977 \x04Activated."),4);
                    Defeat();
                    PlayWAVX("sound\\misc\\Buzz\\wav");
                    SetMemory(0x968B968B,SetTo,1);
                },{Force1,Force5},FP)
            },preserved)


            TriggerX(FP, {MemoryX(0x57EEE8 + 36*i,Exactly,0,0xFF)}, {
                RotatePlayer({
                    DisplayTextX(StrDesignX("\x04컴퓨터 슬롯 변경 감지. \x08헛짓거리 그만하쇼.").."\n"..StrDesignX("\x04EUD ERROR \x080x69746977 \x04Activated."),4);
                    Defeat();
                    PlayWAVX("sound\\misc\\Buzz\\wav");
                    SetMemory(0x968B968B,SetTo,1);
                },{Force1,Force5},FP)
            },preserved)
        end
    -------- End of verifing start phase
    TriggerX(FP, {Bring(P1, AtLeast, 1, 15, "easyselect")}, {SetCD(Difficulty, 1)})
    TriggerX(FP, {Bring(P1, AtLeast, 1, 15, "hellselect")}, {SetCD(Difficulty, 2)})
end