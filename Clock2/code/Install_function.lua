function Install_function()
    PlayerString = {"\x08P1","\x0EP2","\x0FP3","\x10P4","\x11P5"} 
    
    function RotatePlayer(Print,Players,RecoverCP)
        return CopyCpAction(Print,Players,RecoverCP)
    end

	function LeaderBoardGreed(Goal)
    return Action(0, 0, 0, 0, 0, Goal, 0, 40, 0, 4)
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

	function SetLabel(Index)
		Trigger {
			players = {FP},
			conditions = {
					Label(Index);
				},
		}
	end

function Install_BackupCP(Player)
	BackupCp = CreateVar(Player)
	SaveCp_CallIndex = SetCallForward()
	SetCall(Player)
		SaveCp(Player,BackupCp)
	SetCallEnd()

	LoadCp_CallIndex = SetCallForward()
	SetCall(Player)
		LoadCp(Player,BackupCp)
		SetRecoverCp()
	SetCallEnd()
	function f_SaveCp()
		CallTrigger(Player,SaveCp_CallIndex,nil)
	end
	function f_LoadCp()
		CallTrigger(Player,LoadCp_CallIndex,nil)
	end
end

Nextptr, BackupCp = CreateVars(2, FP)

Call_SaveCpCFunc = InitCFunc(FP)
CFunc(Call_SaveCpCFunc)
	SaveCp(FP,BackupCp)
CFuncEnd()

Call_LoadCpCFunc = InitCFunc(FP)
CFunc(Call_LoadCpCFunc)
	LoadCp(FP,BackupCp)
CFuncEnd()

Call_Nextptr = InitCFunc(FP)
CFunc(Call_Nextptr)
	f_Read(FP,0x628438,nil,Nextptr)
CFuncEnd()

function SetNextptr()
	CallCFuncX(FP,Call_Nextptr)
end

function Call_SaveCp()
	CallCFuncX(FP,Call_SaveCpCFunc)
end

function Call_LoadCp()
	CallCFuncX(FP,Call_LoadCpCFunc)
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
    
function CSPlot2(Shape,Owner,UnitId,Location,CenterXY,PerUnit,PlotSize,PlayerID,Condition,Action,Preserve)
	if Shape == nil then
		CS_InputError()
	end
	if Shape[1] > 1700 then
		CS_UnitNumber_Over1700()
	end

	if Preserve == 0 then
		Preserve = nil
	end

	local LocId = Location
	if type(Location) == "string" then
		LocId =  ParseLocation(LocId)-1
	end
	local LocL = 0x58DC60+0x14*LocId
	local LocU = 0x58DC64+0x14*LocId
	local LocR = 0x58DC68+0x14*LocId
	local LocD = 0x58DC6C+0x14*LocId

	local Plot = {}
	if CenterXY == nil then
		for i = 1, Shape[1] do
			if Shape[i+1] ~= nil then
				table.insert(Plot,SetMemory(LocL,Add,Shape[i+1][1]-PlotSize))
				table.insert(Plot,SetMemory(LocR,Add,Shape[i+1][1]+PlotSize))
				table.insert(Plot,SetMemory(LocU,Add,Shape[i+1][2]-PlotSize))
				table.insert(Plot,SetMemory(LocD,Add,Shape[i+1][2]+PlotSize))
				table.insert(Plot,CreateUnit(PerUnit,UnitId,Location,Owner))
				table.insert(Plot,SetMemory(LocL,Add,0-Shape[i+1][1]+PlotSize))
				table.insert(Plot,SetMemory(LocR,Add,0-Shape[i+1][1]-PlotSize))
				table.insert(Plot,SetMemory(LocU,Add,0-Shape[i+1][2]+PlotSize))
				table.insert(Plot,SetMemory(LocD,Add,0-Shape[i+1][2]-PlotSize))
			end
		end
	else
		local LocX = CenterXY[1]
		local LocY = CenterXY[2]

		for i = 1, Shape[1] do
			if Shape[i+1] ~= nil then
				table.insert(Plot,SetMemory(LocL,SetTo,LocX+Shape[i+1][1]-PlotSize))
				table.insert(Plot,SetMemory(LocR,SetTo,LocX+Shape[i+1][1]+PlotSize))
				table.insert(Plot,SetMemory(LocU,SetTo,LocY+Shape[i+1][2]-PlotSize))
				table.insert(Plot,SetMemory(LocD,SetTo,LocY+Shape[i+1][2]+PlotSize))
				table.insert(Plot,CreateUnit(PerUnit,UnitId,Location,Owner))
			end
		end
	end

	if Action ~= nil then
		for k, v in pairs(Action) do
			table.insert(Plot,v)
		end
	end

	local k = 1
	local Size = #Plot

	local Y = {}
	if Preserve ~= nil then
		table.insert(Y,PreserveTrigger())
	end

	while k <= Size do
		if Size - k + 1 >= 63 then
			local X = {}
			for i = 0, 62 do
				table.insert(X, Plot[k])
				k = k + 1
			end
			Trigger {
				players = {PlayerID},
				conditions = {
                    Label(0),
					Condition,
				},
				actions = {
					X,
					Y,
				},
			}
		else
			local X = {}
			repeat
				table.insert(X, Plot[k])
				k = k + 1
			until k == Size + 1
			Trigger {
				players = {PlayerID},
				conditions = {
                    Label(0),
					Condition,
				},
				actions = {
					X,
					Y,
				},
			}
		end
	end
