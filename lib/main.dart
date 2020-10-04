import 'package:flutter/material.dart';
// import 'package:hack/bar.dart';
import 'package:hack/login.dart';
import 'package:backdrop/backdrop.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      headerHeight: 400,
      appBar: BackdropAppBar(),
      frontLayer: Column(
        children: [
          SizedBox(),
          Center(
            child: Text(
              "Mental Health",
              style: TextStyle(fontSize: 40, color: Colors.blue),
            ),
          ),
          Center(
            child: Text(
              "Hello Heroes\nStart your hacking now",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
      backLayer: Center(child: Draw()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => Quiz()));
        },
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 80,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyHomePage()));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.school,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyHomePage()));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.business,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyHomePage()));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.contact_phone,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Contactus()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  String title;
  NewPage(this.title);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BackdropScaffold(
        appBar: BackdropAppBar(),
        frontLayer: Center(child: Text(title)),
        backLayer: Draw(),
      ),
    );
  }
}

class Draw extends StatelessWidget {
  const Draw({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        ListTile(
          // leading: Icon(Icons.message),
          title: Text('Home'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => MyHomePage()));
          },
        ),
        ListTile(
          // leading: Icon(Icons.settings),
          title: Text('Prevention'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => NewPage("Prevention")));
          },
        ),
        ListTile(
          onTap: () {
            // Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => HomePage()));
          },
          // leading: Icon(Icons.settings),
          title: Text('Logout'),
        ),
      ],
    );
  }
}

class Quiz extends StatelessWidget {
  const Quiz({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
        body: HeroHacks(),
      ),
    );
  }
}

class Quizquestions extends StatefulWidget {
  @override
  _QuizquestionsState createState() => _QuizquestionsState();
}

class _QuizquestionsState extends State<Quizquestions> {
  static const widgets = [
    Text("who are you?"),
    Text("how are you?"),
    Text("where are you?"),
    // Field(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widgets.length,
      child: Builder(
        builder: (BuildContext context) => Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              TabPageSelector(),
              Expanded(
                child: IconTheme(
                  data: IconThemeData(size: 128, color: Colors.blue),
                  child: TabBarView(
                    children: widgets,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  final TabController controller =
                      DefaultTabController.of(context);
                  if ((controller.index + 1) != widgets.length) {
                    controller.animateTo(controller.index + 1);
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyHomePage()));
                  }
                },
                child: Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Contactus extends StatefulWidget {
  @override
  _ContactusState createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class HeroHacks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HeroHacksState();
  }
}

class _HeroHacksState extends State<HeroHacks> {
  var _questionIndex = 0;

  void question() {
    setState(() {
      if (_questionIndex < 4) {
        _questionIndex = _questionIndex + 1;
      }

      if (_questionIndex == 4) {
        _questionIndex = 0;
      }
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'On a scale from 1 to 10, \nHow are you feeling today?',
        'answers': ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
      },
      {
        'questionText': 'What is your current mood?',
        'answers': [
          'Happy',
          'Sad',
          'Motivated',
          'Angry',
          'Disappointed',
          'Tired',
          'Hungry'
        ]
      },
      {
        'questionText': 'Did you eat today?',
        'answers': ['Yes', 'No', 'I don\'t have an appetite', 'Other']
      },
      {
        'questionText': 'Did you talk to anyone today?',
        'answers': ['Yes', 'No', 'Other']
      },
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(question, answer);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
