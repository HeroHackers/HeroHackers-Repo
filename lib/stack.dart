import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:hack/main.dart';
import 'globals.dart' as globals;

class YourApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExampleHomePage(),
    );
  }
}

class ExampleHomePage extends StatefulWidget {
  @override
  _ExampleHomePageState createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage>
    with TickerProviderStateMixin {
  List<Widget> widgets = [
    Card1("Is your mood good now?"),
    Card1("Did you ate food today ?"),
    Card1("Did you talk to anyone today?"),
    Card1("are you feeling happy now?"),
    Card1("how are you,fine?"),
  ];

  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: TinderSwapCard(
                swipeUp: true,
                swipeDown: true,
                orientation: AmassOrientation.BOTTOM,
                totalNum: widgets.length,
                stackNum: 3,
                swipeEdge: 4.0,
                maxWidth: MediaQuery.of(context).size.width * 0.9,
                maxHeight: MediaQuery.of(context).size.height * 0.9,
                minWidth: MediaQuery.of(context).size.width * 0.8,
                minHeight: MediaQuery.of(context).size.height * 0.8,
                cardBuilder: (context, index) => Card(
                  child: widgets[index],
                ),
                cardController: controller = CardController(),
                swipeUpdateCallback:
                    (DragUpdateDetails details, Alignment align) {
                  /// Get swiping card's alignment
                  ///

                  if (align.x < -10) {
                    //Card is LEFT swiping
                    globals.score--;

                    print("left");
                  } else if (align.x > 10) {
                    //Card is RIGHT swiping
                    globals.score++;
                  }
                },
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {
                  /// Get orientation & index of swiped card!
                  if (index == widgets.length - 1) {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyHomePage()));
                  }
                },
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Swipe Left\n      NO",
                    style: TextStyle(
                      color: Colors.yellow[700],
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "Swipe Right\n     Yes",
                    style: TextStyle(
                      color: Colors.yellow[700],
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Card1 extends StatelessWidget {
  String quest;
  Card1(this.quest);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FittedBox(
      child: Text(
        quest,
        style: TextStyle(
          fontSize: 40,
          color: Colors.blue,
        ),
      ),
    ));
  }
}
