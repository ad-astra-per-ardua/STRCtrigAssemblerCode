
-- Copy from here
-- Laptop
-- Curdir = "C:\\Users\\rlatj\\Desktop\\workingarea\\mapping\\euddraft0.9.10.12\\Mapping\\ctrig"
-- __MapDirSetting(__encode_cp949(Curdir.."\\map")) -- 맵파일 경로(\를 \\로 바꿔야함)
-- __SubDirSetting(__encode_cp949(Curdir)) -- Main.lua 폴더경로 (\를 \\로 바꿔야함, 없으면 비우기)

-- - Desktop
-- Curdir = "C:\\Users\\USER\\Desktop\\mapping\\euddraft0.9.10.12\\Mapping\\ctrig"
-- __MapDirSetting(__encode_cp949(Curdir.."\\map")) -- 맵파일 경로(\를 \\로 바꿔야함)
-- __SubDirSetting(__encode_cp949(Curdir)) -- Main.lua 폴더경로 (\를 \\로 바꿔야함, 없으면 비우기)
-- -- End of VSC Compile Mode Initialization


--↓ Tep에 그대로 붙여넣기 -----------------------------------------------------------------
SetForces({P1},{P2,P3,P4,P5,P6,P7,P8},{},{},{P1,P2,P3,P4,P5,P6,P7,P8})
SetFixedPlayer(P8)
StartCtrig(1,nil,0,1,"C:\\Users\\rlatj\\Desktop\\workingarea\\mapping\\euddraft0.9.10.12")
-- StartCtrig(1,nil,0,1,"C:\\Users\\USER\\Desktop\\mapping\\euddraft0.9.10.12") -- Declare fixed player first
FP = P1
Include_CtrigPlib(360,"Switch 1")
Include_64BitLibrary("Switch 1")
Namefunction()
Lib322()
DisplayprintLib()
DP_Start_init(FP)
CJump(AllPlayers,0x9FF)




CJumpEnd(AllPlayers,0x9FF)

--↓ 이곳에 예제를 붙여넣기 (예제에 Include_CtrigPlib가 존재하는경우 삭제) ----------------------


CVariable(FP, 0x10)
V_value = V(0x10)
CIf(FP, Always())
DisplayPrint(P1,{"Player Name is ",PName(P1)})
CIfEnd()
DisplayPrintEr(FP, {"V's value : " , V(0x10)})

--DisplayPrintEr는 해당플레이어 오류줄에 텍스트를 넣음. DisplayPrint도 똑같은 원리. CPosX,CPosY의 데이터형은 V임. 
--PlayerID에는 원하는 플레이어에 발싸할지 결정하는곳. 관전플레이어 넣으면안됨. 상수 가능, Force1 형태 가능(아마?) 안되면 {0,1,2,3} 이렇게 넣어도 됨. 데이터형 W는 DisplayPrint에만 지원가능하지만 64비트 라이브러리 필요.
--DisplayPrint류 함수는 모두 FP가 주인인 트리거임(트리거 주인을 자유자재로 바꾸는건 어케하는지 몰라서 패스;;;
--DisplayPrint는 Er와 다르게 관전플레이어에도 쏠 수 있다!!
--너무 남발하면 트리거수 폭발할수 있으므로 자제할것. (정작 본인이 남발하고있죠?킹받죠?)



--↑ 이곳에 예제를 붙여넣기 -----------------------------------------------------------------
Trigger {
	players = {P1},
	conditions = {
		Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 22");
	},
	actions = {
		MoveUnit(1,"Devouring One (Zergling)",P1,"Location 22","Location 28");
		SetResources(P1,SetTo,0,Ore);
		PreserveTrigger();
	}
}
Trigger {
	players = {P1},
	conditions = {
		Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 23");
	},
	actions = {
		MoveUnit(1,"Devouring One (Zergling)",P1,"Location 23","Location 28");
		SetResources(P1,Add,1,Ore);
		PreserveTrigger();
	}
}
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 24"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 24","Location 28"))
	CMov(P1,0x57f0f0,_Mul(_Read(0x57f0f0),2))
CIfEnd()
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 25"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 25","Location 28"))
	CMov(P1,0x57f0f0,_Neg(_Read(0x57f0f0)))
CIfEnd()
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 26"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 26","Location 28"))
	CMov(P1,0x57f0f0,_Div(_Read(0x57f0f0),2))
CIfEnd()
Trigger {
	players = {P1},
	conditions = {
		Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 27");
	},
	actions = {
		MoveUnit(1,"Devouring One (Zergling)",P1,"Location 27","Location 28");
		SetResources(P1,Add,-1,Ore);
		PreserveTrigger();
	}
}




