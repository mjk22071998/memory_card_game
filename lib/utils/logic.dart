import 'dart:math';

class GameBoard {
  final String hiddencard = "assets/hidden.png";
  final cardCount = 25;
  late List<String>? gameImg;
  late List<String> cards = [];
  List<Map<int, String>> matchChecked = [];
  final List<String> cardImgs = [
    "assets/burger.jpg",
    "assets/car.jpg",
    "assets/chicken.jpg",
    "assets/heart.jpg",
    "assets/money.jpg",
    "assets/star.jpg",
    "assets/steak.jpg"
  ];
  void initGame() {
    gameImg = List.generate(cardCount, (index) => hiddencard);
    for (int i = 0; i < 25; i++) {
      cards.add(cardImgs[Random().nextInt(6)]);
    }
  }
}
