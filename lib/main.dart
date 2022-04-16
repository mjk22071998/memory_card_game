import 'package:flutter/material.dart';
import 'package:memory_card_game/custom_widgets/scorecard.dart';
import 'package:memory_card_game/utils/logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Card Game',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Memory Card Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GameBoard _game = GameBoard();

  @override
  void initState() {
    super.initState();
    _game.initGame();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Memory Game"),
        backgroundColor: const Color(0xFFE55870),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFE55870),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [scorecard("Tries", "0"), scorecard("Score", "0")],
          ),
          Expanded(
            child: SizedBox(
              width: width,
              child: GridView.builder(
                  itemCount: _game.cardCount,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemBuilder: (context, index) {
                    return Container();
                  }),
            ),
          )
        ],
      ),
    );
  }
}
