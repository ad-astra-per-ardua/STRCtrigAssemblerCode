function Install_WaveTrigger()
    ----------- 30 sec period --------

TriggerX(FP, {CDeaths(FP, AtLeast, 1, Waveswitch)}, {SetDeaths(P8, Add, 1, 131)}, preserved)
TriggerX(FP, {CDeaths(FP, AtLeast, 1, Waveswitch)}, {SetDeaths(P8, Add, 1, 132)}, preserved)


TriggerX(FP, {Deaths(FP, AtLeast, 1020, 131)}, SetDeaths(P8, SetTo, 0, 131),{preserved})

CIfX(Force2, {CDeaths(FP, Exactly, 1, Difficulty)})

-- CSPlotOrder(WAVE1, P7, 40, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,0,35,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131), Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 0, 152)},nil,1)
-- CSPlotOrder(WAVE2, P7, 44, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,0,20,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131), Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 0, 152)},nil,1)
-- CSPlotOrder(WAVE3, P7, 51, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,45,13,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131), Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 0, 152)},nil,1)

-- CSPlotOrder(WAVE1, P7, 40, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,0,35,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131), Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 0, 152)},nil,1)
-- CSPlotOrder(WAVE2, P7, 44, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,0,20,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131), Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 0, 152)},nil,1)
-- CSPlotOrder(WAVE3, P7, 51, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,45,13,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131, Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 0, 152))},nil,1)

-- -------- 1 Cerebrate Terran ---------

-- CSPlotOrder(WAVE1, P7, 17, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,0,35,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131), Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 1, 152)},nil,1)
-- CSPlotOrder(WAVE2, P7, 8, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,0,20,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 1, 152)},nil,1)
-- CSPlotOrder(WAVE3, P7, 46, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,45,13,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 1, 152)},nil,1)

-- CSPlotOrder(WAVE1, P7, 17, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,0,35,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 1, 152)},nil,1)
-- CSPlotOrder(WAVE2, P7, 8, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,0,20,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 1, 152)},nil,1)
-- CSPlotOrder(WAVE3, P7, 46, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,45,13,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 1, 152)},nil,1)

-- ---------- 1 Daggoth Terran --------

-- CSPlotOrder(WAVE1, P7, 17, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,0,35,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131), Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 0, 152)},nil,1)
-- CSPlotOrder(WAVE2, P7, 8, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,0,20,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 0, 152)},nil,1)
-- CSPlotOrder(WAVE3, P7, 46, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,45,13,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 0, 152)},nil,1)

-- CSPlotOrder(WAVE1, P7, 17, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,0,35,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 0, 152)},nil,1)
-- CSPlotOrder(WAVE2, P7, 8, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,0,20,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 0, 152)},nil,1)
-- CSPlotOrder(WAVE3, P7, 46, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,45,13,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 0, 152)},nil,1)


-- ------- After unlock big wave Protoss ------

-- CSPlotOrder(WAVE1, P7, 65, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,0,35,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131), Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 1, 152)},nil,1)
-- CSPlotOrder(WAVE2, P7, 88, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,0,20,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 1, 152)},nil,1)
-- CSPlotOrder(WAVE3, P7, 81, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,45,13,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 1, 152)},nil,1)

-- CSPlotOrder(WAVE1, P7, 65, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,0,35,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 1, 152)},nil,1)
-- CSPlotOrder(WAVE2, P7, 88, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,0,20,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 1, 152)},nil,1)
-- CSPlotOrder(WAVE3, P7, 81, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,45,13,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 1, 152)},nil,1)


