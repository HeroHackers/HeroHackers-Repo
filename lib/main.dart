import 'package:flutter/material.dart';
import 'package:hack/contactus.dart';
// import 'package:hack/bar.dart';
import 'package:hack/login.dart';
import 'package:backdrop/backdrop.dart';
import 'package:hack/stack.dart';
import 'globals.dart' as globals;

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
          SizedBox(
            height: 100,
          ),
          Center(
            child: Text(
              "Mental Health",
              style: TextStyle(fontSize: 40, color: Colors.blue),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              "Hello Heroes\nStart your hacking now",
              style: TextStyle(fontSize: 25),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              "Your Mental Score:\n               ${globals.score}",
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
              MaterialPageRoute(builder: (BuildContext context) => YourApp()));
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
