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

	-- temp1 = CSMakePolygon(6,80,0,CS_Level("Polygon",6,6),0)

	-- function HyperCycloidB(T) return {4*math.cos(T) + 2*math.cos(4*T), 4*math.sin(T) - 2*math.sin(4*T)} end
	-- HCB0 = CSMakeGraphT({32,32},"HyperCycloidB",0,0,12,12,120)
	-- temp1 = CS_RatioXY(CS_RemoveStack(HCB0,12,0),1.5,1.5)

	
	-- function HyperCycloid1(T) return {2.1*math.cos(T) - math.cos(2.1*T), 2.1*math.sin(T) - math.sin(2.1*T)} end 
	-- Hp0 = CSMakeGraphT({192,192},"HyperCycloid1",0,0,10,10,200)
	-- temp1 = CS_RatioXY(CS_RemoveStack(Hp0,10),0.5,0.5)

	-- temp1 = CSMakeCircle(6,64,0,61,1)
	
	-- Eftstar = CSMakeStarX(5,108,64,36,90,0)
	-- temp2 = CS_RemoveStack(HCD0,20,0)
	-- temp1 = CSMakePolygon(6,80,0,127,1)

	
    -- CS_BMPGraph(temp1, {0x00FFC0}, "1", {{-10},{10}}, {{-10},{10}}, 1, nil, nil, nil, 3, 1, 1, 1)
end