-- ------------------ Big Wave Trigger 132 -----------------
-- for i = 1 , 5 do
-- 	Trigger2(Force1, Deaths(P8, Exactly, Gentime * i, 132), {PlayWAV("staredit\\wav\\bigwave.ogg"),PlayWAV("staredit\\wav\\bigwave.ogg"),PlayWAV("staredit\\wav\\bigwave.ogg"),MinimapPing("celebrate1"),MinimapPing("celebrate1"),MinimapPing("celebrate1")})
-- 	CSPlotOrder(Bigwave1, P6, 37, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 38, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 37, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 38, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
-- 	CSPlotOrder(Bigwave2, P6, 62, "celebrate1", nil, 1, 48, CSMakeLine(6,1,0,15,0), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
-- end

-- for i = 6, 10 do
-- 	Trigger2(Force1, Deaths(P8, Exactly, Gentime * i, 132), {PlayWAV("staredit\\wav\\bigwave.ogg"),PlayWAV("staredit\\wav\\bigwave.ogg"),PlayWAV("staredit\\wav\\bigwave.ogg"),MinimapPing("celebrate1"),MinimapPing("celebrate1"),MinimapPing("celebrate1")})
-- 	CSPlotOrder(Bigwave1, P6, 46, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 56, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 93, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 38, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
-- 	CSPlotOrder(Bigwave2, P6, 62, "celebrate1", nil, 1, 48, CSMakeLine(6,1,0,15,0), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
-- end


-- for i = 11, 15 do
-- 	Trigger2(Force1, Deaths(P8, Exactly, Gentime * i + 120, 132), {PlayWAV("staredit\\wav\\bigwave.ogg"),PlayWAV("staredit\\wav\\bigwave.ogg"),PlayWAV("staredit\\wav\\bigwave.ogg"),MinimapPing("celebrate1"),MinimapPing("celebrate1"),MinimapPing("celebrate1")})
-- 	CSPlotOrder(Bigwave1, P6, 65, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 120, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 66, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 120, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 51, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 120, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 88, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 120, 132)})
-- 	CSPlotOrder(Bigwave2, P6, 70, "celebrate1", nil, 1, 48, CSMakeLine(6,1,0,15,0), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 120, 132)})
-- end

-- for i = 16, 20 do
-- 	Trigger2(Force1, Deaths(P8, Exactly, Gentime * i + 180, 132), {PlayWAV("staredit\\wav\\bigwave.ogg"),PlayWAV("staredit\\wav\\bigwave.ogg"),PlayWAV("staredit\\wav\\bigwave.ogg"),MinimapPing("celebrate1"),MinimapPing("celebrate1"),MinimapPing("celebrate1")})
-- 	CSPlotOrder(Bigwave1, P6, 77, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 180, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 78, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 180, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 104, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 180, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 88, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 180, 132)})
-- 	CSPlotOrder(Bigwave2, P6, 64, "celebrate1", nil, 1, 48, CSMakeLine(6,1,0,15,0), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 180, 132)})
-- end


-- for i = 1 , 5 do
-- 	Trigger2(Force1, Deaths(P8, Exactly, Gentime * i, 132), {MinimapPing("celebrate2"),MinimapPing("celebrate2"),MinimapPing("celebrate2")})
-- 	CSPlotOrder(Bigwave1, P6, 37, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 38, "celebrate2", nil, 1, 32, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 37, "celebrate2", nil, 1, 32, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 38, "celebrate2", nil, 1, 32, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
-- 	CSPlotOrder(Bigwave2, P6, 62, "celebrate2", nil, 1, 48, CSMakeLine(6,1,0,15,0), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
-- end

-- for i = 6, 10 do
-- 	Trigger2(Force1, Deaths(P8, Exactly, Gentime * i, 132), {PlayWAV("staredit\\wav\\bigwave.ogg"),PlayWAV("staredit\\wav\\bigwave.ogg"),PlayWAV("staredit\\wav\\bigwave.ogg"),MinimapPing("celebrate1"),MinimapPing("celebrate1"),MinimapPing("celebrate1")})
-- 	CSPlotOrder(Bigwave1, P6, 46, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 56, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 93, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 38, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
-- 	CSPlotOrder(Bigwave2, P6, 62, "celebrate1", nil, 1, 48, CSMakeLine(6,1,0,15,0), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
-- end

-- for i = 11, 15 do
-- 	Trigger2(Force1, Deaths(P8, Exactly, Gentime * i + 120, 132),
--  {MinimapPing("celebrate2"),MinimapPing("celebrate2"),MinimapPing("celebrate2")})
-- 	CSPlotOrder(Bigwave1, P6, 65, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 120, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 66, "celebrate2", nil, 1, 32, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 120, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 51, "celebrate2", nil, 1, 32, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 120, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 88, "celebrate2", nil, 1, 32, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 120, 132)})
-- 	CSPlotOrder(Bigwave2, P6, 70, "celebrate2", nil, 1, 48, CSMakeLine(6,1,0,15,0), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 120, 132)})
-- end

-- for i = 16, 20 do
-- 	Trigger2(Force1, Deaths(P8, Exactly, Gentime * i + 180, 132), {MinimapPing("celebrate2"),MinimapPing("celebrate2"),MinimapPing("celebrate2")})
-- 	CSPlotOrder(Bigwave1, P6, 77, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 180, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 78, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 180, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 104, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 180, 132)})
-- 	CSPlotOrder(Bigwave1, P6, 88, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 180, 132)})
-- 	CSPlotOrder(Bigwave2, P6, 64, "celebrate2", nil, 1, 48, CSMakeLine(6,1,0,15,0), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 180, 132)})
-- end

