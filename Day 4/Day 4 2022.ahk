#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

raw = 
(
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
)

rows := StrSplit(raw, "`n")
Elves := {}

for e, row in rows {

	Elves["Row_" CurRow := A_Index] := {}

	Elves["Row_" CurRow := A_Index]["Elf_1"] := {}
	Elves["Row_" CurRow]["Elf_1"]["Start"] := StrSplit(StrSplit(row, ",").1, "-").1
	Elves["Row_" CurRow]["Elf_1"]["End"] := StrSplit(StrSplit(row, ",").1, "-").2

	Elves["Row_" CurRow := A_Index]["Elf_2"] := {}
	Elves["Row_" CurRow]["Elf_2"]["Start"] := StrSplit(StrSplit(row, ",").2, "-").1
	Elves["Row_" CurRow]["Elf_2"]["End"] := StrSplit(StrSplit(row, ",").2, "-").2

}

DeleteKeys := []

for each, elf in Elves {
	If (elf["Elf_1"]["Start"] < elf["Elf_2"]["Start"]) and (elf["Elf_1"]["End"] < elf["Elf_2"]["End"])
		If (elf["Elf_1"]["End"] != elf["Elf_2"]["Start"])
			if (elf["Elf_1"]["End"] < elf["Elf_2"]["Start"])
				DeleteKeys.Push(each)
}

for i, key in DeleteKeys
	Elves.Delete(key)

Count := 0

for each, elf in Elves {
	
	If (elf["Elf_2"]["Start"] >= elf["Elf_1"]["End"]) or (elf["Elf_2"]["Start"] <= elf["Elf_1"]["End"])
		MsgBox % elf["Elf_1"]["Start"] " to " elf["Elf_1"]["End"] "`n" elf["Elf_2"]["Start"] " to " elf["Elf_2"]["End"]

}
MsgBox % "Answer to Part 1: " Count
Return

for each, elf in Elves
	If (elf["Elf_1"]["Start"] <= elf["Elf_2"]["Start"]) and (elf["Elf_1"]["End"] >= elf["Elf_2"]["End"]) or (elf["Elf_1"]["Start"] >= elf["Elf_2"]["Start"]) and (elf["Elf_1"]["End"] <= elf["Elf_2"]["End"])
		Count++

MsgBox % "Answer to Part 1: " Count
MsgBox % "Answer to Part 2: " Elves.Count() 
