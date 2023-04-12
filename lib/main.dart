import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _navigationkey = GlobalKey<CurvedNavigationBarState>();
  int _index = 2;

  final items = <Widget>[
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.person),
    Icon(Icons.settings),
    Icon(Icons.menu),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Curved NavigationBar"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$_index",
                style: TextStyle(fontSize: 34, color: Colors.white),
              ),
              ElevatedButton(
                  onPressed: () {
                    final navigationstat = _navigationkey.currentState!;
                    navigationstat.setPage(0);
                  },
                  child: Text("Go to 0"))
            ],
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              iconTheme: IconThemeData(
            color: Colors.white,
          )),
          child: CurvedNavigationBar(
            key: _navigationkey,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 300),
            color: Colors.deepPurple,
            buttonBackgroundColor: Colors.deepPurple,
            index: _index,
            backgroundColor: Colors.transparent,
            items: items,
            onTap: (value) {
              setState(() {
                this._index = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
