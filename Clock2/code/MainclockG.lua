function MainclockG()
    CIfX(Allplayers, {CVar("X",finMainclock[2],AtLeast,0), CVar("X",finMainclock[2],AtMost,4)})

    TriggerX(FP, Always(), {
        RotatePlayer({
            DisplayTextX(StrDesign("여명의 시간이 다가옵니다."), 4)
        }, {Force1, Force5}, FP)
    })

    CElseIfX({CVar("X",finMainclock[2],AtLeast,4), CVar("X",finMainclock[2],AtMost,8)})

    TriggerX(FP, Always(), {
        RotatePlayer({
            DisplayTextX(StrDesign("백주의 시간이 다가옵니다."), 4)
        }, {Force1, Force5}, FP)
    })

    CElseIfX({CVar("X",finMainclock[2],AtLeast,8), CVar("X",finMainclock[2],AtMost,12)})
    
    TriggerX(FP, Always(), {
        RotatePlayer({
            DisplayTextX(StrDesign("어스름의 시간이 다가옵니다."), 4)
        }, {Force1, Force5}, FP)
    })

    CIfXEnd()
end