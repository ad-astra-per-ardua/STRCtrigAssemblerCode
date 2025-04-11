function Define_Shape()
    function GRADX(X) return math.abs(X) end
    function GRADRY(Y) return Y*3 end
    function SORTXYT(X,Y) return {math.abs(X)} end

	function CreateMShapes(Name,Pathdata,Type,Init1,Dev1,Init2,Dev2,InvertFlag)
		local InitTemp1 = Init1
		local InitTemp2 = Init2
	for i = 1, 8 do
		local varName = Name .. i
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

local idx = 0
local idx2 = 0

function ShapeDebugging(shapeTable)
    local args = {}
	if shapeTable ~= nil and next(shapeTable) ~= nil then
		for key, shape in pairs(shapeTable) do
			_G[key] = shape
			table.insert(args, shape)
		end

		local debugShape = CS_OverlapX(table.unpack(args))

		for _, shape in ipairs(args) do
			local fileName = tostring(idx)
			CS_BMPGraph(shape, {0x000000}, fileName, {{-10},{10}}, {{-10},{10}}, 1, nil, nil, nil, 3, 1, 1, 1)
			idx = idx + 1
		end

		-- Overlapped
		local debugFileName = tostring(idx2)
		CS_BMPGraph(debugShape, {0x000000}, "Overlapped_"..debugFileName, {{-10},{10}}, {{-10},{10}}, 1, nil, nil, nil, 3, 1, 1, 1)
		idx2 = idx2 + 1

		return debugShape
	end
