-- Copy from here
-- Laptop
-- Curdir = "C:\\Users\\rlatj\\Desktop\\workingarea\\mapping\\euddraft0.9.10.12\\Mapping\\New"
-- __MapDirSetting(__encode_cp949(Curdir.."\\Map")) -- 맵파일 경로(\를 \\로 바꿔야함)
-- __SubDirSetting(__encode_cp949(Curdir)) -- Main.lua 폴더경로 (\를 \\로 바꿔야함, 없으면 비우기)

-- --- Desktop
-- Curdir = "C:\\Users\\rlatj\\Desktop\\workingarea\\mapping\\euddraft0.9.10.12\\Mapping\\New"
-- __MapDirSetting(__encode_cp949(Curdir.."\\Map")) -- 맵파일 경로(\를 \\로 바꿔야함)
-- __SubDirSetting(__encode_cp949(Curdir)) -- Main.lua 폴더경로 (\를 \\로 바꿔야함, 없으면 비우기)
-- -- End of VSC Compile Mode Initialization


--↓ Tep에 그대로 붙여넣기----------------------------------------
FP = P8
SetForces({P1,P2,P3,P4,P5},{P6,P7,P8},{},{},{P1,P2,P3,P4,P5,P6,P7,P8}) 
SetFixedPlayer(P8)
StartCtrig(1,nil,0,1,"C:\\Users\\rlatj\\Desktop\\workingarea\\mapping\\euddraft0.9.10.12")
-- StartCtrig(1,nil,0,1,"C:\\Users\\USER\\Desktop\\mapping\\euddraft0.9.10.12")
CJump(AllPlayers,0)

Include_DataTransfer()
Include_CBPaint()
Include_CtrigPlib(360,"Switch 254",1)
Include_64BitLibrary("Switch 255")
Install_322Lib()
Install_GetCLoc(FP,248,184)
Install_BackupCP(FP)
------------------
Convert_Function()
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

P_Count = CreateNcode()
HumanPlayers = {P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12}

CJumpEnd(AllPlayers,0)
Enable_PlayerCheck()
ObserverChatToAll(FP, _Void(0xFF), nil, nil, 0)
NoAirCollision(FP)
DoActions(FP,{SetSpeed(SetTo, "#X2")})
Install_function()
InitVar()
Define_Shape()
check_shape()



Opening()
----------- 분할 lua 선언 -------
CIfX(AllPlayers,{CDeaths(FP, AtLeast, 1, Difficulty)}) -- 난이도 상관없이 전체 실행


Initial_Setup()
Install_BGMPhase()

Normalgunplot()

CIfXEnd()
----------- 분할 lua 선언 End ---------

CSPlotToCAPlot()


EndCtrig()
ErrorCheck()
EUDTurbo(FP)
-- 에러 체크 함수 선언 위치 --
--↑Tep에 그대로 붙여넣기-----