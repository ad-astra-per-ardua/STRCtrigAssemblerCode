function Verifing_Phase()

    TriggerX(FP,{Memory(0x57F0B4, Exactly, 0)},{
        RotatePlayer({
        DisplayTextX(StrDesignX("\x04싱글 플레이 감지 멀티플레이 환경에서 플레이 해주세요.").."\n"..StrDesignX("\x04EUD ERROR \x080x69746977 \x04Activated."),4);
        Defeat();
        },HumanPlayers,FP);
        PlayWAV("sound\\misc\\Buzz\\wav");
        SetMemory(0x968B968B,SetTo,1);},preserved)
    
    for i = 5, 7 do
        Trigger {
            players = {FP},
            conditions = {
                MemoryX(0x57EEE8 + 36*i,Exactly,0,0xFF);
            },
            actions = {
                RotatePlayer({
                DisplayTextX(StrDesignX("\x04컴퓨터 슬롯 변경 감지. \x08헛짓거리 그만하쇼.").."\n"..StrDesignX("\x04EUD ERROR \x080x69746977 \x04Activated."),4);
                Defeat();
                },HumanPlayers,FP);
                PlayWAV("sound\\misc\\Buzz\\wav");
                SetMemory(0x968B968B,SetTo,1);
            }
        }
        Trigger {
            players = {FP},
            conditions = {
                MemoryX(0x57EEE8 + 36*i,Exactly,2,0xFF);
            },
            actions = {
                RotatePlayer({
                    DisplayTextX(StrDesignX("\x04컴퓨터 슬롯 변경 감지. \x08헛짓거리 그만하쇼.").."\n"..StrDesignX("\x04EUD ERROR \x080x69746977 \x04Activated."),4);
                Defeat();
                },HumanPlayers,FP);
                PlayWAV("sound\\misc\\Buzz\\wav");
                SetMemory(0x968B968B,SetTo,1);
            }
        }
    end
    -- Detecting Modifing with cheat engine to extend upgrade value
    for i = 0, 4 do
        TriggerX(i, {MemoryB(0x58D088 + (i * 7) + 7, AtLeast, 201)}, {
            DisplayText(StrDesignX("Cheating test"), 4);
            SetMemory(0x69746977, SetTo, 1);
        }, preserved)
    end

end