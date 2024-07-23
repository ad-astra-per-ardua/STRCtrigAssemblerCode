from eudplib import *
import math


def beforeTriggerExec():
    Name_1 = EUDVariable()
    Name_2 = EUDVariable()
    Name_3 = EUDVariable()
    Name_4 = EUDVariable()
    Name_5 = EUDVariable()
    Name_6 = EUDVariable()
 

    Name_1 = f_dwread_epd_safe(EPD(0x6D0F48))
    Name_2 = f_dwread_epd_safe(EPD(0x6D0F4C))
    Name_3 = f_dwread_epd_safe(EPD(0x6D0F50))
    Name_4 = f_dwread_epd_safe(EPD(0x6D0F54))
    Name_5 = f_dwread_epd_safe(EPD(0x6D0F58))
    Name_6 = f_dwread_epd_safe(EPD(0x6D0F5C))

    Na_1, Na_2, Na_3, Na_4 = f_dwbreak(Name_1)[2:]
    Na_5, Na_6, Na_7, Na_8 = f_dwbreak(Name_2)[2:]
    Na_9, Na_10, Na_11, Na_12 = f_dwbreak(Name_3)[2:]
    Na_13, Na_14, Na_15, Na_16 = f_dwbreak(Name_4)[2:]
    Na_17, Na_18, Na_19, Na_20 = f_dwbreak(Name_5)[2:]
    Na_21, Na_22, Na_23, Na_24 = f_dwbreak(Name_6)[2:]

    if EUDIf()((Na_1 == 35, Na_2 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_2 == 35, Na_3 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_3 == 35, Na_4 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_4 == 35, Na_5 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_5 == 35, Na_6 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_6 == 35, Na_7 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_7 == 35, Na_8 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_8 == 35, Na_9 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_9 == 35, Na_10 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_10 == 35, Na_11 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_11 == 35, Na_12 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_12 == 35, Na_13 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_13 == 35, Na_14 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_14 == 35, Na_15 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_15 == 35, Na_16 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_16 == 35, Na_17 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_17 == 35, Na_18 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_18 == 35, Na_19 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_19 == 35, Na_20 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_20 == 35, Na_21 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_21 == 35, Na_22 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_22 == 35, Na_23 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()

    if EUDIf()((Na_23 == 35, Na_24 == 68)):
        DoActions(SetSwitch("#D", Set))
    EUDEndIf()







    reph_epd = f_epdread_epd(EPD(0x6D5CD8))
    Ky = EUDVariable()
    Kz = EUDVariable()
    Kw = EUDVariable()
    Kx = EUDVariable()


    
    

    Ba = EUDVariable()
    Bb = EUDVariable()
    Bc = EUDVariable()
    Bd = EUDVariable()
    Be = EUDVariable()
    Bf = EUDVariable()
    Bg = EUDVariable()
    Bh = EUDVariable()
    Bi = EUDVariable()
    Bt = EUDVariable()
    Bx = EUDVariable()
    By = EUDVariable()
    Bz = EUDVariable()

    Ca = EUDVariable()
    Cb = EUDVariable()
    Cd = EUDVariable()
    Ce = EUDVariable()
    Cf = EUDVariable()
    Cg = EUDVariable()
    Ch = EUDVariable()
    Cn = EUDVariable()


    Da = EUDVariable()
    Db = EUDVariable()
    Dc = EUDVariable()
    Dd = EUDVariable()
    De = EUDVariable()
    Df = EUDVariable()
    Dg = EUDVariable()
    Dh = EUDVariable()
    Dn = EUDVariable()
    Dm = EUDVariable()

    Fc = EUDVariable()
    Fd = EUDVariable()
    Fe = EUDVariable()
    Ff = EUDVariable()
    Fg = EUDVariable()
    Fh = EUDVariable()
    Fn = EUDVariable()
    Fm = EUDVariable()
    Fi = EUDVariable()
    Fs = EUDVariable()
    Fw = EUDVariable()
    Fj = EUDVariable()
    Fx = EUDVariable()
    Fy = EUDVariable()
    Fu = EUDVariable()
    Fv = EUDVariable()
    Fo = EUDVariable()
    Fi = EUDVariable()
    Fparty = EUDVariable()
    Fpartx = EUDVariable()
    Fpartxy = EUDVariable()

    Gi = EUDVariable()
    Gi << 0
    Gj = EUDVariable()
    Gj << 0
    Gp = EUDVariable()
    Gp << 0
    Gq = EUDVariable()
    Gq << 0


    Ha = EUDVariable()
    Hb = EUDVariable()
    Hc = EUDVariable()
    Hd = EUDVariable()
    He = EUDVariable()
    Hf = EUDVariable()
    Hg = EUDVariable()
    Hh = EUDVariable()
    Hi = EUDVariable()
    Hj = EUDVariable()
    Hk = EUDVariable()
    Hl = EUDVariable()
    Hm = EUDVariable()
    Hn = EUDVariable()
    Ho = EUDVariable()
    Hp = EUDVariable()
    Hx = EUDVariable()
    Hw = EUDVariable()
    Hy = EUDVariable()
    Hz = EUDVariable()
    Hq = EUDVariable()
    Hr = EUDVariable()
    Hs = EUDVariable()
    Ht = EUDVariable()
    Hu = EUDVariable()
    Hv = EUDVariable()


    Ia = EUDVariable()
    Ib = EUDVariable()
    Ic = EUDVariable()
    Id = EUDVariable()
    Ie = EUDVariable()
    Ih = EUDVariable()
    Ig = EUDVariable()
    Ii = EUDVariable()
    Ix = EUDVariable()
    Iw = EUDVariable()
    In = EUDVariable()
    Ik = EUDVariable()
    Il = EUDVariable()
    Iy = EUDVariable()
    Iq = EUDVariable()
    Is = EUDVariable()
    Io = EUDVariable()
    Ip = EUDVariable()

    Jn = EUDVariable()
    Jm = EUDVariable()
    Jr = EUDVariable()
    Jo = EUDVariable()
    Jθ = EUDVariable()
    Ji = EUDVariable()
    Jj = EUDVariable()
    Jfx = EUDVariable()
    Jfy = EUDVariable()


    Ln = EUDVariable()
    Lm = EUDVariable()
    Lr = EUDVariable()
    Lw = EUDVariable()
    Lx = EUDVariable()
    Ly = EUDVariable()

    Lθ = EUDVariable()
    Li = EUDVariable()
    Lj = EUDVariable()
    Lfx = EUDVariable()
    Lfy = EUDVariable()













    Ci = EUDVariable()
    Ci << 0
    Cj = EUDVariable()
    Cj << 0
    Cp = EUDVariable()
    Cp << 0
    Cq = EUDVariable()
    Cq << 0
    Di = EUDVariable()

    Dr = EUDVariable()

    Dt = EUDVariable()
    Dt << 0
    Dh = EUDVariable()
    Dh << 0
    Ds = EUDVariable()
    Ds << 0
    Dz = EUDVariable()
    Dz << 0
    Dw = EUDVariable()
    Dw << 0
    EHp = EUDVariable()
    EHp << 0
    Eexy = EUDVariable()
    Eexy << 0
    Eex = EUDVariable()
    Eex << 0
    Eey = EUDVariable()
    Eey << 0
    ESh = EUDVariable()
    ESh << 0
    Efx = EUDVariable()
    Efx << 0
    Efy = EUDVariable()
    Efy << 0
    En = EUDVariable()
    En << 0
    Ei = EUDVariable()
    Ei << 0
    Ej = EUDVariable()
    Ej << 0
    Ecd = EUDVariable()
    Ecd << 0
    Ec = EUDVariable()
    Ec << 0
    Ez = EUDVariable()
    Ez << 0
    Et = EUDVariable()
    Et << 0
    Eux = EUDVariable()
    Eux << 0    
    Es = EUDVariable()
    Es << 0 
    Eg = EUDVariable()
    Eg << 0
    Egx = EUDVariable()
    Egx << 0
    Er = EUDVariable()
    Er << 0

    FHp = EUDVariable()
    FHp << 0
    Fexy = EUDVariable()
    Fexy << 0
    Fex = EUDVariable()
    Fex << 0
    Fey = EUDVariable()
    Fey << 0
    FSh = EUDVariable()
    FSh << 0
    Ffx = EUDVariable()
    Ffx << 0
    Ffy = EUDVariable()
    Ffy << 0
    Fn = EUDVariable()
    Fn << 0
    Fi = EUDVariable()
    Fi << 0
    Fj = EUDVariable()
    Fj << 0
    Fcd = EUDVariable()
    Fcd << 0
    Fc = EUDVariable()
    Fc << 0
    Fz = EUDVariable()
   
    Ft = EUDVariable()
    Ft << 0
    Fux = EUDVariable()
    Fux << 0    
    Fs = EUDVariable()
    Fs << 0 
    Fg = EUDVariable()
    Fg << 0
    Fgx = EUDVariable()
    Fgx << 0
    Fp = EUDVariable()
    Fp << 0
    Fa = EUDVariable()
    Fa << 0
    Fb = EUDVariable()
    Fb << 0
    Fo = EUDVariable()
    Fo << 0
    Fm = EUDVariable()
    Fm << 0
    Fq = EUDVariable()
    Fq << 0


    Ga = EUDVariable()
    Ga << 0


    Gb = EUDVariable()
    Gb << 0
    Gn = EUDVariable()
    Gn << 0
    Gx = EUDVariable()
    Gx << 0
    Gy = EUDVariable()
    Gy << 0
    Gv = EUDVariable()
    Gv << 0
    Gu = EUDVariable()
    Gu << 0
    Gc= EUDVariable()
    Gc << 0
    Gd = EUDVariable()
    Gd << 0
    Gm = EUDVariable()
    Gm << 0








    Mp = EUDVariable()
    Mp << 0
    Mq = EUDVariable()
    Mq << 0
    Mr = EUDVariable()
    Mr << 0
    Ms = EUDVariable()
    Ms << 0
    Mt = EUDVariable()
    Mt << 0
    Mdx = EUDVariable()
    Mdx << 0
    Mdy = EUDVariable()
    Mdy << 0
    Mdu = EUDVariable()
    Mdu << 0
    Mdv = EUDVariable()
    Mdv << 0



    
    Md = EUDVariable()
    Md << 0

    Mn = EUDVariable()
    Mn << 0

    Mdp = EUDVariable()
    Mdp << 0
 

    Mdq = EUDVariable()
    Mdq << 0

    Np = EUDVariable()
    Np << 0
    Nq = EUDVariable()
    Nq << 0
    Nr = EUDVariable()
    Nr << 0
    Ns = EUDVariable()
    Ns << 0
    Nt = EUDVariable()
    Nt << 0
    Ndx = EUDVariable()
    Ndx << 0
    Ndy = EUDVariable()
    Ndy << 0
    Ndu = EUDVariable()
    Ndu << 0
    Ndv = EUDVariable()
    Ndv << 0



    
    Nd = EUDVariable()
    Nd << 0

    Nn = EUDVariable()
    Nn << 0

    Ndp = EUDVariable()
    Ndp << 0
 

    Ndq = EUDVariable()
    Ndq << 0

    Op = EUDVariable()
    Op << 0
    Oq = EUDVariable()
    Oq << 0
    Or = EUDVariable()
    Or << 0
    Os = EUDVariable()
    Os << 0
    Ot = EUDVariable()
    Ot << 0
    Odx = EUDVariable()
    Odx << 0
    Ody = EUDVariable()
    Ody << 0
    Odu = EUDVariable()
    Odu << 0
    Odv = EUDVariable()
    Odv << 0



    
    Od = EUDVariable()
    Od << 0

    On = EUDVariable()
    On << 0

    Odp = EUDVariable()
    Odp << 0
 

    Odq = EUDVariable()
    Odq << 0

    Pp = EUDVariable()
    Pp << 0
    Pq = EUDVariable()
    Pq << 0
    Pr = EUDVariable()
    Pr << 0
    Ps = EUDVariable()
    Ps << 0
    Pt = EUDVariable()
    Pt << 0
    Pdx = EUDVariable()
    Pdx << 0
    Pdy = EUDVariable()
    Pdy << 0
    Pdu = EUDVariable()
    Pdu << 0
    Pdv = EUDVariable()
    Pdv << 0



    
    Pd = EUDVariable()
    Pd << 0

    Pn = EUDVariable()
    Pn << 0

    Pdp = EUDVariable()
    Pdp << 0
 

    Pdq = EUDVariable()
    Pdq << 0
 
  
    Zp = EUDVariable()
    Zp << 0
    Zq = EUDVariable()
    Zq << 0
    Zr = EUDVariable()
    Zr << 0
    Zs = EUDVariable()
    Zs << 0
    Zt = EUDVariable()
    Zt << 0
    Zdx = EUDVariable()
    Zdx << 0
    Zdy = EUDVariable()
    Zdy << 0
    Zdu = EUDVariable()
    Zdu << 0
    Zdv = EUDVariable()
    Zdv << 0
    Zd = EUDVariable()
    Zd << 0
    Zn = EUDVariable()
    Zn << 0
    Zdp = EUDVariable()
    Zdp << 0
    Zdq = EUDVariable()
    Zdq << 0
    Zθ = EUDVariable()
    Zθ << 0
    Zc = EUDVariable()
    Zc << 0



    La = EUDVariable()
    La << 0



    Aa = EUDVariable()
    Aa << 0
    Ab = EUDVariable()
    Ab << 0
    Ac = EUDVariable()
    Ac << 0
    Ld = EUDVariable()
    Le = EUDVariable()
    Vn = EUDVariable()
    Pdk = EUDVariable()
    Pdl = EUDVariable()
    Odl = EUDVariable()
    Odk = EUDVariable()
    Ndk = EUDVariable()
    Ndl = EUDVariable()
    Mdl = EUDVariable()
    Mdk = EUDVariable()
    Pθ = EUDVariable()
    Oθ = EUDVariable()
    Nθ = EUDVariable()
    Mθ = EUDVariable()

    Δx = EUDVariable()
    Δy = EUDVariable()
    Δw = EUDVariable()
    Δt = EUDVariable()
    Δu = EUDVariable()
    Δv = EUDVariable()

    Su = EUDVariable()

    #X_XX = EUDVariable()
    #X_XY = EUDVariable()
    #X_XZ = EUDVariable()

    NextPtre1 = EUDVariable()
    NextPtre2 = EUDVariable()




   
 
 







    if EUDInfLoop()():

        # Repulse Map를 계속 0으로 설정 -> 공중유닛끼리 밀림 현상 방지
        m = EUDVariable()
        m << reph_epd
        t = EUDLightVariable()
        t << 29244 // 4
        
        if EUDWhile()(t >= 1):
            DoActions([
                t.SubtractNumber(1),
                SetDeaths(m, SetTo, 0, 0),
                m.AddNumber(1)
            ])
        EUDEndWhile()

        #X_XX = f_dwread_epd_safe(156287) -- 0x18 확인용 트리거
        #X_XY, X_XZ = f_dwbreak(X_XX)[0:2]
        #f_dwwrite_epd(156287,0x04000400)

        #DoActions([SetResources(P1,SetTo,X_XY, Ore), SetResources(P1,SetTo,X_XZ,Gas),])


























        #stage I







        Be, Bf = f_lengthdir(2000,Bz + 180)
        Bg, Bh = f_lengthdir(2000,Bz)
        Ba, Bb = f_lengthdir(2000,Bx)
        Bc, Bd = f_lengthdir(2000,By)


        if EUDIf()(Bi == 0):
            Bt << 2048
            Bi << Bi + 1
        if EUDElseIf()((Bi >= 1,Bi <=  64)):
            Bt << Bt - 5
            Bi << Bi + 1
        if EUDElseIf()((Bi >= 65 ,Bi <= 192)):
            Bt << Bt + 5
            Bi << Bi + 1
        if EUDElseIf()((Bi >= 193, Bi <= 256)):
            Bt << Bt - 5
            Bi << Bi + 1
        if EUDElseIf()(Bi >= 257):
            Bt << 2048
            Bi << 0
        EUDEndIf()
        


        Trigger(
                conditions=[
                        Switch("#2",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Deaths(P7,AtMost,1412,"!stage"),
                        
                ],
                actions=[
                    SetMemory(0x6606B0,SetTo,16 * 16777216),

                    SetMemory(0x6CA0E4, SetTo, 1680),


                    SetMemory(0x58E5E8,SetTo,Bt),
                    SetMemory(0x58E1F0,SetTo,Bt),




                    SetMemory(0x58E1EC,SetTo,Bt + Ba),
                    SetMemory(0x58E1F4,SetTo,Bt + Ba),
                    SetMemory(0x58E1F0,SetTo,2048 + Bb),
                    SetMemory(0x58E1F8,SetTo,2048 + Bb),
                
                    CreateUnit(1, "Slow Missile","122", P6),
                    MoveLocation("!g_5", "Slow Missile", P6, "Anywhere"),
                    GiveUnits(1, "Slow Missile", P6, "!g_5", P8),
                    Order("Slow Missile", P8, "!g_5", Move, "!e"),

                    Bx.AddNumber(9),
                   

                    SetMemory(0x58E1EC,SetTo,Bt + Ba),
                    SetMemory(0x58E1F4,SetTo,Bt + Ba),
                    SetMemory(0x58E1F0,SetTo,2048 + Bb),
                    SetMemory(0x58E1F8,SetTo,2048 + Bb),
                
                    CreateUnit(1, "Fast Missile","122", P5),
                    MoveLocation("!g_6", "Fast Missile", P5, "Anywhere"),
                    GiveUnits(1, "Fast Missile", P5, "!g_6", P7),
                    Order("Fast Missile", P7, "!g_6", Move, "!e"),

                    By.AddNumber(4),


                    SetMemory(0x58E1EC,SetTo,Bt + Be),
                    SetMemory(0x58E1F4,SetTo,Bt + Be),
                    SetMemory(0x58E1F0,SetTo,2048 + Bf),
                    SetMemory(0x58E1F8,SetTo,2048 + Bf),
                
                    CreateUnit(1, "Normal Missile","122", P5),
                    MoveLocation("!g_6", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!g_6", P7),
                    Order("Normal Missile", P7, "!g_6", Move, "!e"),

                    


                    SetMemory(0x58E1EC,SetTo,Bt + Bg ),
                    SetMemory(0x58E1F4,SetTo,Bt + Bg),
                    SetMemory(0x58E1F0,SetTo,2048 + Bh),
                    SetMemory(0x58E1F8,SetTo,2048 + Bh),
                
                    CreateUnit(1, "Normal Missile","122", P6),
                    MoveLocation("!g_6", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!g_6", P8),
                    Order("Normal Missile", P8, "!g_6", Move, "!e"),

                    Bz.AddNumber(11),



                   
                ]
            )

        #stage II





        Ca = f_dwrand()
        Cb = f_dwrand()

        Ca << Ca // 6710886
        Cb << Cb // 20069941



        Trigger(
            conditions=[
                        Switch("#3",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Deaths(P7,AtMost,1412,"!stage"),
                        Deaths(P4,Exactly,0,"!wait2"),
                        Cn == 0,
                       
                        
            ],
            actions=[
                    
                    
                    
                    Cn.AddNumber(360),  
                    Ch.AddNumber(5),
                    SetDeaths(P4,Add,12,"!wait2"),
                   

                                   
            ]
        )







        if EUDWhile()(Cn >= 1):



                Cd, Ce = f_lengthdir(1800,Cn + Ch)
                Cf, Cg = f_lengthdir(48,Cn)


            



        Trigger(
            conditions=[
                        Cn >= 1,
                       
                        
            ],
            actions=[
                    SetMemory(0x6606B4,SetTo,16),

                    SetMemory(0x58E37C,SetTo,1696 + Ca + Cf),
                    SetMemory(0x58E384,SetTo,1696 + Ca + Cf),
                    SetMemory(0x58E380,SetTo,1696 + Cb + Cg),
                    SetMemory(0x58E388,SetTo,1696 + Cb + Cg),
                    SetMemory(0x58E3A4,SetTo,1696 + Ca + Cd),
                    SetMemory(0x58E3AC,SetTo,1696 + Ca + Cd),
                    SetMemory(0x58E3A8,SetTo,1696 + Cb + Ce),
                    SetMemory(0x58E3B0,SetTo,1696 + Cb + Ce),
                    
                    
                
                    CreateUnit(1, "Normal Missile","!5s", P5),
                    MoveLocation("!5g", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!5g", P7),
                    Order("Normal Missile", P7, "!5g", Move, "!5e"),
                    
                    Cn.SubtractNumber(10),

                    
            ]
        )
        EUDEndWhile()


        #Stage III



         # 5Stage start



        if EUDIf()(Eg == 0):
            Egx << 2048
        if EUDElseIf()((Eg >= 1,Eg <= 124 )):
            Egx << Egx - 2
            Eg << Eg + 1
        if EUDElseIf()((Eg >= 125 ,Eg <= 372)):
            Egx << Egx + 2
            Eg << Eg + 1
        if EUDElseIf()((Eg >= 373, Eg <= 496)):
            Egx << Egx - 2
            Eg << Eg + 1
        if EUDElseIf()(Eg >= 497):
            Egx << 2048
            Eg << 1
        EUDEndIf()


        Er = f_dwrand()

        if EUDIf()((Er >= 0 , Er <= 2^8-1)):
            Er << 0
        if EUDElseIf()((Er >= 2^8 , Er <= 2^16-1)):
            Er << 2
        if EUDElseIf()((Er >= 2^16 , Er <= 2^24-1)):
            Er << 5
        if EUDElseIf()((Er >= 2^24 , Er <= 2^32-1)):
            Er << 8
        EUDEndIf()


            



        Trigger(
            conditions=[
                        Switch("#4",Set),
                        Deaths(P7,Exactly,1411,"!stage"),
                        
                        
            ],
            actions=[
                    
                    
                    
                    
                    SetDeaths(P11,Add,12,"!wait"),
                    Eg.AddNumber(1),                  
            ],
        )






        Trigger(
            conditions=[
                        Switch("#4",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Deaths(P10,Exactly,0,"!wait"),
                        
            ],
            actions=[
                    
                    
                    
                    En.AddNumber(360),  
                    SetDeaths(P10,SetTo,24,"!wait"),                  
            ],
        )


        


        

    
        if EUDWhile()(En >= 1):
            Ex, Ey = f_lengthdir(1800,En + Er)
            Eu, Ev = f_lengthdir(32,En + Er)

            NextPtre1 << f_dwread_epd(EPD(0x628438))

            Trigger(
            conditions=[
                        En >= 1
                        
            ],
            actions=[
                    SetMemory(0x6606B4,SetTo,16),
                    SetMemory(0x58E37C,SetTo,Egx + Eu),
                    SetMemory(0x58E384,SetTo,Egx + Eu),
                    SetMemory(0x58E380,SetTo,1800 + Ev),
                    SetMemory(0x58E388,SetTo,1800 + Ev),
                    SetMemory(0x58E3A4,SetTo,Egx + Ex),
                    SetMemory(0x58E3AC,SetTo,Egx + Ex),
                    SetMemory(0x58E3A8,SetTo,1800 + Ey),
                    SetMemory(0x58E3B0,SetTo,1800 + Ey),
                    SetMemory(0x6CA0E8,SetTo,2400),
                    
                
                    CreateUnit(1, "Normal Missile","!5s", P6),
                    MoveLocation("!5g", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!5g", P8),
                    Order("Normal Missile", P8, "!5g", Move, "!5e"),

                    SetMemory(NextPtre1 + 0xA0,SetTo,Egx),
                    
                    En.SubtractNumber(9),
                    
            ],
            )
        EUDEndWhile()





        Trigger(
            conditions=[
                        Switch("#4",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Deaths(P11,Exactly,0,"!wait"),
                        
            ],
            actions=[
                    
                    
                    
                    En.AddNumber(360),  
                    SetDeaths(P11,SetTo,24,"!wait"),                  
            ],
        )



        if EUDWhile()(En >= 1):
            Ex, Ey = f_lengthdir(1800,En + Er)
            Eu, Ev = f_lengthdir(32,En + Er)

            NextPtre2 << f_dwread_epd(EPD(0x628438))

            Trigger(
            conditions=[
                        En >= 1
                        
            ],
            actions=[
                    SetMemory(0x6606B4,SetTo,16),
                    SetMemory(0x58E37C,SetTo,Egx + Eu),
                    SetMemory(0x58E384,SetTo,Egx + Eu),
                    SetMemory(0x58E380,SetTo,1800 + Ev),
                    SetMemory(0x58E388,SetTo,1800 + Ev),
                    SetMemory(0x58E3A4,SetTo,Egx + Ex),
                    SetMemory(0x58E3AC,SetTo,Egx + Ex),
                    SetMemory(0x58E3A8,SetTo,1800 + Ey),
                    SetMemory(0x58E3B0,SetTo,1800 + Ey),
                    SetMemory(0x6CA0E8,SetTo,2400),
                
                    CreateUnit(1, "Normal Missile","!5s", P5),
                    MoveLocation("!5g", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!5g", P7),
                    Order("Normal Missile", P7, "!5g", Move, "!5e"),

                    SetMemory(NextPtre2 + 0xA0,SetTo,Egx),
                    
                    En.SubtractNumber(9),
                    
            ],
            )
        EUDEndWhile()

        Trigger(
            conditions=[
                Switch("#4",Cleared),
                        
                        
            ],
            actions=[

                    
                Ei.SetNumber(99),
                Ej.SetNumber(0),

            ]
        )


        Ei << Ei - 1

        if EUDIf()(Ei == 0):

            DoActions(Ej.SetNumber(161741 + 25))

            if EUDWhile()(Ej >= 19025 + 25):

                if EUDIf()(Deaths(Ej,Exactly,196,0)): # Unit id

                    DoActions(Ej.SubtractNumber(25))

                    Eux = f_dwread_epd(Ej + 40)  # EPD(0x628298 + 0xA0 - 0x150 * Ej)


                
                    EHp = f_dwread_epd(Ej + 2)  # EPD(0x628298 + 0x08 - 0x150 * Ej)
                    ESh = f_dwread_epd(Ej + 24)  # EPD(0x628298 + 0x60 - 0x150 * Ej)
                    
     
                    Ec = f_bread_epd(Ej + 19,0) # EPD(0x628298 + 0x4C - 0x150 * Ej)


                    if EUDIf()((ESh >= 64,EHp >= 5000 * 256,Ec == 7)):
                        # 목적지의 length가 너무 길면 0~4096 범위를 벗어나게되서 찌그러짐. 3000 -> 2000

                        

                        Eexy = f_dwread_epd_safe(Ej + 6) # EPD(0x628298 + 0x18 - 0x150 * Ej)
                        Eex, Eey = f_dwbreak(Eexy)[0:2]


                        Eex << Eex - Eux
                        Eey << Eey - 1800

                        Eux << Eux * 10000



                        Efx << (9848 * Eex) - (1736 * Eey)
                        Efy << (1736 * Eex) + (9848 * Eey)

                        Efx << Efx + Eux
                        Efy << Efy + 18000000

                        Efx << Efx//10000
                        Efy << Efy//10000


                        Efy << Efy * 65536


                        f_dwwrite_epd(Ej + 6,Efx + Efy) # EPD(0x628298 + 0x18 - 0x150 * Ej)


                        EHp << EHp - 500*256




                        f_dwwrite_epd(Ej + 24,0) # EPD(0x628298 + 0x60 - 0x150 * Ej)

                        f_dwwrite_epd(Ej + 2,EHp) # EPD(0x628298 + 0x08 - 0x150 * Ej)
                        

                    EUDEndIf()



                    if EUDIf()((ESh >= 64,EHp >= 5000 * 256,Ec == 6)):
                        # 목적지의 length가 너무 길면 0~4096 범위를 벗어나게되서 찌그러짐. 3000 -> 2000

                        

                        Eexy = f_dwread_epd_safe(Ej + 6) # EPD(0x628298 + 0x18 - 0x150 * Ej)
                        Eex, Eey = f_dwbreak(Eexy)[0:2]


                        Eex << Eex - Eux
                        Eey << Eey - 1800

                        Eux << Eux * 10000



                        Efx << (9848 * Eex) + (1736 * Eey)
                        Efy << (9848 * Eey) - (1736 * Eex)  

                        Efx << Efx + Eux
                        Efy << Efy + 18000000

                        Efx << Efx//10000
                        Efy << Efy//10000


                        Efy << Efy * 65536


                        f_dwwrite_epd(Ej + 6,Efx + Efy) # EPD(0x628298 + 0x18 - 0x150 * Ej)


                        EHp << EHp - 500*256

                        f_dwwrite_epd(Ej + 24,0) # EPD(0x628298 + 0x60 - 0x150 * Ej)

                        f_dwwrite_epd(Ej + 2,EHp) # EPD(0x628298 + 0x08 - 0x150 * Ej)
                        

                    EUDEndIf()
                
                    DoActions(Ej.AddNumber(25))

                EUDEndIf()

                DoActions(Ej.SubtractNumber(84))

            EUDEndWhile()

            Ei << 18
  
        EUDEndIf()

        #Stage IV


        Dr = f_dwrand()
        Di = f_dwrand()

        Dr << Dr // 477218588
        Di << Di // 477218588




        Trigger(
            conditions=[
                        Switch("#5",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Deaths(P7,AtMost,1400,"!stage"),
                        Deaths(P4,Exactly,0,"!wait2"),
                        Dn == 0,
                       
                        
            ],
            actions=[
                    
                    
                    
                    Dn.AddNumber(360),  
                    
                    SetDeaths(P4,Add,36,"!wait2"),
                   

                                   
            ]
        )







        if EUDWhile()(Dn >= 1):



                Da, Db = f_lengthdir(1800,Dn + Dr)
                Dc, Dd = f_lengthdir(36,Dn + Dr + 180)


            



        Trigger(
            conditions=[
                        Dn >= 1,
                       
                        
            ],
            actions=[
                    SetMemory(0x6606B4,SetTo,16),
                    SetMemory(0x6606B0, SetTo, 269484032),

                    SetMemory(0x58E37C,SetTo,2048 + Dc),
                    SetMemory(0x58E384,SetTo,2048 + Dc),
                    SetMemory(0x58E380,SetTo,2048 + Dd),
                    SetMemory(0x58E388,SetTo,2048 + Dd),
                    SetMemory(0x58E3A4,SetTo,2048 + Da),
                    SetMemory(0x58E3AC,SetTo,2048 + Da),
                    SetMemory(0x58E3A8,SetTo,2048 + Db),
                    SetMemory(0x58E3B0,SetTo,2048 + Db),
                    SetMemory(0x6CA0E8,SetTo,3200),
                    
                    
                
                    CreateUnit(1, "Normal Missile","!5s", P6),
                    MoveLocation("!5g", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!5g", P8),
                    Order("Normal Missile", P8, "!5g", Move, "!5e"),
                    
                    Dn.SubtractNumber(10),

                    
            ]
        )
        EUDEndWhile()



        Trigger(
            conditions=[
                        Switch("#5",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Deaths(P7,AtMost,1300,"!stage"),
                        Deaths(P5,Exactly,0,"!wait2"),
                        Dm == 0,
                       
                        
            ],
            actions=[
                    
                    
                    
                    Dm.AddNumber(360),  
                    
                    SetDeaths(P5,Add,60,"!wait2"),
                   

                                   
            ]
        )







        if EUDWhile()(Dm >= 1):



                De, Df = f_lengthdir(1800,Dm + Di)
                Dg, Dh = f_lengthdir(36,Dm + Di + 180)


            



        Trigger(
            conditions=[
                        Dm >= 1,
                       
                        
            ],
            actions=[
                    SetMemory(0x6606B4,SetTo,16),
                    SetMemory(0x6606B0, SetTo, 269484032),

                    SetMemory(0x58E37C,SetTo,2048 + Dg),
                    SetMemory(0x58E384,SetTo,2048 + Dg),
                    SetMemory(0x58E380,SetTo,2048 + Dh),
                    SetMemory(0x58E388,SetTo,2048 + Dh),
                    SetMemory(0x58E3A4,SetTo,2048 + De),
                    SetMemory(0x58E3AC,SetTo,2048 + De),
                    SetMemory(0x58E3A8,SetTo,2048 + Df),
                    SetMemory(0x58E3B0,SetTo,2048 + Df),
                    
                    
                
                    CreateUnit(1, "Fast Missile","!5s", P5),
                    MoveLocation("!5g", "Fast Missile", P5, "Anywhere"),
                    GiveUnits(1, "Fast Missile", P5, "!5g", P7),
                    Order("Fast Missile", P7, "!5g", Move, "!5e"),
                    
                    Dm.SubtractNumber(9),

                    
            ]
        )
        EUDEndWhile()


        #Stage V


        Fo = f_dwrand()
        Fo << Fo // 11930465


        Trigger(
            conditions=[
                    Switch("#6",Set),
                    Deaths(P7,AtLeast,1,"!stage"),
                    Deaths(P7,AtMost,1300,"!stage"),
                    Deaths(P5,Exactly,0,"!wait2"),
                    Fm == 0,
                       
                        
            ],
            actions=[
                    
                    
                    
                    Fm.AddNumber(3),  
                    
                    SetDeaths(P5,Add,6,"!wait2"),
                   

                                   
            ]
        )







        if EUDWhile()(Fm >= 1):



                Fe, Ff = f_lengthdir(1800,Fo + Fm * 2)
                Fg, Fj = f_lengthdir(36,Fo + Fm * 2)


            



        Trigger(
            conditions=[
                        Fm >= 1,
                       
                        
            ],
            actions=[
                    SetMemory(0x6606B4,SetTo,16),
                    SetMemory(0x6606B0, SetTo, 269484032),

                    SetMemory(0x58E37C,SetTo,2048 + Fg),
                    SetMemory(0x58E384,SetTo,2048 + Fg),
                    SetMemory(0x58E380,SetTo,1800 + Fj),
                    SetMemory(0x58E388,SetTo,1800 + Fj),
                    SetMemory(0x58E3A4,SetTo,2048 + Fe),
                    SetMemory(0x58E3AC,SetTo,2048 + Fe),
                    SetMemory(0x58E3A8,SetTo,1800 + Ff),
                    SetMemory(0x58E3B0,SetTo,1800 + Ff),

                    SetMemory(0x6CA0E8,SetTo,3200),
                    
                    
                
                    CreateUnit(1, "Normal Missile","!5s", P5),
                    MoveLocation("!5g", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!5g", P7),
                    Order("Normal Missile", P7, "!5g", Move, "!5e"),
                    
                    Fm.SubtractNumber(1),

                    
            ]
        )
        EUDEndWhile()














        Trigger(
            conditions=[
                        Switch("#6",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Deaths(P7,AtMost,1410,"!stage"),
                        


                        Deaths(P4,Exactly,0,"!wait2"),

                        
            ],
            actions=[
                    
                    
                    
                    Fn.AddNumber(360),  
                    SetDeaths(P4,Add,36,"!wait2"),
                    Fd.AddNumber(7),


                                   
            ]
        )



        if EUDWhile()(Fn >= 1):


            Fx, Fy = f_lengthdir(1800,Fn)
            Fu, Fv = f_lengthdir(48,Fn)


            Fc << Fd + Fn
            if EUDIf()(Fc >= 361):

                Fc << Fc - 360

            EUDEndIf()






            




            if EUDIf()((Fc >= 0 , Fc < 90)):

                DoActions([SetMemory(0x6CA0E8,SetTo,1280 + 35 * Fc)])

            EUDEndIf()


            if EUDIf()((Fc >= 90 , Fc < 180)):

                DoActions([SetMemory(0x6CA0E8,SetTo, 1280 + 35 * (Fc - 90))])

            EUDEndIf()


            if EUDIf()((Fc >= 180 , Fc < 270)):

                DoActions([SetMemory(0x6CA0E8,SetTo,1280 + 35 * (Fc - 180 ))])

            EUDEndIf()


            if EUDIf()((Fc >= 270 , Fc <= 360)):

                DoActions([SetMemory(0x6CA0E8,SetTo,1280 + 35 * (Fc - 270))])

            EUDEndIf()


            




            



            Trigger(
                conditions=[
                            Fn >= 1,
                            
                            
                ],
                actions=[
                        SetMemory(0x6606B4,SetTo,16),
                        SetMemory(0x58E37C,SetTo,2048 + Fu),
                        SetMemory(0x58E384,SetTo,2048 + Fu),
                        SetMemory(0x58E380,SetTo,1800 + Fv),
                        SetMemory(0x58E388,SetTo,1800 + Fv),
                        SetMemory(0x58E3A4,SetTo,2048 + Fx),
                        SetMemory(0x58E3AC,SetTo,2048 + Fx),
                        SetMemory(0x58E3A8,SetTo,1800 + Fy),
                        SetMemory(0x58E3B0,SetTo,1800 + Fy),
                        
                        
                        
                    
                        CreateUnit(1, "Normal Missile","!5s", P6),
                        MoveLocation("!5g", "Normal Missile", P6, "Anywhere"),
                        GiveUnits(1, "Normal Missile", P6, "!5g", P8),
                        Order("Normal Missile", P8, "!5g", Move, "!5e"),
                        
                        Fn.SubtractNumber(6),
                        

                        
                ]
            )
        EUDEndWhile()


















































































        Fi << 1699





        Trigger(
            conditions=[
                        Switch("#6",Set),
                        Bring(P7, AtLeast, 1, "Normal Missile", "→Reflec"),
                        
                        
            ],
            actions=[
               
                    ModifyUnitHitPoints(All, "Normal Missile", P7, "→Reflec", 50),
                    Fw.SetNumber(0),


                    
                    

            ]
        )


        Trigger(
            conditions=[
                        Switch("#6",Set),
                        Bring(P7, AtLeast, 1, "Normal Missile", "←Reflec"),
                        
                        
            ],
            actions=[

                  
                    ModifyUnitHitPoints(All, "Normal Missile", P7, "←Reflec", 50),
                    Fw.SetNumber(0),


                    
                   

            ]
        )



        Trigger(
            conditions=[
                        Switch("#6",Set),
                        Bring(P7, AtLeast, 1, "Normal Missile", "↓Reflec"),
                        
                        
            ],
            actions=[

                    ModifyUnitHitPoints(All, "Normal Missile", P7, "↓Reflec", 30),
                   
                    Fw.SetNumber(0),

                    
                   

            ]
        )


        if EUDIf()(Fw == 0):

            DoActions(Fi.SetNumber(161741 + 25))

            if EUDWhile()(Fi >= 19025 + 25):

                if EUDIf()(Deaths(Fi,Exactly,196,0)): # Unit id

                    DoActions(Fi.SubtractNumber(25))

                    Fh = f_dwread_epd(Fi + 2) # EPF(0x628298 + 0x8 - 0x150 * Fi)
                    Fs = f_dwread_epd(Fi + 24) # EPF(0x628298 + 0x60 - 0x150 * Fi)

                    if EUDIf()((Fh == 5000 * 256, Fs == 10000 * 256)):

                        Fpartxy = f_dwread_epd_safe(Fi + 6) # EPF(0x628298 + 0x18 - 0x150 * Fi)
                        Fpartx, Fparty = f_dwbreak(Fpartxy)[0:2]


                        Fpartx << 4096 - Fpartx
                        Fparty << Fparty + 1000
                        Fparty << Fparty * 65536 



                        f_dwwrite_epd(Fi + 6,Fpartx + Fparty) # EPF(0x628298 + 0x18 - 0x150 * Fi)

                        f_dwwrite_epd(Fi + 24,0) # EPF(0x628298 + 0x60 - 0x150 * Fi)

                    EUDEndIf()


                    if EUDIf()((Fh == 3000 * 256, Fs == 10000 * 256)):

                        Fpartxy = f_dwread_epd_safe(Fi + 6) # EPF(0x628298 + 0x18 - 0x150 * Fi)
                        Fpartx, Fparty = f_dwbreak(Fpartxy)[0:2]

                        Fparty << 4096 - Fparty
                        Fparty << Fparty * 65536



                        f_dwwrite_epd(Fi + 6,Fpartx + Fparty) # EPF(0x628298 + 0x18 - 0x150 * Fi)

                        f_dwwrite_epd(Fi + 24,0) # EPF(0x628298 + 0x60 - 0x150 * Fi)

                    EUDEndIf()

                    DoActions(Fi.AddNumber(25))

                EUDEndIf()

                DoActions(Fi.SubtractNumber(84))

            EUDEndWhile()

            Fw << 2

        EUDEndIf()














        #Stage VI


        Gu, Gv = f_lengthdir(256,Gi)
        


        Trigger(
                conditions=[
                        Switch("#7",Set),
                        Deaths(P7,AtLeast,1,"!stage"),

                        
                ],
                actions=[

                    SetMemory(0x58E1D8,SetTo,2048 + Gu),
                    SetMemory(0x58E1E0,SetTo,2048 + Gu),
                    SetMemory(0x58E1DC,SetTo,2048 + Gv),
                    SetMemory(0x58E1E4,SetTo,2048 + Gv),
                
    
                    Gi.AddNumber(2),
                ]
            )

        Trigger(
            conditions=[

                Gi > 361,
            ],
            actions=[
                Gi.SubtractNumber(360),
            ]
        )

        


        Trigger(
            conditions=[
                        Switch("#7",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Bring(P8, AtLeast, 1, "Slow Missile", "→killm"),
                        
            ],
            actions=[
                    GiveUnits(1, "Slow Missile", P8, "→killm", P6),
                    
            ]
        )
        Trigger(
            conditions=[
                        Switch("#7",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Bring(P8, AtLeast, 1, "Slow Missile", "←killm"),
                        
            ],
            actions=[
                    GiveUnits(1, "Slow Missile", P8, "←killm", P6),
                    
            ]
        )
        Trigger(
            conditions=[
                        Switch("#7",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Bring(P8, AtLeast, 1, "Slow Missile", "↑killm"),
                        
            ],
            actions=[
                    GiveUnits(1, "Slow Missile", P8, "↑killm", P6),
                    
            ]
        )
        Trigger(
            conditions=[
                        Switch("#7",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Bring(P8, AtLeast, 1, "Slow Missile", "↓killm"),
                        
            ],
            actions=[
                    GiveUnits(1, "Slow Missile", P8, "↓killm", P6),
                    
            ]
        )



        Trigger(
            conditions=[
                        Switch("#7",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Bring(P8, AtLeast, 1, "Normal Missile", "→killm"),
                        
            ],
            actions=[
                    GiveUnits(1, "Normal Missile", P8, "→killm", P5),
                    
            ]
        )
        Trigger(
            conditions=[
                        Switch("#7",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Bring(P8, AtLeast, 1, "Normal Missile", "←killm"),
                        
            ],
            actions=[
                    GiveUnits(1, "Normal Missile", P8, "←killm", P5),
                    
            ]
        )
        Trigger(
            conditions=[
                        Switch("#7",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Bring(P8, AtLeast, 1, "Normal Missile", "↑killm"),
                        
            ],
            actions=[
                    GiveUnits(1, "Normal Missile", P8, "↑killm", P5),
                    
            ]
        )
        Trigger(
            conditions=[
                        Switch("#7",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Bring(P8, AtLeast, 1, "Normal Missile", "↓killm"),
                        
            ],
            actions=[
                    GiveUnits(1, "Normal Missile", P8, "↓killm", P5),
                    
            ]
        )



           
        Trigger(
            conditions=[
                        Switch("#7",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Bring(P6, AtLeast, 1, "Slow Missile", "Anywhere"),
                        
            ],
            actions=[
                    MoveLocation("!3s", "Slow Missile", P6, "Anywhere"),
                    MoveLocation("!3e", "Slow Missile", P6, "Anywhere"),
                    KillUnitAt(1, "Slow Missile", "!3s", P6),
                    SetMemory(0x6606B4,SetTo,0),
                    Gj.AddNumber(360),                    
            ]
        )




        

        Gp = f_dwread_epd(EPD(0x58E2DC))
        Gq = f_dwread_epd(EPD(0x58E2E0))

        

        

        if EUDWhile()(Gj >= 1):
            Gm, Gn = f_lengthdir(3000,Gj)
            Gk, Gl = f_lengthdir(32,Gj)


            



            Trigger(
            conditions=[
                        Gj >= 1
                        
            ],
            actions=[
                    SetMemory(0x58E2DC,SetTo,Gp + Gk),
                    SetMemory(0x58E2E4,SetTo,Gp + Gk),
                    SetMemory(0x58E2E0,SetTo,Gq + Gl),
                    SetMemory(0x58E2E8,SetTo,Gq + Gl),
                    SetMemory(0x58E2F0,SetTo,Gp + Gm),
                    SetMemory(0x58E2F8,SetTo,Gp + Gm),
                    SetMemory(0x58E2F4,SetTo,Gq + Gn),
                    SetMemory(0x58E2FC,SetTo,Gq + Gn),

                
                    CreateUnit(1, "Normal Missile","!3s", P6),
                    MoveLocation("!g", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!g", P7),
                    Order("Normal Missile", P7, "!g", Move, "!3e"),
                    
                    Gj.SubtractNumber(9),
                    
            ]
            )
        EUDEndWhile()  



        Trigger(
            conditions=[
                        Switch("#7",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Bring(P5, AtLeast, 1, "Normal Missile", "Anywhere"),
                        
            ],
            actions=[
                    MoveLocation("!3s", "Normal Missile", P5, "Anywhere"),
                    MoveLocation("!3e", "Normal Missile", P5, "Anywhere"),
                    KillUnitAt(1, "Normal Missile", "!3s", P5),
                    SetMemory(0x6606B4,SetTo,0),
                    Gj.AddNumber(360),                    
            ]
        )


        Gp = f_dwread_epd(EPD(0x58E2DC))
        Gq = f_dwread_epd(EPD(0x58E2E0))




        if EUDWhile()(Gj >= 1):
            Gm, Gn = f_lengthdir(3000,Gj)
            Gk, Gl = f_lengthdir(32,Gj)


            



        Trigger(
            conditions=[
                        Gj >= 1
                        
            ],
            actions=[
                    SetMemory(0x58E2DC,SetTo,Gp + Gk),
                    SetMemory(0x58E2E4,SetTo,Gp + Gk),
                    SetMemory(0x58E2E0,SetTo,Gq + Gl),
                    SetMemory(0x58E2E8,SetTo,Gq + Gl),
                    SetMemory(0x58E2F0,SetTo,Gp + Gm),
                    SetMemory(0x58E2F8,SetTo,Gp + Gm),
                    SetMemory(0x58E2F4,SetTo,Gq + Gn),
                    SetMemory(0x58E2FC,SetTo,Gq + Gn),
                
                    CreateUnit(1, "Fast Missile","!3s", P6),
                    MoveLocation("!g", "Fast Missile", P6, "Anywhere"),
                    GiveUnits(1, "Fast Missile", P6, "!g", P7),
                    Order("Fast Missile", P7, "!g", Move, "!3e"),
                    
                    Gj.SubtractNumber(6),
                    
            ]
            )
        EUDEndWhile()

        #Stage VII


        Trigger(
            conditions=[
                        Switch("#8",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                       
                        
            ],
            actions=[

                SetMemory(0x58DC60,SetTo,1200),
                SetMemory(0x58DC64,SetTo,1200),
                SetMemory(0x58DC68,SetTo,1254),
                SetMemory(0x58DC6C,SetTo,1254),


                SetMemory(0x58DCD8,SetTo,1200),
                SetMemory(0x58DCDC,SetTo,1200),
                SetMemory(0x58DCE0,SetTo,1254),
                SetMemory(0x58DCE4,SetTo,1254),

                SetMemory(0x58DCEC,SetTo,1200),
                SetMemory(0x58DCF0,SetTo,1200),
                SetMemory(0x58DCF4,SetTo,1254),
                SetMemory(0x58DCF8,SetTo,1254),

                SetMemory(0x58DD00,SetTo,1200),
                SetMemory(0x58DD04,SetTo,1200),
                SetMemory(0x58DD08,SetTo,1254),
                SetMemory(0x58DD0C,SetTo,1254),
                                    
            ]
        )



        #Stage VIII


        Trigger(
            conditions=[
                        Switch("#9",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                       
                        
            ],
            actions=[

                SetMemory(0x58DC60,SetTo,1200),
                SetMemory(0x58DC64,SetTo,1200),
                SetMemory(0x58DC68,SetTo,1248),
                SetMemory(0x58DC6C,SetTo,1248),


                SetMemory(0x58DCD8,SetTo,1200),
                SetMemory(0x58DCDC,SetTo,1200),
                SetMemory(0x58DCE0,SetTo,1248),
                SetMemory(0x58DCE4,SetTo,1248),

                SetMemory(0x58DCEC,SetTo,1200),
                SetMemory(0x58DCF0,SetTo,1200),
                SetMemory(0x58DCF4,SetTo,1248),
                SetMemory(0x58DCF8,SetTo,1248),

                SetMemory(0x58DD00,SetTo,1200),
                SetMemory(0x58DD04,SetTo,1200),
                SetMemory(0x58DD08,SetTo,1248),
                SetMemory(0x58DD0C,SetTo,1248),
                                    
            ]
        )





        Ha, Hb = f_lengthdir(2000,Hw)
        Hc, Hd = f_lengthdir(2000,Hw + 90)
        He, Hf = f_lengthdir(2000,Hw + 180)
        Hg, Hh = f_lengthdir(2000,Hw + 270)

        Hi, Hj = f_lengthdir(2000,36000 - Hx)
        Hk, Hl = f_lengthdir(2000,90 + 36000 - Hx)
        Hm, Hn = f_lengthdir(2000,180 + 36000 - Hx)
        Ho, Hp = f_lengthdir(2000,270 + 36000 - Hx)




        Trigger(
                conditions=[

                    Hy >= 1,
                        
                ],
                actions=[


                    Hy.SubtractNumber(1),



                   
                ]
            )





        


        Trigger(
                conditions=[
                        Switch("#9",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Deaths(P7,AtMost,1412,"!stage"),
                        Hy == 0
                        
                ],
                actions=[
                    SetMemory(0x6606B0, SetTo, 269484032),







                    SetMemory(0x58E1EC,SetTo,2048 + Ha),
                    SetMemory(0x58E1F4,SetTo,2048 + Ha),
                    SetMemory(0x58E1F0,SetTo,1888 + Hb),
                    SetMemory(0x58E1F8,SetTo,1888 + Hb),
                
                    CreateUnit(1, "Normal Missile","124", P5),
                    MoveLocation("!g_6", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!g_6", P7),
                    Order("Normal Missile", P7, "!g_6", Move, "!e"),

                    SetMemory(0x58E1EC,SetTo,2048 + Hc),
                    SetMemory(0x58E1F4,SetTo,2048 + Hc),
                    SetMemory(0x58E1F0,SetTo,1888 + Hd),
                    SetMemory(0x58E1F8,SetTo,1888 + Hd),
                
                    CreateUnit(1, "Normal Missile","126", P5),
                    MoveLocation("!g_6", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!g_6", P7),
                    Order("Normal Missile", P7, "!g_6", Move, "!e"),

                    SetMemory(0x58E1EC,SetTo,2048 + He),
                    SetMemory(0x58E1F4,SetTo,2048 + He),
                    SetMemory(0x58E1F0,SetTo,1888 + Hf),
                    SetMemory(0x58E1F8,SetTo,1888 + Hf),
                
                    CreateUnit(1, "Normal Missile","125", P5),
                    MoveLocation("!g_6", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!g_6", P7),
                    Order("Normal Missile", P7, "!g_6", Move, "!e"),

                    SetMemory(0x58E1EC,SetTo,2048 + Hg),
                    SetMemory(0x58E1F4,SetTo,2048 + Hg),
                    SetMemory(0x58E1F0,SetTo,1888 + Hh),
                    SetMemory(0x58E1F8,SetTo,1888 + Hh),
                
                    CreateUnit(1, "Normal Missile","127", P5),
                    MoveLocation("!g_6", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!g_6", P7),
                    Order("Normal Missile", P7, "!g_6", Move, "!e"),

                    


                    
                    SetMemory(0x58E1EC,SetTo,2048 + Hi),
                    SetMemory(0x58E1F4,SetTo,2048 + Hi),
                    SetMemory(0x58E1F0,SetTo,1888 + Hj),
                    SetMemory(0x58E1F8,SetTo,1888 + Hj),
                
                    CreateUnit(1, "Normal Missile","124", P6),
                    MoveLocation("!g_6", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!g_6", P8),
                    Order("Normal Missile", P8, "!g_6", Move, "!e"),


                    SetMemory(0x58E1EC,SetTo,2048 + Hk),
                    SetMemory(0x58E1F4,SetTo,2048 + Hk),
                    SetMemory(0x58E1F0,SetTo,1888 + Hl),
                    SetMemory(0x58E1F8,SetTo,1888 + Hl),
                
                    CreateUnit(1, "Normal Missile","126", P6),
                    MoveLocation("!g_6", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!g_6", P8),
                    Order("Normal Missile", P8, "!g_6", Move, "!e"),

                    SetMemory(0x58E1EC,SetTo,2048 + Hm),
                    SetMemory(0x58E1F4,SetTo,2048 + Hm),
                    SetMemory(0x58E1F0,SetTo,1888 + Hn),
                    SetMemory(0x58E1F8,SetTo,1888 + Hn),
                
                    CreateUnit(1, "Normal Missile","125", P6),
                    MoveLocation("!g_6", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!g_6", P8),
                    Order("Normal Missile", P8, "!g_6", Move, "!e"),


                    SetMemory(0x58E1EC,SetTo,2048 + Ho),
                    SetMemory(0x58E1F4,SetTo,2048 + Ho),
                    SetMemory(0x58E1F0,SetTo,1888 + Hp),
                    SetMemory(0x58E1F8,SetTo,1888 + Hp),
                
                    CreateUnit(1, "Normal Missile","127", P6),
                    MoveLocation("!g_6", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!g_6", P8),
                    Order("Normal Missile", P8, "!g_6", Move, "!e"),




                    Hw.AddNumber(6),
                    Hx.AddNumber(6),
                    Hy.SetNumber(2),



                   
                ]
            )









        Trigger(
            conditions=[
                        Switch("#9",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Deaths(P7,AtMost,1410,"!stage"),
                        


                        Deaths(P4,Exactly,0,"!wait2"),

                        
            ],
            actions=[
                    
                    
                    
                    Hq.AddNumber(360),  
                    SetDeaths(P4,Add,36,"!wait2"),
                    Hr.AddNumber(37),


                                   
            ]
        )

        Hs = f_dwrand()

        Hs << Hs // 477218588



        if EUDWhile()(Hq >= 1):


            Ht, Hz = f_lengthdir(1800,Hq + Hs)
            Hu, Hv = f_lengthdir(48,Hq + Hs)




            Trigger(
                conditions=[
                            Hq >= 1,
                            
                            
                ],
                actions=[
                        SetMemory(0x6606B4,SetTo,16),
                        SetMemory(0x58E37C,SetTo,2048 + Hu),
                        SetMemory(0x58E384,SetTo,2048 + Hu),
                        SetMemory(0x58E380,SetTo,1888 + Hv),
                        SetMemory(0x58E388,SetTo,1888 + Hv),
                        SetMemory(0x58E3A4,SetTo,2048 + Ht),
                        SetMemory(0x58E3AC,SetTo,2048 + Ht),
                        SetMemory(0x58E3A8,SetTo,1888 + Hz),
                        SetMemory(0x58E3B0,SetTo,1888 + Hz),


                        SetMemory(0x6CA0E4,SetTo,1780),
                        
                        
                        
                    
                        CreateUnit(1, "Slow Missile","!5s", P6),
                        MoveLocation("!5g", "Slow Missile", P6, "Anywhere"),
                        GiveUnits(1, "Slow Missile", P6, "!5g", P8),
                        Order("Slow Missile", P8, "!5g", Move, "!5e"),
                        
                        Hq.SubtractNumber(9),
                        

                        
                ]
            )
        EUDEndWhile()

        #Stage IX


        Ir = f_dwrand()


        Ir << Ir // 390451572





        Trigger(
            conditions=[
                        Switch("#10",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Deaths(P7,AtMost,1400,"!stage"),
                        Deaths(P4,Exactly,0,"!wait2"),
                        In == 0,
                       
                        
            ],
            actions=[
                    
                    
                    
                    In.AddNumber(360),  
                    
                    SetDeaths(P4,Add,36,"!wait2"),
                   

                                   
            ]
        )







        if EUDWhile()(In >= 1):



                Ia, Ib = f_lengthdir(1800,In + Ir)
                Ic, Id = f_lengthdir(36,In + Ir + 180)


            



        Trigger(
            conditions=[
                        In >= 1,
                       
                        
            ],
            actions=[
                    SetMemory(0x6606B4,SetTo,16),
                    SetMemory(0x6606B0, SetTo, 269484032),

                    SetMemory(0x6CA0E8,SetTo,2700),

                    SetMemory(0x58E37C,SetTo,1568 + Ic),
                    SetMemory(0x58E384,SetTo,1568 + Ic),
                    SetMemory(0x58E380,SetTo,1568 + Id),
                    SetMemory(0x58E388,SetTo,1568 + Id),
                    SetMemory(0x58E3A4,SetTo,1568 + Ia),
                    SetMemory(0x58E3AC,SetTo,1568 + Ia),
                    SetMemory(0x58E3A8,SetTo,1568 + Ib),
                    SetMemory(0x58E3B0,SetTo,1568 + Ib),
                    SetMemory(0x6CA0E8,SetTo,2800),
                    SetMemory(0x6CA0E4,SetTo,2300),
                    
                    
                
                    CreateUnit(1, "Normal Missile","!5s", P5),
                    MoveLocation("!5g", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!5g", P7),
                    Order("Normal Missile", P7, "!5g", Move, "!5e"),


                    SetMemory(0x58E37C,SetTo,2528 + Ic),
                    SetMemory(0x58E384,SetTo,2528 + Ic),
                    SetMemory(0x58E380,SetTo,1568 + Id),
                    SetMemory(0x58E388,SetTo,1568 + Id),
                    SetMemory(0x58E3A4,SetTo,2528 + Ia),
                    SetMemory(0x58E3AC,SetTo,2528 + Ia),
                    SetMemory(0x58E3A8,SetTo,1568 + Ib),
                    SetMemory(0x58E3B0,SetTo,1568 + Ib),

                    
                    
                
                    CreateUnit(1, "Normal Missile","!5s", P5),
                    MoveLocation("!5g", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!5g", P7),
                    Order("Normal Missile", P7, "!5g", Move, "!5e"),



                    SetMemory(0x58E37C,SetTo,2528 + Ic),
                    SetMemory(0x58E384,SetTo,2528 + Ic),
                    SetMemory(0x58E380,SetTo,2528 + Id),
                    SetMemory(0x58E388,SetTo,2528 + Id),
                    SetMemory(0x58E3A4,SetTo,2528 + Ia),
                    SetMemory(0x58E3AC,SetTo,2528 + Ia),
                    SetMemory(0x58E3A8,SetTo,2528 + Ib),
                    SetMemory(0x58E3B0,SetTo,2528 + Ib),

                    
                    
                
                    CreateUnit(1, "Normal Missile","!5s", P5),
                    MoveLocation("!5g", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!5g", P7),
                    Order("Normal Missile", P7, "!5g", Move, "!5e"),



                    SetMemory(0x58E37C,SetTo,1568 + Ic),
                    SetMemory(0x58E384,SetTo,1568 + Ic),
                    SetMemory(0x58E380,SetTo,2528 + Id),
                    SetMemory(0x58E388,SetTo,2528 + Id),
                    SetMemory(0x58E3A4,SetTo,1568 + Ia),
                    SetMemory(0x58E3AC,SetTo,1568 + Ia),
                    SetMemory(0x58E3A8,SetTo,2528 + Ib),
                    SetMemory(0x58E3B0,SetTo,2528 + Ib),

                    
                    
                
                    CreateUnit(1, "Normal Missile","!5s", P5),
                    MoveLocation("!5g", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!5g", P7),
                    Order("Normal Missile", P7, "!5g", Move, "!5e"),
                    
                    In.SubtractNumber(11),

                    
            ]
        )
        EUDEndWhile()


        if EUDWhile()(Iy >= 360):

            Iy << Iy - 360

        EUDEndWhile()
            

        Ie, Ig = f_lengthdir(10000, Iy)


        #Ie = cost , Ig = sint

    
        


        if EUDIf()((Ix == 0, Switch("#10",Set))):

            Ik << Ie * 10000
            Il << Ig * 10000

            DoActions([SetMemory(0x6CA0E0,SetTo,1612)])
            
        EUDEndIf()


        if EUDIf()((Ix == 1, Switch("#10",Set))):

            Ik << Ie * 9999 - Ig * 122
            Il << Ig * 9999 + Ie * 122

            DoActions([SetMemory(0x6CA0E0,SetTo,1624)])
            
        EUDEndIf()


        if EUDIf()((Ix == 2, Switch("#10",Set))):

            Ik << Ie * 9997 - Ig * 244
            Il << Ig * 9997 + Ie * 244


            DoActions([SetMemory(0x6CA0E0,SetTo,1636)])
            
        EUDEndIf()


        if EUDIf()((Ix == 3, Switch("#10",Set))):

            Ik << Ie * 9993 - Ig * 366
            Il << Ig * 9993 + Ie * 366


            DoActions([SetMemory(0x6CA0E0,SetTo,1648)])
            
        EUDEndIf()


        if EUDIf()((Ix == 4, Switch("#10",Set))):

            Ik << Ie * 9988 - Ig * 488
            Il << Ig * 9988 + Ie * 488

            DoActions([SetMemory(0x6CA0E0,SetTo,1600)])

            
        EUDEndIf()

        

  

        Trigger(
                conditions=[
                        Switch("#10",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Deaths(P7,AtMost,1412,"!stage"),
                       
                        
                ],
                actions=[
                    SetMemory(0x6606B0, SetTo, 269484032),

                    SetMemory(0x58E1EC,SetTo,(1568 * 66667 + Ik)//66667),
                    SetMemory(0x58E1F4,SetTo,(1568 * 66667 + Ik)//66667),
                    SetMemory(0x58E1F0,SetTo,(1568 * 66667 + Il)//66667),
                    SetMemory(0x58E1F8,SetTo,(1568 * 66667 + Il)//66667),
                
                    CreateUnit(1, "Fast Missile","128", P5),
                    MoveLocation("!g_6", "Fast Missile", P5, "Anywhere"),
                    GiveUnits(1, "Fast Missile", P5, "!g_6", P8),
                    Order("Fast Missile", P8, "!g_6", Move, "!e"),







                    SetMemory(0x58E1EC,SetTo,(2528 * 66667 + Ik)//66667),
                    SetMemory(0x58E1F4,SetTo,(2528 * 66667 + Ik)//66667),
                    SetMemory(0x58E1F0,SetTo,(1568 * 66667 + Il)//66667),
                    SetMemory(0x58E1F8,SetTo,(1568 * 66667 + Il)//66667),
                
                    CreateUnit(1, "Fast Missile","129", P5),
                    MoveLocation("!g_6", "Fast Missile", P5, "Anywhere"),
                    GiveUnits(1, "Fast Missile", P5, "!g_6", P8),
                    Order("Fast Missile", P8, "!g_6", Move, "!e"),




                    SetMemory(0x58E1EC,SetTo,(2528 * 50000 + Ik)//50000),
                    SetMemory(0x58E1F4,SetTo,(2528 * 50000 + Ik)//50000),
                    SetMemory(0x58E1F0,SetTo,(2528 * 50000 + Il)//50000),
                    SetMemory(0x58E1F8,SetTo,(2528 * 50000 + Il)//50000),
                
                    CreateUnit(1, "Fast Missile","130", P5),
                    MoveLocation("!g_6", "Fast Missile", P5, "Anywhere"),
                    GiveUnits(1, "Fast Missile", P5, "!g_6", P8),
                    Order("Fast Missile", P8, "!g_6", Move, "!e"),





                    SetMemory(0x58E1EC,SetTo,(1568 * 66667 + Ik)//66667),
                    SetMemory(0x58E1F4,SetTo,(1568 * 66667 + Ik)//66667),
                    SetMemory(0x58E1F0,SetTo,(2528 * 66667 + Il)//66667),
                    SetMemory(0x58E1F8,SetTo,(2528 * 66667 + Il)//66667),
                
                    CreateUnit(1, "Fast Missile","131", P5),
                    MoveLocation("!g_6", "Fast Missile", P5, "Anywhere"),
                    GiveUnits(1, "Fast Missile", P5, "!g_6", P8),
                    Order("Fast Missile", P8, "!g_6", Move, "!e"),





                    Ix.AddNumber(1),




                   
                ]
            )



        if EUDIf()(Ix == 5):

            Ix << 0
            Iy << Iy + 11

        EUDEndIf()



        #Stage X





        Trigger(
            conditions=[
                        Switch("#11",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Deaths(P10,Exactly,0,"!wait"),
                        
            ],
            actions=[
                    
                    
                    
                    Jn.AddNumber(360),  
                    SetDeaths(P10,SetTo,12,"!wait"),                  
            ]
        )


        


        

    
        if EUDWhile()(Jn >= 1):
            Jx, Jy = f_lengthdir(1800,Jn + Jr)
            Ju, Jv = f_lengthdir(32,Jn + Jr)


            


            



            Trigger(
            conditions=[
                        Jn >= 1
                        
            ],
            actions=[
                    SetMemory(0x6606B4,SetTo,16),
                    SetMemory(0x58E37C,SetTo,2048 + Ju),
                    SetMemory(0x58E384,SetTo,2048 + Ju),
                    SetMemory(0x58E380,SetTo,1800 + Jv),
                    SetMemory(0x58E388,SetTo,1800 + Jv),
                    SetMemory(0x58E3A4,SetTo,2048 + Jx),
                    SetMemory(0x58E3AC,SetTo,2048 + Jx),
                    SetMemory(0x58E3A8,SetTo,1800 + Jy),
                    SetMemory(0x58E3B0,SetTo,1800 + Jy),
                    SetMemory(0x6CA0E8, SetTo,1700),
                    
                
                    CreateUnit(1, "Normal Missile","!5s", P6),
                    MoveLocation("!5g", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!5g", P8),
                    Order("Normal Missile", P8, "!5g", Move, "!5e"),
                    
                    Jn.SubtractNumber(30),

                    
            ]
            )
        EUDEndWhile()





        Trigger(
            conditions=[
                        Switch("#11",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Deaths(P11,Exactly,0,"!wait"),
                        
            ],
            actions=[
                    
                    
                    
                    Jm.AddNumber(360),  
                    SetDeaths(P11,SetTo,12,"!wait"), 
                    Jr.AddNumber(1),                 
            ]
        )



        if EUDWhile()(Jm >= 1):
            Jx, Jy = f_lengthdir(1800,Jm + Jr)
            Ju, Jv = f_lengthdir(32,Jm + Jr)


            


            



            Trigger(
            conditions=[
                        Jm >= 1
                        
            ],
            actions=[
                    SetMemory(0x6606B4,SetTo,16),
                    SetMemory(0x58E37C,SetTo,2048 + Ju),
                    SetMemory(0x58E384,SetTo,2048 + Ju),
                    SetMemory(0x58E380,SetTo,1800 + Jv),
                    SetMemory(0x58E388,SetTo,1800 + Jv),
                    SetMemory(0x58E3A4,SetTo,2048 + Jx),
                    SetMemory(0x58E3AC,SetTo,2048 + Jx),
                    SetMemory(0x58E3A8,SetTo,1800 + Jy),
                    SetMemory(0x58E3B0,SetTo,1800 + Jy),
                    SetMemory(0x6CA0E8,SetTo,1700),
                    
                
                    CreateUnit(1, "Normal Missile","!5s", P5),
                    MoveLocation("!5g", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!5g", P7),
                    Order("Normal Missile", P7, "!5g", Move, "!5e"),
                    
                    Jm.SubtractNumber(30),


                    
            ]
            )
        EUDEndWhile()



        Jo << Jo + 1

        if EUDIf()((Jo >= 1, Jo <= 12)):
            Jθ << 30
        EUDEndIf()

        if EUDIf()((Jo >= 13, Jo <= 20)):
            Jθ << 15
        EUDEndIf()

        if EUDIf()((Jo >= 21, Jo <= 24)):
            Jθ << 0
        EUDEndIf()


        if EUDIf()((Jo >= 25, Jo <= 32)):
            Jθ << 345
        EUDEndIf()


        if EUDIf()((Jo >= 33, Jo <= 44)):
            Jθ << 330
        EUDEndIf()


        if EUDIf()((Jo >= 45, Jo <= 52)):
            Jθ << 345
        EUDEndIf()


        if EUDIf()((Jo >= 53, Jo <= 56)):
            Jθ << 0
        EUDEndIf()

        if EUDIf()((Jo >= 57, Jo <= 64)):
            Jθ << 15
        EUDEndIf()


        if EUDIf()(Jo >= 65):
            Jo << 1
        EUDEndIf()

        Ji << Ji - 1














        










        Trigger(
            conditions=[
                Switch("#11",Cleared),
                        
                        
            ],
            actions=[

                    
                Ji.SetNumber(99),
                Jj.SetNumber(0),

            ]
        )

        

        Jθx, Jθy = f_lengthdir(10000,Jθ)

        if EUDIf()(Ji == 0):

            DoActions(Jj.SetNumber(161741 + 25))

            if EUDWhile()(Jj >= 19025 + 25):

                if EUDIf()(Deaths(Jj,Exactly,196,0)): # Unit id

                    DoActions(Jj.SubtractNumber(25))

                    JHp = f_dwread_epd(Jj + 2)  # EPD(0x628298 + 0x08 - 0x150 * Jj)
                    JSh = f_dwread_epd(Jj + 24)  # EPD(0x628298 + 0x60 - 0x150 * Jj)
                     # EPD(0x628298 + 0x64 - 0x150 * Jj)
     
                    Jc = f_bread_epd(Jj + 19,0)

                    if EUDIf()((JSh >= 32,JHp >= 2000 * 256,Jc == 7)):
                        
                        # 목적지의 length가 너무 길면 0~4096 범위를 벗어나게되서 찌그러짐. 3000 -> 2000

                        

                        Jexy = f_dwread_epd_safe(Jj + 6) # EPD(0x628298 + 0x18 - 0x150 * Jj)
                        Jex, Jey = f_dwbreak(Jexy)[0:2]


                        Jex << Jex - 2048
                        Jey << Jey - 1800


                        Jfx << (Jθx * Jex) - (Jθy * Jey)
                        Jfy << (Jθy * Jex) + (Jθx * Jey)

                        Jfx << Jfx + 20480000
                        Jfy << Jfy + 18000000

                        Jfx << Jfx//10000
                        Jfy << Jfy//10000


                        Jfy << Jfy * 65536


                        f_dwwrite_epd(Jj + 6,Jfx + Jfy) # EPD(0x628298 + 0x18 - 0x150 * Jj)


                        JHp << JHp - 50*256




                        f_dwwrite_epd(Jj + 24,0) # EPD(0x628298 + 0x60 - 0x150 * Jj)

                        f_dwwrite_epd(Jj + 2,JHp) # EPD(0x628298 + 0x08 - 0x150 * Jj)
                        

                    EUDEndIf()



                    if EUDIf()((JSh >= 32,JHp >= 2000 * 256,Jc == 6)):
                        # 목적지의 length가 너무 길면 0~4096 범위를 벗어나게되서 찌그러짐. 3000 -> 2000
                        

                        

                        Jexy = f_dwread_epd_safe(Jj + 6) # EPD(0x628298 + 0x18 - 0x150 * Jj)
                        Jex, Jey = f_dwbreak(Jexy)[0:2]


                        Jex << Jex - 2048
                        Jey << Jey - 1800

                      
                        Jfx << (Jθx * Jex) + (Jθy * Jey)
                        Jfy << (Jθx * Jey) - (Jθy * Jex)  

                        Jfx << Jfx + 20480000
                        Jfy << Jfy + 18000000

                        Jfx << Jfx//10000
                        Jfy << Jfy//10000


                        Jfy << Jfy * 65536


                        f_dwwrite_epd(Jj + 6,Jfx + Jfy) # EPD(0x628298 + 0x18 - 0x150 * Jj)


                        JHp << JHp - 50*256



                        f_dwwrite_epd(Jj + 24,0) # EPD(0x628298 + 0x60 - 0x150 * Jj)

                        f_dwwrite_epd(Jj + 2,JHp) # EPD(0x628298 + 0x08 - 0x150 * Jj)
                        

                    EUDEndIf()

                    DoActions(Jj.AddNumber(25))

                EUDEndIf()

                DoActions(Jj.SubtractNumber(84))

            EUDEndWhile()

            Ji << 2

            
        EUDEndIf()

        #Stage XI


        Trigger(
            conditions=[
                        Switch("#12",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                       
                        
            ],
            actions=[

                SetMemory(0x58DC60,SetTo,1200),
                SetMemory(0x58DC64,SetTo,1200),
                SetMemory(0x58DC68,SetTo,1254),
                SetMemory(0x58DC6C,SetTo,1254),


                SetMemory(0x58DCD8,SetTo,1200),
                SetMemory(0x58DCDC,SetTo,1200),
                SetMemory(0x58DCE0,SetTo,1254),
                SetMemory(0x58DCE4,SetTo,1254),

                SetMemory(0x58DCEC,SetTo,1200),
                SetMemory(0x58DCF0,SetTo,1200),
                SetMemory(0x58DCF4,SetTo,1254),
                SetMemory(0x58DCF8,SetTo,1254),

                SetMemory(0x58DD00,SetTo,1200),
                SetMemory(0x58DD04,SetTo,1200),
                SetMemory(0x58DD08,SetTo,1254),
                SetMemory(0x58DD0C,SetTo,1254),
                                    
            ]
        )

        #Stage XII

        Trigger(
            conditions=[
                        Switch("#13",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                       
                        
            ],
            actions=[

                SetMemory(0x58DC60,SetTo,1200),
                SetMemory(0x58DC64,SetTo,1200),
                SetMemory(0x58DC68,SetTo,1248),
                SetMemory(0x58DC6C,SetTo,1248),


                SetMemory(0x58DCD8,SetTo,1200),
                SetMemory(0x58DCDC,SetTo,1200),
                SetMemory(0x58DCE0,SetTo,1248),
                SetMemory(0x58DCE4,SetTo,1248),

                SetMemory(0x58DCEC,SetTo,1200),
                SetMemory(0x58DCF0,SetTo,1200),
                SetMemory(0x58DCF4,SetTo,1248),
                SetMemory(0x58DCF8,SetTo,1248),

                SetMemory(0x58DD00,SetTo,1200),
                SetMemory(0x58DD04,SetTo,1200),
                SetMemory(0x58DD08,SetTo,1248),
                SetMemory(0x58DD0C,SetTo,1248),
                SetMemory(0x6CA0E8,SetTo,2600),
                SetMemory(0x6606B4,SetTo,16),
                                    
            ]
        )



    

        X_1, Y_1 = f_lengthdir(2000,Kw)
        X_2, Y_2 = f_lengthdir(2000,45 + Kz)
        X_3, Y_3 = f_lengthdir(2000,90 + Kw)
        X_4, Y_4 = f_lengthdir(2000,135 + Kz)
        X_5, Y_5 = f_lengthdir(2000,180 + Kw)
        X_6, Y_6 = f_lengthdir(2000,225 + Kz)
        X_7, Y_7 = f_lengthdir(2000,270 + Kw)
        X_8, Y_8 = f_lengthdir(2000,315 + Kz)



        Trigger(
                conditions=[
                        Switch("#13",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Deaths(P7,AtMost,1800,"!stage"),
                        
                ],
                actions=[
                    SetMemory(0x58E1EC,SetTo,2272 + X_1),
                    SetMemory(0x58E1F4,SetTo,2272 + X_1),
                    SetMemory(0x58E1F0,SetTo,1856 + Y_1),
                    SetMemory(0x58E1F8,SetTo,1856 + Y_1),
                
                    CreateUnit(1, "Normal Missile","133", P6),
                    MoveLocation("!g_1", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!g_1", P8),
                    Order("Normal Missile", P8, "!g_1", Move, "!e"),

                    SetMemory(0x58E1EC,SetTo,2272 + X_3),
                    SetMemory(0x58E1F4,SetTo,2272 + X_3),
                    SetMemory(0x58E1F0,SetTo,1856 + Y_3),
                    SetMemory(0x58E1F8,SetTo,1856 + Y_3),
                
                    CreateUnit(1, "Normal Missile","134", P6),
                    MoveLocation("!g_3", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!g_3", P8),
                    Order("Normal Missile", P8, "!g_3", Move, "!e"),

                    SetMemory(0x58E1EC,SetTo,2272 + X_5),
                    SetMemory(0x58E1F4,SetTo,2272 + X_5),
                    SetMemory(0x58E1F0,SetTo,1856 + Y_5),
                    SetMemory(0x58E1F8,SetTo,1856 + Y_5),
                
                    CreateUnit(1, "Normal Missile","135", P6),
                    MoveLocation("!g_5", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!g_5", P8),
                    Order("Normal Missile", P8, "!g_5", Move, "!e"),

                    SetMemory(0x58E1EC,SetTo,2272 + X_7),
                    SetMemory(0x58E1F4,SetTo,2272 + X_7),
                    SetMemory(0x58E1F0,SetTo,1856 + Y_7),
                    SetMemory(0x58E1F8,SetTo,1856 + Y_7),
                
                    CreateUnit(1, "Normal Missile","140", P6),
                    MoveLocation("!g_5", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!g_5", P8),
                    Order("Normal Missile", P8, "!g_5", Move, "!e"),














                    SetMemory(0x58E1EC,SetTo,1824 + X_2),
                    SetMemory(0x58E1F4,SetTo,1824 + X_2),
                    SetMemory(0x58E1F0,SetTo,1856 + Y_2),
                    SetMemory(0x58E1F8,SetTo,1856 + Y_2),
                
                    CreateUnit(1, "Normal Missile","136", P5),
                    MoveLocation("!g_2", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!g_2", P7),
                    Order("Normal Missile", P7, "!g_2", Move, "!e"),

                    SetMemory(0x58E1EC,SetTo,1824 + X_4),
                    SetMemory(0x58E1F4,SetTo,1824 + X_4),
                    SetMemory(0x58E1F0,SetTo,1856 + Y_4),
                    SetMemory(0x58E1F8,SetTo,1856 + Y_4),
                
                    CreateUnit(1, "Normal Missile","137", P5),
                    MoveLocation("!g_4", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!g_4", P7),
                    Order("Normal Missile", P7, "!g_4", Move, "!e"),

                    SetMemory(0x58E1EC,SetTo,1824 + X_6),
                    SetMemory(0x58E1F4,SetTo,1824 + X_6),
                    SetMemory(0x58E1F0,SetTo,1856 + Y_6),
                    SetMemory(0x58E1F8,SetTo,1856 + Y_6),
                
                    CreateUnit(1, "Normal Missile","138", P5),
                    MoveLocation("!g_6", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!g_6", P7),
                    Order("Normal Missile", P7, "!g_6", Move, "!e"),


                    SetMemory(0x58E1EC,SetTo,1824 + X_8),
                    SetMemory(0x58E1F4,SetTo,1824 + X_8),
                    SetMemory(0x58E1F0,SetTo,1856 + Y_8),
                    SetMemory(0x58E1F8,SetTo,1856 + Y_8),
                
                    CreateUnit(1, "Normal Missile","139", P5),
                    MoveLocation("!g_6", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!g_6", P7),
                    Order("Normal Missile", P7, "!g_6", Move, "!e"),
                    Kz.AddNumber(1),
                ]
            )
        Kz += Ky
        Kw += Kx
        Trigger(
            conditions=[

                Kz > 361,
            ],
            actions=[
                Kz.SubtractNumber(360),
            ]
        )

        Trigger(
            conditions=[

                Kw > 361,
            ],
            actions=[
                Kw.SubtractNumber(360),
            ]
        )


        Trigger(
            conditions=[
              Deaths(P5, Exactly, 0, "!wait"),
              Deaths(P7, AtLeast, 1, "!stage"),
              Deaths(P7,AtMost,1800,"!stage"),
              
            ],
            actions=[
                SetDeaths(P5,SetTo,60,"!wait"),
                Ky.AddNumber(11),
            ]
        )

        Trigger(
            conditions=[
              Deaths(P6, Exactly, 0, "!wait"),
              Deaths(P7, AtLeast, 1, "!stage"),
              Deaths(P7,AtMost,1800,"!stage"),
              
            ],
            actions=[
                SetDeaths(P6,SetTo,48,"!wait"),
                Kx.AddNumber(7),
            ]
        )
        
        #Stage XIII





        La, Lb = f_lengthdir(2000,Lw)
        Lc, Ld = f_lengthdir(2000,Lw + 120)
        Le, Lf = f_lengthdir(2000,Lw + 240)

 
        Lo, Lp = f_lengthdir(2000,Lx)
        Lk, Ll = f_lengthdir(2000,120 + Lx)
        Lg, Lh = f_lengthdir(2000,240 + Lx)





        Trigger(
                conditions=[

                    Ly >= 1,
                        
                ],
                actions=[


                    Ly.SubtractNumber(1),



                   
                ]
            )





        


        Trigger(
                conditions=[
                        Switch("#14",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Deaths(P7,AtMost,1412,"!stage"),
                        Ly == 0
                        
                ],
                actions=[
                    SetMemory(0x6606B0, SetTo, 269484032),
                    SetMemory(0x6CA0E8,SetTo,1700),
                    SetMemory(0x6CA0E0,SetTo,3200),







                    SetMemory(0x58E1EC,SetTo,2048 + La),
                    SetMemory(0x58E1F4,SetTo,2048 + La),
                    SetMemory(0x58E1F0,SetTo,1856 + Lb),
                    SetMemory(0x58E1F8,SetTo,1856 + Lb),
                
                    CreateUnit(1, "Fast Missile","141", P5),
                    MoveLocation("!g_6", "Fast Missile", P5, "Anywhere"),
                    GiveUnits(1, "Fast Missile", P5, "!g_6", P7),
                    Order("Fast Missile", P7, "!g_6", Move, "!e"),

                    SetMemory(0x58E1EC,SetTo,2048 + Lc),
                    SetMemory(0x58E1F4,SetTo,2048 + Lc),
                    SetMemory(0x58E1F0,SetTo,1856 + Ld),
                    SetMemory(0x58E1F8,SetTo,1856 + Ld),
                
                    CreateUnit(1, "Fast Missile","142", P5),
                    MoveLocation("!g_6", "Fast Missile", P5, "Anywhere"),
                    GiveUnits(1, "Fast Missile", P5, "!g_6", P7),
                    Order("Fast Missile", P7, "!g_6", Move, "!e"),

                    SetMemory(0x58E1EC,SetTo,2048 + Le),
                    SetMemory(0x58E1F4,SetTo,2048 + Le),
                    SetMemory(0x58E1F0,SetTo,1856 + Lf),
                    SetMemory(0x58E1F8,SetTo,1856 + Lf),
                
                    CreateUnit(1, "Fast Missile","143", P5),
                    MoveLocation("!g_6", "Fast Missile", P5, "Anywhere"),
                    GiveUnits(1, "Fast Missile", P5, "!g_6", P7),
                    Order("Fast Missile", P7, "!g_6", Move, "!e"),



                    


                    
                    SetMemory(0x58E1EC,SetTo,2048 + Lo),
                    SetMemory(0x58E1F4,SetTo,2048 + Lo),
                    SetMemory(0x58E1F0,SetTo,1856 + Lp),
                    SetMemory(0x58E1F8,SetTo,1856 + Lp),
                
                    CreateUnit(1, "Fast Missile","141", P6),
                    MoveLocation("!g_6", "Fast Missile", P6, "Anywhere"),
                    GiveUnits(1, "Fast Missile", P6, "!g_6", P8),
                    Order("Fast Missile", P8, "!g_6", Move, "!e"),


                    SetMemory(0x58E1EC,SetTo,2048 + Lk),
                    SetMemory(0x58E1F4,SetTo,2048 + Lk),
                    SetMemory(0x58E1F0,SetTo,1856 + Ll),
                    SetMemory(0x58E1F8,SetTo,1856 + Ll),
                
                    CreateUnit(1, "Fast Missile","142", P6),
                    MoveLocation("!g_6", "Fast Missile", P6, "Anywhere"),
                    GiveUnits(1, "Fast Missile", P6, "!g_6", P8),
                    Order("Fast Missile", P8, "!g_6", Move, "!e"),

                    SetMemory(0x58E1EC,SetTo,2048 + Lg),
                    SetMemory(0x58E1F4,SetTo,2048 + Lg),
                    SetMemory(0x58E1F0,SetTo,1856 + Lh),
                    SetMemory(0x58E1F8,SetTo,1856 + Lh),
                
                    CreateUnit(1, "Fast Missile","143", P6),
                    MoveLocation("!g_6", "Fast Missile", P6, "Anywhere"),
                    GiveUnits(1, "Fast Missile", P6, "!g_6", P8),
                    Order("Fast Missile", P8, "!g_6", Move, "!e"),



                    Lw.AddNumber(7),
                    Lx.AddNumber(353),
                    Ly.SetNumber(2),



                   
                ]
            )


        Trigger(
            conditions=[
                        Switch("#14",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                        Deaths(P10,Exactly,0,"!wait"),
                        
            ],
            actions=[
                    
                    
                    
                    Ln.AddNumber(360),  
                    Lr.AddNumber(3),
                    SetDeaths(P10,SetTo,16,"!wait"),                  
            ]
        )


        


        

    
        if EUDWhile()(Ln >= 1):
            Ls, Lt = f_lengthdir(1800,Ln + Lr)
            Lu, Lv = f_lengthdir(32,Ln + Lr)


            


            



            Trigger(
            conditions=[
                        Ln >= 1
                        
            ],
            actions=[
                    SetMemory(0x6606B4,SetTo,16),
                    SetMemory(0x58E37C,SetTo,2048 + Lu),
                    SetMemory(0x58E384,SetTo,2048 + Lu),
                    SetMemory(0x58E380,SetTo,1856 + Lv),
                    SetMemory(0x58E388,SetTo,1856 + Lv),
                    SetMemory(0x58E3A4,SetTo,2048 + Ls),
                    SetMemory(0x58E3AC,SetTo,2048 + Ls),
                    SetMemory(0x58E3A8,SetTo,1856 + Lt),
                    SetMemory(0x58E3B0,SetTo,1856 + Lt),
                    SetMemory(0x6CA0E8, SetTo,2580),
                    
                
                    CreateUnit(1, "Normal Missile","!5s", P6),
                    MoveLocation("!5g", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!5g", P8),
                    Order("Normal Missile", P8, "!5g", Move, "!5e"),

                    
                    Ln.SubtractNumber(24),


                    
            ]
            )
        EUDEndWhile()




        




        Lθ << 3

        Trigger(
            conditions=[
                Switch("#14",Cleared),
                        
                        
            ],
            actions=[

                    
                Li.SetNumber(99),
                Lj.SetNumber(0),

            ]
        )


        Li << Li -1

        
        Lθx, Lθy = f_lengthdir(10000,Lθ)

        
        if EUDIf()(Li == 0):

            DoActions(Lj.SetNumber(161741 + 25))

            if EUDWhile()(Lj >= 19025 + 25):

                if EUDIf()(Deaths(Lj,Exactly,196,0)): # Unit id

                    DoActions(Lj.SubtractNumber(25))

                    LHp = f_dwread_epd(Lj + 2)  # EPD(0x628298 + 0x08 - 0x150 * Lj)
                    LSh = f_dwread_epd(Lj + 24)  # EPD(0x628298 + 0x60 - 0x150 * Lj)
                     # EPD(0x628298 + 0x64 - 0x150 * Lj)
     

                    if EUDIf()((LSh >= 3,LHp >= 6000 * 256)):
                        
                        # 목적지의 length가 너무 길면 0~4096 범위를 벗어나게되서 찌그러짐. 3000 -> 2000

                        Lexy = f_dwread_epd_safe(Lj + 6) # EPD(0x628298 + 0x18 - 0x150 * Lj)
                        Lex, Ley = f_dwbreak(Lexy)[0:2]


                        Lex << Lex - 2048
                        Ley << Ley - 1856


                        Lfx << (Lθx * Lex) - (Lθy * Ley)
                        Lfy << (Lθy * Lex) + (Lθx * Ley)

                        Lfx << Lfx + 20480000
                        Lfy << Lfy + 18560000

                        Lfx << Lfx//10000
                        Lfy << Lfy//10000


                        Lfy << Lfy * 65536


                        f_dwwrite_epd(Lj + 6,Lfx + Lfy) # EPD(0x628298 + 0x18 - 0x150 * Lj)


                        LHp << LHp - 50*256


                        f_dwwrite_epd(Lj + 24,0) # EPD(0x628298 + 0x60 - 0x150 * Lj)

                        f_dwwrite_epd(Lj + 2,LHp) # EPD(0x628298 + 0x08 - 0x150 * Lj)
                        
                    EUDEndIf()

                    DoActions(Lj.AddNumber(25))

                EUDEndIf()

                DoActions(Lj.SubtractNumber(84))

            EUDEndWhile()

            Li << 2
            
        EUDEndIf()


        #Stage XIV

        Trigger(
            conditions=[
                        Switch("#15",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                       
                        
            ],
            actions=[

                SetMemory(0x58DC60,SetTo,1200),
                SetMemory(0x58DC64,SetTo,1200),
                SetMemory(0x58DC68,SetTo,1254),
                SetMemory(0x58DC6C,SetTo,1254),


                SetMemory(0x58DCD8,SetTo,1200),
                SetMemory(0x58DCDC,SetTo,1200),
                SetMemory(0x58DCE0,SetTo,1254),
                SetMemory(0x58DCE4,SetTo,1254),

                SetMemory(0x58DCEC,SetTo,1200),
                SetMemory(0x58DCF0,SetTo,1200),
                SetMemory(0x58DCF4,SetTo,1254),
                SetMemory(0x58DCF8,SetTo,1254),

                SetMemory(0x58DD00,SetTo,1200),
                SetMemory(0x58DD04,SetTo,1200),
                SetMemory(0x58DD08,SetTo,1254),
                SetMemory(0x58DD0C,SetTo,1254),
                                    
            ]
        )




        #Final Stage Start

        Xn = EUDVariable()
        Xs = EUDVariable()
        Xt = EUDVariable()
        Xr = EUDVariable()
        Xd = EUDVariable()
        Xx = EUDVariable()
        Xy = EUDVariable()
        Xc = EUDVariable()
        Xv = EUDVariable()
        Xw = EUDVariable()
        Xp = EUDVariable()
        Xq = EUDVariable()
        Xu = EUDVariable()
        Xz = EUDVariable()
        Xa = EUDVariable()
        Xb = EUDVariable()
        Xg = EUDVariable()
        Xh = EUDVariable()
        Xi = EUDVariable()
        Xj = EUDVariable()
        Xk = EUDVariable()
        Xl = EUDVariable()
        Xe = EUDVariable()
        Xf = EUDVariable()
        Xm = EUDVariable()
        Xo = EUDVariable()
        Xn_2 = EUDVariable()
        Xs_2 = EUDVariable()
        Xt_2 = EUDVariable()
        Xr_2 = EUDVariable()
        Xd_2 = EUDVariable()
        Xx_2 = EUDVariable()
        Xy_2 = EUDVariable()
        Xc_2 = EUDVariable()
        Xv_2 = EUDVariable()
        Xw_2 = EUDVariable()
        Xp_2 = EUDVariable()
        Xq_2 = EUDVariable()
        Xu_2 = EUDVariable()
        Xz_2 = EUDVariable()
        Xa_2 = EUDVariable()
        Xb_2 = EUDVariable()
        Xg_2 = EUDVariable()
        Xh_2 = EUDVariable()
        Xi_2 = EUDVariable()
        Xj_2 = EUDVariable()
        Xk_2 = EUDVariable()
        Xl_2 = EUDVariable()
        Xe_2 = EUDVariable()
        Xf_2 = EUDVariable()
        Xm_2 = EUDVariable()
        Xo_2 = EUDVariable()        


        Yn = EUDVariable()
        Ys = EUDVariable()
        Yt = EUDVariable()
        Yr = EUDVariable()
        Yd = EUDVariable()
        Yx = EUDVariable()
        Yy = EUDVariable()
        Yc = EUDVariable()
        Yv = EUDVariable()
        Yw = EUDVariable()
        Yp = EUDVariable()
        Yq = EUDVariable()
        Yu = EUDVariable()
        Yz = EUDVariable()
        Ya = EUDVariable()
        Yb = EUDVariable()
        Yg = EUDVariable()
        Yh = EUDVariable()
        Yi = EUDVariable()
        Yj = EUDVariable()
        Yk = EUDVariable()
        Yl = EUDVariable()
        Xd_3 = EUDVariable()

        Zn = EUDVariable()
        Zs = EUDVariable()
        Zt = EUDVariable()
        Zr = EUDVariable()
        Zd = EUDVariable()
        Zx = EUDVariable()
        Zy = EUDVariable()
        Zc = EUDVariable()
        Zv = EUDVariable()
        Zw = EUDVariable()
        Zp = EUDVariable()
        Zq = EUDVariable()
        Zu = EUDVariable()
        Zz = EUDVariable()
        Za = EUDVariable()
        Zb = EUDVariable()
        Zg = EUDVariable()
        Zh = EUDVariable()
        Zi = EUDVariable()
        Zj = EUDVariable()
        Zk = EUDVariable()
        Zl = EUDVariable()

        Trigger(
            conditions=[
                        Switch("#16",Set),
                        Deaths(P7,AtLeast,1,"!stage"),
                       
                        
            ],
            actions=[

                SetMemory(0x58DC60,SetTo,1200),
                SetMemory(0x58DC64,SetTo,1200),
                SetMemory(0x58DC68,SetTo,1248),
                SetMemory(0x58DC6C,SetTo,1248),


                SetMemory(0x58DCD8,SetTo,1200),
                SetMemory(0x58DCDC,SetTo,1200),
                SetMemory(0x58DCE0,SetTo,1248),
                SetMemory(0x58DCE4,SetTo,1248),

                SetMemory(0x58DCEC,SetTo,1200),
                SetMemory(0x58DCF0,SetTo,1200),
                SetMemory(0x58DCF4,SetTo,1248),
                SetMemory(0x58DCF8,SetTo,1248),

                SetMemory(0x58DD00,SetTo,1200),
                SetMemory(0x58DD04,SetTo,1200),
                SetMemory(0x58DD08,SetTo,1248),
                SetMemory(0x58DD0C,SetTo,1248),
                                    
            ]
        )


        
        


        if EUDIf()((Switch("#16",Set),Xt == 0,Xn == 0)):

            Xt << 700
            

            DoActions([SetMemory(0x6CA0E0, SetTo, 0),
            SetMemory(0x6CA0E4, SetTo, 0),
            SetMemory(0x6CA0E8, SetTo, 0),])
        
        EUDEndIf()

        if EUDIf()((Switch("#16",Set),Xt == 1,Xn == 0)):

            DoActions([KillUnitAt(All, "Normal Missile", "Anywhere", P8),
                KillUnitAt(All, "Normal Missile", "Anywhere", P7),])

            Xn << 1
            Xt << 550

        EUDEndIf()

        if EUDIf()((Xt >= 1,Xn == 0)):

            Xt << Xt - 1
            Xd << Xt % 10
        
        EUDEndIf()

        if EUDIf()((Xt >= 300,Xn == 0)):

            Xr << 4*((Xt - 200) - 100)
        
        EUDEndIf()

        if EUDIf()((Xt <= 300,Xn == 0)):

            Xr << 4*(100 - (Xt - 200))
        
        EUDEndIf()

        if EUDIf()((Xt >= 200,Xd >= 1,Xd <= 6,Xn == 0)):

            Xu, Xv = f_lengthdir(Xr,3*Xt)

            Xx << Xu + 160 + 2048
            Xy << Xv + 160 + 2048   # X = tcost , Y = tsint

            Xp, Xq = f_lengthdir(1800,3*Xt + 180 + 5 * (Xd - 1))

            Xz << Xp + 160 + 2048
            Xw << Xq + 160 + 2048   # X = tcos(2pi - t), Y = tsin(2pi - t) / x + 160 / y + 160

            Xa, Xb = f_lengthdir(Xr,3*Xt + 180) # t -> 2pi - t

            Xg << Xa - 160 + 2048
            Xh << Xb - 160 + 2048   

            Xi, Xj = f_lengthdir(1800,3*Xt + 5 * (Xd - 1))

            Xk << Xi - 160 + 2048
            Xl << Xj - 160 + 2048   

            DoActions([


                    SetMemory(0x58E37C,SetTo,Xx),
                    SetMemory(0x58E384,SetTo,Xx),
                    SetMemory(0x58E380,SetTo,Xy),
                    SetMemory(0x58E388,SetTo,Xy),
                    SetMemory(0x58E3A4,SetTo,Xz),
                    SetMemory(0x58E3AC,SetTo,Xz),
                    SetMemory(0x58E3A8,SetTo,Xw),
                    SetMemory(0x58E3B0,SetTo,Xw),
             
                
                    CreateUnit(1, "Normal Missile","!5s", P6),
                    MoveLocation("!5g", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!5g", P8),
                    ModifyUnitShields(All, "Normal Missile", P8, "!5g", 0),
                    Order("Normal Missile", P8, "!5g", Move, "!5e"),

                    SetMemory(0x58E37C,SetTo,Xg),
                    SetMemory(0x58E384,SetTo,Xg),
                    SetMemory(0x58E380,SetTo,Xh),
                    SetMemory(0x58E388,SetTo,Xh),
                    SetMemory(0x58E3A4,SetTo,Xk),
                    SetMemory(0x58E3AC,SetTo,Xk),
                    SetMemory(0x58E3A8,SetTo,Xl),
                    SetMemory(0x58E3B0,SetTo,Xl),
             
                
                    CreateUnit(1, "Normal Missile","!5s", P5),
                    MoveLocation("!5g", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!5g", P7),
                    ModifyUnitShields(All, "Normal Missile", P7, "!5g", 0),
                    Order("Normal Missile", P7, "!5g", Move, "!5e"),



                ])

        
        EUDEndIf()

        if EUDIf()((Xt <= 200, Xn == 0,Switch("#16",Set))):

            DoActions(Xc.SetNumber(161741 + 25))
        
        EUDEndIf()  

        if EUDWhile()((Xc >= 19025 + 25,Xn == 0,Switch("#16",Set))):
             
            if EUDIf()((Deaths(Xc,Exactly,196,0))):

                DoActions(Xc.SubtractNumber(25))

                f_dwwrite_epd(Xc + 13,2700)

                DoActions(Xc.AddNumber(25))

            EUDEndIf()

            DoActions(Xc.SubtractNumber(84))

        EUDEndWhile()


        #15 - 2


        if EUDIf()((Switch("#16",Set),Xt == 1,Xn == 1)):

            DoActions([KillUnitAt(All, "Normal Missile", "Anywhere", P8),
                KillUnitAt(All, "Normal Missile", "Anywhere", P7),])

            Xn << 2
            Xt << 450
            

        EUDEndIf()

        if EUDIf()((Xt >= 1,Xn == 1)):

            Xt << Xt - 1
            Xd << Xt % 21
        
        EUDEndIf()

        if EUDIf()((Xt >= 349,Xn == 1)):

            Xr << 10*((Xt - 200) - 150) + 10
        
        EUDEndIf()

        if EUDIf()((Xt <= 349,Xn == 1)):

            Xr << 10*(150 - (Xt - 200)) + 10
        
        EUDEndIf()

        if EUDIf()((Xt >= 351,Xn == 1)):

            Xs << 10*((Xt - 200) - 150) - 10
        
        EUDEndIf()

        if EUDIf()((Xt <= 351,Xn == 1)):

            Xs << 10*(150 - (Xt - 200)) - 10
        
        EUDEndIf()

        if EUDIf()((Xt >= 200,Xd >= 1,Xd <= 15,Xn == 1)):

            Xu, Xv = f_lengthdir(Xr,2*Xt)

            Xx << Xu + 2048 + 128
            Xy << Xv + 2048 - 128  # X = tcost , Y = tsint

            Xp, Xq = f_lengthdir(1800,2*Xt + 180 - 5 * (Xd - 1))

            Xz << Xp + 2048 + 128
            Xw << Xq + 2048 - 128  # X = tcos(2pi - t), Y = tsin(2pi - t) / x + 160 / y + 160

            Xa, Xb = f_lengthdir(Xs,2*Xt + 180) # t -> 2pi - t

            Xg << Xa + 2048 - 128
            Xh << Xb + 2048 + 128

            Xi, Xj = f_lengthdir(1800,2*Xt - 5 * (Xd - 1))

            Xk << Xi + 2048 - 128
            Xl << Xj + 2048 + 128

            DoActions([


                    SetMemory(0x58E37C,SetTo,Xx),
                    SetMemory(0x58E384,SetTo,Xx),
                    SetMemory(0x58E380,SetTo,Xy),
                    SetMemory(0x58E388,SetTo,Xy),
                    SetMemory(0x58E3A4,SetTo,Xz),
                    SetMemory(0x58E3AC,SetTo,Xz),
                    SetMemory(0x58E3A8,SetTo,Xw),
                    SetMemory(0x58E3B0,SetTo,Xw),
             
                
                    CreateUnit(1, "Normal Missile","!5s", P6),
                    MoveLocation("!5g", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!5g", P8),
                    ModifyUnitShields(All, "Normal Missile", P8, "!5g", 0),
                    Order("Normal Missile", P8, "!5g", Move, "!5e"),

                    SetMemory(0x58E37C,SetTo,Xg),
                    SetMemory(0x58E384,SetTo,Xg),
                    SetMemory(0x58E380,SetTo,Xh),
                    SetMemory(0x58E388,SetTo,Xh),
                    SetMemory(0x58E3A4,SetTo,Xk),
                    SetMemory(0x58E3AC,SetTo,Xk),
                    SetMemory(0x58E3A8,SetTo,Xl),
                    SetMemory(0x58E3B0,SetTo,Xl),
             
                
                    CreateUnit(1, "Normal Missile","!5s", P5),
                    MoveLocation("!5g", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!5g", P7),
                    ModifyUnitShields(All, "Normal Missile", P7, "!5g", 0),
                    Order("Normal Missile", P7, "!5g", Move, "!5e"),



                ])

        
        EUDEndIf()

        if EUDIf()((Xt <= 200, Xn == 1)):

            DoActions(Xc.SetNumber(161741 + 25))
        
        EUDEndIf()  

        if EUDWhile()((Xc >= 19025 + 25,Xn == 1)):
             
            if EUDIf()((Deaths(Xc,Exactly,196,0))):

                DoActions(Xc.SubtractNumber(25))

                f_dwwrite_epd(Xc + 13,3200)

                DoActions(Xc.AddNumber(25))

            EUDEndIf()

            DoActions(Xc.SubtractNumber(84))

        EUDEndWhile()

        #15 - 3

        if EUDIf()((Switch("#16",Set),Xt == 25,Xn == 2)):

            DoActions([KillUnitAt(All, "Normal Missile", "Anywhere", P8),
                KillUnitAt(All, "Normal Missile", "Anywhere", P7),])

            Xn << 3

            Xt << 450
            

        EUDEndIf()

        if EUDIf()((Xt >= 1,Xn == 2)):

            Xt << Xt - 1
            Xd << Xt % 11
        
        EUDEndIf()

        if EUDIf()((Xt >= 249,Xn == 2)):

            Xr << 64*(f_sqrt((Xt - 200) - 50))+ 12
        
        EUDEndIf()

        if EUDIf()((Xt <= 249,Xn == 2)):

            Xr << 64*(f_sqrt(50 - (Xt - 200))) + 12
        
        EUDEndIf()

        if EUDIf()((Xt >= 251,Xn == 2)):

            Xs << 64*(f_sqrt((Xt - 200) - 50)) - 12
        
        EUDEndIf()

        if EUDIf()((Xt <= 251,Xn == 2)):

            Xs << 64*(f_sqrt(50 - (Xt - 200))) - 12
        
        EUDEndIf()

        if EUDIf()((Xt >= 249,Xn == 2)):

            Yr << 6*((Xt - 200) - 50) + 6
        
        EUDEndIf()

        if EUDIf()((Xt <= 249,Xn == 2)):

            Yr << 6*(50 - (Xt - 200)) + 6
        
        EUDEndIf()

        if EUDIf()((Xt >= 251,Xn == 2)):

            Ys << 6*((Xt - 200) - 50) - 6
        
        EUDEndIf()

        if EUDIf()((Xt <= 251,Xn == 2)):

            Ys << 6*(50 - (Xt - 200)) - 6
        
        EUDEndIf()

        if EUDIf()((Xt >= 220,Xd >= 1,Xd <= 3,Xn == 2)):

            Xu, Xv = f_lengthdir(Xr,3*Xt)

            Xx << Xu + 2048 + 128
            Xy << Xv + 2048 - 128  # X = tcost , Y = tsint

            Xp, Xq = f_lengthdir(1800,3*Xt + 180 + 4 * (Xd - 1))

            Xz << Xp + 2048 + 128
            Xw << Xq + 2048 - 128  # X = tcos(2pi - t), Y = tsin(2pi - t) / x + 160 / y + 160

            Xa, Xb = f_lengthdir(Xs,3*Xt + 180) # t -> 2pi - t

            Xg << Xa + 2048 - 128
            Xh << Xb + 2048 + 128

            Xi, Xj = f_lengthdir(1800,3*Xt + 4 * (Xd - 1))

            Xk << Xi + 2048 - 128
            Xl << Xj + 2048 + 128

            Yu, Yv = f_lengthdir(Yr,3*Xt + 90)

            Yx << Yu + 2048 - 128
            Yy << Yv + 2048 - 128  # X = tcost , Y = tsint

            Yp, Yq = f_lengthdir(1800,3*Xt + 270 - 8 * (Xd - 1))

            Yz << Yp + 2048 - 128
            Yw << Yq + 2048 - 128

            Ya, Yb = f_lengthdir(Ys,3*Xt + 270) # t -> 2pi - t

            Yg << Ya + 2048 + 128
            Yh << Yb + 2048 + 128

            Yi, Yj = f_lengthdir(1800,3*Xt - 8 * (Xd - 1) + 90)

            Yk << Yi + 2048 + 128
            Yl << Yj + 2048 + 128



            DoActions([


                    SetMemory(0x58E37C,SetTo,Xx),
                    SetMemory(0x58E384,SetTo,Xx),
                    SetMemory(0x58E380,SetTo,Xy),
                    SetMemory(0x58E388,SetTo,Xy),
                    SetMemory(0x58E3A4,SetTo,Xz),
                    SetMemory(0x58E3AC,SetTo,Xz),
                    SetMemory(0x58E3A8,SetTo,Xw),
                    SetMemory(0x58E3B0,SetTo,Xw),
             
                
                    CreateUnit(1, "Normal Missile","!5s", P6),
                    MoveLocation("!5g", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!5g", P8),
                    ModifyUnitShields(All, "Normal Missile", P8, "!5g", 0),
                    Order("Normal Missile", P8, "!5g", Move, "!5e"),

                    SetMemory(0x58E37C,SetTo,Xg),
                    SetMemory(0x58E384,SetTo,Xg),
                    SetMemory(0x58E380,SetTo,Xh),
                    SetMemory(0x58E388,SetTo,Xh),
                    SetMemory(0x58E3A4,SetTo,Xk),
                    SetMemory(0x58E3AC,SetTo,Xk),
                    SetMemory(0x58E3A8,SetTo,Xl),
                    SetMemory(0x58E3B0,SetTo,Xl),
             
                
                    CreateUnit(1, "Normal Missile","!5s", P5),
                    MoveLocation("!5g", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!5g", P7),
                    ModifyUnitShields(All, "Normal Missile", P7, "!5g", 0),
                    Order("Normal Missile", P7, "!5g", Move, "!5e"),


                    SetMemory(0x58E37C,SetTo,Yx),
                    SetMemory(0x58E384,SetTo,Yx),
                    SetMemory(0x58E380,SetTo,Yy),
                    SetMemory(0x58E388,SetTo,Yy),
                    SetMemory(0x58E3A4,SetTo,Yz),
                    SetMemory(0x58E3AC,SetTo,Yz),
                    SetMemory(0x58E3A8,SetTo,Yw),
                    SetMemory(0x58E3B0,SetTo,Yw),
             
                
                    CreateUnit(1, "Normal Missile","!5s", P6),
                    MoveLocation("!5g", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!5g", P8),
                    ModifyUnitShields(All, "Normal Missile", P8, "!5g", 0),
                    Order("Normal Missile", P8, "!5g", Move, "!5e"),

                    SetMemory(0x58E37C,SetTo,Yg),
                    SetMemory(0x58E384,SetTo,Yg),
                    SetMemory(0x58E380,SetTo,Yh),
                    SetMemory(0x58E388,SetTo,Yh),
                    SetMemory(0x58E3A4,SetTo,Yk),
                    SetMemory(0x58E3AC,SetTo,Yk),
                    SetMemory(0x58E3A8,SetTo,Yl),
                    SetMemory(0x58E3B0,SetTo,Yl),
             
                
                    CreateUnit(1, "Normal Missile","!5s", P5),
                    MoveLocation("!5g", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!5g", P7),
                    ModifyUnitShields(All, "Normal Missile", P7, "!5g", 0),
                    Order("Normal Missile", P7, "!5g", Move, "!5e"),



                ])

        
        EUDEndIf()


        if EUDIf()((Xt <= 200, Xn == 2)):

            DoActions(Xc.SetNumber(161741 + 25))
        
        EUDEndIf()  

        if EUDWhile()((Xc >= 19025 + 25,Xn == 2)):
             
            if EUDIf()((Deaths(Xc,Exactly,196,0))):

                DoActions(Xc.SubtractNumber(25))

                f_dwwrite_epd(Xc + 13,3400)

                DoActions(Xc.AddNumber(25))

            EUDEndIf()

            DoActions(Xc.SubtractNumber(84))

        EUDEndWhile()

        #15 - 4


        if EUDIf()((Switch("#16",Set),Xt == 1,Xn == 3)):

            DoActions([KillUnitAt(All, "Normal Missile", "Anywhere", P8),
                KillUnitAt(All, "Normal Missile", "Anywhere", P7),])

            Xn << 4
            Xt << 420
            

        EUDEndIf()

        if EUDIf()((Xt >= 1,Xn == 3)):

            Xt << Xt - 1
            Xd << Xt % 15
        
        EUDEndIf()

        if EUDIf()((Xt >= 249,Xn == 3)):

            Xr << 64*(f_sqrt((Xt - 200) - 50)) + 12
        
        EUDEndIf()

        if EUDIf()((Xt <= 249,Xn == 3)):

            Xr << 64*(f_sqrt(50 - (Xt - 200))) + 12
        
        EUDEndIf()

        if EUDIf()((Xt >= 251,Xn == 3)):

            Xs << 64*(f_sqrt((Xt - 200) - 50)) - 12
        
        EUDEndIf()

        if EUDIf()((Xt <= 251,Xn == 3)):

            Xs << 64*(f_sqrt(50 - (Xt - 200))) - 12
        
        EUDEndIf()

        if EUDIf()((Xt >= 249,Xn == 3)):

            Yr << 5*((Xt - 200) - 50) + 6
        
        EUDEndIf()

        if EUDIf()((Xt <= 249,Xn == 3)):

            Yr << 5*(50 - (Xt - 200)) + 6
        
        EUDEndIf()

        if EUDIf()((Xt >= 251,Xn == 3)):

            Ys << 5*((Xt - 200) - 50) - 6
        
        EUDEndIf()

        if EUDIf()((Xt <= 251,Xn == 3)):

            Ys << 5*(50 - (Xt - 200)) - 6
        
        EUDEndIf()

        if EUDIf()((Xt >= 250,Xn == 3)):

            Zr << ((Xt - 200) - 50)
            Zr << (Zr * f_sqrt(Zr)) //3
            Zr << Zr + 64
        
        EUDEndIf()

        if EUDIf()((Xt <= 250,Xn == 3)):

            Zr << (50 - (Xt - 200)) 
            Zr << (Zr * f_sqrt(Zr)) //3
            Zr << Zr + 64
        
        EUDEndIf()

        if EUDIf()((Xt >= 250,Xn == 3)):

            Zs << ((Xt - 200) - 50)
            Zs << (Zs *  f_sqrt(Zs))//3
            Zs << Zs + 64
        
        EUDEndIf()

        if EUDIf()((Xt <= 250,Xn == 3)):

            Zs << (50 - (Xt - 200))
            Zs << (Zs *  f_sqrt(Zs)) //3
            Zs << Zs + 64
        
        EUDEndIf()

        if EUDIf()((Xt >= 220,Xd >= 1,Xd <= 3,Xn == 3)):

            Xu, Xv = f_lengthdir(Xr,3*Xt)

            Xx << Xu + 2048 + 128
            Xy << Xv + 2048 - 128  # X = tcost , Y = tsint

            Xp, Xq = f_lengthdir(1800,3*Xt + 180 - 4 * (Xd - 1))

            Xz << Xp + 2048 + 128
            Xw << Xq + 2048 - 128  # X = tcos(2pi - t), Y = tsin(2pi - t) / x + 160 / y + 160

            Xa, Xb = f_lengthdir(Xs,3*Xt + 180) # t -> 2pi - t

            Xg << Xa + 2048 - 128
            Xh << Xb + 2048 + 128

            Xi, Xj = f_lengthdir(1800,3*Xt - 4 * (Xd - 1))

            Xk << Xi + 2048 - 128
            Xl << Xj + 2048 + 128

            Yu, Yv = f_lengthdir(Yr,3*Xt + 90)

            Yx << Yu + 2048 - 128
            Yy << Yv + 2048 - 128  # X = tcost , Y = tsint

            Yp, Yq = f_lengthdir(1800,3*Xt + 270 + 8 * (Xd - 1))

            Yz << Yp + 2048 - 128
            Yw << Yq + 2048 - 128

            Ya, Yb = f_lengthdir(Ys,3*Xt + 270) # t -> 2pi - t

            Yg << Ya + 2048 + 128
            Yh << Yb + 2048 + 128

            Yi, Yj = f_lengthdir(1800,3*Xt + 8 * (Xd - 1) + 90)

            Yk << Yi + 2048 + 128
            Yl << Yj + 2048 + 128

            Zu, Zv = f_lengthdir(Zr,3*Xt + 90)

            Zx << Zu + 2048 - 181
            Zy << Zv + 2048   # X = tcost , Y = tsint

            Zp, Zq = f_lengthdir(1800,3*Xt + 270 + 16 * (Xd - 1))

            Zz << Zp + 2048 - 181
            Zw << Zq + 2048 

            Za, Zb = f_lengthdir(Zs,3*Xt + 270) # t -> 2pi - t

            Zg << Za + 2048 + 181
            Zh << Zb + 2048 

            Zi, Zj = f_lengthdir(1800,3*Xt - 16 * (Xd - 1) + 90)

            Zk << Zi + 2048 + 181
            Zl << Zj + 2048 



            DoActions([


                    SetMemory(0x58E37C,SetTo,Xx),
                    SetMemory(0x58E384,SetTo,Xx),
                    SetMemory(0x58E380,SetTo,Xy),
                    SetMemory(0x58E388,SetTo,Xy),
                    SetMemory(0x58E3A4,SetTo,Xz),
                    SetMemory(0x58E3AC,SetTo,Xz),
                    SetMemory(0x58E3A8,SetTo,Xw),
                    SetMemory(0x58E3B0,SetTo,Xw),
             
                
                    CreateUnit(1, "Normal Missile","!5s", P6),
                    MoveLocation("!5g", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!5g", P8),
                    ModifyUnitShields(All, "Normal Missile", P8, "!5g", 0),
                    Order("Normal Missile", P8, "!5g", Move, "!5e"),

                    SetMemory(0x58E37C,SetTo,Xg),
                    SetMemory(0x58E384,SetTo,Xg),
                    SetMemory(0x58E380,SetTo,Xh),
                    SetMemory(0x58E388,SetTo,Xh),
                    SetMemory(0x58E3A4,SetTo,Xk),
                    SetMemory(0x58E3AC,SetTo,Xk),
                    SetMemory(0x58E3A8,SetTo,Xl),
                    SetMemory(0x58E3B0,SetTo,Xl),
             
                
                    CreateUnit(1, "Normal Missile","!5s", P5),
                    MoveLocation("!5g", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!5g", P7),
                    ModifyUnitShields(All, "Normal Missile", P7, "!5g", 0),
                    Order("Normal Missile", P7, "!5g", Move, "!5e"),


                    SetMemory(0x58E37C,SetTo,Yx),
                    SetMemory(0x58E384,SetTo,Yx),
                    SetMemory(0x58E380,SetTo,Yy),
                    SetMemory(0x58E388,SetTo,Yy),
                    SetMemory(0x58E3A4,SetTo,Yz),
                    SetMemory(0x58E3AC,SetTo,Yz),
                    SetMemory(0x58E3A8,SetTo,Yw),
                    SetMemory(0x58E3B0,SetTo,Yw),
             
                
                    CreateUnit(1, "Normal Missile","!5s", P6),
                    MoveLocation("!5g", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!5g", P8),
                    ModifyUnitShields(All, "Normal Missile", P8, "!5g", 0),
                    Order("Normal Missile", P8, "!5g", Move, "!5e"),

                    SetMemory(0x58E37C,SetTo,Yg),
                    SetMemory(0x58E384,SetTo,Yg),
                    SetMemory(0x58E380,SetTo,Yh),
                    SetMemory(0x58E388,SetTo,Yh),
                    SetMemory(0x58E3A4,SetTo,Yk),
                    SetMemory(0x58E3AC,SetTo,Yk),
                    SetMemory(0x58E3A8,SetTo,Yl),
                    SetMemory(0x58E3B0,SetTo,Yl),
             
                
                    CreateUnit(1, "Normal Missile","!5s", P5),
                    MoveLocation("!5g", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!5g", P7),
                    ModifyUnitShields(All, "Normal Missile", P7, "!5g", 0),
                    Order("Normal Missile", P7, "!5g", Move, "!5e"),

                    SetMemory(0x58E37C,SetTo,Zx),
                    SetMemory(0x58E384,SetTo,Zx),
                    SetMemory(0x58E380,SetTo,Zy),
                    SetMemory(0x58E388,SetTo,Zy),
                    SetMemory(0x58E3A4,SetTo,Zz),
                    SetMemory(0x58E3AC,SetTo,Zz),
                    SetMemory(0x58E3A8,SetTo,Zw),
                    SetMemory(0x58E3B0,SetTo,Zw),
             
                
                    CreateUnit(1, "Normal Missile","!5s", P6),
                    MoveLocation("!5g", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!5g", P8),
                    ModifyUnitShields(All, "Normal Missile", P8, "!5g", 0),
                    Order("Normal Missile", P8, "!5g", Move, "!5e"),

                    SetMemory(0x58E37C,SetTo,Zg),
                    SetMemory(0x58E384,SetTo,Zg),
                    SetMemory(0x58E380,SetTo,Zh),
                    SetMemory(0x58E388,SetTo,Zh),
                    SetMemory(0x58E3A4,SetTo,Zk),
                    SetMemory(0x58E3AC,SetTo,Zk),
                    SetMemory(0x58E3A8,SetTo,Zl),
                    SetMemory(0x58E3B0,SetTo,Zl),
             
                
                    CreateUnit(1, "Normal Missile","!5s", P5),
                    MoveLocation("!5g", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!5g", P7),
                    ModifyUnitShields(All, "Normal Missile", P7, "!5g", 0),
                    Order("Normal Missile", P7, "!5g", Move, "!5e"),




                ])

        
        EUDEndIf()



        if EUDIf()((Xt <= 200, Xn == 3)):

            DoActions(Xc.SetNumber(161741 + 25))
        
        EUDEndIf()  

        if EUDWhile()((Xc >= 19025 + 25,Xn == 3)):
             
            if EUDIf()((Deaths(Xc,Exactly,196,0))):

                DoActions(Xc.SubtractNumber(25))

                f_dwwrite_epd(Xc + 13,2400)

                DoActions(Xc.AddNumber(25))

            EUDEndIf()

            DoActions(Xc.SubtractNumber(84))

        EUDEndWhile()

        #15 - 5

        Xd_2 = EUDVariable()
        Xd_1 = EUDVariable()
        XΘ = EUDVariable()
        Xθ = EUDVariable()
        XΔ = EUDVariable()


        if EUDIf()((Switch("#16",Set),Xt == 1,Xn == 4)):

            DoActions([KillUnitAt(All, "Normal Missile", "Anywhere", P8),
                KillUnitAt(All, "Normal Missile", "Anywhere", P7),])

            Xn << 5
            Xt << 700
            
            

        EUDEndIf()

        if EUDIf()((Xt >= 1,Xn == 4)):

            Xt << Xt - 1
            XΘ << ((Xt-200) % 360)
            Xθ << XΘ + 12

            if EUDIf()((Xt >= 330,Xt <= 500,Xn == 4)):
                XΔ << 0
            EUDEndIf()

            if EUDIf()((Xt >= 290,Xt <= 330,Xn == 4)):
                XΔ << (330-Xt) * 4
            EUDEndIf()

            if EUDIf()((Xt >= 200,Xt <= 290,Xn == 4)):
                XΔ << 160
            EUDEndIf()

        EUDEndIf()

        


        if EUDIf()((Xn == 4)):

            Xe, Xf = f_lengthdir(1280,Xθ)

            if EUDIf()((Xθ >= 91 , Xθ <= 270)):

                Xe << 4294967296 - Xe

                Xr << Xe

                Xd_1 << 180

            EUDEndIf()

            if EUDIf()((Xθ >= 0 ,Xθ <= 90)):

                Xr << Xe

                Xd_1 << 0

            EUDEndIf()

            if EUDIf()((Xθ >= 271)):

                Xr << Xe

                Xd_1 << 0

            EUDEndIf()
        
        EUDEndIf()

        if EUDIf()((Xn == 4)):

            Xm, Xo = f_lengthdir(1280,Xθ)

            if EUDIf()((Xθ >= 91, Xθ <= 270)):

                Xm << 4294967296 - Xm

                Xs << Xm

                Xd_2 << 180

            EUDEndIf()

            if EUDIf()((Xθ >= 0,Xθ <= 90)):

                Xs << Xm

                Xd_2 << 0

            EUDEndIf()

            if EUDIf()((Xθ >= 271)):

                Xs << Xm

                Xd_2 << 0

            EUDEndIf()


        
        EUDEndIf()



        if EUDIf()((Xt >= 200,Xn == 4)):

            Xu, Xv = f_lengthdir(Xr,2*XΘ + Xd_1)

            Xx << Xu + 2048 + 128
            Xy << Xv + 2048 - 288 # X = tcost , Y = tsint

            Xp, Xq = f_lengthdir(1800,2*XΘ + Xd_1 + 180  +(360-XΔ))

            Xz << Xp + 2048 + 128
            Xw << Xq + 2048 - 288  # X = tcos(2pi - t), Y = tsin(2pi - t) / x + 160 / y + 160

            Xa, Xb = f_lengthdir(Xs,2*XΘ + Xd_2 + 180) # t -> 2pi - t

            Xg << Xa + 2048 - 128
            Xh << Xb + 2048 + 288

            Xi, Xj = f_lengthdir(1800,2*XΘ + Xd_2 +(360- XΔ))

            Xk << Xi + 2048 - 128
            Xl << Xj + 2048 + 288

            DoActions([


                    SetMemory(0x58E37C,SetTo,Xx),
                    SetMemory(0x58E384,SetTo,Xx),
                    SetMemory(0x58E380,SetTo,Xy),
                    SetMemory(0x58E388,SetTo,Xy),
                    SetMemory(0x58E3A4,SetTo,Xz),
                    SetMemory(0x58E3AC,SetTo,Xz),
                    SetMemory(0x58E3A8,SetTo,Xw),
                    SetMemory(0x58E3B0,SetTo,Xw),
             
                
                    CreateUnit(1, "Normal Missile","!5s", P6),
                    MoveLocation("!5g", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!5g", P8),
                    ModifyUnitShields(All, "Normal Missile", P8, "!5g", 0),
                    Order("Normal Missile", P8, "!5g", Move, "!5e"),

                    SetMemory(0x58E37C,SetTo,Xg),
                    SetMemory(0x58E384,SetTo,Xg),
                    SetMemory(0x58E380,SetTo,Xh),
                    SetMemory(0x58E388,SetTo,Xh),
                    SetMemory(0x58E3A4,SetTo,Xk),
                    SetMemory(0x58E3AC,SetTo,Xk),
                    SetMemory(0x58E3A8,SetTo,Xl),
                    SetMemory(0x58E3B0,SetTo,Xl),
             
                
                    CreateUnit(1, "Normal Missile","!5s", P5),
                    MoveLocation("!5g", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!5g", P7),
                    ModifyUnitShields(All, "Normal Missile", P7, "!5g", 0),
                    Order("Normal Missile", P7, "!5g", Move, "!5e"),



                ])

        
        EUDEndIf()

        if EUDIf()((Xt <= 200, Xn == 4)):

            DoActions(Xc.SetNumber(161741 + 25))
        
        EUDEndIf()  

        if EUDWhile()((Xc >= 19025 + 25,Xn == 4)):
             
            if EUDIf()((Deaths(Xc,Exactly,196,0))):

                DoActions(Xc.SubtractNumber(25))

                f_dwwrite_epd(Xc + 13,3100)

                DoActions(Xc.AddNumber(25))

            EUDEndIf()

            DoActions(Xc.SubtractNumber(84))

        EUDEndWhile()

        #15 - 6

        if EUDIf()((Switch("#16",Set),Xt == 100,Xn == 5)):

            DoActions([KillUnitAt(All, "Fast Missile", "Anywhere", P8),
                KillUnitAt(All, "Fast Missile", "Anywhere", P7),])

            Xn << 6
            Xt << 400
            
            

        EUDEndIf()

        if EUDIf()((Xt >= 1,Xn == 5)):

            Xt << Xt - 1
            Xd << Xt % 18
            XΘ << ((Xt-200) % 360)
        
        EUDEndIf()

        if EUDIf()((XΘ >= 149,Xn == 5)):

            Xr << 8*(XΘ - 150) + 8
        
        EUDEndIf()

        if EUDIf()((XΘ <= 149,Xn == 5)):

            Xr << 8*(150 - XΘ) + 8
        
        EUDEndIf()

        if EUDIf()((XΘ >= 151,Xn == 5)):

            Xs << 6*(XΘ - 150) - 6
        
        EUDEndIf()

        if EUDIf()((XΘ <= 151,Xn == 5)):

            Xs << 6*(150 - XΘ) - 6
        
        EUDEndIf()

        if EUDIf()((Xt >= 300,Xd >= 0,Xd <= 18,Xn == 5)):

            Xu, Xv = f_lengthdir(Xr,5*XΘ)
            Xu_2, Xv_2 = f_lengthdir(Xr,5*(XΘ-7))

            Xx << Xu + 2048 
            Xy << Xv + 2048 # X = tcost , Y = tsint

            Xx_2 << Xu_2 + 2048
            Xy_2 << Xv_2 + 2048 

            Xp, Xq = f_lengthdir(1800,5*XΘ + 180 + 5 * (Xd - 1))
            Xp_2, Xq_2 = f_lengthdir(1800,5*(XΘ-7)+ 180 + 5 * (Xd - 1))


            Xz << Xp + 2048
            Xw << Xq + 2048  # X = tcos(2pi - t), Y = tsin(2pi - t) / x + 160 / y + 160

            Xz_2 << Xp_2 + 2048 
            Xw_2 << Xq_2 + 2048 

            Xa, Xb = f_lengthdir(Xs,7*XΘ + 180) # t -> 2pi - t
            Xa_2, Xb_2 = f_lengthdir(Xs,7*(XΘ+5) + 180)


            Xg << Xa + 2048 
            Xh << Xb + 2048 

            Xg_2 << Xa_2 + 2048 
            Xh_2 << Xb_2 + 2048 

            Xi, Xj = f_lengthdir(1800,7*XΘ - 5 * (Xd - 1))
            Xi_2, Xj_2 = f_lengthdir(1800,7*(XΘ+5) - 7 * (Xd - 1))

            Xk << Xi + 2048 
            Xl << Xj + 2048 

            Xk_2 << Xi_2 + 2048 
            Xl_2 << Xj_2 + 2048 

            DoActions([


                    SetMemory(0x58E37C,SetTo,Xx_2),
                    SetMemory(0x58E384,SetTo,Xx_2),
                    SetMemory(0x58E380,SetTo,Xy),
                    SetMemory(0x58E388,SetTo,Xy),
                    SetMemory(0x58E3A4,SetTo,Xz_2),
                    SetMemory(0x58E3AC,SetTo,Xz_2),
                    SetMemory(0x58E3A8,SetTo,Xw),
                    SetMemory(0x58E3B0,SetTo,Xw),
             
                
                    CreateUnit(1, "Fast Missile","!5s", P6),
                    MoveLocation("!5g", "Fast Missile", P6, "Anywhere"),
                    GiveUnits(1, "Fast Missile", P6, "!5g", P8),
                    ModifyUnitShields(All, "Fast Missile", P8, "!5g", 0),
                    Order("Fast Missile", P8, "!5g", Move, "!5e"),

                    SetMemory(0x58E37C,SetTo,Xg_2),
                    SetMemory(0x58E384,SetTo,Xg_2),
                    SetMemory(0x58E380,SetTo,Xh),
                    SetMemory(0x58E388,SetTo,Xh),
                    SetMemory(0x58E3A4,SetTo,Xk_2),
                    SetMemory(0x58E3AC,SetTo,Xk_2),
                    SetMemory(0x58E3A8,SetTo,Xl),
                    SetMemory(0x58E3B0,SetTo,Xl),
             
                
                    CreateUnit(1, "Fast Missile","!5s", P5),
                    MoveLocation("!5g", "Fast Missile", P5, "Anywhere"),
                    GiveUnits(1, "Fast Missile", P5, "!5g", P7),
                    ModifyUnitShields(All, "Fast Missile", P7, "!5g", 0),
                    Order("Fast Missile", P7, "!5g", Move, "!5e"),



                ])

        
        EUDEndIf()

        if EUDIf()((Xt <= 200, Xn == 5)):

            DoActions(Xc.SetNumber(161741 + 25))
        
        EUDEndIf()  

        if EUDWhile()((Xc >= 19025 + 25,Xn == 5)):
             
            if EUDIf()((Deaths(Xc,Exactly,194,0))):

                DoActions(Xc.SubtractNumber(25))

                f_dwwrite_epd(Xc + 13,3400)

                DoActions(Xc.AddNumber(25))

            EUDEndIf()

            DoActions(Xc.SubtractNumber(84))

        EUDEndWhile()

        #15 - 7

        if EUDIf()((Switch("#16",Set),Xt == 1,Xn == 6)):

            DoActions([KillUnitAt(All, "Fast Missile", "Anywhere", P7),
                KillUnitAt(All, "Fast Missile", "Anywhere", P8),
                ])

            Xn << 7
            Xt << 900

        EUDEndIf()

        if EUDIf()((Xt >= 1,Xn == 6)):

            Xt << Xt - 1
            XΘ << ((Xt-200) % 360)
            Xθ << (XΘ * 5)%360

            if EUDIf()((Xt >= 200,Xt <= 700,Xn == 6)):
                XΔ << 45
            EUDEndIf()

        EUDEndIf()

        

        if EUDIf()((Xn == 6)):

            Xe, Xf = f_lengthdir(1536,Xθ)

            if EUDIf()((Xθ >= 91 , Xθ <= 270)):

                Xe << 4294967296 - Xe

                Xr << Xe

                Xd_1 << 180

            EUDEndIf()

            if EUDIf()((Xθ >= 0 ,Xθ <= 90)):

                Xr << Xe

                Xd_1 << 0

            EUDEndIf()

            if EUDIf()((Xθ >= 271)):

                Xr << Xe

                Xd_1 << 0

            EUDEndIf()
        
        EUDEndIf()

        if EUDIf()((Xn == 6)):

            Xm, Xo = f_lengthdir(1280,Xθ)

            if EUDIf()((Xθ >= 91, Xθ <= 270)):

                Xm << 4294967296 - Xm

                Xs << Xm

                Xd_2 << 180

            EUDEndIf()

            if EUDIf()((Xθ >= 0,Xθ <= 90)):

                Xs << Xm

                Xd_2 << 0

            EUDEndIf()

            if EUDIf()((Xθ >= 271)):

                Xs << Xm

                Xd_2 << 0

            EUDEndIf()


        
        EUDEndIf()


        if EUDIf()((Xt >= 200,Xn == 6)):

            Xu, Xv = f_lengthdir(Xr,7*XΘ + Xd_1)

            Xx << Xu + 2048 
            Xy << Xv + 2048 # X = tcost , Y = tsint

            Xp, Xq = f_lengthdir(1800,7*XΘ + Xd_1 + 180 + XΔ)

            Xz << Xp + 2048 
            Xw << Xq + 2048  # X = tcos(2pi - t), Y = tsin(2pi - t) / x + 160 / y + 160

            Xa, Xb = f_lengthdir(Xs,7*XΘ + Xd_2 + 180) # t -> 2pi - t

            Xg << Xa + 2048 
            Xh << Xb + 2048 

            Xi, Xj = f_lengthdir(1800,7*XΘ + Xd_2)
           
            Xk << Xi + 2048 
            Xl << Xj + 2048 


            DoActions([


                    SetMemory(0x58E37C,SetTo,Xx),
                    SetMemory(0x58E384,SetTo,Xx),
                    SetMemory(0x58E380,SetTo,Xy),
                    SetMemory(0x58E388,SetTo,Xy),
                    SetMemory(0x58E3A4,SetTo,Xz),
                    SetMemory(0x58E3AC,SetTo,Xz),
                    SetMemory(0x58E3A8,SetTo,Xw),
                    SetMemory(0x58E3B0,SetTo,Xw),
             
                
                    CreateUnit(1, "Fast Missile","!5s", P5),
                    MoveLocation("!5g", "Fast Missile", P5, "Anywhere"),
                    GiveUnits(1, "Fast Missile", P5, "!5g", P7),
                    ModifyUnitShields(All, "Fast Missile", P7, "!5g", 0),
                    Order("Fast Missile", P7, "!5g", Move, "!5e"),

                    SetMemory(0x58E37C,SetTo,Xg),
                    SetMemory(0x58E384,SetTo,Xg),
                    SetMemory(0x58E380,SetTo,Xh),
                    SetMemory(0x58E388,SetTo,Xh),
                    SetMemory(0x58E3A4,SetTo,Xk),
                    SetMemory(0x58E3AC,SetTo,Xk),
                    SetMemory(0x58E3A8,SetTo,Xl),
                    SetMemory(0x58E3B0,SetTo,Xl),
             
                
                    CreateUnit(1, "Fast Missile","!5s", P6),
                    MoveLocation("!5g", "Fast Missile", P6, "Anywhere"),
                    GiveUnits(1, "Fast Missile", P6, "!5g", P8),
                    ModifyUnitShields(All, "Fast Missile", P8, "!5g", 0),
                    Order("Fast Missile", P8, "!5g", Move, "!5e"),



                    
                ])


        
        EUDEndIf()

        if EUDIf()((Xt <= 200, Xn == 6)):

            DoActions(Xc.SetNumber(161741 + 25))
        
        EUDEndIf()  

        if EUDWhile()((Xc >= 19025 + 25,Xn == 6)):
             
            if EUDIf()((Deaths(Xc,Exactly,194,0))):

                DoActions(Xc.SubtractNumber(25))

                f_dwwrite_epd(Xc + 13,3400)

                DoActions(Xc.AddNumber(25))

            EUDEndIf()

            DoActions(Xc.SubtractNumber(84))

        EUDEndWhile()

        #15 - 8



        if EUDIf()((Switch("#16",Set),Xt == 1,Xn == 7)):

            DoActions([KillUnitAt(All, "Slow Missile", "Anywhere", P7),
                KillUnitAt(All, "Slow Missile", "Anywhere", P8),
                KillUnitAt(All, "Slow Missile", "Anywhere", P6),
                ])

            Xn << 8
            Xt << 700

        EUDEndIf()

        if EUDIf()((Xt >= 1,Xn == 7)):

            Xt << Xt - 1
            XΘ << ((Xt-400) % 360)
            

            if EUDIf()((Xt >= 600,Xt <= 900,Xn == 7)):
                XΔ << 8 + (900 - Xt)//25
            EUDEndIf()

            if EUDIf()((Xt >= 400,Xt <= 600,Xn == 7)):
                XΔ << 20 + (600 - Xt)//3
            EUDEndIf()

            

        EUDEndIf()

        



        





        if EUDIf()((Xt >= 400,Xn == 7)):

            Xu, Xv = f_lengthdir(96 + 4*(900 - Xt),3*XΘ)

            Xx << Xu + 2048 
            Xy << Xv + 2048 # X = tcost , Y = tsint

            Xp, Xq = f_lengthdir(2000,3*XΘ + 180 + XΔ)

            Xz << Xp + 2048 
            Xw << Xq + 2048  # X = tcos(2pi - t), Y = tsin(2pi - t) / x + 160 / y + 160

            Xa, Xb = f_lengthdir(96+ 4*(900 - Xt),3*XΘ + 120) # t -> 2pi - t

            Xg << Xa + 2048 
            Xh << Xb + 2048 

            Xi, Xj = f_lengthdir(2000,3*XΘ + 300 + XΔ)
           
            Xk << Xi + 2048 
            Xl << Xj + 2048 

            Yu, Yv = f_lengthdir(96 +4*(900 - Xt),3*XΘ + 240)

            Yx << Yu + 2048 
            Yy << Yv + 2048 # X = tcost , Y = tsint

            Yp, Yq = f_lengthdir(2000,3*XΘ + 60 + XΔ)

            Yz << Yp + 2048 
            Yw << Yq + 2048     


            DoActions([


                    SetMemory(0x58E37C,SetTo,Xx),
                    SetMemory(0x58E384,SetTo,Xx),
                    SetMemory(0x58E380,SetTo,Xy),
                    SetMemory(0x58E388,SetTo,Xy),
                    SetMemory(0x58E3A4,SetTo,Xz),
                    SetMemory(0x58E3AC,SetTo,Xz),
                    SetMemory(0x58E3A8,SetTo,Xw),
                    SetMemory(0x58E3B0,SetTo,Xw),
             
                
                    CreateUnit(1, "Slow Missile","!5s", P5),
                    MoveLocation("!5g", "Slow Missile", P5, "Anywhere"),
                    GiveUnits(1, "Slow Missile", P5, "!5g", P7),
                    ModifyUnitShields(All, "Slow Missile", P7, "!5g", 0),
                    Order("Slow Missile", P7, "!5g", Move, "!5e"),

                    SetMemory(0x58E37C,SetTo,Xg),
                    SetMemory(0x58E384,SetTo,Xg),
                    SetMemory(0x58E380,SetTo,Xh),
                    SetMemory(0x58E388,SetTo,Xh),
                    SetMemory(0x58E3A4,SetTo,Xk),
                    SetMemory(0x58E3AC,SetTo,Xk),
                    SetMemory(0x58E3A8,SetTo,Xl),
                    SetMemory(0x58E3B0,SetTo,Xl),
             
                
                    CreateUnit(1, "Slow Missile","!5s", P5),
                    MoveLocation("!5g", "Slow Missile", P5, "Anywhere"),
                    GiveUnits(1, "Slow Missile", P5, "!5g", P8),
                    ModifyUnitShields(All, "Slow Missile", P8, "!5g", 0),
                    Order("Slow Missile", P8, "!5g", Move, "!5e"),

                    SetMemory(0x58E37C,SetTo,Yx),
                    SetMemory(0x58E384,SetTo,Yx),
                    SetMemory(0x58E380,SetTo,Yy),
                    SetMemory(0x58E388,SetTo,Yy),
                    SetMemory(0x58E3A4,SetTo,Yz),
                    SetMemory(0x58E3AC,SetTo,Yz),
                    SetMemory(0x58E3A8,SetTo,Yw),
                    SetMemory(0x58E3B0,SetTo,Yw),
             
                
                    CreateUnit(1, "Slow Missile","!5s", P5),
                    MoveLocation("!5g", "Slow Missile", P5, "Anywhere"),
                    GiveUnits(1, "Slow Missile", P5, "!5g", P6),
                    ModifyUnitShields(All, "Slow Missile", P6, "!5g", 0),
                    Order("Slow Missile", P6, "!5g", Move, "!5e"),




                    
                ])


        
        EUDEndIf()

        if EUDIf()((Xt <= 400, Xn == 7)):

            DoActions(Xc.SetNumber(161741 + 25))
        
        EUDEndIf()  

        if EUDWhile()((Xc >= 19025 + 25,Xn == 7)):
             
            if EUDIf()((Deaths(Xc,Exactly,195,0))):

                DoActions(Xc.SubtractNumber(25))

                f_dwwrite_epd(Xc + 13,2400)

                DoActions(Xc.AddNumber(25))

            EUDEndIf()

            DoActions(Xc.SubtractNumber(84))

        EUDEndWhile()

        #15 - 9


        if EUDIf()((Switch("#16",Set),Xt == 1,Xn == 8)):

            DoActions([KillUnitAt(All, "Normal Missile", "Anywhere", P7),
                KillUnitAt(All, "Normal Missile", "Anywhere", P8),
                KillUnitAt(All, "Fast Missile", "Anywhere", P6),
                ])

            Xn << 9
            Xt << 700

        EUDEndIf()

        if EUDIf()((Switch("#16",Set),Xt == 10,Xn == 8,Xd_3 == 0)):

           
                

            Xt << 125
            Xd_3 << 1

        EUDEndIf()

      

        if EUDIf()((Xt >= 1,Xn == 8)):

            Xt << Xt - 1
            XΘ << ((Xt-200) % 360)
            Xd << Xt % 9

            if EUDIf()((Xt >= 200,Xt <= 220,Xn == 8)):
                XΔ << 180
            EUDEndIf()
            
            if EUDIf()((Xt >= 220,Xt <= 250,Xn == 8)):
                XΔ << 150 + (250 - Xt)
            EUDEndIf()

            if EUDIf()((Xt >= 200,Xt <= 320,Xn == 8)):
                XΔ << 150
            EUDEndIf()

            if EUDIf()((Xt >= 320,Xt <= 370,Xn == 8)):
                XΔ << 3* (370 - Xt)
            EUDEndIf()

            if EUDIf()((Xt >= 370,Xt <= 600,Xn == 8)):
                XΔ << 0
            EUDEndIf()


        EUDEndIf()

        if EUDIf()((Xt >= 350,Xn == 8)):

            Xr << 6*(Xt - 350) 
        
        EUDEndIf()

        if EUDIf()((Xt <= 350,Xn == 8)):

            Xr << 6*(350 - Xt)
        
        EUDEndIf()

        if EUDIf()((Xt >= 350,Xn == 8)):

            Xs << 6*(Xt - 350) 
        
        EUDEndIf()

        if EUDIf()((Xt <= 350,Xn == 8)):

            Xs << 6*(350 - Xt) 
        
        EUDEndIf()



        if EUDIf()((Xt >= 200,Xn == 8)):

            Xu, Xv = f_lengthdir(Xr,XΘ)
            Xu_2, Xv_2 = f_lengthdir(Xs,XΘ)

            Xx << Xu + 2048 - 96
            Xy << Xv + 2048 # X = tcost , Y = tsint

            Xx_2 << Xu_2 + 2048 - 96
            Xy_2 << Xv_2 + 2048

            Xp, Xq = f_lengthdir(2000,XΘ + 180 - XΔ)

            Xz << Xp + 2048 - 96
            Xw << Xq + 2048  # X = tcos(2pi - t), Y = tsin(2pi - t) / x + 160 / y + 160

            Xa, Xb = f_lengthdir(Xr,XΘ + 180) # t -> 2pi - t
            Xa_2, Xb_2 = f_lengthdir(Xs,XΘ + 180)

            Xg << Xa + 2048 + 96
            Xh << Xb + 2048 

            Xg_2 << Xa_2 + 2048 + 96
            Xh_2 << Xb_2 + 2048

            Xi, Xj = f_lengthdir(2000,XΘ + (360 - XΔ) )
           
            Xk << Xi + 2048 + 96
            Xl << Xj + 2048


            DoActions([


                    SetMemory(0x58E37C,SetTo,Xx),
                    SetMemory(0x58E384,SetTo,Xx),
                    SetMemory(0x58E380,SetTo,Xy_2),
                    SetMemory(0x58E388,SetTo,Xy_2),
                    SetMemory(0x58E3A4,SetTo,Xz),
                    SetMemory(0x58E3AC,SetTo,Xz),
                    SetMemory(0x58E3A8,SetTo,Xw),
                    SetMemory(0x58E3B0,SetTo,Xw),
             
                
                    CreateUnit(1, "Normal Missile","!5s", P5),
                    MoveLocation("!5g", "Normal Missile", P5, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P5, "!5g", P7),
                    ModifyUnitShields(All, "Normal Missile", P7, "!5g", 0),
                    Order("Normal Missile", P7, "!5g", Move, "!5e"),

                    SetMemory(0x58E37C,SetTo,Xg),
                    SetMemory(0x58E384,SetTo,Xg),
                    SetMemory(0x58E380,SetTo,Xh_2),
                    SetMemory(0x58E388,SetTo,Xh_2),
                    SetMemory(0x58E3A4,SetTo,Xk),
                    SetMemory(0x58E3AC,SetTo,Xk),
                    SetMemory(0x58E3A8,SetTo,Xl),
                    SetMemory(0x58E3B0,SetTo,Xl),
             
                
                    CreateUnit(1, "Normal Missile","!5s", P6),
                    MoveLocation("!5g", "Normal Missile", P6, "Anywhere"),
                    GiveUnits(1, "Normal Missile", P6, "!5g", P8),
                    ModifyUnitShields(All, "Normal Missile", P8, "!5g", 0),
                    Order("Normal Missile", P8, "!5g", Move, "!5e"),

           




                    
                ])



        EUDEndIf()


        if EUDIf()((Xt >= 200,Xn == 8,Xd >= 1,Xt <=600, Xd <= 3)):

           

            Yu, Yv = f_lengthdir(1400+2*(600 - Xt),4*XΘ)

            Yx << Yu + 2048 
            Yy << Yv + 2048 # X = tcost , Y = tsint

            Yp, Yq = f_lengthdir(2000,4*XΘ + 180 + (Xd-1)*5)

            Yz << Yp + 2048 
            Yw << Yq + 2048     


            DoActions([


                

                    SetMemory(0x58E37C,SetTo,Yx),
                    SetMemory(0x58E384,SetTo,Yx),
                    SetMemory(0x58E380,SetTo,Yy),
                    SetMemory(0x58E388,SetTo,Yy),
                    SetMemory(0x58E3A4,SetTo,Yz),
                    SetMemory(0x58E3AC,SetTo,Yz),
                    SetMemory(0x58E3A8,SetTo,Yw),
                    SetMemory(0x58E3B0,SetTo,Yw),
             
                
                    CreateUnit(1, "Fast Missile","!5s", P5),
                    MoveLocation("!5g", "Fast Missile", P5, "Anywhere"),
                    GiveUnits(1, "Fast Missile", P5, "!5g", P6),
                    ModifyUnitShields(All, "Fast Missile", P6, "!5g", 0),
                    Order("Fast Missile", P6, "!5g", Move, "!5e"),




                    
                ])



        EUDEndIf()

        if EUDIf()((Xt <= 200, Xn == 8)):

            DoActions(Xc.SetNumber(161741 + 25))
        
        EUDEndIf()  

        if EUDWhile()((Xc >= 19025 + 25,Xn == 8)):
             
            if EUDIf()((Deaths(Xc,Exactly,194,0))):

                DoActions(Xc.SubtractNumber(25))

                f_dwwrite_epd(Xc + 13,3400)

                DoActions(Xc.AddNumber(25))

            EUDEndIf()

            if EUDIf()((Deaths(Xc,Exactly,196,0))):

                DoActions(Xc.SubtractNumber(25))

                f_dwwrite_epd(Xc + 13,3400)

                DoActions(Xc.AddNumber(25))

            EUDEndIf()

            DoActions(Xc.SubtractNumber(84))

        EUDEndWhile()



        #15 - L

        XΛ  = EUDVariable()

        if EUDIf()((Switch("#16",Set),Xt == 1,Xn == 9)):

            DoActions([KillUnitAt(All, "Normal Missile", "Anywhere", P7),
                KillUnitAt(All, "Normal Missile", "Anywhere", P8),
            
                ])

            Xn << 10

        EUDEndIf()


        if EUDIf()((Xt >= 1,Xn == 9)):

            Xt << Xt - 1

        EUDEndIf()


        if EUDIf()((Xt >= 671,Xt <= 700, Xn == 9)):

            XΛ << 27

            if EUDWhile()(XΛ >= 1):

                Xr = f_dwrand()
                XΘ = f_dwrand()

                Xr << Xr // 5368709 
                XΘ << XΘ // 11930465

                Xu, Xv = f_lengthdir(Xr,XΘ)

                Xx << Xu + 2048 
                Xy << Xv + 2048 # X = tcost , Y = tsint


                Xp, Xq = f_lengthdir(2000,XΘ + 180)

                Xz << Xp + 2048 
                Xw << Xq + 2048  # X = tcos(2pi - t), Y = tsin(2pi - t) / x + 160 / y + 160

                Xa, Xb = f_lengthdir(Xr,XΘ + 180) # t -> 2pi - t
         

                Xg << Xa + 2048 
                Xh << Xb + 2048 


                Xi, Xj = f_lengthdir(2000,XΘ)
               
                Xk << Xi + 2048 
                Xl << Xj + 2048


                DoActions([


                        SetMemory(0x58E37C,SetTo,Xx),
                        SetMemory(0x58E384,SetTo,Xx),
                        SetMemory(0x58E380,SetTo,Xy),
                        SetMemory(0x58E388,SetTo,Xy),
                        SetMemory(0x58E3A4,SetTo,Xz),
                        SetMemory(0x58E3AC,SetTo,Xz),
                        SetMemory(0x58E3A8,SetTo,Xw),
                        SetMemory(0x58E3B0,SetTo,Xw),
                 
                    
                        CreateUnit(1, "Normal Missile","!5s", P5),
                        MoveLocation("!5g", "Normal Missile", P5, "Anywhere"),
                        GiveUnits(1, "Normal Missile", P5, "!5g", P7),
                        ModifyUnitShields(All, "Normal Missile", P7, "!5g", 0),
                        Order("Normal Missile", P7, "!5g", Move, "!5e"),

                        SetMemory(0x58E37C,SetTo,Xg),
                        SetMemory(0x58E384,SetTo,Xg),
                        SetMemory(0x58E380,SetTo,Xh),
                        SetMemory(0x58E388,SetTo,Xh),
                        SetMemory(0x58E3A4,SetTo,Xk),
                        SetMemory(0x58E3AC,SetTo,Xk),
                        SetMemory(0x58E3A8,SetTo,Xl),
                        SetMemory(0x58E3B0,SetTo,Xl),
                 
                    
                        CreateUnit(1, "Normal Missile","!5s", P6),
                        MoveLocation("!5g", "Normal Missile", P6, "Anywhere"),
                        GiveUnits(1, "Normal Missile", P6, "!5g", P8),
                        ModifyUnitShields(All, "Normal Missile", P8, "!5g", 0),
                        Order("Normal Missile", P8, "!5g", Move, "!5e"),
                        
                    ])

                XΛ << XΛ - 1

            EUDEndWhile()

        EUDEndIf()

        if EUDIf()((Xt <= 650, Xn == 9)):

            DoActions(Xc.SetNumber(161741 + 25))
        
        EUDEndIf()  

        if EUDWhile()((Xc >= 19025 + 25,Xn == 9)):
             
            if EUDIf()((Deaths(Xc,Exactly,196,0))):

                DoActions(Xc.SubtractNumber(25))

                f_dwwrite_epd(Xc + 13,400)

                DoActions(Xc.AddNumber(25))

            EUDEndIf()

            DoActions(Xc.SubtractNumber(84))

        EUDEndWhile()









        Δx = f_dwread_epd_safe(EPD(0x51CE8C))

        Δy << 0xFFFFFFFF - Δx

        Δt << Δy - Δu

        Δv << Δv + Δt

        if EUDIf()(Δw == 0):
            Δv << 0

            #bgm go
            DoActions([SetDeaths(Force1,SetTo,59,"!bgm")])

        EUDEndIf()


        if EUDIf()((Δv >= 199 * 1000, Δw == 1)):
            Δv << 0

            #bgm go
            DoActions([SetDeaths(Force1,SetTo,59,"!bgm")])
                            
        EUDEndIf()

        Δu << Δy
        Δw << 1





     







        




























        

        
        
        





            




















        

















       




        












        






        
     

       

            




































































        
        Trigger(
            conditions=[

              Always(),
            ],
            actions=[
                SetDeaths(P4,Subtract,1,"!wait"),
                SetDeaths(P5,Subtract,1,"!wait"),
                SetDeaths(P6,Subtract,1,"!wait"),
                SetDeaths(P7,Subtract,1,"!wait"),
                SetDeaths(P9,Subtract,1,"!wait"),
                SetDeaths(P10,Subtract,1,"!wait"),
                SetDeaths(P11,Subtract,1,"!wait"),
                SetDeaths(P12,Subtract,1,"!wait"),
                SetDeaths(P1,Subtract,1,"!wait2"),
                SetDeaths(P2,Subtract,1,"!wait2"),
                SetDeaths(P3,Subtract,1,"!wait2"),
                SetDeaths(P4,Subtract,1,"!wait2"),
                SetDeaths(P5,Subtract,1,"!wait2"),
                SetDeaths(P6,Subtract,1,"!wait2"),
                SetDeaths(P7,Subtract,1,"!wait2"),
                SetDeaths(P8,Subtract,1,"!wait2"),
                SetDeaths(P9,Subtract,1,"!wait2"),
                SetDeaths(P10,Subtract,1,"!wait2"),
                SetDeaths(P11,Subtract,1,"!wait2"),
                SetDeaths(P12,Subtract,1,"!wait2"),


                SetDeaths(P1,Subtract,1,"!wait3"),
                SetDeaths(P2,Subtract,1,"!wait3"),
                SetDeaths(P3,Subtract,1,"!wait3"),
                SetDeaths(P4,Subtract,1,"!wait3"),
                SetDeaths(P5,Subtract,1,"!wait3"),
                SetDeaths(P6,Subtract,1,"!wait3"),
                SetDeaths(P7,Subtract,1,"!wait3"),
                SetDeaths(P8,Subtract,1,"!wait3"),
                SetDeaths(P9,Subtract,1,"!wait3"),
                SetDeaths(P10,Subtract,1,"!wait3"),
                SetDeaths(P11,Subtract,1,"!wait3"),
                SetDeaths(P12,Subtract,1,"!wait3"),
            ]
        )
   


  




        # 터보트리거 등등
        RunTrigTrigger()
        EUDDoEvents()
    EUDEndInfLoop()









