function Install_function()
    PlayerString = {"\x08P1","\x0EP2","\x0FP3","\x10P4"} 
    
    function RotatePlayer(Print,Players,RecoverCP)
        return CopyCpAction(Print,Players,RecoverCP)
    end

    function ElapsedTime(Comparison, Time)
        Comparison = ParseComparison(Comparison)
        return Condition(0, 0, Time, 0, Comparison, 12, 0, 0)
    end

    function SetMemoryBA(Offset,Type,Value)
        local ret = bit32.band(Offset, 0xFFFFFFFF)%4
        if ret == 0 then
            Mask = 0xFF
        elseif ret == 1 then
            Mask = 0xFF00
            Value = Value * 0x100
        elseif ret == 2 then
            Mask = 0xFF0000
            Value = Value * 0x10000
        elseif ret == 3 then
            Mask = 0xFF000000
            Value = Value * 0x1000000
        end
        return SetMemoryX(Offset-ret,Type,Value,Mask)
    end

    function StrDesignX(Str)
        return "\x13\x07。\x18˙\x0F☆\x1C˚ \x04"..Str.." \x1C。\x0F☆\x18.\x07˚"
    end
    function SetCD(Code,Value)
        if Code == nil then PushErrorMsg("Undefined Code!") end
        if Value == nil then Value = 1 end
        if FP == nil then PushErrorMsg("FP Player not defined") end
        if type(Value) == "number" then
            return SetCDeaths(FP,SetTo,Value,Code)
        else
            return TSetCDeaths(FP,SetTo,Value,Code)
        end
    end
    function HumanCheck(Player,Status)
        if HumanCheckOffset == 0 then
            PushErrorMsg("Need_Enable_HumanCheck")
        end
        if Player >= 8  or Player < 0 then
            PushErrorMsg("HumanCheck_InputData_Error")
        end
        if Status == "X" or Status == 0 then
            Status = 0
        else
            Status = 2^Player
        end
        return FMemoryX(HumanCheckOffset,Exactly,Status,2^Player)
    end
    function SubV(V,Value)
        if Value == nil then Value = 1 end
        if FP == nil then PushErrorMsg("FP Player not defined") end
        if type(Value) == "number" then
            return SetCVar(FP,V[2],Subtract,Value)
        else
            return TSetCVar(FP,V[2],Subtract,Value)
        end
    end
    function CD(Code,Value,Type)
        if Value == nil then Value = 1 end
        if Type == nil then Type = Exactly end
        if FP == nil then PushErrorMsg("FP Player not defined") end
        if type(Value) == "number" then
            return CDeaths(FP,Type,Value,Code)
        else
            return TCDeaths(FP,Type,Value,Code)
        end
    end
    function PlotSizeCalc(Points,SizeofPolygon)
        local X = 1+(Points*(SizeofPolygon*(SizeofPolygon+1)/2))
        return X
    end
end