end

function CSPlotOrder2(Shape,Owner,UnitId,Location,CenterXY,PerUnit,PlotSize,OrderShape,Direction,OrderType,OrderLocation,DestXY,SizeofLoc,PerAction,PlayerID,Condition,Action,Preserve)
	if Shape[1] ~= OrderShape[1] then
		CS_Number_Difference()
	end
	if Shape[1] > 1700 then
		CS_UnitNumber_Over1700()
	end

	if Shape == nil then
		CS_InputError()
	end

	if Preserve == 0 then
		Preserve = nil
	end
	if Direction == 0 then
		Direction = nil
	end

	local LocId = Location
	if type(Location) == "string" then
		LocId = ParseLocation(LocId)-1
	end
	local LocL = 0x58DC60+0x14*LocId
	local LocU = 0x58DC64+0x14*LocId
	local LocR = 0x58DC68+0x14*LocId
	local LocD = 0x58DC6C+0x14*LocId

	if OrderShape == nil then
		CS_InputError()
	end

	local OLocId = OrderLocation
	if type(OrderLocation) == "string" then
		OLocId = ParseLocation(OLocId)-1
	end
	local OLocL = 0x58DC60+0x14*OLocId
	local OLocU = 0x58DC64+0x14*OLocId
	local OLocR = 0x58DC68+0x14*OLocId
	local OLocD = 0x58DC6C+0x14*OLocId

	local Plot = {}
	if CenterXY == nil then
		for i = 1, Shape[1] do
			if Shape[i+1] ~= nil then
				table.insert(Plot,SetMemory(LocL,Add,Shape[i+1][1]-PlotSize))
				table.insert(Plot,SetMemory(LocR,Add,Shape[i+1][1]+PlotSize))
				table.insert(Plot,SetMemory(LocU,Add,Shape[i+1][2]-PlotSize))
				table.insert(Plot,SetMemory(LocD,Add,Shape[i+1][2]+PlotSize))
				table.insert(Plot,CreateUnit(PerUnit,UnitId,Location,Owner))
				table.insert(Plot,SetMemory(LocL,Add,PlotSize-SizeofLoc))
				table.insert(Plot,SetMemory(LocR,Add,0-PlotSize+SizeofLoc))
				table.insert(Plot,SetMemory(LocU,Add,PlotSize-SizeofLoc))
				table.insert(Plot,SetMemory(LocD,Add,0-PlotSize+SizeofLoc))
				if DestXY == nil then
					if Direction == nil then
						table.insert(Plot,SetMemory(OLocL,Add,OrderShape[i+1][1]))
						table.insert(Plot,SetMemory(OLocR,Add,OrderShape[i+1][1]))
						table.insert(Plot,SetMemory(OLocU,Add,OrderShape[i+1][2]))
						table.insert(Plot,SetMemory(OLocD,Add,OrderShape[i+1][2]))
						table.insert(Plot,Order(UnitId,Owner,Location,OrderType,OrderLocation))
						table.insert(Plot,SetMemory(OLocL,Add,0-OrderShape[i+1][1]))
						table.insert(Plot,SetMemory(OLocR,Add,0-OrderShape[i+1][1]))
						table.insert(Plot,SetMemory(OLocU,Add,0-OrderShape[i+1][2]))
						table.insert(Plot,SetMemory(OLocD,Add,0-OrderShape[i+1][2]))
					else
						table.insert(Plot,SetMemory(OLocL,Add,OrderShape[Shape[1]+2-i][1]))
						table.insert(Plot,SetMemory(OLocR,Add,OrderShape[Shape[1]+2-i][1]))
						table.insert(Plot,SetMemory(OLocU,Add,OrderShape[Shape[1]+2-i][2]))
						table.insert(Plot,SetMemory(OLocD,Add,OrderShape[Shape[1]+2-i][2]))
						table.insert(Plot,Order(UnitId,Owner,Location,OrderType,OrderLocation))
						table.insert(Plot,SetMemory(OLocL,Add,0-OrderShape[Shape[1]+2-i][1]))
						table.insert(Plot,SetMemory(OLocR,Add,0-OrderShape[Shape[1]+2-i][1]))
						table.insert(Plot,SetMemory(OLocU,Add,0-OrderShape[Shape[1]+2-i][2]))
						table.insert(Plot,SetMemory(OLocD,Add,0-OrderShape[Shape[1]+2-i][2]))
					end
				else
					local OLocX = DestXY[1]
					local OLocY = DestXY[2]
					if Direction == nil then
						table.insert(Plot,SetMemory(OLocL,SetTo,OLocX+OrderShape[i+1][1]))
						table.insert(Plot,SetMemory(OLocR,SetTo,OLocX+OrderShape[i+1][1]))
						table.insert(Plot,SetMemory(OLocU,SetTo,OLocY+OrderShape[i+1][2]))
						table.insert(Plot,SetMemory(OLocD,SetTo,OLocY+OrderShape[i+1][2]))
						table.insert(Plot,Order(UnitId,Owner,Location,OrderType,OrderLocation))
					else
						table.insert(Plot,SetMemory(OLocL,SetTo,OLocX+OrderShape[Shape[1]+2-i][1]))
						table.insert(Plot,SetMemory(OLocR,SetTo,OLocX+OrderShape[Shape[1]+2-i][1]))
						table.insert(Plot,SetMemory(OLocU,SetTo,OLocY+OrderShape[Shape[1]+2-i][2]))
						table.insert(Plot,SetMemory(OLocD,SetTo,OLocY+OrderShape[Shape[1]+2-i][2]))
						table.insert(Plot,Order(UnitId,Owner,Location,OrderType,OrderLocation))
					end
				end
				if PerAction ~= nil then
					for k, v in pairs(PerAction) do
						table.insert(Plot,v)
					end
				end
				table.insert(Plot,SetMemory(LocL,Add,0-Shape[i+1][1]+SizeofLoc))
				table.insert(Plot,SetMemory(LocR,Add,0-Shape[i+1][1]-SizeofLoc))
				table.insert(Plot,SetMemory(LocU,Add,0-Shape[i+1][2]+SizeofLoc))
				table.insert(Plot,SetMemory(LocD,Add,0-Shape[i+1][2]-SizeofLoc))
			end
		end
	else
		local LocX = CenterXY[1]
		local LocY = CenterXY[2]

		for i = 1, Shape[1] do
			if Shape[i+1] ~= nil then
				table.insert(Plot,SetMemory(LocL,SetTo,LocX+Shape[i+1][1]-PlotSize))
				table.insert(Plot,SetMemory(LocR,SetTo,LocX+Shape[i+1][1]+PlotSize))
				table.insert(Plot,SetMemory(LocU,SetTo,LocY+Shape[i+1][2]-PlotSize))
				table.insert(Plot,SetMemory(LocD,SetTo,LocY+Shape[i+1][2]+PlotSize))
				table.insert(Plot,CreateUnit(PerUnit,UnitId,Location,Owner))
				table.insert(Plot,SetMemory(LocL,SetTo,LocX+Shape[i+1][1]-SizeofLoc))
				table.insert(Plot,SetMemory(LocR,SetTo,LocX+Shape[i+1][1]+SizeofLoc))
				table.insert(Plot,SetMemory(LocU,SetTo,LocY+Shape[i+1][2]-SizeofLoc))
				table.insert(Plot,SetMemory(LocD,SetTo,LocY+Shape[i+1][2]+SizeofLoc))
				if DestXY == nil then
					if Direction == nil then
						table.insert(Plot,SetMemory(OLocL,Add,OrderShape[i+1][1]))
						table.insert(Plot,SetMemory(OLocR,Add,OrderShape[i+1][1]))
						table.insert(Plot,SetMemory(OLocU,Add,OrderShape[i+1][2]))
						table.insert(Plot,SetMemory(OLocD,Add,OrderShape[i+1][2]))
						table.insert(Plot,Order(UnitId,Owner,Location,OrderType,OrderLocation))
						table.insert(Plot,SetMemory(OLocL,Add,0-OrderShape[i+1][1]))
						table.insert(Plot,SetMemory(OLocR,Add,0-OrderShape[i+1][1]))
						table.insert(Plot,SetMemory(OLocU,Add,0-OrderShape[i+1][2]))
						table.insert(Plot,SetMemory(OLocD,Add,0-OrderShape[i+1][2]))
					else
						table.insert(Plot,SetMemory(OLocL,Add,OrderShape[Shape[1]+2-i][1]))
						table.insert(Plot,SetMemory(OLocR,Add,OrderShape[Shape[1]+2-i][1]))
						table.insert(Plot,SetMemory(OLocU,Add,OrderShape[Shape[1]+2-i][2]))
						table.insert(Plot,SetMemory(OLocD,Add,OrderShape[Shape[1]+2-i][2]))
						table.insert(Plot,Order(UnitId,Owner,Location,OrderType,OrderLocation))
						table.insert(Plot,SetMemory(OLocL,Add,0-OrderShape[Shape[1]+2-i][1]))
						table.insert(Plot,SetMemory(OLocR,Add,0-OrderShape[Shape[1]+2-i][1]))
						table.insert(Plot,SetMemory(OLocU,Add,0-OrderShape[Shape[1]+2-i][2]))
						table.insert(Plot,SetMemory(OLocD,Add,0-OrderShape[Shape[1]+2-i][2]))
					end
				else
					local OLocX = DestXY[1]
					local OLocY = DestXY[2]
					if Direction == nil then
						table.insert(Plot,SetMemory(OLocL,SetTo,OLocX+OrderShape[i+1][1]))
						table.insert(Plot,SetMemory(OLocR,SetTo,OLocX+OrderShape[i+1][1]))
						table.insert(Plot,SetMemory(OLocU,SetTo,OLocY+OrderShape[i+1][2]))
						table.insert(Plot,SetMemory(OLocD,SetTo,OLocY+OrderShape[i+1][2]))
						table.insert(Plot,Order(UnitId,Owner,Location,OrderType,OrderLocation))
					else
						table.insert(Plot,SetMemory(OLocL,SetTo,OLocX+OrderShape[Shape[1]+2-i][1]))
						table.insert(Plot,SetMemory(OLocR,SetTo,OLocX+OrderShape[Shape[1]+2-i][1]))
						table.insert(Plot,SetMemory(OLocU,SetTo,OLocY+OrderShape[Shape[1]+2-i][2]))
						table.insert(Plot,SetMemory(OLocD,SetTo,OLocY+OrderShape[Shape[1]+2-i][2]))
						table.insert(Plot,Order(UnitId,Owner,Location,OrderType,OrderLocation))
					end
				end
				if PerAction ~= nil then
					for k, v in pairs(PerAction) do
						table.insert(Plot,v)
					end
				end
			end
		end
	end

	if Action ~= nil then
		for k, v in pairs(Action) do
			table.insert(Plot,v)
		end
	end

	local k = 1
	local Size = #Plot

	local Y = {}
	if Preserve ~= nil then
		table.insert(Y,PreserveTrigger())
	end

	while k <= Size do
		if Size - k + 1 >= 63 then
			local X = {}
			for i = 0, 62 do
				table.insert(X, Plot[k])
				k = k + 1
			end
			Trigger {
				players = {PlayerID},
				conditions = {
                    Label(0),
					Condition,
				},
				actions = {
					X,
					Y,
				},
			}
		else
			local X = {}
			repeat
				table.insert(X, Plot[k])
				k = k + 1
			until k == Size + 1
			Trigger {
				players = {PlayerID},
				conditions = {
                    Label(0),
					Condition,
				},
				actions = {
					X,
					Y,
				},
			}
		end
	end
