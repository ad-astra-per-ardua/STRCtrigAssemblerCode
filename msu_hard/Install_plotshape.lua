function Install_plotshape()
    -------- Properties
    TempProperties = {
        clocked = false,
        burrowed = false,
        intransit = false,
        hallucinated = false,
        invincible = false,
        hitpoint = 30,
        shield = 50,
        energy = 0,
        resource = 0,
        hanger = 0,}
    HiveProperties = {
        clocked = false,
        burrowed = false,
        intransit = false,
        hallucinated = false,
        invincible = false,
        hitpoint = 70,
        shield = 50,
        energy = 0,
        resource = 0,
        hanger = 0,
        }
    EftProperties = {
        clocked = false,
        burrowed = false,
        intransit = false,
        hallucinated = false,
        invincible = false,
        hitpoint = 100,
        shield = 100,
        energy = 0,
        resource = 0,
        hanger = 0,
        }
    StargateProperties = {
        clocked = false,
        burrowed = false,
        intransit = false,
        hallucinated = false,
        invincible = true,
        hitpoint = 100,
        shield = 100,
        energy = 0,
        resource = 0,
        hanger = 0,
        } 
    StargatePropertiesHero = {
    clocked = false,
    burrowed = false,
    intransit = false,
    hallucinated = false,
    invincible = true,
    hitpoint = 70,
    shield = 50,
    energy = 0,
    resource = 0,
    hanger = 0,
    }


    JYD = "Set Unit Order To: Junk Yard Dog"
    Gentime = SDspeed * 572
    ExRate = {21, 23, 25, 27}
    HDrate = {23, 25, 28, 31}
    Rate_c = {ExRate, HDrate}
    ScanInitSetting(Force2,0)

    Evfmode = CreateCcode()

    Difficulty = CreateCcode()
    Lairlv2_1,Lairlv2_2, Lairlv2_3, Lairlv2_4 = CreateCcodes(4)
    LairDeathArray = {Lairlv2_1,Lairlv2_2, Lairlv2_3, Lairlv2_4}

    StarportLv2_1,StarportLv2_2,StarportLv2_3,StarportLv2_4,StarportLv2_5 = CreateCcodes(5)
    StarportDeathArray = {StarportLv2_1,StarportLv2_2,StarportLv2_3,StarportLv2_4,StarportLv2_5}
    StarportSpotArr = {"starp7", "starp1", "starp4", "starp10", "starp3"}
    StarportSpotArr2 = {"starp8", "starp6", "starp2", "starp5", "starp9"}

    generator_dvar1,generator_dvar2,generator_dvar3,generator_dvar4 = CreateCcodes(4)
    generator_dvarr = {generator_dvar1,generator_dvar2,generator_dvar3,generator_dvar4}
    generator_spot = {"generator1","generator2","generator3","generator4"}
    
    CannotPenalty,Waveswitch  = CreateCcodes(2)
    Endingtimer = CreateCcode()
    CUnitFlag,CUnitRefresh = CreateCcodes(2)

    BGMdeathVar,BGMtimedeath = CreateCcodes(2)
    Wavebreak = CreateCcode()
    TempPos = CreateVar(FP)

    P8minimap,BattleGen = CreateCcodes(2)
    FBOSS_Initvar,Screen_var,FBOSS_Tmpvar, FBOSS_BGM, Start_var1 = CreateCcodes(5)

    TmpNextptr,FnBossPtr,FnBossHP,FnBossHP2 = CreateVars(4, FP)

    --------- Plot shape

    HeroShape1 = {4,{32,32},{-32,32},{-32,-32},{32,-32}}
    HeroShape2 = {1, {0,0}}
    CellScattered = {10, {128,128}, {114,-62},{65,168}, {-168,118},{100,158},{-81,148},{-135,149}, {-256,-256},{-64,-68},{32,-128}}
    -- CSPlot(HeroShape1,P1,54,"Location 1",nil,1,32,P1)
    -- CSPlot(HeroShape2,P1,54,"Location 1",nil,1,32,P1)
    WAVE1 = CSMakePolygon(4,50,0,35,5)
    WAVE2 = CSMakePolygon(4,50,0,20,5)
    WAVE3 = CSMakePolygon(4,50,45,13,5)
    Bigwave1 = CSMakePolygon(6,45,0,50,1)
    Bigwave2 = CSMakeLine(6,80,0,15,0)

    ------ Hat
    square1 = CSMakePolygonX(4,80,0,36,0)
    square2 = CSMakePolygonX(4,70,45,36,0)

    Shape5 = CSMakePolygon(6,80,0,91,1)
    Shape4 = CSMakePolygon(6,80,0,61,1)
    Shape3 = CSMakePolygon(6,80,0,37,1)
    Shape2 = CSMakePolygon(6,80,0,19,1)
    Shape1 = CSMakePolygon(6,80,0,7,0)

    sixline = CSMakeCircleX(6,64,30,54,0)
    spiral1 = CSMakeSpiral(4, 16, 1/1.2, 40, 0, 37, 5)
    spiral2 = CSMakeSpiral(4, 16, 1/1.2, 40, 45, 37, 5)


    CX2 = CSMakeCircleX(6,80,30,30,0)

    ------ Lair
    LSU = CSMakeLineX(6,64,0,30,0)
    LSU2 = CSMakeLineX(6,64,10,30,0)
    LSU3 = CSMakeLineX(6,64,20,30,0)
    LSU4 = CSMakeLineX(6,64,30,30,0)
    LSU5 = CSMakeLineX(6,64,40,30,0)

    LGU1 = CSMakePolygonX(6,64,30,6,0)
    LGU2 = CSMakePolygonX(6,64,30,24,6) -- 3
    LGU3 = CSMakePolygonX(6,64,30,54,24) -- 5
    LGU4 = CSMakePolygonX(6,64,30,96,54) -- 7
	LGU5 = CSMakePolygonX(6,64,30,150,96) -- 9
    CenterCallShape = CS_Overlap(LGU4, LGU5)
    CenterCallShapeA = CSMakePolygonX(6,0,30,96,0)

    LGU1a = CSMakePolygonX(6,1,30,6,0)
    LGU2a = CSMakePolygonX(6,1,30,24,6)
    LGU3a = CSMakePolygonX(6,1,30,54,24)

    Eft1 = CSMakeLineX(6,64,10,24,0)
    Eft2 = CSMakeLineX(6,64,20,24,0)
    Eft3 = CSMakeLineX(6,64,30,24,0)
    Eftstar = CSMakeStarX(5,108,64,36,90,0)

    ------ Hive
    Line1 = CSMakeLineX(2,64,0,23,1)
    Trdline = CSMakeLineX(3,64,0,28,1)
    Trdline2 = CSMakeLineX(3,64,60,28,1)
    Triangle1 = CSMakePolygonX(3, 64, 0, 18, 0)
    Triangle2 = CSMakePolygonX(3, 64, 0, 61, 18)
    Triangle3 = CSMakePolygonX(3, 64, 0, 61, 0)
    Triangle4 = CSMakePolygonX(3, 32, 0, CS_Level("PolygonX", 3, 3), 0)
    HiveEtf1 = CSMakeSpiral(6, 16, 1/2, 40, 0, 130, 0)
    MemEft = CSMakeSpiral(8, 16, 1/2, 40, 0, 260, 0)

    HiveLv2Shape1 = CSMakePolygon(3, 32, 0, CS_Level("Polygon", 3, 10), CS_Level("Polygon", 3, 9))
    HiveLv2Shape2 = CS_InvertXY(HiveLv2Shape1,nil,0)
    Finale_mem = CSMakeCircle(6,64,0,PlotSizeCalc(6, 10),1)

    -- CAPlot(CS_SortR(HiveEtf1,1),P6,33,"Hive3",nil,1,32,{1,0,0,0,HiveEtf1[1]/36,0},nil,P6,{CommandLeastAt(133,"Hive3")})

    ------- Starport
    PA = CSMakePolygon(6,80,0,61,1)
    PB = CSMakePolygon(6,80,0,37,1)
    PC = CSMakePolygon(6,80,0,19,1)
    PD = CSMakePolygon(6,80,0,7,0)
    PE = CSMakePolygon(6,80,0,91,1)

    PAA = CSMakePolygon(6,1,0,61,1)
    PBA = CSMakePolygon(6,1,0,37,1)
    PCA = CSMakePolygon(6,1,0,19,1)
    PDA = CSMakePolygon(6,1,0,7,0)
    PEA = CSMakePolygon(6,1,0,91,1)

    ------- Stargate
    SShape1 = CSMakeCircle(6,64,0,7,1)
    SShape2 = CSMakeCircle(6,64,0,19,7)
    SShape3 = CSMakeCircle(6,64,0,37,19)
    Overlapped = CS_OverlapX(LGU1, LGU2, LGU3, LGU4)
    Overlapped2 = CS_OverlapX(LGU1, LGU2, LGU3, LGU4, SShape1,SShape2,SShape3)
    E_Base = CSMakeCircle(6,30,0,91,61)
    EllipseN = CS_RemoveStack(CS_MoveXY(CS_Distortion(E_Base,{3,0},{3,0},nil,nil),550,0),20)
    EllipseArr = {EllipseN,CS_Rotate(EllipseN,45),CS_Rotate(EllipseN,90),CS_Rotate(EllipseN,135),CS_Rotate(EllipseN,180),CS_Rotate(EllipseN,225),CS_Rotate(EllipseN,270),CS_Rotate(EllipseN,315)}
    SH_Flower = CS_OverlapX(EllipseArr[1],EllipseArr[2],EllipseArr[3],EllipseArr[4],EllipseArr[5],EllipseArr[6],EllipseArr[7],EllipseArr[8])
    
    CircleA = CSMakeCircle(6,60,0,91,61)
    EllipseB = CS_Distortion(CircleA,{5,0},{5,0},nil,nil)
    EllipseN = CS_RemoveStack(CS_MoveXY(EllipseB,1600,0),32)
    Ellipse1 = CS_Rotate(EllipseN,30)
    Ellipse2 = CS_Rotate(EllipseN,60)
    Ellipse3 = CS_Rotate(EllipseN,90)
    Ellipse4 = CS_Rotate(EllipseN,120)
    Ellipse5 = CS_Rotate(EllipseN,150)
    Ellipse6 = CS_Rotate(EllipseN,180)
    Ellipse7 = CS_Rotate(EllipseN,210)
    Ellipse8 = CS_Rotate(EllipseN,240)
    Ellipse9 = CS_Rotate(EllipseN,270)
    Ellipse10 = CS_Rotate(EllipseN,300)
    Ellipse11 = CS_Rotate(EllipseN,330)
    Ellipse12 = CS_Rotate(EllipseN,0)

    Shape3 = CSMakeCircleX(6,120,30,54,24)
    Cross = CSMakeLineX(2,32,0, 46,0)
    Cross1 = CSMakeLineX(2,32,90, 46,0)
    CX2 = CSMakeCircleX(6,80,30,30,0)
    StargateEft = CS_RemoveStack(CS_OverlapX(Shape3, Cross, Cross1,SShape2), 16)
    function CSMakeTornado(Point,Radius,Angle,Numner,Outside,StartNumber)
		local Shape = {0}
		if StartNumber == nil then StartNumber = 1 end
		for i = StartNumber, Numner do
			CS_OverlapShape(Shape,CSMakePolygon(Point,i*Radius,i*Angle,Point+1,0))
		end
		if Outside~=nil then
			return CS_Rotate((CS_OverlapShape(Shape,CSMakePolygon(Point,Radius,Numner*Angle,PlotSizeCalc(Point,Numner),PlotSizeCalc(Point,Numner-1)))),-Numner*Angle)
		else
			return Shape
		end
	end
	function CS_OverlapShape(Shape,...)
		local RetShape = Shape
	
		local arg = table.pack(...)
		for k = 1, arg.n do
			RetShape[1] = RetShape[1] + arg[k][1]
			for i = 1, arg[k][1] do
				table.insert(RetShape,{arg[k][i+1][1],arg[k][i+1][2]})
			end
		end
		return RetShape	
	end
	function CSMakeFillPathXY(Range,Radius)
		local a = CSMakePath({-Range,-Range},{Range,-Range},{Range,Range},{-Range,Range})
		return CS_FillPathXY(a,0,Radius,Radius)
	end
    function HyperCycloid1(T) return {2.1*math.cos(T) - math.cos(2.1*T), 2.1*math.sin(T) - math.sin(2.1*T)} end 
	Hp0 = CSMakeGraphT({192,192},"HyperCycloid1",0,0,10,10,200)
	Generator_shape2 = CS_RatioXY(CS_RemoveStack(Hp0,10),0.5,0.5)
    Generator_shape = CSMakePolygon(6,80,0,127,1)
    Generator_shapeA = CSMakePolygon(6,0,0,127,1)

    FBossMainplot = CS_Rotate3D(CSMakePolygon(6,80,0,CS_Level('Polygon', 6, 7),1),90,nil,15)
    FBossMainplotA = CS_Rotate3D(CSMakePolygon(6,1,0,CS_Level('Polygon', 6, 7),1),90,nil,15)

    Mem_shape1 = CS_CompassA({0,0}, {2048,0}, {0,2048}, 0, 30)
    Mem_shape2 = CS_MirrorX(Mem_shape1,0,0,0)
    Mem_shape3 = CS_MirrorY(CS_SymmetryY(Mem_shape1, 1, 2048, 4096),0,1,0)
    Mem_shape4 = CS_MirrorY(CS_SymmetryY(Mem_shape2, 1, 2048, 4096),0,1,0)

    Mem_CAplot1 = CSMakeTornado(4, 32, 75, 6)
    Mem_CAplot2 = CS_Rotate(Mem_CAplot1, 10)
    Mem_CAplot3 = CS_Rotate(Mem_CAplot1, 20)
    Mem_CAplot4 = CS_Rotate(Mem_CAplot1, 30)
    Mem_CAplot5 = CS_Rotate(Mem_CAplot1, 40)
    Mem_CAplot6 = CS_Rotate(Mem_CAplot1, 50)
    Mem_CAplot7 = CS_Rotate(Mem_CAplot1, 60)
    Mem_CAplot8 = CS_Rotate(Mem_CAplot1, 70)
    Circulation1 = CSMakeCircleX(6,115,30,54,24)
    Circulation2 = CS_Rotate(Circulation1,90)
    Circulation3 = CS_Rotate(Circulation1,180)
    Circulation4 = CS_Rotate(Circulation1,270)
    Mem_Flnale1 = CS_SortA(CSMakePolygon(4,64,45,PlotSizeCalc(4,19),PlotSizeCalc(4,18)),0)
    Mem_Flnale2 = CS_SortA(CSMakePolygon(5,64,45,PlotSizeCalc(5,19),PlotSizeCalc(5,18)),0)
    Mem_Flnale3 = CS_SortA(CSMakePolygon(6,64,45,PlotSizeCalc(6,19),PlotSizeCalc(6,18)),0)
    Mem_Flnale4 = CS_SortA(CSMakeStar(5,136,64,36,CS_Level("Star", 5, 20),CS_Level("Star", 5, 19)),0)

    Mem_Flnale1A = CS_SortA(CSMakePolygon(4,1,45,PlotSizeCalc(4,19),PlotSizeCalc(4,18)),0)
    Mem_Flnale2A = CS_SortA(CSMakePolygon(5,1,45,PlotSizeCalc(5,19),PlotSizeCalc(5,18)),0)
    Mem_Flnale3A = CS_SortA(CSMakePolygon(6,1,45,PlotSizeCalc(6,19),PlotSizeCalc(6,18)),0)
    Mem_Flnale4A = CS_SortA(CSMakeStar(5,136,1,36,CS_Level("Star", 5, 20),CS_Level("Star", 5, 19)),0)
    
    Middle_Mem_Eft = CS_RatioXY(CS_Rotate3D(sixline,45,45,45),2,2)
    Final_rhegb_Eft = CS_RatioXY(CS_Rotate3D(sixline,45,60,80),2,2)
    -------- Plot Timeline

    CenterCallGen1 = {
        51, 16, 56, 46, 62
    }
    CenterCallGen2 = {
        8, 25, 12, 66, 17
    }
    CenterCallGen3 = {
        7, 76, 60, 64, 70
    }
    CenterCallGen4 = {
        86, 104, 58, 21, 74
    }
    CenterCallGen5 = {
        28, 102
    }
    LairTimeline = {3.0, 5.7, 8.5, 14.1, 14.6, 15.3, 15.7, 16, 17, 19.7, 21.6, 22, 22.3, 22.5 }

    LairLv2timeline = {1.6, -- Create Effect shape Bass part
                2, -- Create unit shape Tremble part, Thus, 1 cycle = + 0.8
                3.2, 4.8, 6.4, 8, 9.6, 11.2, 12.8, -- 1 phase
                15.2, 16.8,18.4, 20, 21.6, 23.2, -- 2 phase
                24.4, 25.2, 25.6 -- End phase
            }

        

    HiveGenTime = { 1.79, 2.7, 3.60, 4.57, 5.5, 6.5, 7.5, 8.4, 9.3, 10.2, 11.1, 12, 12.9, 13.8, 14.7, 15.8, 16.8, 18.7, 20.5, 22.4, 24.3, 26.1, 28, 29.9}
    HiveEftTime = {2.22, 3.18, 4.15, 5.07, 6, 7, 7.9 ,8.8 ,9.7,10.6, 11.5, 12.4, 13.3, 14.2, 15.1}
    HiveGenTime2 = {16.8, 18.7, 20.5, 22.4, 24.3, 26.1, 28, 29.9}

    HiveLv2GenTime = {
        6.8, 7.3, 7.8, 
        10.7, 11.1, 11.6, 
        14.5, 14.99, 15.46,
        18.8, -- overlayed
        22.1, 22.6,23.1,
        25.9, 26.4, 26.8,
        29.7, 30.2, 30.7,
        33.5, 34, 35 -- finished
    }

    Starport_gen = {4.1, 6, 8, 12, 14, 16, 19.8, 21.8, 23.8, 27.7, 29.7, 31.7}

    Starport_lv2_gen = {
        2.6, -- Start bass part effect part, + 0.5 Second bass part generate part
        4.5, 5.4, 6.4 , 8.2, 9.2, 10.1,  
        12,13, 13.8,  15.6, 16.6, 17.6,  19.5, 20.4, 
        21.4,  23.2, 24.2, 25.1,  27, 28, 28.9, 
        30.8, 31.7, 32.1
    }

    

    StargateGenTime = {
        1.9, 2.4, 2.9, 3.4, 3.8, 4.3, 4.8, 5.2, 
        9.6, 10.4, 10.9, 11.4, 11.9, 12.4, 12.9, 13.4, 
        19.1, 19.5, 20, 20.5, 20.9, 
        28.2, 
        32.9, 36.7, 40.5, -- after effects
        48.1, 55.8 -- after 2nd effects
        }
    StargateEftTime = {
        32, 32.4, -- reloading effect
        47.2, 47.6 -- 2nd effects
        }
    gene_tl = { -- term : 0.9 sec
        32.5, 36.3, 39.1, 41 , 44,
        46, 47.7, 49.7, 51.6, 53.4, 55.4, 57.2, 
        59, 61, 63, 71, 74.4, 78.6, 83.2, 85.7,
        87.7, 89.6, 91.4, 93.3, 95.3, 97.2, 100.9,
        102.9, 104.8, 106.7, 108.6, 110.5, 112.4,
        114.2, 116.3, 118.1, 120, 122, 123.9, 125.7, 
        127.7, 129.6, 131.4, 133.4, 135.3, 137.2, 
        138.1, 138.7, 139.1, 141.1, 142.9, 143.9, 
        144.9, 145.8, 146.3
    }
    gene_spawntb_gnd = {
        52, 104, 3, 93, 95, 81, 78, 17, 25, 3, 75
    }
    gene_spawntb_air = {
        12, 88, 89, 70, 96, 60, 64, 62, 58, 21, 96
    }

    gene_spawntb_gnd1 = {
        46, 16, 3, 93, 95, 81, 66, 17, 25, 3, 76
    }
    gene_spawntb_air1 = {
        12, 88, 89, 56, 96, 60, 8, 62, 58, 21, 96
    }

    -- Lair Eft : 94 | Hive Eft : 84 | SP EFT : 42 | SG EFT : 202 | FT EFT : 11

    -- Cerebrate
    -- Circular = CSMakeLineX(1,60,0+15*i,7,1)

    --- Infested Center


    Arc1 = CS_CompassA({128,0},{0,0},{256,0},0,36)
    Arc2 = CS_CompassA({64,0},{0,0},{128,0},0,18)
    Arc3 = CS_CompassA({192,0},{128,0},{256,0},1,18)
    ArcTemp = CS_OverlapX(Arc1,Arc2,Arc3)
    SH_Arc1 = CS_RatioXY(CS_Rotate(CS_FillPathXY(ArcTemp,0,15,15,0),0),7,7)
    SH_Arc2 = CS_RatioXY(CS_Rotate(CS_FillPathXY(ArcTemp,0,15,15,0),90),7,7)
    SH_Arc3 = CS_RatioXY(CS_Rotate(CS_FillPathXY(ArcTemp,0,15,15,0),180),7,7)
    SH_Arc4 = CS_RatioXY(CS_Rotate(CS_FillPathXY(ArcTemp,0,15,15,0),270),7,7)

    Shell_Arc1 = CS_RatioXY(CS_Rotate(ArcTemp, 0),7,7)
    Shell_Arc2 = CS_RatioXY(CS_Rotate(ArcTemp, 90),7,7)
    Shell_Arc3 = CS_RatioXY(CS_Rotate(ArcTemp, 180),7,7)
    Shell_Arc4 = CS_RatioXY(CS_Rotate(ArcTemp, 270),7,7)

    function HyperCycloidD(T) return {6*math.cos(T) - 2*math.cos(6*T), 6*math.sin(T) - 2*math.sin(6*T)} end 

	Starportlv2Shape1 = CSMakeGraphT({24,24},"HyperCycloidD",0,0,1,1,90)




    Shape7077 = {18  ,{1427, 1883},{2559, 1864},{2565, 2190},{1610, 1649},{1623, 2444},{2441, 1656},{2467, 2473},{3050, 1570},{2975, 2557},{1869, 1282},{2238, 1279},{1840, 2488},{1831, 2866},{2253, 2482},{2240, 2854},{1428, 2203},{1864, 1630},{2236, 1633}}
    Shape7078 = {28  ,{2048, 1256},{2049, 1395},{2048, 1521},{2046, 1633},{2050, 2451},{2050, 2564},{2051, 2663},{2053, 2788},{2375, 3016},{2536, 2934},{2682, 2855},{2819, 2794},{1240, 2767},{1379, 2843},{1532, 2924},{1701, 3003},{1256, 1337},{1393, 1256},{1539, 1175},{1686, 1109},{2356, 1076},{2449, 1149},{2590, 1217},{2741, 1302},{2758, 1853},{2763, 2154},{1217, 1879},{1250, 2200}}
    Shape7070 = {4   ,{3264, 2976},{3264, 3296},{768, 3232},{768, 3008}}
    Shape7150 = {29  ,{1152, 1536},{1792, 1536},{1152, 2560},{2944, 1536},{3040, 2560},{2976, 768},{1088, 736},{1920, 64},{2208, 64},{2176, 4000},{1920, 4000},{448, 3584},{448, 3936},{3648, 3616},{3648, 3968},{3072, 2016},{640, 2048},{1024, 2048},{3680, 512},{3680, 192},{512, 512},{512, 192},{1056, 1216},{1088, 2784},{2048, 2848},{2048, 1184},{1664, 2048},{3456, 2048},{2464, 2048}}
    Shape7075 = {20  ,{320, 3712},{320, 3744},{352, 3744},{352, 3712},{736, 3712},{736, 3744},{768, 3744},{768, 3712},{3296, 3680},{3296, 3712},{3328, 3712},{3328, 3680},{3936, 3680},{3936, 3712},{3968, 3712},{3968, 3680},{3552, 1952},{3552, 2016},{3552, 2080},{3552, 2144}}
    Shape7052 = {4   ,{543, 1939},{543, 2003},{543, 2067},{543, 2131}}
    Shape7025 = {26  ,{1025, 2574},{1021, 1543},{1911, 1085},{2186, 1078},{640, 704},{64, 640},{2048, 160},{3168, 512},{928, 512},{3168, 64},{928, 64},{928, 3584},{32, 3584},{928, 4000},{32, 4000},{1472, 4032},{2720, 4032},{2144, 2976},{1952, 2976},{3232, 864},{832, 832},{3584, 2880},{3264, 3296},{3104, 2816},{2001, 4049},{2560, 3456}}
    Shape7003 = {8   ,{3174, 865},{3194, 1138},{933, 1099},{3693, 669},{1244, 3976},{941, 862},{2670, 3461},{1184, 3424}}
    Shape7086 = {5   ,{416, 672},{2720, 3168},{1100, 3217},{2890, 366},{2054, 1082}}
    Shape7104 = {8   ,{2916, 3759},{2852, 3759},{2852, 3823},{2916, 3823},{1344, 3712},{1408, 3712},{1408, 3648},{1344, 3648}}
    Shape6150 = {4   ,{608, 992},{2528, 864},{2464, 3232},{3264, 448}}
    function Heroinitfunc(shape, unitnum)
        CSPlot(shape, P7, unitnum, "heroinit", {0,0}, 1, 32, FP, Always())
    end
    function Heroinitfunc2(shape, unitnum)
        CSPlot(shape, P6, unitnum, "heroinit", {0,0}, 1, 32, FP, Always())
    end

    Heroinitfunc(Shape7077,77)
    Heroinitfunc(Shape7078,78)
    Heroinitfunc(Shape7070,70)
    Heroinitfunc(Shape7150,150)
    Heroinitfunc(Shape7075,75)
    Heroinitfunc(Shape7052,52)
    Heroinitfunc(Shape7025,25)
    Heroinitfunc(Shape7003,03)
    Heroinitfunc(Shape7086,86)
    Heroinitfunc(Shape7104,104)
    Heroinitfunc2(Shape6150, 150)




    
end