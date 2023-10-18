class XOGame {
  List<String> board = List.generate(9, (index) => "", growable: false);
  int playerXScore = 0;
  int playerOScore = 0;
  int turn = 0;
  String currentPlayer = "X";
  void setCurrentPlayer(String playerSymbol) {
    currentPlayer = playerSymbol;
  }

  String getValueOf(int index) {
    return board[index];
  }

  void setValueOf(int index, String value) {
    if (board[index].isEmpty) {
      board[index] = value;
      currentPlayer = currentPlayer == "X" ? "O" : "X";
    }
  }

  rePlay() {
    board = List.generate(9, (index) => "", growable: false);
    currentPlayer = "X";
  }

  GameState getGameState() {
    String state;
    if ((board[0] == board[1] && board[1] == board[2]) && board[0] != "") {
      state = board[0];
    } else if ((board[3] == board[4] && board[4] == board[5]) &&
        board[3] != "") {
      state = board[3];
    } else if ((board[6] == board[7] && board[7] == board[8]) &&
        board[6] != "") {
      state = board[6];
    } else if ((board[0] == board[4] && board[4] == board[8]) &&
        board[0] != "") {
      state = board[0];
    } else if ((board[2] == board[4] && board[4] == board[6]) &&
        board[2] != "") {
      state = board[2];
    } else if ((board[0] == board[3] && board[3] == board[6]) &&
        board[0] != "") {
      state = board[0];
    } else if ((board[1] == board[4] && board[4] == board[7]) &&
        board[1] != "") {
      state = board[1];
    } else if ((board[2] == board[5] && board[5] == board[8]) &&
        board[2] != "") {
      state = board[2];
    } else if (!board.contains("")) {
      state = "Tie";
    } else {
      state = "Play";
    }
    if (state == "X") {
      return GameState.xWin;
    } else if (state == "O") {
      return GameState.oWin;
    } else if (state == "Tie") {
      return GameState.tie;
    } else {
      return GameState.play;
    }
  }
}

enum GameState { xWin, oWin, tie, play }