CElseX()

CSPlotOrder(WAVE1, P7, 54, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,0,35,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131), Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 0, 152)},nil,1)
CSPlotOrder(WAVE2, P7, 53, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,0,20,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131), Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 0, 152)},nil,1)
CSPlotOrder(WAVE3, P7, 55, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,45,13,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131), Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 0, 152)},nil,1)

CSPlotOrder(WAVE1, P7, 54, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,0,35,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131), Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 0, 152)},nil,1)
CSPlotOrder(WAVE2, P7, 53, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,0,20,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131), Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 0, 152)},nil,1)
CSPlotOrder(WAVE3, P7, 55, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,45,13,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131), Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 0, 152)},nil,1)

-------- 1 Cerebrate Terran ---------

CSPlotOrder(WAVE1, P7, 17, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,0,35,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131), Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 1, 152)},nil,1)
CSPlotOrder(WAVE2, P7, 8, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,0,20,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 1, 152)},nil,1)
CSPlotOrder(WAVE3, P7, 46, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,45,13,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 1, 152)},nil,1)

CSPlotOrder(WAVE1, P7, 17, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,0,35,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 1, 152)},nil,1)
CSPlotOrder(WAVE2, P7, 8, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,0,20,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 1, 152)},nil,1)
CSPlotOrder(WAVE3, P7, 46, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,45,13,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 0, 151),Deaths(P7, Exactly, 1, 152)},nil,1)

---------- 1 Daggoth Terran --------

CSPlotOrder(WAVE1, P7, 17, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,0,35,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131), Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 0, 152)},nil,1)
CSPlotOrder(WAVE2, P7, 8, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,0,20,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 0, 152)},nil,1)
CSPlotOrder(WAVE3, P7, 46, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,45,13,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 0, 152)},nil,1)

CSPlotOrder(WAVE1, P7, 17, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,0,35,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 0, 152)},nil,1)
CSPlotOrder(WAVE2, P7, 8, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,0,20,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 0, 152)},nil,1)
CSPlotOrder(WAVE3, P7, 46, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,45,13,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 0, 152)},nil,1)


------- After unlock big wave Protoss ------

CSPlotOrder(WAVE1, P7, 65, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,0,35,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131), Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 1, 152)},nil,1)
CSPlotOrder(WAVE2, P7, 88, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,0,20,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 1, 152)},nil,1)
CSPlotOrder(WAVE3, P7, 81, "celebrate1", nil, 1, 32, CSMakePolygon(4,1,45,13,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 1, 152)},nil,1)

CSPlotOrder(WAVE1, P7, 65, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,0,35,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 1, 152)},nil,1)
CSPlotOrder(WAVE2, P7, 88, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,0,20,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 1, 152)},nil,1)
CSPlotOrder(WAVE3, P7, 81, "celebrate2", nil, 1, 32, CSMakePolygon(4,1,45,13,5), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, AtLeast, 1019, 131),Deaths(P7, Exactly, 1, 151),Deaths(P7, Exactly, 1, 152)},nil,1)


