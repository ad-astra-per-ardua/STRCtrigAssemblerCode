function Install_ConvertMarineTrigger()
    ConvertT1 = "\x12\x04약해빠진 \x1dPrivate \x1fGuardians of \x19Galaxy\x04가 전투를 통해 조금 더 강해졌습니다 !"
    ConvertT2 = "\x12\x07Hero \x1fGuardians of \x19Galaxy\x04가 세계선을 지키기 위해 각성했습니다 !"
    for e = 1, 2 do    
        for i = 0, 3 do    
            Trigger { -- 일마  > 영마 변환
                players = {i},
                conditions = {
                    Bring(CurrentPlayer, AtLeast, 1, 0, "convertH"..e);
                    Accumulate(CurrentPlayer, AtLeast, 13000, Ore);
                },
                actions = {
                    SetResources(CurrentPlayer, Subtract, 13000, Ore);
                    RemoveUnitAt(1, 0, "convertH"..e, CurrentPlayer);
                    CreateUnit(1, 20, "HealZone", CurrentPlayer);
                    DisplayText(StrDesign2X(ConvertT1), 4);
                    PlayWAV("staredit\\wav\\ghost_living.ogg");
                    PreserveTrigger();
                },
            }
            
            Trigger { -- 영마 > 스마 변환
                players = {i},
                conditions = {
                    Bring(CurrentPlayer, AtLeast, 1, 20, "convertH"..e);
                    Bring(CurrentPlayer, AtLeast, 1, 128, "Anywhere");
                    Accumulate(CurrentPlayer, AtLeast, 28000, Ore);
                },
                actions = {
                    SetResources(CurrentPlayer, Subtract, 28000, Ore);
                    RemoveUnitAt(1, 20, "convertH"..e, CurrentPlayer);
                    CreateUnit(1, 1, "HealZone", CurrentPlayer);
                    DisplayText(StrDesign2X(ConvertT2), 4);
                    PlayWAV("staredit\\wav\\ghost_nevergiveup.ogg");
                    PreserveTrigger();
                },
            }
        end
    end
    for i = 0 , 3 do
        Trigger{ -- 해금
            players = {i},
            conditions = {
                Deaths(P7, AtLeast, 1, 152);
                Deaths(P7, AtLeast, 1, 151);
            },
            actions = {
                CreateUnit(1, 128, "unlock"..(i+1), CurrentPlayer);
            }
        }
    end
        Trigger2X(FP, {
            Deaths(P7, AtLeast, 1, 152);
            Deaths(P7, AtLeast, 1, 151);
        }, {
            RotatePlayer({
                DisplayTextX("\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08ＮＯＴＩＣＥ\x04 ● ● ●\n\x14\n\x14\n", 4);
                DisplayTextX("\x13\x19｡˙+ﾟ\x11Special \x1fGuardians of \x19Galaxy\x19 ｡+ﾟ. 가 전장에 합류했습니다 !\n", 4);
                DisplayTextX("\x13\x04\n\x0D\x0D\x13\x04● ● ● \x08ＮＯＴＩＣＥ\x04 ● ● ●\n\x14\n\x14\n", 4);
                MinimapPing("mainLocation");
                MinimapPing("mainLocation");
                MinimapPing("mainLocation");
                PlayWAVX("staredit\\wav\\unlock.ogg");
                PlayWAVX("staredit\\wav\\unlock.ogg");
                PlayWAVX("staredit\\wav\\unlock.ogg");
            }, {Force1, Force5}, FP),
        })
    
end