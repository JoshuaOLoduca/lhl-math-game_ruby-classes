> Create a 2-_Player_ math game where players take turns to answer simple math addition problems. A new math question is generated for each turn by picking two numbers between 1 and 20. The player whose turn it is is prompted the question and must answer correctly or lose a life.

CLASS LIST

- Player
  - Lives, players name

- GameLobby
  - Ask if added another player
    - Happy; Take in Player name and add to array
    - Less-Happy; Pass array to gamemanager and start game

- GameManager
  - Current Turn
  - Player List
  - Turn
    - Show Player[0] turn
    - Run Question Class
      - Wrong; remove life and check lose condition
      - Right; Rotate player list and run question
  - Lose Condition (Player out of lifes), Drop from player List
  - Win Condition (Player list length is 1)
    - Congratulate player and exit program
  -

- Question
  - Show Question
  - Ask for answer
  - Validate answer

FUNCTION
- Questions
