function MainclockG()
    NIfX(Allplayers, {CDeaths(FP, Exactly, 1, Difficulty)}) -- Past
        NIfX(Allplayers, {CVar(FP,finMainclock[2],AtLeast,0), CVar(FP,finMainclock[2],AtMost,4)})
            DoActionsX(FP,{RotatePlayer({DisplayTextX(StrDesign("여명의 시간이 다가옵니다."), 4)}, {Force1, Force5}, FP)},{})


        NElseIfX({CVar(FP,finMainclock[2],AtLeast,4), CVar(FP,finMainclock[2],AtMost,8)})
            DoActionsX(FP,{RotatePlayer({DisplayTextX(StrDesign("백주의 시간이 다가옵니다."), 4)}, {Force1, Force5}, FP)},{})
        

        NElseIfX({CVar(FP,finMainclock[2],AtLeast,8), CVar(FP,finMainclock[2],AtMost,12)})
            DoActionsX(FP,{RotatePlayer({DisplayTextX(StrDesign("어스름의 시간이 다가옵니다."), 4)}, {Force1, Force5}, FP)},{})
        

        NIfXEnd()
    NElseIfX(CDeaths(FP, Exactly, 2, Difficulty)) -- Present
        NIfX(Allplayers, {CVar(FP,finMainclock[2],AtLeast,0), CVar(FP,finMainclock[2],AtMost,4)})
            DoActionsX(FP,{RotatePlayer({DisplayTextX(StrDesign("여명의 시간이 다가옵니다."), 4)}, {Force1, Force5}, FP)},{})


        NElseIfX({CVar(FP,finMainclock[2],AtLeast,4), CVar(FP,finMainclock[2],AtMost,8)})
            DoActionsX(FP,{RotatePlayer({DisplayTextX(StrDesign("백주의 시간이 다가옵니다."), 4)}, {Force1, Force5}, FP)},{})
        

        NElseIfX({CVar(FP,finMainclock[2],AtLeast,8), CVar(FP,finMainclock[2],AtMost,12)})
            DoActionsX(FP,{RotatePlayer({DisplayTextX(StrDesign("어스름의 시간이 다가옵니다."), 4)}, {Force1, Force5}, FP)},{})
        

        NIfXEnd()
    NElseX() -- Future
        NIfX(Allplayers, {CVar(FP,finMainclock[2],AtLeast,0), CVar(FP,finMainclock[2],AtMost,4)})
            DoActionsX(FP,{RotatePlayer({DisplayTextX(StrDesign("여명의 시간이 다가옵니다."), 4)}, {Force1, Force5}, FP)},{})


        NElseIfX({CVar(FP,finMainclock[2],AtLeast,4), CVar(FP,finMainclock[2],AtMost,8)})
            DoActionsX(FP,{RotatePlayer({DisplayTextX(StrDesign("백주의 시간이 다가옵니다."), 4)}, {Force1, Force5}, FP)},{})
        

        NElseIfX({CVar(FP,finMainclock[2],AtLeast,8), CVar(FP,finMainclock[2],AtMost,12)})
            DoActionsX(FP,{RotatePlayer({DisplayTextX(StrDesign("어스름의 시간이 다가옵니다."), 4)}, {Force1, Force5}, FP)},{})
        

        NIfXEnd()
    NIfXEnd()

end