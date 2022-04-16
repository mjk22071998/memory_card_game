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
  int tries = 0;
  int score = 0;
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
            children: [
              scorecard("Tries", "$tries"),
              scorecard("Score", "$score")
            ],
          ),
          Expanded(
            child: SizedBox(
              width: width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    itemCount: _game.gameImg!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _game.gameImg![index] = _game.cards[index];
                            _game.matchChecked.add({index: _game.cards[index]});
                            if (_game.matchChecked.length == 2) {
                              tries++;
                              if (_game.matchChecked[0].values.first ==
                                  _game.matchChecked[1].values.first) {
                                score += 100;
                                _game.matchChecked.clear();
                              } else {
                                Future.delayed(
                                  const Duration(milliseconds: 500),
                                  () {
                                    setState(() {
                                      _game.gameImg![_game.matchChecked[0].keys
                                          .first] = _game.hiddencard;
                                      _game.gameImg![_game.matchChecked[1].keys
                                          .first] = _game.hiddencard;
                                      _game.matchChecked.clear();
                                    });
                                  },
                                );
                              }
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child:
                              Image(image: AssetImage(_game.gameImg![index])),
                        ),
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
