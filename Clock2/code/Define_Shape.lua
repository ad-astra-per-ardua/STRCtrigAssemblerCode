function Define_Shape()
    function GRADX(X) return X end
    DHSH1 = CSMakePath({-160,128},{160,128},{64,0},{160,-128},{-160,-128},{-64,0})
    DHSH1T1 = CS_FillPathXY2(DHSH1, 1, 60, 60, 0, 0, 1)
    SHH15x = CSMakePath({0,-191},{-240,-179},{-240,17},{363,-15})
    SHH15xa = CS_FillPathGradX(SHH15x,1,60,"GRADX",3,0,0,1)


    CS_BMPGraph(DHSH1T1, {0x00FFC0}, "1", {{-10},{10}}, {{-10},{10}}, 1, nil, nil, nil, 3, 1, 1, 1)

end