end

function CreateMShapes(Name,Pathdata,Type,Init1,Dev1,Init2,Dev2,InvertFlag)
	local InitTemp1 = Init1
	local InitTemp2 = Init2
	for i = 1, 8 do
		local varName = Name ..'_'.. i
		local varName2 = Name ..'_'.. i
		local ShapeType = Type
		if i <= 4 then
			if ShapeType == 1 then
				_G[varName] = CS_FillPathGradX(Pathdata,1,InitTemp1,"GRADX",3,0,0,1)
			else if ShapeType == 2 then
				_G[varName] = CS_FillPathGradY(Pathdata,1,InitTemp1,"GRADX",3,0,0,1)
			end end
			if i == 1 then
				InitTemp1 = InitTemp1-Dev1*(5-i)-Dev1
			else
				InitTemp1 = InitTemp1-Dev1*(5-i)
			end
		else -- 5<=i<=8
			if ShapeType == 1 then
				_G[varName] = CS_FillPathGradX(Pathdata,1,InitTemp2,"GRADX",3,0,0,1)
			else if ShapeType == 2 then
				_G[varName] = CS_FillPathGradY(Pathdata,1,InitTemp2,"GRADX",3,0,0,1)
			end end
			if i == 5 then
				InitTemp2= InitTemp2-Dev2*(9-i)-Dev2*2
			else if i == 6 then
				InitTemp2= InitTemp2-Dev2*(9-i)-Dev2*1.25
			else -- i == 7
				InitTemp2= InitTemp2-Dev2*(9-i)-Dev2*0.75
			end end
			
		end
		if InvertFlag == 0 then
			_G[varName2] = _G[varName]
		else if InvertFlag == 1 then
			_G[varName2] = CS_InvertXY(_G[varName],nil,0)
		end end
	end
end

function dthGenfunc(ScannedUnitID, Cr8ID, Cr8num, Owner, OrderType,SettingFlagVar)
        
	if SettingFlagVar ~= nil then
		dthGenfuncTable = {}
		for i = 1, #Cr8ID do
			table.insert(dthGenfuncTable,CreateUnit(Cr8num[i], Cr8ID[i], "248", Owner))
			table.insert(dthGenfuncTable,Order(Cr8ID[i], Owner, "248", OrderType, "home"))
		end
		TriggerX(FP, {DeathsX(CurrentPlayer,Exactly,ScannedUnitID,0,0xFF),CDeaths(FP, Exactly, SettingFlagVar, SettingFlag)}, {
			dthGenfuncTable
		}, preserved)
	else
		dthGenfuncTable = {}
		for i = 1, #Cr8ID do
			table.insert(dthGenfuncTable,CreateUnit(Cr8num[i], Cr8ID[i], "248", Owner))
			table.insert(dthGenfuncTable,Order(Cr8ID[i], Owner, "248", OrderType, "home"))
		end
		TriggerX(FP, {DeathsX(CurrentPlayer,Exactly,ScannedUnitID,0,0xFF)}, {
			dthGenfuncTable
		}, preserved)
	end
end

end