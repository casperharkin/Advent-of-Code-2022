#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

		
		; Part 1
		Raw = 
		(
		vJrwpWtwJgWrhcsFMMfFFhFp
		jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
		PmmdzqPrVvPwwTWBwg
		wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
		ttgJtRGJQctTZtZT
		CrZsJsPPZsGzwwsLwLmpwMDw
		)
		
		Result := []
		for each, bag in bags := StrSplit(Raw, "`n"){
			Result.Push(SplitBag(bag))
		}
		
		MsgBox % ScoreItems(Result) 
		
		Exit ; EOAES
		
		SplitBag(bag){
		
			MiddlePoint := StrLen(bag)/2
			ChrCount_1 := ChrCounter(Compartment_1 := StrSplit(SubStr(bag, 1, MiddlePoint)))
			ChrCount_2 := ChrCounter(Compartment_2 := StrSplit(SubStr(bag, MiddlePoint+1)))
		
			for each, item in ChrCount_1 
				If ChrCount_2.HasKey(each)
					s := Chr(each)
			Return s
		}
		
		ScoreItems(ResultList){
			for i, e in ResultList {
				if ((asc(e)-65)-31 < 27) and ((asc(e)-65)-31>0)
					s += (asc(e)-65)-31
				Else
					s += asc(e)-38
			}
			Return s
		}
		
		ChrCounter(Array){
			CountingTool := {}
		
			loop 26 {
				CountingTool[64+A_Index] := 0
				CountingTool[97+A_Index] := 0
			}
		
			for each, letter in Array
				CountingTool[Asc(letter)] += 1
		
			DeleteKeys := []
			
			for each, letter in CountingTool
				If (CountingTool[each] = 0)
					DeleteKeys.Push(each) 
		
			for i, key in DeleteKeys
			    CountingTool.Delete(key)
		
			Return CountingTool
		}
		
		
		
		;Part 2
		
		Raw = 
		(
		vJrwpWtwJgWrhcsFMMfFFhFp
		jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
		PmmdzqPrVvPwwTWBwg
		wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
		ttgJtRGJQctTZtZT
		CrZsJsPPZsGzwwsLwLmpwMDw
		)
		
		Bags := StrSplit(Raw, "`n")
		Groups := SplitGroups(Bags)
		
		for each, group in Groups {
		
			GroupNo := A_Index
			Group_%GroupNo%_Lines := {}
		
			for i, Line in Group_%GroupNo% := StrSplit(Group, "`n") {
				Group_%GroupNo%_Lines.Push(t := ChrCounter(Line))
			}
		
			For e, item in Group_%GroupNo%_Lines[1] {
				if (Group_%GroupNo%_Lines[1].HasKey(e)) and (Group_%GroupNo%_Lines[2].HasKey(e)) and (Group_%GroupNo%_Lines[3].HasKey(e))
					ResultList .= chr(e) 
			}
			
		}
		
		MsgBox % ScoreItems(ResultList)
		
		MsgBox end
		
		Exit ; EOAES
		
		ScoreItems(ResultList){
			for i, e in StrSplit(ResultList){
				if ((asc(e)-65)-31 < 27) and ((asc(e)-65)-31>0)
					s += (asc(e)-65)-31
				Else
					s += asc(e)-38
			}
			Return s
		}
		
		ChrCounter(Line){
			CountingTool := {}
			
			loop 26 {
				CountingTool[64+A_Index] := 0
				CountingTool[97+A_Index] := 0
			}
		
			for each, letter in Array := StrSplit(Line)
				CountingTool[Asc(letter)] += 1
		
			DeleteKeys := []
			
			for each, letter in CountingTool
				If (CountingTool[each] = 0)
					DeleteKeys.Push(each) 
		
			for i, key in DeleteKeys
			    CountingTool.Delete(key)
		
			Return CountingTool
		}
		
		SplitGroups(Array, Counter := 0){
			Groups := {}
			for each, bag in Array {
				If (Counter = 0){
					s .= bag "`n"
					Counter++
				}
				else If (Counter = 1){
					s .= bag "`n"
					Counter++
				}
				else If (Counter = 2){
					s .= bag
					Counter++
					Groups.Push(s)
					Counter := 0
					s := ""
				}
			}
		Return Groups
		}


