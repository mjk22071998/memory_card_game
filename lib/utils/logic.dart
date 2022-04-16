class GameBoard {
  final String hiddencard = "assets/hidden.png";
  final cardCount = 25;
  late List<String>? gameImg;
  void initGame() {
    gameImg = List.generate(cardCount, (index) => hiddencard);
  }
}
