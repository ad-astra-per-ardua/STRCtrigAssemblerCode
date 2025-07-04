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
			CS_BMPGraph(shape, {0xFFFFFF}, fileName, {{-10},{10}}, {{-10},{10}}, 1, nil, nil, nil, 3, 1, 1, 1)
			idx = idx + 1
		end

		-- Overlapped
		local debugFileName = tostring(idx2)
		CS_BMPGraph(debugShape, {0xFFFFFF}, "Overlapped_"..debugFileName, {{-10},{10}}, {{-10},{10}}, 1, nil, nil, nil, 3, 1, 1, 1)
		idx2 = idx2 + 1

		return debugShape
	end
end

	PSZ = 128
	DthdetectShape = CSMakePolygon(3, 128, 0, 4, 1)
	DthdetectShape2 = CSMakePolygon(3, 128, 20, 4, 1)
	DthdetectShape3 = CSMakePolygon(3, 128, 40, 4, 1)


    DHSH1 = CSMakePath({-160,128},{160,128},{64,0},{160,-128},{-160,-128},{-64,0})
    DHSH1T1 = CS_SortX(CS_FillPathXY2(DHSH1, 1, 60, 60, 0, 0, 1),1)
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
	DH2PRT1lower1 = CS_SortY(CS_MoveXY(CSMakeLine(2, 96, 90, 13, 0),0,-90),1)
	DH2PRT1lower2 = CS_SortY(CS_MoveXY(CSMakeLine(2, 96, 90, 13, 0),0,-30),1)
	DH2PRT1lower3 = CS_SortY(CS_MoveXY(CSMakeLine(2, 96, 90, 13, 0),0,30),1)
	DH2PRT1lower4 = CS_SortY(CS_MoveXY(CSMakeLine(2, 96, 90, 13, 0),0,90),1)

	DH2PRT1Horizontal1 = CS_SortY(CS_MoveXY(CSMakeLine(2, 96, 0, 12, 0),-90,0),0)
	DH2PRT1Horizontal2 = CS_SortY(CS_MoveXY(CSMakeLine(2, 96, 0, 12, 0),-30,0),0)
	DH2PRT1Horizontal3 = CS_SortY(CS_MoveXY(CSMakeLine(2, 96, 0, 12, 0),30,0),0)
	DH2PRT1Horizontal4 = CS_SortY(CS_MoveXY(CSMakeLine(2, 96, 0, 12, 0),90,0),0)

	DH2PRT2ASHAPE1EFT = CSMakeCircle(8, 48, 0, CS_Level("Circle", 8, 7), CS_Level("Circle", 8, 6)) -- 약 유닛 큰원
	DH2PRT2ASHAPE2EFT = CSMakeCircle(8, 48, 0, CS_Level("Circle", 8, 4), CS_Level("Circle", 8, 3)) -- 약 유닛 작은원

	DH2PRT2ASHAPE1EFTF = CS_Overlap(DH2PRT2ASHAPE1EFT, DH2PRT2ASHAPE2EFT)

	DH2PRT2ASHAPEplot1 = CS_Split(DH2PRT2ASHAPE1EFT, {DH2PRT2ASHAPE1EFT[1] / 2 , "splitfunc3"}, 0, 0)
	DH2PRT2ASHAPEplot2 = CS_Split(DH2PRT2ASHAPE2EFT, {DH2PRT2ASHAPE2EFT[1] / 2 , "splitfunc3"}, 0, 0)  

	DH2PRT2ASHAPEplot2F = CS_Overlap(DH2PRT2ASHAPEplot1, DH2PRT2ASHAPEplot2)

	DH2PRT2ASHAPEplot3 = CS_Split(DH2PRT2ASHAPE1EFT, {DH2PRT2ASHAPE1EFT[1] / 3, "splitfunc4"}, 0, 0) -- 영작유닛 큰원
	DH2PRT2ASHAPEplot4 = CS_Split(DH2PRT2ASHAPE2EFT, {DH2PRT2ASHAPE2EFT[1] / 3, "splitfunc4"}, 0, 0) -- 영작유닛 작은원

	DH2PRT2ASHAPEplot3F = CS_Overlap(DH2PRT2ASHAPEplot3, DH2PRT2ASHAPEplot4)

	DH2PRT2TEMPline1EFT = CSMakeLine(2, 48, 0, 19, 1)
	DH2PRT2TEMPline2EFT = CSMakeLine(2, 48, 90, 19, 0)
	DH2PRT2TEMPline1 = CSMakeLine(2, 96, 0, 9, 1)
	DH2PRT2TEMPline2 = CSMakeLine(2, 96, 90, 9, 0)

	DH2PRT2SHAPEline1EFT = CS_OverlapX(DH2PRT2TEMPline1EFT, DH2PRT2TEMPline2EFT)
	DH2PRT2SHAPEline1 = CS_OverlapX(DH2PRT2TEMPline1,DH2PRT2TEMPline2)

	DH2PRT2SHAPE3EFT = CS_Overlap(DH2PRT2ASHAPE1EFTF, DH2PRT2SHAPEline1EFT)

	------------- duskHive5 == flashback ----
	DH5PTH1 = CS_MoveCenter(CSMakePath({2036, 229},{2125, 155},{2171, 56},{2321, 46},{2334, 137},{2425, 203},{2395, 335},{2375, 395},{2285, 403},{2109, 435},{2051, 355}),0,0)
	DH5Entrance = CS_MoveCenter({4   ,{1922, 315},{1921, 376},{1920, 438},{1919, 504}},-192,256)
	DH5RightSide = CS_MoveCenter({4   ,{2305, 475},{2363, 423},{2427, 357},{2493, 293}},160,160)
	DH5UpperSide = CS_MoveCenter({3   ,{2462, 59},{2523, 120},{2595, 156}},320,-144)

	CreateMShapes("DH5PTH1SHAPE", DH5PTH1, 1, 64, 4, 64, 10, 0) -- 1, 2, 3 | H T E

	DH5PTH1SHAPEF4 = CS_DoubleSortRA(DH5PTH1SHAPE2, 32, 1, 0)
	DH5PTH1SHAPEF5 = CS_DoubleSortRA(DH5PTH1SHAPE2, 32, 0, 0)

	function SortXYFunc(X) return {math.abs(X)} end
	DH5PTH1SHAPEF6 = CS_SortXY(DH5PTH1SHAPE2, "SortXYFunc", nil, 0)
	DH5PTH1SHAPEF7 = CS_SortXY(DH5PTH1SHAPE2, "SortXYFunc", nil, 1)

	------------------- Start Of duskHat5  --------------
	---Entrance == A | Main == B
	---A + B | B | X Desc Sorted A+B | 3T | Eft | Eft | 1T + H, A+B | Y Aesc Eft + Eft A+B, 1T + H 
	
	DHat5PTH1 = CS_MoveCenter(CSMakePath({1840, 310},{1839, 557},{1935, 309},{1937, 561},{1940, 358},{2011, 359},{2014, 528},{1941, 525},{1830, 359},{1788, 355},{1782, 457},{1835, 457}),-320,-64)
	DHat5PTH2 = CS_MoveCenter(CSMakePath({2208, 339},{2065, 487},{2213, 636},{2372, 483}),0,0)
	-- CreateMShapes("DHat5ShapePartI", DHat5PTH1, 1, 64, 5, 64, 10, 0)
	CreateMShapes("DHat5ShapePartII", DHat5PTH2, 1, 96, 4, 96, 6, 0) -- 4, 3, 2 | 3, 2, H
	DHat5ShapePartI1 = CS_FillPathXY(DHat5PTH1, 1, 48, 48, 0) 

	DHat5ShapeOverlapped = CS_Overlap(DHat5ShapePartI1, DHat5ShapePartII4)
	DHat5ShapeOverlapped_SortYD = CS_SortY(DHat5ShapeOverlapped, 1)
	DHat5ShapeOverlapped_SortYA = CS_SortY(DHat5ShapeOverlapped, 0)
	DHat5ShapeOverlapped_SortXD = CS_SortX(DHat5ShapeOverlapped, 1)
	DHat5ShapeOverlapped_SortXA = CS_SortX(DHat5ShapeOverlapped, 0)

	DHat5ShapePartII4_SortXD = CS_SortX(DHat5ShapePartII4,1)
	DHat5ShapePartII4_SortXA = CS_SortX(DHat5ShapePartII4,0)
	DHat5ShapePartII4_SortYD = CS_SortY(DHat5ShapePartII4,1)
	DHat5ShapePartII4_SortYA = CS_SortY(DHat5ShapePartII4,0)

	DHat5ShapePartII3_SortXD = CS_SortX(DHat5ShapePartII3,1)
	DHat5ShapePartII3_SortXA = CS_SortX(DHat5ShapePartII3,0)
	DHat5ShapePartII3_SortYD = CS_SortY(DHat5ShapePartII3,1)
	DHat5ShapePartII3_SortYA = CS_SortY(DHat5ShapePartII3,0)

	DHat5ShapePartII2_SortXD = CS_SortX(DHat5ShapePartII2,1)
	DHat5ShapePartII2_SortXA = CS_SortX(DHat5ShapePartII2,0)
	DHat5ShapePartII2_SortYD = CS_SortY(DHat5ShapePartII2,1)
	DHat5ShapePartII2_SortYA = CS_SortY(DHat5ShapePartII2,0)

	DHat5ShapePartII4_SortXY0 = CS_SortXY(DHat5ShapePartII4,"SortXYFunc",nil,0)
	DHat5ShapePartII4_SortXY1 = CS_SortXY(DHat5ShapePartII4,"SortXYFunc",nil,1)
	--------------- duskHat4 -------------

	DHAT4ShapePart1 = CS_SortR(CSMakePolygon(6,80,0,61,37),1)
    DHAT4ShapePart2 = CS_SortR(CSMakePolygon(6,80,0,37,19),1)
    DHAT4ShapePart3 = CS_SortR(CSMakePolygon(6,80,0,19,7),1)
	DHAT4ShapePart4 = CS_SortR(CSMakePolygon(6,80,0,7,1),1)
	DHAT4ShapePart5 = CS_SortR(CS_OverlapX(DHAT4ShapePart1,DHAT4ShapePart2,DHAT4ShapePart3,DHAT4ShapePart4),1)

	




	ShapeDebugging({
		DHAT4ShapePart1,DHAT4ShapePart2,DHAT4ShapePart3,DHAT4ShapePart4
	})

	-- PushErrorMsg(lairShape2[1]) -- Check dotted number 

end