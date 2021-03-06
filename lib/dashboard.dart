import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const String _title = 'Drawer Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String nameString;
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    Text('Products List',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    Text('Contact us',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    Text('Special discounts',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    nameString = "Welcome Neosoft";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: new Text(
          'Home',
          style: new TextStyle(color: Colors.green),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _widgetOptions.elementAt(_selectedIndex),
            Text(
              nameString,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            Container(
              color: Colors.white,
              child: FlutterLogo(size: MediaQuery.of(context).size.height * .4),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Neo"),
              accountEmail: Text('abc@wwindia.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.lightGreen,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('HOME'),
              //_onItemTapped("MyHomePage"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('10+1 PLAN'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('MY GOLDMINE'),
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('FAQ'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('LOG OUT'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.orange),
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Products List',
                backgroundColor: Colors.orange),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              label: 'Contact us',
              backgroundColor: Colors.orange,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: 'Special discounts',
              backgroundColor: Colors.orange,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepPurpleAccent,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
