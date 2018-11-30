import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'navigation/navigation.dart';

void main() {
  runApp(FlashBetter());
}

class FlashBetter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('zh', 'CN'), // Chinese?
        const Locale('in', 'IN'), // Indonesia?
      ],
      title: "闪秀秀",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;

  final _widgetOptions = [
    Text('Index 0: Home'),
    Text('Index 1: Auction'),
    Text('Index 2: Sale'),
    Text('Index 3: Price'),
    Text('Index 4: Account'),
  ];

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(icon: Icon(Icons.home), title: Text('Buy')),
      new NavigationIconView(icon: Icon(Icons.gavel), title: Text('Auction')),
      new NavigationIconView(
          icon: Icon(Icons.control_point), title: Text('Sale')),
      new NavigationIconView(
          icon: Icon(Icons.local_pizza), title: Text('Deal')),
      new NavigationIconView(icon: Icon(Icons.person), title: Text('Account')),
    ];

    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }

    _pageList = <StatefulWidget>[
      //new Buy(),
    ];
  }

  void _rebuild() {
    setState(() {

    });
  }

  @override
  void dispose() {
    super.dispose();
    for (NavigationIconView view in _navigationViews) {
      view.controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    var countryCode = locale.countryCode;
    var languageCode = locale.languageCode;
    print(countryCode + " " + languageCode);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flash Better',
          style: Theme.of(context).textTheme.headline,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.gavel), title: Text('Auction')),
          BottomNavigationBarItem(
              icon: Icon(Icons.control_point), title: Text('Sale')),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_pizza), title: Text('Deal')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Account')),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        fixedColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
