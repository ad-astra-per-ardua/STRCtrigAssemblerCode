function check_shape()
	CircleA = CSMakeCircle(6,60,0,PlotSizeCalc(6, 2),PlotSizeCalc(6, 1)) ---- 작은 원
	EllipseA = CS_Distortion(CircleA,{2,1},{2,1},{2,1},{2,1}) ---- 작은 타원
	EllipseRA = CS_Rotate(EllipseA,15) ---- 작은 타원 회전
	CircleB = CSMakeCircle(6,40,0,PlotSizeCalc(6, 2),PlotSizeCalc(6, 1)) ---- 큰 원
	EllipseB = CS_Distortion(CircleB,{3,1.5},{3,1.5},{3,1.5},{3,1.5}) ---- 큰 타원
	EllipseRB = CS_Rotate(EllipseB,40) ---- 큰 타원 회전
	EllipseRAD = CS_MoveXY(EllipseRA,0,350) ---- 큰 타원 평행이동
	EllipseShape = CS_Merge(EllipseRB,EllipseRAD,64,1) ---- 작은타원 큰타원 합
	EllipseMirror = CS_MirrorX(EllipseShape,300,1,1) --나비
	EllipseMirror1 = CS_MoveXY(EllipseMirror,-300,-250)
	CircleA = CSMakeCircle(4,60,0,PlotSizeCalc(4, 1),PlotSizeCalc(4, 0)) ---- 작은 원
	EllipseA = CS_Distortion(CircleA,{2,1},{2,1},{2,1},{2,1}) ---- 작은 타원
	EllipseRA = CS_Rotate(EllipseA,15) ---- 작은 타원 회전
	CircleB = CSMakeCircle(4,40,0,PlotSizeCalc(4, 1),PlotSizeCalc(4, 0)) ---- 큰 원
	EllipseB = CS_Distortion(CircleB,{3,1.5},{3,1.5},{3,1.5},{3,1.5}) ---- 큰 타원
	EllipseRB = CS_Rotate(EllipseB,40) ---- 큰 타원 회전
	EllipseRAD = CS_MoveXY(EllipseRA,0,350) ---- 큰 타원 평행이동
	EllipseShape = CS_Merge(EllipseRB,EllipseRAD,64,1) ---- 작은타원 큰타원 합
	EllipseMirror = CS_MirrorX(EllipseShape,300,1,1) --나비
	EllipseMirror2 = CS_MoveXY(EllipseMirror,-300,-250)

	STGateHD1 = CS_RatioXY(EllipseMirror2, 0.5, 0.5)
	STGateSC1 = CS_RatioXY(EllipseMirror1, 0.5, 0.5)
    
    Lairbaseshape1 = CS_Merge(STGateHD1, STGateSC1, 1, 1)
	LairbaseshapeArrival = CSMakeLine(1, 1, 0, 64, 0)


	CircleB = CSMakeCircle(6,40,0,91,19+18) ---- 큰 원
	EllipseB = CS_Distortion(CircleB,{3,1.5},{3,1.5},{3,1.5},{3,1.5}) ---- 큰 타원
	EllipseRB = CS_Rotate(EllipseB,40) ---- 큰 타원 회전
	CircleA = CSMakeCircle(4,60,0,PlotSizeCalc(4, 1),PlotSizeCalc(4, 0))
	EllipseA = CS_Distortion(CircleA,{2,1},{2,1},{2,1},{2,1})
	EllipseRA = CS_Rotate(EllipseA,15) ---- 작은 타원 회전
	EllipseRAD = CS_MoveXY(EllipseRA,0,500) ---- 큰 타원 평행이동
	EllipseShape = CS_Merge(EllipseRB,EllipseRAD,64,1) ---- 작은타원 큰타원 합
	EllipseMirror = CS_MirrorX(EllipseShape,500,1,1) --나비	
	function CSMakeTornado(Point,Radius,Angle,Numner,Outside,StartNumber)
		local Shape = {0}
		if StartNumber == nil then StartNumber = 1 end
		for i = StartNumber, Numner do
			CS_OverlapShape(Shape,CSMakePolygon(Point,i*Radius,i*Angle,Point+1,0))
		end
		if Outside~=nil then
			return CS_Rotate((CS_OverlapShape(Shape,CSMakePolygon(Point,Radius,Numner*Angle,PlotSizeCalc(Point,Numner),PlotSizeCalc(Point,Numner-1)))),-Numner*Angle)
		else
			return Shape
		end
	end
	function CS_OverlapShape(Shape,...)
		local RetShape = Shape
	
		local arg = table.pack(...)
		for k = 1, arg.n do
			RetShape[1] = RetShape[1] + arg[k][1]
			for i = 1, arg[k][1] do
				table.insert(RetShape,{arg[k][i+1][1],arg[k][i+1][2]})
			end
		end
		return RetShape	
	end
	function CSMakeFillPathXY(Range,Radius)
		local a = CSMakePath({-Range,-Range},{Range,-Range},{Range,Range},{-Range,Range})
		return CS_FillPathXY(a,0,Radius,Radius)
	end

	-- Mem_shape1 = CS_CompassA({-4096,4096}, {2048,0}, {0,-2048}, 0, 30)
	-- Mem_shape2 = CS_CompassA({4096,4096}, {-2048,0}, {0,-2048}, 0, 30)
	-- Mem_shape3 = CS_CompassA({-4096,-4096}, {0,2048}, {2048,0}, 0, 30)
	-- Mem_shape4 = CS_CompassA({4096,-4096}, {0,2048}, {-2048,0}, 0, 30)

	temp1 = CSMakePolygon(3, 32, 0, CS_Level("Polygon", 3, 10), CS_Level("Polygon", 3, 9))
	

	-- temp1 = CSMakeCircle(6,30,0,PlotSizeCalc(6, 10),0)
	
	
	
	function HyperCycloid1(T) return {2.1*math.cos(T) - math.cos(2.1*T), 2.1*math.sin(T) - math.sin(2.1*T)} end 
	Hp0 = CSMakeGraphT({192,192},"HyperCycloid1",0,0,10,10,200)
	Hp1 = CS_RatioXY(CS_RemoveStack(Hp0,10),0.5,0.5)
	temp = CS_RatioXY(Hp1,4,2)
    -- CS_BMPGraph(temp1, {0x00FFC0}, "1", {{-10},{10}}, {{-10},{10}}, 1, nil, nil, nil, 3, 1, 1, 1)
end