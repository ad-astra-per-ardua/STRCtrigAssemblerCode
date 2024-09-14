function Define_Shape()
    
    upperTri = CSMakePolygonX(3, 48, 0, CS_Level("PolygonX", 3, 5), CS_Level("PolygonX", 3, 4))
    downTri = CS_InvertXY(upperTri, nil, 1)
    upperTriA = CSMakePolygonX(3, 1, 0, CS_Level("PolygonX", 3, 5), CS_Level("PolygonX", 3, 4))
    Line1 = CSMakeLineX(1,64,0,10,1)
    square1 = CSMakePolygonX(4, 48, 0, CS_Level("PolygonX", 4, 5), CS_Level("PolygonX", 4, 4))
    square2 = CS_Rotate(square1, 45)
    square1a = CSMakePolygonX(4, 1, 0, CS_Level("PolygonX", 4, 5), CS_Level("PolygonX", 4, 4))
    sixline = CSMakeLine(6,80,0,15,0)
    CircleB = CSMakeCircle(4,40,0,PlotSizeCalc(4, 1),PlotSizeCalc(4, 0)) ---- 큰 원
	EllipseB = CS_Distortion(CircleB,{3,1.5},{3,1.5},{3,1.5},{3,1.5}) ---- 큰 타원

end