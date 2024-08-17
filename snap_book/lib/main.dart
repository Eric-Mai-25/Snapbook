import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snapbook',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue[900]!,
          primary: Colors.blue[900]!,
          secondary: Colors.cyanAccent,
          surface: Colors.grey[200]!,
        ),
        useMaterial3: true, // Optional, for a modern UI look
        scaffoldBackgroundColor: Colors.grey[200],
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.cyanAccent,
          unselectedItemColor: Colors.blue[300],
          backgroundColor: Colors.blue[900],
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[900],
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(title: 'SnapBook'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Feed', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    Text('Search Feed', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    Text('Add Content', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    Text('Follow Feed', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    Text('My Profile', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Follow',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}