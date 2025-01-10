function Define_Shape()
    function GRADX(X) return X end
    function GRADRY(Y) return Y end
    DHSH1 = CSMakePath({-160,128},{160,128},{64,0},{160,-128},{-160,-128},{-64,0})
    DHSH1T1 = CS_FillPathGradXD(DHSH1, 1, 60, "GRADRY", 3, 0, 30,1)
    SHH15x = CSMakePath({0,-191},{-240,-179},{-240,17},{363,-15})
    SHH15xa = CS_FillPathGradX(SHH15x,1,60,"GRADX",3,0,0,1)
    baseCircle = CS_RatioXY(CSMakeCircleX(6,64,30,150,96),1,0.5)
    baseStar = CSMakeStarX(5,108,64,36,CS_Level("StarX", 5, 6),CS_Level("StarX", 5, 5))
    function HyperCycloidC(T) return {12*math.sin(T) - 4*math.sin(3*T), 13*math.cos(T) - 5*math.cos(2*T) - 2*math.cos(3*T) - math.cos(4*T)} end
	HCCC = CSMakeGraphT({12,12},"HyperCycloidC",0,0,2,2,51) 
	HCC0 = CS_Rotate(HCCC,180)
	Heart = CS_RemoveStack(HCC0,15,0) -------하트

    HEFT1 = CS_SortA(CS_Rotate(baseCircle, 45),0)
    HEFT2 = CS_SortA(baseStar,0)
    HEFT3 = CS_SortA(Heart,1)
    HEFT4 = CS_SortA(CS_Rotate(baseCircle, -45),0)
    HEFT5 = CS_SortA(baseStar,1)
    HEFT6 = CS_SortA(CS_Rotate(baseCircle, -45),0)
    HEFT7 = CS_SortA(Heart,0)


    CS_BMPGraph(DHSH1T1, {0x00FFC0}, "1", {{-10},{10}}, {{-10},{10}}, 1, nil, nil, nil, 3, 1, 1, 1)

end