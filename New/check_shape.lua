function check_shape()
    CircleB = CSMakeCircle(4,40,0,PlotSizeCalc(4, 1),PlotSizeCalc(4, 0)) ---- 큰 원
	temp1 = CSMakeCircle(100, 960, 0, 101, 1)
    UnitReadX(PlayerID, Player, UnitId, Loc, Output, AtMostflag)
    CS_BMPGraph(temp1, {0x00FFC0}, "1", {{-10},{10}}, {{-10},{10}}, 1, nil, nil, nil, 3, 1, 1, 1)
end