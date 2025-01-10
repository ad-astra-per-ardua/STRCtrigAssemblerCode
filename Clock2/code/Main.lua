--- 0x58F44C == LeaderBoard change Variable
--- 0x58F450 +*(4 * i for i in range(5)) ) == CCMU Counter Output 



-- Laptop
Curdir = "C:\\Users\\rlatj\\Desktop\\workingarea\\mapping\\euddraft0.9.10.12\\Mapping\\Clock2"
__MapDirSetting(__encode_cp949(Curdir.."\\Map")) -- 맵파일 경로(\를 \\로 바꿔야함)
__SubDirSetting(__encode_cp949(Curdir.."\\code")) -- Main.lua 폴더경로 (\를 \\로 바꿔야함, 없으면 비우기)

-- --- Desktop
-- Curdir = "C:\\Users\\USER\\Desktop\\mapping\\euddraft0.9.10.12\\Mapping\\Clock2"
-- __MapDirSetting(__encode_cp949(Curdir.."\\Map")) -- 맵파일 경로(\를 \\로 바꿔야함)
-- __SubDirSetting(__encode_cp949(Curdir.."\\code")) -- Main.lua 폴더경로 (\를 \\로 바꿔야함, 없으면 비우기)
-- -- End of VSC Compile Mode Initialization

FP = P8
CP = CurrentPlayer
SetForces({P1,P2,P3,P4,P5},{P6,P7,P8},{},{},{P1,P2,P3,P4,P5,P6,P7,P8}) 
SetFixedPlayer(P8)
StartCtrig(1,nil,0,1,"C:\\Users\\rlatj\\Desktop\\workingarea\\mapping\\euddraft0.9.10.12")
-- StartCtrig(1,nil,0,1,"C:\\Users\\USER\\Desktop\\mapping\\euddraft0.9.10.12")
CJump(AllPlayers,0)

Include_DataTransfer()
Include_CBPaint()
Include_CtrigPlib(360,"Switch 254",1)
Include_64BitLibrary("Switch 255")
Namefunction()
Lib322()
DisplayprintLib()
DP_Start_init(FP)
Install_GetCLoc(FP,248,184)
Install_BackupCP(FP)
Install_function()
------------------
-- Convert_Function()
------------------
CSPlotIndexAlloc = 1
CSPlotOrderIndexAlloc = 1

CRecoverCP = CreateVar(FP)
CCX,CCY= CreateVars(2, FP)
DCCX,DCCY = CreateVars(2, FP)
CCA = CreateVarArr(11, FP)
CALocation = CreateVar(FP)
CAOrderLocation = CreateVar(FP)
COrder = CreateVar(FP)
CLSize = CreateVar(FP)
Call_CSPlotToCAPlot = CreateCallIndex()
CSPlotShapeArr = {}
CSPlotOShapeArr = {}
TestOn = CreateCcode()

-- Include_MatheMatics(360)
---- Calculating death variable ----
SDspeed = 1000 // 29
JYD = "Set Unit Order To: Junk Yard Dog"
HumanPlayers = {P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12}

CJumpEnd(AllPlayers,0)
Enable_PlayerCheck()
ObserverChatToAll(FP, _Void(0xFF), nil, nil, 0)
NoAirCollision(FP)
DoActions(FP,{SetSpeed(SetTo, "#X2")})

---------- End of Set Up Initialization ------
Gunplot_Timeline()
Basement_functions()
Verifing_Phase()
Initial_Setting()
Enable_TestMode()
Define_Shape()
Install_GplotEngine()


----------- 분할 lua 선언 -------


Define_Variable()
Declare_BGM()
N_Gunplot()

----------- 분할 lua 선언 End ---------

Clock_setting()
Clock_modifyloop()
-- CSPlotToCAPlot()
init_Setting()
EndCtrig()
ErrorCheck()
EUDTurbo(FP)