------------------ Big Wave Trigger 132 -----------------
for i = 1 , 5 do
	local arrayLength = #CenterCallGen1
    local genIndex = ((i - 1) % arrayLength) + 1
	Trigger2(Force1, Deaths(P8, Exactly, Gentime * i, 132), {PlayWAV("staredit\\wav\\bigwave.ogg"),PlayWAV("staredit\\wav\\bigwave.ogg"),PlayWAV("staredit\\wav\\bigwave.ogg"),MinimapPing("celebrate1"),MinimapPing("celebrate1"),MinimapPing("HealZone")})
	CSPlotOrder(Bigwave1, P6, 54, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
	CSPlotOrder(Bigwave1, P6, 53, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
	CSPlotOrder(Bigwave1, P6, 46, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
	CSPlotOrder(Bigwave1, P6, 51, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
	CSPlotOrder(Bigwave2, P6, 62, "celebrate1", nil, 1, 48, CSMakeLine(6,1,0,15,0), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})

	CSPlotOrder(CenterCallShape, P6, CenterCallGen1[genIndex], "HealZone", nil, 1, 32, CenterCallShapeA, nil, Attack, "callArrival", nil, 32, nil, P6, {Deaths(P8, Exactly, Gentime * i, 132)}, nil, 1)
end

for i = 1 , 5 do
	Trigger2(Force1, Deaths(P8, Exactly, Gentime * i, 132), {MinimapPing("celebrate2"),MinimapPing("celebrate2"),MinimapPing("celebrate2")})
	CSPlotOrder(Bigwave1, P6, 54, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
	CSPlotOrder(Bigwave1, P6, 53, "celebrate2", nil, 1, 32, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
	CSPlotOrder(Bigwave1, P6, 46, "celebrate2", nil, 1, 32, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
	CSPlotOrder(Bigwave1, P6, 51, "celebrate2", nil, 1, 32, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
	CSPlotOrder(Bigwave2, P6, 62, "celebrate2", nil, 1, 48, CSMakeLine(6,1,0,15,0), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
end

for i = 6, 10 do
	local arrayLength = #CenterCallGen2
    local genIndex = ((i - 1) % arrayLength) + 1
	Trigger2(Force1, Deaths(P8, Exactly, Gentime * i, 132), {PlayWAV("staredit\\wav\\bigwave.ogg"),PlayWAV("staredit\\wav\\bigwave.ogg"),PlayWAV("staredit\\wav\\bigwave.ogg"),MinimapPing("celebrate1"),MinimapPing("celebrate1"),MinimapPing("HealZone")})
	CSPlotOrder(Bigwave1, P6, 46, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
	CSPlotOrder(Bigwave1, P6, 56, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
	CSPlotOrder(Bigwave1, P6, 93, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
	CSPlotOrder(Bigwave1, P6, 38, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
	CSPlotOrder(Bigwave2, P6, 62, "celebrate1", nil, 1, 48, CSMakeLine(6,1,0,15,0), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})

	CSPlotOrder(CenterCallShape, P6, CenterCallGen2[genIndex], "HealZone", nil, 1, 32, CenterCallShapeA, nil, Attack, "callArrival", nil, 32, nil, P6, {Deaths(P8, Exactly, Gentime * i, 132)}, nil, 1)
end

for i = 6, 10 do
	Trigger2(Force1, Deaths(P8, Exactly, Gentime * i, 132), {MinimapPing("celebrate2"),MinimapPing("celebrate2"),MinimapPing("HealZone")})
	CSPlotOrder(Bigwave1, P6, 46, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
	CSPlotOrder(Bigwave1, P6, 56, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
	CSPlotOrder(Bigwave1, P6, 93, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
	CSPlotOrder(Bigwave1, P6, 38, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
	CSPlotOrder(Bigwave2, P6, 62, "celebrate2", nil, 1, 48, CSMakeLine(6,1,0,15,0), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i, 132)})
end

for i = 11, 15 do
	local arrayLength = #CenterCallGen3
    local genIndex = ((i - 1) % arrayLength) + 1
	Trigger2(Force1, Deaths(P8, Exactly, Gentime * i + 120, 132), {PlayWAV("staredit\\wav\\bigwave.ogg"),PlayWAV("staredit\\wav\\bigwave.ogg"),PlayWAV("staredit\\wav\\bigwave.ogg"),MinimapPing("celebrate1"),MinimapPing("celebrate1"),MinimapPing("HealZone")})
	CSPlotOrder(Bigwave1, P6, 65, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 120, 132)})
	CSPlotOrder(Bigwave1, P6, 66, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 120, 132)})
	CSPlotOrder(Bigwave1, P6, 16, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 120, 132)})
	CSPlotOrder(Bigwave1, P6, 88, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 120, 132)})
	CSPlotOrder(Bigwave2, P6, 64, "celebrate1", nil, 1, 48, CSMakeLine(6,1,0,15,0), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 120, 132)})

	CSPlotOrder(CenterCallShape, P6, CenterCallGen3[genIndex], "HealZone", nil, 1, 32, CenterCallShapeA, nil, Attack, "callArrival", nil, 32, nil, P6, {Deaths(P8, Exactly, Gentime * i + 120, 132)}, nil, 1)
end

for i = 11, 15 do
	Trigger2(Force1, Deaths(P8, Exactly, Gentime * i + 120, 132), {MinimapPing("celebrate2"),MinimapPing("celebrate2"),MinimapPing("HealZone")})
	CSPlotOrder(Bigwave1, P6, 65, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 120, 132)})
	CSPlotOrder(Bigwave1, P6, 66, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 120, 132)})
	CSPlotOrder(Bigwave1, P6, 16, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 120, 132)})
	CSPlotOrder(Bigwave1, P6, 88, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 120, 132)})
	CSPlotOrder(Bigwave2, P6, 64, "celebrate2", nil, 1, 48, CSMakeLine(6,1,0,15,0), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 120, 132)})
