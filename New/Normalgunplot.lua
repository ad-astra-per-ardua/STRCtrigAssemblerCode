function Normalgunplot()
    HatTimeline = {
        2.1, 4.95,
        7.8, --to 8.5 5times == term is 0.33 sec
        10.6, 13.4, 
        16.2, 19, 
        20.5, -- 5times rotate
        21.9 -- last gen
    }
    CSPlotOrder(upperTri, P1, 1, "home", nil, 1, 32, upperTri, nil, Attack, "home", nil, 32, nil, FP, {Always()})

    CIfX(Force2, CDeaths(FP, AtLeast, 1, Difficulty)) -- Case of normal difficulty

    function HatGunplotLv1(Hatname, Deathvar)
        CIf(FP, {CDeaths(FP, AtMost, (26 * SDspeed) + SDspeed, Deathvar), CommandLeastAt(131, Hatname)}) -- Start of If parse of hatchery gun shape // If player destroy Hatchery, CommandLeastAt executed at this moment Cdeath valus is zero, Thus, Cdeaths start increase, start with zero, as the results CIF's conditions is satisfied. Thats how it works

        TriggerX(FP, {CommandLeastAt(131, Hatname)}, AddCD(Deathvar, 1), preserved)
        CSPlotOrder(upperTri, P6, 37, Hatname, nil, 1, 32, upperTriA, nil, Attack, "home", nil, 32, nil, FP, {CDeaths(FP, AtLeast, HatTimeline[1] * SDspeed, Deathvar)})
        CSPlotOrder(downTri, P6, 38, Hatname, nil, 1, 32, upperTriA, nil, Attack, "home", nil, 32, nil, FP, {CDeaths(FP, AtLeast, HatTimeline[1] * SDspeed, Deathvar)})

        CSPlotOrder(upperTri, P6, 39, Hatname, nil, 1, 32, upperTriA, nil, Attack, "home", nil, 32, nil, FP, {CDeaths(FP, AtLeast, HatTimeline[2] * SDspeed, Deathvar)})
        CSPlotOrder(downTri, P6, 38, Hatname, nil, 1, 32, upperTriA, nil, Attack, "home", nil, 32, nil, FP, {CDeaths(FP, AtLeast, HatTimeline[2] * SDspeed, Deathvar)})

        for i = 1, 5 do
            CSPlotOrder(CS_Rotate(Line1, (1 - i) * 72), P6, 44, Hatname, nil, 1, 32, Line1, nil, Attack, "home", nil, 32, nil, FP, {CDeaths(FP, AtLeast, (HatTimeline[3] + (i * 0.2)) * SDspeed, Deathvar)})
        end

        CSPlotOrder(square1, P6, 51, Hatname, nil, 1, 32, square1a, nil, Attack, "home", nil, 32, nil, FP, {CDeaths(FP, AtLeast, HatTimeline[4] * SDspeed, Deathvar)})
        CSPlotOrder(square2, P6, 38, Hatname, nil, 1, 32, square1a, nil, Attack, "home", nil, 32, nil, FP, {CDeaths(FP, AtLeast, HatTimeline[4] * SDspeed, Deathvar)})

        CSPlotOrder(square1, P6, 37, Hatname, nil, 1, 32, square1a, nil, Attack, "home", nil, 32, nil, FP, {CDeaths(FP, AtLeast, HatTimeline[5] * SDspeed, Deathvar)})
        CSPlotOrder(square2, P6, 38, Hatname, nil, 1, 32, square1a, nil, Attack, "home", nil, 32, nil, FP, {CDeaths(FP, AtLeast, HatTimeline[5] * SDspeed, Deathvar)})
        CSPlotOrder(sixline, P6, 56, Hatname, nil, 1, 32, square1a, nil, Attack, "home", nil, 32, nil, FP, {CDeaths(FP, AtLeast, HatTimeline[5] * SDspeed, Deathvar)})

        CSPlotOrder(CSMakeSpiral(6, 16, 1/3, 40, 0, 54, 0), P6, 43, Hatname, nil, 1, 32, CSMakeSpiral(6, 16, 1/3, 1, 0, 54, 0), nil, Attack, "home", nil, 32, nil, FP, {CDeaths(FP, AtLeast, HatTimeline[6] * SDspeed, Deathvar)})

        CSPlotOrder(square1, P6, 37, Hatname, nil, 1, 32, square1a, nil, Attack, "home", nil, 32, nil, FP, {CDeaths(FP, AtLeast, HatTimeline[7] * SDspeed, Deathvar)})
        CSPlotOrder(square2, P6, 38, Hatname, nil, 1, 32, square1a, nil, Attack, "home", nil, 32, nil, FP, {CDeaths(FP, AtLeast, HatTimeline[7] * SDspeed, Deathvar)})

        for e = 1, 5 do
            CSPlotOrder(CS_Rotate(Line1, (1 - e) * 72), P6, 44, Hatname, nil, 1, 32, Line1, nil, Attack, "home", nil, 32, nil, FP, {CDeaths(FP, AtLeast, (HatTimeline[8] + (e * 0.2)) * SDspeed, Deathvar)})
        end

        CSPlotOrder(upperTri, P6, 51, Hatname, nil, 1, 32, upperTriA, nil, Attack, "home", nil, 32, nil, FP, {CDeaths(FP, AtLeast, HatTimeline[9] * SDspeed, Deathvar)})
        CSPlotOrder(downTri, P6, 38, Hatname, nil, 1, 32, upperTriA, nil, Attack, "home", nil, 32, nil, FP, {CDeaths(FP, AtLeast, HatTimeline[9] * SDspeed, Deathvar)})

        CIfEnd()
    end

    function LairGunplotLv1()
        
    end



    CElseX() -- Case of Hell difficulty


    CIfXEnd()

    HatdeathvarArr = {Hatdeathvar1,Hatdeathvar2,Hatdeathvar3,Hatdeathvar4,Hatdeathvar5}

    for i = 1, 5 do
        HatGunplotLv1("hatch"..i, HatdeathvarArr[i])
    end

end