Trigger {
	players = {P1},
	conditions = {
		Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 29");
	},
	actions = {
		MoveUnit(1,"Devouring One (Zergling)",P1,"Location 29","Location 35");
		SetResources(P1,SetTo,0,Gas);
		PreserveTrigger();
	}
}
Trigger {
	players = {P1},
	conditions = {
		Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 30");
	},
	actions = {
		MoveUnit(1,"Devouring One (Zergling)",P1,"Location 30","Location 35");
		SetResources(P1,Add,1,Gas);
		PreserveTrigger();
	}
}
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 31"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 31","Location 35"))
	CMov(P1,0x57f120,_Mul(_Read(0x57f120),2))
CIfEnd()
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 32"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 32","Location 35"))
	CMov(P1,0x57f120,_Neg(_Read(0x57f120)))
CIfEnd()
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 33"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 33","Location 35"))
	CMov(P1,0x57f120,_Div(_Read(0x57f120),2))
CIfEnd()
Trigger {
	players = {P1},
	conditions = {
		Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 34");
	},
	actions = {
		MoveUnit(1,"Devouring One (Zergling)",P1,"Location 34","Location 35");
		SetResources(P1,Add,-1,Gas);
		PreserveTrigger();
	}
}

Trigger {
	players = {P1},
	conditions = {
		Label(0);
		Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 39");
	},
	actions = {
		MoveUnit(1,"Devouring One (Zergling)",P1,"Location 39","Location 45");
		SetMemory(0x58F480,SetTo,0);
		SetMemory(0x58F484,SetTo,0);
		PreserveTrigger();
	}
}
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 40"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 40","Location 45"))
	f_LMov(P1,0x58F480,_LAdd(_LRead(0x58F480),1))
CIfEnd()
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 41"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 41","Location 45"))
	f_LMov(P1,0x58F480,_LMul(_LRead(0x58F480),2))
CIfEnd()
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 42"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 42","Location 45"))
	f_LMov(P1,0x58F480,_LNeg(_LRead(0x58F480)))
CIfEnd()
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 43"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 43","Location 45"))
	f_LMov(P1,0x58F480,_LDiv(_LRead(0x58F480),2))
CIfEnd()
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 44"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 44","Location 45"))
	f_LMov(P1,0x58F480,_LAdd(_LRead(0x58F480),"0xFFFFFFFFFFFFFFFF"))
CIfEnd()

Trigger {
	players = {P1},
	conditions = {
		Label(0);
		Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 46");
	},
	actions = {
		MoveUnit(1,"Devouring One (Zergling)",P1,"Location 46","Location 52");
		SetMemory(0x58F488,SetTo,0);
		SetMemory(0x58F48C,SetTo,0);
		PreserveTrigger();
	}
}
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 47"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 47","Location 52"))
	f_LMov(P1,0x58F488,_LAdd(_LRead(0x58F488),1))
CIfEnd()
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 48"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 48","Location 52"))
	f_LMov(P1,0x58F488,_LMul(_LRead(0x58F488),2))
CIfEnd()
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 49"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 49","Location 52"))
	f_LMov(P1,0x58F488,_LNeg(_LRead(0x58F488)))
CIfEnd()
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 50"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 50","Location 52"))
	f_LMov(P1,0x58F488,_LDiv(_LRead(0x58F488),2))
CIfEnd()
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 51"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 51","Location 52"))
	f_LMov(P1,0x58F488,_LAdd(_LRead(0x58F488),"0xFFFFFFFFFFFFFFFF"))
CIfEnd()

Trigger {
	players = {P1},
	conditions = {
		Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 53");
	},
	actions = {
		MoveUnit(1,"Devouring One (Zergling)",P1,"Location 53","Location 59");
		SetMemory(0x58F4C0,SetTo,0);
		PreserveTrigger();
	}
}
Trigger {
	players = {P1},
	conditions = {
		Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 54");
	},
	actions = {
		MoveUnit(1,"Devouring One (Zergling)",P1,"Location 54","Location 59");
		SetMemory(0x58F4C0,Add,1);
		PreserveTrigger();
	}
}
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 55"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 55","Location 59"))
	CMov(P1,0x58F4C0,_Mul(_Read(0x58F4C0),2))
CIfEnd()
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 56"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 56","Location 59"))
	CMov(P1,0x58F4C0,_Neg(_Read(0x58F4C0)))
CIfEnd()
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 57"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 57","Location 59"))
	CMov(P1,0x58F4C0,_Div(_Read(0x58F4C0),2))
CIfEnd()
Trigger {
	players = {P1},
	conditions = {
		Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 58");
	},
	actions = {
		MoveUnit(1,"Devouring One (Zergling)",P1,"Location 58","Location 59");
		SetMemory(0x58F4C0,Add,-1);
		PreserveTrigger();
	}
}

Trigger {
	players = {P1},
	conditions = {
		Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 60");
	},
	actions = {
		MoveUnit(1,"Devouring One (Zergling)",P1,"Location 60","Location 67");
		SetMemory(0x58F4C4,SetTo,0);
		PreserveTrigger();
	}
}
Trigger {
	players = {P1},
	conditions = {
		Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 61");
	},
	actions = {
		MoveUnit(1,"Devouring One (Zergling)",P1,"Location 61","Location 67");
		SetMemory(0x58F4C4,Add,1);
		PreserveTrigger();
	}
}
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 62"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 62","Location 67"))
	CMov(P1,0x58F4C4,_Mul(_Read(0x58F4C4),2))