end

	PSZ = 128
	DthdetectShape = CSMakePolygon(3, 128, 0, 4, 1)
	DthdetectShape2 = CSMakePolygon(3, 128, 20, 4, 1)
	DthdetectShape3 = CSMakePolygon(3, 128, 40, 4, 1)


    DHSH1 = CSMakePath({-160,128},{160,128},{64,0},{160,-128},{-160,-128},{-64,0})
    DHSH1T1 = CS_FillPathXY2(DHSH1, 1, 60, 60, 0, 0, 1)
    SHH15x = CSMakePath({0,-191},{-240,-179},{-240,17},{363,-15})

	-- 1 ~ 4 4는 거의 이펙트로 사용
	-- 5 ~ 7 5는 강유닛 혹은 영작유닛
	DLSH3 = CS_InvertXY(CSMakePath({-32,144}, {-160,112}, {-160,-48}, {-64,-80}, {-32,-144}, {160,-144}, {64,80}, {-32,144}),nil,1)
	CreateMShapes("DLSH3SH",DLSH3, 2, 64, 4, 128, 10, 0)
	DLSH3SHEft1 = CS_SortY(DLSH3SH_4, 1)
	DLSG3SH1G1 = CS_SortY(DLSH3SH1, 1)
	DLSH3SH5G2 = CS_SortR(DLSH3SH5, 0)
	DLSH3SH5G3 = CS_InvertXY(CS_SortR(DLSH3SH5, 1),nil,1)
	DLSH3SHEft2 = CS_InvertXY(CS_SortR(DLSH3SH_4, 1),nil,1)
	DLSH3SH5G4 = CS_SortR(DLSH3SH1, 0)

	DuskHive1PTH = CS_MoveXY(CS_InvertXY(CSMakePath(
	{0,1.5 * PSZ},{-1 * PSZ, 1 * PSZ}, {-2 * PSZ, 1 * PSZ},{-2.2*PSZ, 0.5*PSZ},{-2*PSZ,-0.5*PSZ},{-1*PSZ, 1*PSZ}, {0,-1.5*PSZ}, {1.5*PSZ,-1.5*PSZ},
	{2*PSZ, -0.5*PSZ},{2*PSZ,1.5*PSZ}
	),nil,0),0,-3)
	CreateMShapes("DuskHive1SH", DuskHive1PTH, 1, 64, 4, 128, 10, 0) -- 2 약 지상유닛, 1 공중유닛, 5 강유닛
	DuskHive1SH1plt = CS_SortX(DuskHive1SH1, 0)
	DuskHive1SH2plt = CS_SortX(DuskHive1SH2, 0)
	DuskHive1SH5plt = CS_SortX(DuskHive1SH_5, 0)
	DuskHive1SH6plt = CS_SortX(DuskHive1SH_6, 0)

	DuskCerebratePTH = CS_InvertXY(CSMakePath(
		{0,0},{-2/3*PSZ,5/3*PSZ},{-(3+2/3)*PSZ,-4/3*PSZ},{-(3+2/3)*PSZ,-(2+1/3)*PSZ},{-(2+2/3)*PSZ,-(3+1/3)*PSZ},{-(1+2/3)*PSZ,-(3+1/3)*PSZ},{1/3*PSZ,-(1+1/3*PSZ)},{4/3*PSZ,-4/3*PSZ},{4/3*PSZ,2/3*PSZ}
	),nil,0)
	CreateMShapes("DuskCerebrateSH", DuskCerebratePTH, 1, 64, 4, 128, 10, 0) -- 2 약 지상유닛, 1 공중유닛 5 강유닛

	line1 = CS_SortX(CSMakeLine(2, 128, 90, 7, 0),0)
	line2 = CS_SortY(CSMakeLine(2, 96, 0, 5, 0),0)
	

    SHH15xa = CS_FillPathGradX(SHH15x,1,60,"GRADX",3,0,0,1)
    baseCircle = CS_RatioXY(CSMakeCircleX(6,64,30,150,96),1,0.5)
    baseCircle1 = CS_Rotate(baseCircle, 90)
    baseStar = CS_SortXY(CSMakeStarX(5,108,64,36,CS_Level("StarX", 5, 6),CS_Level("StarX", 5, 5)),"SORTXYT",nil,1)
    function HyperCycloidC(T) return {12*math.sin(T) - 4*math.sin(3*T), 13*math.cos(T) - 5*math.cos(2*T) - 2*math.cos(3*T) - math.cos(4*T)} end
	HCCC = CSMakeGraphT({12,12},"HyperCycloidC",0,0,2,2,51) 
	HCC0 = CS_Rotate(HCCC,180)
	Heart = CS_SortXY(CS_RemoveStack(HCC0,15,0),"SORTXYT",nil,1) -------하트
	Heart = CS_SortA(Heart,0)
    baseCircle2 = CS_RatioXY(CSMakeCircleX(6,128,30,54,24),1,0.5)
    baseCircle3 = CS_Rotate(baseCircle2, 90)

    HEFT1 = CS_SortA(CS_Rotate(baseCircle, 45),0)
    HEFT2 = baseStar
    HEFT3 = Heart
    HEFT4 = CS_SortA(CS_Rotate(baseCircle, -45),0)
    HEFT5 = baseStar
    HEFT6 = CS_SortA(CS_Rotate(baseCircle, -45),0)
    HEFT7 = Heart

	function splitfunc(i) return i*2+1 end
	function splitfunc2(i) return i*3 end
	function splitfunc3(i) return i*2 end
	function splitfunc4(i) return i*4 end

	HeartV2 = CS_Split(CS_SortA(Heart,0), {CS_SortA(Heart,0)[1]/2,"splitfunc"},0,0)
    duskHat3S = CSMakePathX({1.3,1.3},{0,192}, {96,192},{144,16},{32,-112},{-144,-32},{-96,78})
    duskHat3SF = CS_SortXY(CS_FillPathHX2(duskHat3S, 1, 60, 60, 0, 0,45,1),"SORTXYT",nil,0)

    lairShape1 = CSMakeCircleX(6,48,30,150,96)
	lairShape2 = CS_Split(lairShape1, {lairShape1[1] / 3 , "splitfunc2"}, 0, 0)

	TriangleDuskhive1 = CS_RatioXY(CSMakePolygon(3, 80, 0, CS_Level("Polygon", 3, 4), CS_Level("Polygon", 3, 3)),1.1,1.1)
	TriangleDuskhive2 = CS_InvertXY(TriangleDuskhive1,nil,0)
	TriangleDuskhive3 = CSMakePolygon(3, 80, 0, CS_Level("Polygon", 3, 4), CS_Level("Polygon", 3, 3))
	TriangleDuskhive4 = CS_InvertXY(TriangleDuskhive1,nil,0)
	HexagonDuskhive1 = CSMakePolygon(6, 48, 0, CS_Level("Polygon", 6, 5), CS_Level("Polygon", 6, 4))
	PentagonDuskhive1 = CS_SortA(CSMakePolygon(5, 80, 0, CS_Level("Polygon", 5, 4), CS_Level("Polygon", 5, 3)),0)
	
	---- duskHive2 ----
	DH2PRT1lower1 = CS_SortY(CS_MoveXY(CSMakeLine(2, 128, 90, 13, 0),0,60),1)
	DH2PRT1lower2 = CS_SortY(CS_MoveXY(CSMakeLine(2, 128, 90, 13, 0),0,-60),1)
	DH2PRT1lower3 = CS_SortY(CS_MoveXY(CSMakeLine(2, 128, 90, 13, 0),0,180),1)
	DH2PRT1lower4 = CS_SortY(CS_MoveXY(CSMakeLine(2, 128, 90, 13, 0),0,-180),1)

	DH2PRT1Horizontal1 = CS_SortY(CS_MoveXY(CSMakeLine(2, 128, 0, 12, 0),60,0),0)
	DH2PRT1Horizontal2 = CS_SortY(CS_MoveXY(CSMakeLine(2, 128, 0, 12, 0),-60,0),0)
	DH2PRT1Horizontal3 = CS_SortY(CS_MoveXY(CSMakeLine(2, 128, 0, 12, 0),180,0),0)
	DH2PRT1Horizontal4 = CS_SortY(CS_MoveXY(CSMakeLine(2, 128, 0, 12, 0),-180,0),0)

	DH2PRT2ASHAPE1EFT = CSMakeCircle(8, 48, 0, CS_Level("Circle", 8, 7), CS_Level("Circle", 8, 6)) -- 약 유닛 큰원
	DH2PRT2ASHAPE2EFT = CSMakeCircle(8, 48, 0, CS_Level("Circle", 8, 4), CS_Level("Circle", 8, 3)) -- 약 유닛 작은원

	DH2PRT2ASHAPEplot1 = CS_Split(DH2PRT2ASHAPE1EFT, {DH2PRT2ASHAPE1EFT[1] / 2 , "splitfunc3"}, 0, 0)
	DH2PRT2ASHAPEplot2 = CS_Split(DH2PRT2ASHAPE2EFT, {DH2PRT2ASHAPE2EFT[1] / 2 , "splitfunc3"}, 0, 0)  

	DH2PRT2ASHAPEplot3 = CS_Split(DH2PRT2ASHAPE1EFT, {DH2PRT2ASHAPE1EFT[1] / 3, "splitfunc4"}, 0, 0) -- 영작유닛 큰원
	DH2PRT2ASHAPEplot4 = CS_Split(DH2PRT2ASHAPE2EFT, {DH2PRT2ASHAPE2EFT[1] / 3, "splitfunc4"}, 0, 0) -- 영작유닛 작은원

	DH2PRT2TEMPline1EFT = CSMakeLine(2, 48, 0, 19, 1)
	DH2PRT2TEMPline2EFT = CSMakeLine(2, 48, 90, 19, 0)
	DH2PRT2TEMPline1 = CSMakeLine(2, 96, 0, 9, 1)
	DH2PRT2TEMPline2 = CSMakeLine(2, 96, 90, 9, 0)

	DH2PRT2SHAPEline1EFT = CS_OverlapX(DH2PRT2TEMPline1EFT, DH2PRT2TEMPline2EFT)
	DH2PRT2SHAPEline1 = CS_OverlapX(DH2PRT2TEMPline1,DH2PRT2TEMPline2)

	-------------
	



	
	ShapeDebugging({
		DH2PRT2ASHAPEplot1,DH2PRT2ASHAPEplot2,DH2PRT2ASHAPEplot3,DH2PRT2ASHAPEplot4,DH2PRT2SHAPEline1
	})

	-- PushErrorMsg(lairShape2[1]) -- Check dotted number 

end