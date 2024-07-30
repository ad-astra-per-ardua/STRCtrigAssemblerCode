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
    
    temp1 = CS_Merge(STGateHD1, STGateSC1, 1, 1)

    Final_output = CSMakeStar(4, 135, 90, 45, PlotSizeCalc(4*2, 6), PlotSizeCalc(4*2, 5))

    CS_BMPGraph(Final_output, {0x00FFC0}, "1", {{-10},{10}}, {{-10},{10}}, 1, nil, nil, nil, 3, 1, 1, 1)
end