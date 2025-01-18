function Define_Shape()
    function GRADX(X) return X end
    function GRADRY(Y) return Y*3 end
    function SORTXYT(X,Y) return {math.abs(X)} end
    DHSH1 = CSMakePath({-160,128},{160,128},{64,0},{160,-128},{-160,-128},{-64,0})
    DHSH1T1 = CS_FillPathXY2(DHSH1, 1, 60, 60, 0, 0, 1)
    SHH15x = CSMakePath({0,-191},{-240,-179},{-240,17},{363,-15})
    SHH15xa = CS_FillPathGradX(SHH15x,1,60,"GRADX",3,0,0,1)
    baseCircle = CS_RatioXY(CSMakeCircleX(6,64,30,150,96),1,0.5)
    baseCircle1 = CS_Rotate(baseCircle, 90)
    baseStar = CS_SortXY(CSMakeStarX(5,108,64,36,CS_Level("StarX", 5, 6),CS_Level("StarX", 5, 5)),"SORTXYT",nil,1)
    function HyperCycloidC(T) return {12*math.sin(T) - 4*math.sin(3*T), 13*math.cos(T) - 5*math.cos(2*T) - 2*math.cos(3*T) - math.cos(4*T)} end
	HCCC = CSMakeGraphT({12,12},"HyperCycloidC",0,0,2,2,51) 
	HCC0 = CS_Rotate(HCCC,180)
	Heart = CS_SortXY(CS_RemoveStack(HCC0,15,0),"SORTXYT",nil,1) -------하트
    baseCircle2 = CS_RatioXY(CSMakeCircleX(6,128,30,54,24),1,0.5)
    baseCircle3 = CS_Rotate(baseCircle2, 90)


    HEFT1 = CS_SortA(CS_Rotate(baseCircle, 45),0)
    HEFT2 = baseStar
    HEFT3 = Heart
    HEFT4 = CS_SortA(CS_Rotate(baseCircle, -45),0)
    HEFT5 = baseStar
    HEFT6 = CS_SortA(CS_Rotate(baseCircle, -45),0)
    HEFT7 = Heart

    duskHat3S = CSMakePathX({1.3,1.3},{0,192}, {96,192},{144,16},{32,-112},{-144,-32},{-96,78})
    duskHat3SF = CS_SortXY(CS_FillPathHX2(duskHat3S, 1, 60, 60, 0, 0,45,1),"SORTXYT",nil,0)

    lairShape1 = CSMakeCircleX(6,48,30,150,96)


    CS_BMPGraph(lairShape1, {0x00FFC0}, "1", {{-10},{10}}, {{-10},{10}}, 1, nil, nil, nil, 3, 1, 1, 1)

end