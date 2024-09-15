function Define_Shape()
    
    upperTri = CSMakePolygonX(3, 48, 0, CS_Level("PolygonX", 3, 5), CS_Level("PolygonX", 3, 4))
    downTri = CS_InvertXY(upperTri, nil, 1)
    upperTriA = CSMakePolygonX(3, 1, 0, CS_Level("PolygonX", 3, 5), CS_Level("PolygonX", 3, 4))
    Line1 = CSMakeLineX(1,64,0,10,1)
    square1 = CSMakePolygonX(4, 48, 0, CS_Level("PolygonX", 4, 5), CS_Level("PolygonX", 4, 4))
    square2 = CS_Rotate(square1, 45)
    square1a = CSMakePolygonX(4, 1, 0, CS_Level("PolygonX", 4, 5), CS_Level("PolygonX", 4, 4))
    sixline = CSMakeLine(6,80,0,15,0)
    baseCircle = CS_RatioXY(CSMakeCircleX(6,64,30,150,96),1,0.5)
    LGU1 = CSMakePolygonX(6,64,30,6,0)
    LGU2 = CSMakePolygonX(6,64,30,24,6) -- 3
    LGU3 = CSMakePolygonX(6,64,30,54,24) -- 5
    LGU4 = CSMakePolygonX(6,64,30,96,54) -- 7

    LGU1a = CSMakePolygonX(6,1,30,6,0)
    LGU2a = CSMakePolygonX(6,1,30,24,6)
    LGU3a = CSMakePolygonX(6,1,30,54,24)
    LGU4a = CSMakePolygonX(6,1,30,96,54) -- 7

    PB = CSMakePolygon(6,80,0,37,1)
    PBA = CSMakePolygon(6,1,0,37,1)

    baseStar = CSMakeStarX(5,108,64,36,CS_Level("StarX", 5, 6),CS_Level("StarX", 5, 5))
    function HyperCycloidC(T) return {12*math.sin(T) - 4*math.sin(3*T), 13*math.cos(T) - 5*math.cos(2*T) - 2*math.cos(3*T) - math.cos(4*T)} end
	HCCC = CSMakeGraphT({12,12},"HyperCycloidC",0,0,2,2,51) 
	HCC0 = CS_Rotate(HCCC,180)
	Heart = CS_RemoveStack(HCC0,15,0) -------하트

end