end


for i = 16, 20 do
	local arrayLength = #CenterCallGen4
    local genIndex = ((i - 1) % arrayLength) + 1
	Trigger2(Force1, Deaths(P8, Exactly, Gentime * i + 180, 132), {PlayWAV("staredit\\wav\\bigwave.ogg"),PlayWAV("staredit\\wav\\bigwave.ogg"),PlayWAV("staredit\\wav\\bigwave.ogg"),MinimapPing("celebrate1"),MinimapPing("celebrate1"),MinimapPing("HealZone")})
	CSPlotOrder(Bigwave1, P6, 77, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 180, 132)})
	CSPlotOrder(Bigwave1, P6, 78, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 180, 132)})
	CSPlotOrder(Bigwave1, P6, 104, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 180, 132)})
	CSPlotOrder(Bigwave1, P6, 88, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 180, 132)})
	CSPlotOrder(Bigwave2, P6, 60, "celebrate1", nil, 1, 48, CSMakeLine(6,1,0,15,0), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 180, 132)})

	CSPlotOrder(CenterCallShape, P6, CenterCallGen4[genIndex], "HealZone", nil, 1, 32, CenterCallShapeA, nil, Attack, "callArrival", nil, 32, nil, P6, {Deaths(P8, Exactly, Gentime * i + 180, 132)}, nil, 1)
end

for i = 16, 20 do
	Trigger2(Force1, Deaths(P8, Exactly, Gentime * i + 180, 132), {MinimapPing("celebrate2"),MinimapPing("celebrate2"),MinimapPing("HealZone")})
	CSPlotOrder(Bigwave1, P6, 77, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 180, 132)})
	CSPlotOrder(Bigwave1, P6, 78, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 180, 132)})
	CSPlotOrder(Bigwave1, P6, 104, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 180, 132)})
	CSPlotOrder(Bigwave1, P6, 88, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 180, 132)})
	CSPlotOrder(Bigwave2, P6, 60, "celebrate2", nil, 1, 48, CSMakeLine(6,1,0,15,0), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 180, 132)})

end

for i = 21, 30 do
	local arrayLength = #CenterCallGen5
    local genIndex = ((i - 1) % arrayLength) + 1
	Trigger2(Force1, Deaths(P8, Exactly, Gentime * i + 240, 132), {PlayWAV("staredit\\wav\\bigwave.ogg"),PlayWAV("staredit\\wav\\bigwave.ogg"),PlayWAV("staredit\\wav\\bigwave.ogg"),MinimapPing("celebrate1"),MinimapPing("celebrate1"),MinimapPing("HealZone")})
	CSPlotOrder(Bigwave1, P6, 76, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 240, 132)})
	CSPlotOrder(Bigwave1, P6, 58, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 240, 132)})
	CSPlotOrder(Bigwave1, P6, 104, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 240, 132)})
	CSPlotOrder(Bigwave1, P6, 70, "celebrate1", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 240, 132)})
	CSPlotOrder(Bigwave2, P6, 28, "celebrate1", nil, 1, 48, CSMakeLine(6,1,0,15,0), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 240, 132)})

	CSPlotOrder(CenterCallShape, P6, CenterCallGen5[genIndex], "HealZone", nil, 1, 32, CenterCallShapeA, nil, Attack, "callArrival", nil, 32, nil, P6, {Deaths(P8, Exactly, Gentime * i + 240, 132)}, nil, 1)
end

for i = 21, 30 do
	Trigger2(Force1, Deaths(P8, Exactly, Gentime * i + 240, 132), {MinimapPing("celebrate2"),MinimapPing("celebrate2"),MinimapPing("HealZone")})
	CSPlotOrder(Bigwave1, P6, 76, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 240, 132)})
	CSPlotOrder(Bigwave1, P6, 58, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 240, 132)})
	CSPlotOrder(Bigwave1, P6, 104, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 240, 132)})
	CSPlotOrder(Bigwave1, P6, 70, "celebrate2", nil, 1, 48, CSMakePolygon(6,1,0,50,1), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 240, 132)})
	CSPlotOrder(Bigwave2, P6, 28, "celebrate2", nil, 1, 48, CSMakeLine(6,1,0,15,0), 0, Attack, "HealZone", nil, 64, nil, P6,{Deaths(P8, Exactly, Gentime * i + 240, 132)})
end

CIfXEnd()

end