CIfEnd()
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 63"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 63","Location 67"))
	CMov(P1,0x58F4C4,_Neg(_Read(0x58F4C4)))
CIfEnd()
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 65"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 65","Location 67"))
	CMov(P1,0x58F4C4,_Div(_Read(0x58F4C4),2))
CIfEnd()
Trigger {
	players = {P1},
	conditions = {
		Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 66");
	},
	actions = {
		MoveUnit(1,"Devouring One (Zergling)",P1,"Location 66","Location 67");
		SetMemory(0x58F4C4,Add,-1);
		PreserveTrigger();
	}
}

Trigger {
	players = {P1},
	conditions = {
		Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 68");
	},
	actions = {
		MoveUnit(1,"Devouring One (Zergling)",P1,"Location 68","Location 74");
		SetMemory(0x58F4C8,SetTo,0);
		PreserveTrigger();
	}
}
Trigger {
	players = {P1},
	conditions = {
		Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 69");
	},
	actions = {
		MoveUnit(1,"Devouring One (Zergling)",P1,"Location 69","Location 74");
		SetMemory(0x58F4C8,Add,1);
		PreserveTrigger();
	}
}
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 70"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 70","Location 74"))
	CMov(P1,0x58F4C8,_Mul(_Read(0x58F4C8),2))
CIfEnd()
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 71"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 71","Location 74"))
	CMov(P1,0x58F4C8,_Neg(_Read(0x58F4C8)))
CIfEnd()
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 72"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 72","Location 74"))
	CMov(P1,0x58F4C8,_Div(_Read(0x58F4C8),2))
CIfEnd()
Trigger {
	players = {P1},
	conditions = {
		Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 73");
	},
	actions = {
		MoveUnit(1,"Devouring One (Zergling)",P1,"Location 73","Location 74");
		SetMemory(0x58F4C8,Add,-1);
		PreserveTrigger();
	}
}

Trigger {
	players = {P1},
	conditions = {
		Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 75");
	},
	actions = {
		MoveUnit(1,"Devouring One (Zergling)",P1,"Location 75","Location 81");
		SetMemory(0x58F4CC,SetTo,0);
		PreserveTrigger();
	}
}
Trigger {
	players = {P1},
	conditions = {
		Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 76");
	},
	actions = {
		MoveUnit(1,"Devouring One (Zergling)",P1,"Location 76","Location 81");
		SetMemory(0x58F4CC,Add,1);
		PreserveTrigger();
	}
}
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 77"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 77","Location 81"))
	CMov(P1,0x58F4CC,_Mul(_Read(0x58F4CC),2))
CIfEnd()
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 78"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 78","Location 81"))
	CMov(P1,0x58F4CC,_Neg(_Read(0x58F4CC)))
CIfEnd()
CIf(P1,Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 79"),MoveUnit(1,"Devouring One (Zergling)",P1,"Location 79","Location 81"))
	CMov(P1,0x58F4CC,_Div(_Read(0x58F4CC),2))
CIfEnd()
Trigger {
	players = {P1},
	conditions = {
		Bring(P1,Exactly,1,"Devouring One (Zergling)","Location 80");
	},
	actions = {
		MoveUnit(1,"Devouring One (Zergling)",P1,"Location 80","Location 81");
		SetMemory(0x58F4CC,Add,-1);
		PreserveTrigger();
	}
}

Trigger { -- No comment (B3442EB7)
	players = {P1},
	conditions = {
		Always();
	},
	actions = {
		CreateUnit(1, "Zerg Broodling", "broodling", P1);
		SetMemoryX(0x58F448,SetTo,255,255);
	},
}
Trigger { -- No comment (EC7DF1DE)
	players = {P2},
	conditions = {
		Never();
	},
	actions = {
		RunAIScriptAt("Expansion Terran Campaign Difficult", "town");
	},
}
Trigger { -- No comment (3775A93C)
	players = {P1},
	conditions = {
		Always();
	},
	actions = {
		RunAIScriptAt("Enter Closest Bunker", "Banker0");
		RunAIScriptAt("Enter Closest Bunker", "Banker1");
	},
}
Trigger { -- No comment (43CD0280)
	players = {P1},
	conditions = {
		Bring(P1, AtLeast, 1, "Men", "HEAL");
	},
	actions = {
		ModifyUnitEnergy(All, "Men", P1, "HEAL", 100);
		ModifyUnitHitPoints(All, "Men", P1, "HEAL", 100);
		ModifyUnitShields(All, "Men", P1, "HEAL", 100);
		PreserveTrigger();
	},
}



EUDTurbo(P1)
init_Setting()
EndCtrig()
ErrorCheck()
--↑ Tep에 그대로 붙여넣기 -----------------------------------------------------------------