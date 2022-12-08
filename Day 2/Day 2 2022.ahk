#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
			
			Raw = 
			(
			A Y
			B X
			C Z
			)
			
			TotalScore := 0, TotalScore2 := 0
			
			For Each, Match in ScheduledMatches := StrSplit(Raw, "`n") {
				TotalScore += StartMatch(Match), TotalScore2 += StartMatch2(Match)
			}
			
			MsgBox % "Stage 1:" TotalScore "`n`nStage 2: " TotalScore2
			
			Exit ; EOAES
			
			StartMatch(Match){
				Scoring := {"A":"Rock", "X":"Rock","B":"Paper","Y":"Paper","C":"Scissors","Z":"Scissors"}
				Points := {"Rock":1,"Paper":2,"Scissors":3}
				Return Points[Scoring[Player := StrSplit(Match, " ").2]] + CheckWinner(Scoring[Opponent := StrSplit(Match, " ").1], Scoring[Player := StrSplit(Match, " ").2])
			}
			
			StartMatch2(Match){
				Scoring := {"A":"Rock","B":"Paper","C":"Scissors"}
				Conditions := {"X":"Lose","Y":"Draw","Z":"Win"}
				Points := {"Rock":1,"Paper":2,"Scissors":3}
			
				Opponent := StrSplit(Match, " ").1
				Condition := Conditions[StrSplit(Match, " ").2]
				PlayersChoice := GetPlayersChoice(Scoring[Opponent], Condition)
			
				Return Points[PlayersChoice] + CheckWinner(Scoring[Opponent], PlayersChoice)
			}
			
			GetPlayersChoice(Opponent, Condition){
				if (Condition = "Draw")
					Return Opponent
				Else if (Opponent = "Rock") and if (Condition = "Win")
					Return "Paper"
				Else if (Opponent = "Paper") and if (Condition = "Win")
					Return "Scissors"
				Else if (Opponent = "Scissors") and if (Condition = "Win")
					Return "Rock"
				Else if (Opponent = "Rock") and if (Condition = "Lose")
					Return "Scissors"
				Else if (Opponent = "Paper") and if (Condition = "Lose")
					Return "Rock"
				Else if (Opponent = "Scissors") and if (Condition = "Lose")
					Return "Paper"
			}
			
			CheckWinner(Opponent, Player){
				if (Opponent = Player)
					Return 3
				if (Opponent = "Rock") and if (Player = "Paper")
					Return 6
				Else if (Opponent = "Paper") and if (Player = "Scissors")
					Return 6
				Else if (Opponent = "Scissors") and if (Player = "Rock")
					Return 6
				Else
					Return 0
			}
			
