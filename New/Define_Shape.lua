function Define_Shape()
    
    upperTri = CSMakePolygonX(3, 48, 0, CS_Level("PolygonX", 3, 5), CS_Level("PolygonX", 3, 4))
    downTri = CS_InvertXY(upperTri, nil, 1)
    upperTriA = CSMakePolygonX(3, 1, 0, CS_Level("PolygonX", 3, 5), CS_Level("PolygonX", 3, 4))
    Line1 = CSMakeLineX(1,64,0,10,1)
    square1 = CSMakePolygonX(4, 48, 0, CS_Level("PolygonX", 4, 5), CS_Level("PolygonX", 4, 4))
    square2 = CS_Rotate(square1, 45)
    square1a = CSMakePolygonX(4, 1, 0, CS_Level("PolygonX", 4, 5), CS_Level("PolygonX", 4, 4))
    sixline = CSMakeLine(6,80,0,15,0)

end