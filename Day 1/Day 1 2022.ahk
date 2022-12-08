#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.





		Raw =
		(
		1000
		2000
		3000
		
		4000
		
		5000
		6000
		
		7000
		8000
		9000
		
		10000
		)
		
		Elf_Calories := {}
		
		for each, Elf in Elves := StrSplit(Raw, "`n`n")
			Elf_Calories[CountCalories(StrSplit(Elf, "`n"))] := each
		
		MsgBox % "Stage 1:" GetHighestCalories(Elf_Calories) "`n`nStage 2: " GetHighestCalories(Elf_Calories, 3)
		
		Exit ;EOAES
		
		GetHighestCalories(Obj, StageFlag := ""){
			for numbers, i in Obj
				str .= i<Obj.MaxIndex() ? numbers ", " : numbers
			Sort str, R N D,
			Return StageFlag=3?StrSplit(str, ",").1 + StrSplit(str, ",").2 + StrSplit(str, ",").3:StrSplit(str, ",").1
		}
		
		CountCalories(Meals){
			for each, Meal in Meals
				Calories += Meal
			Return Calories 
		}
