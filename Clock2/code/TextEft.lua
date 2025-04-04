function TextEft()
    SpCodeBase = 0x8080E200 
    SpCode0 = 0x8880E200 -- 식별자 (텍스트 미출력 라인은 첫 1바이트가 00으로 고정됨) 
    SpCode3 = 0x8B80E200 -- \x0D\x0D!H
    HStr2 = SaveiStrArrX(FP,MakeiStrVoid(54*11)) 
	HStr4 = SaveiStrArrX(FP,MakeiStrVoid(54)) 
	--HStr4 = SaveiStrArrX(FP,MakeiStrVoid(54*11)) 
    HVA3 = CVArray(FP,4*5) 
	
	EEggV = CreateVar(FP)
	UnivStrPtr = CreateVar(FP)
	_0D_1000B = string.rep("\x0D",1000)
    HLine, ChatSize, ChatOff, HCheck = CreateVars(4,FP) 
	iStr1 = GetiStrId(FP,MakeiStrWord(MakeiStrVoid(54).."\r\n",3)) 
	Str1, Str1a, Str1s = SaveiStrArrX(FP,MakeiStrVoid(54))
	RepHeroIndex,Gun_LV,CunitHP,CunitP,CunitIndex = CreateVars(5,FP)
    

    function HTextEff() -- ScanChat -> 11줄 전체를 utf8 -> iutf8화 (식별자로 중복방지) 
        CA__SetNext(HStr2,8,SetTo,0,54*11-1,0)
        CA__SetNext(HStr4,8,SetTo,0,54-1,0)
        CMov(FP,HLine,0)
        EffCV2 = CreateVArr(11, FP)
        VArrI,VArrI4 = CreateVars(2,FP)

        DoActionsX(FP, {SetV(VArrI,0),SetV(VArrI4,0)})

        CWhile(FP,NVar(HLine,AtMost,10),SetNVar(HCheck,SetTo,0))
            f_ChatOffset(FP,HLine,0,ChatOff) 
            CMovX(FP,HCheck,VArrX(EffCV2, VArrI, VArrI4))
            CIfX(FP,{TTbytecmp(ChatOff,VArr(HVA3,0),GetStrSize(0,"\x0D\x0D!H"))},{SetNVar(HCheck,SetTo,3)})
        --    for i = 0, 3 do
        --        CElseIfX({HumanCheck(i, 1),TTbytecmp(ChatOff,VArr(Names2[i+1],0),PLength[i+1])},{SetNVar(HCheck,SetTo,4)})
        --    end
            CElseIfX({TTDisplayX(HLine,0,NotSame,SpCode3,0xFFFFFF00)},{SetNVar(HCheck,SetTo,0)})
            CIfXEnd()

            CurLiV = CreateVar(FP)
            EffCV = CreateVArr(11, FP)
            CIf(FP,{NVar(HCheck,AtLeast,3),NVar(HCheck,AtMost,4)})
            CIfX(FP,{TTDisplayX(HLine,0,"!=",SpCodeBase,0xF0FFFF00)}) -- 0x8080E2 ~ 0x8F80F2 인식
                CMovX(FP,VArr(EffCV,HLine),0)
                CMov(FP,CurLiV, _Mul(HLine,54*604))
                CA__SetValue(HStr2,MakeiStrLetter("\x0D",53),0xFFFFFFFF,CurLiV,1,1) 
                CD__ScanChat(SVA1(HStr2,CurLiV),ChatOff,52,ChatSize,0,1) 
                CIfX(FP,NVar(HCheck,Exactly,3))
                    CA__SetValue(HStr2,MakeiStrLetter("\x0D",2),0xFFFFFFFF,CurLiV,1,1) 
                    CA__SetMemoryX(_GIndex2(HLine,0),SpCode3+0x0D,0xFFFFFFFF,1) 
                CElseX()
                    CA__SetMemoryX(_GIndex2(HLine,0),SpCode0+0x0D,0xFFFFFFFF,1) 
                CIfXEnd()

                CIf(FP,{TTNVar(HCheck, NotSame, 3)})
                CD__InputVAX(_GIndex2(HLine,1),SVA1(HStr2,CurLiV),52,0xFFFFFFFF,0xFFFFFFFF,8,604*11-1)
                CIfEnd()
                CD__InputMask(HLine,0xFFFFFFFF,0,52) 
            CElseIfX({TTDisplay(HLine,"On"),TTDisplayX(HLine,0,Exactly,SpCode3,0xFFFFFF00)}) 
            TempEC = CreateVar(FP)
                CMov(FP,CurLiV, _Mul(HLine,54*604))
                CMovX(FP,TempEC,VArr(EffCV,HLine))
                CD__InputVAX(_GIndex2(HLine,1),HStr4,52,0xFFFFFFFF,0xFFFFFFFF,8,604*11-1)
                CD__InputVAX(_GIndex2(HLine,1),SVA1(HStr2,CurLiV),TempEC,0xFFFFFFFF,0xFFFFFFFF,8,604*11-1)
                CIf(FP,NVar(TempEC,AtMost,51),SetNVar(TempEC, Add, 1))
                    CMovX(FP,VArr(EffCV,HLine),TempEC)
                CIfEnd()
            CIfXEnd()
            CIfEnd()


            CMovX(FP,VArrX(EffCV2, VArrI, VArrI4),HCheck)
        CWhileEnd({SetNVar(HLine,Add,1),AddV(VArrI,604),AddV(VArrI4,2416)}) 
    end 
    CDPrint(0,11,{"\x0D",0,0},{Force1,Force2,Force5},{1,0,0,0,1,1,0,0},"HTextEff",FP) 
end