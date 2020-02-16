import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: MainMenuList()),
    );
  }
}

class MainMenuList extends StatefulWidget {
  @override
  _MainMenuListState createState() => _MainMenuListState();
}

class _MainMenuListState extends State<MainMenuList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: IconButton(
                onPressed: null,
                icon: Icon(Icons.ac_unit),
                color: Colors.black,
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.ac_unit),
                    color: Colors.black,
                  ),
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.ac_unit),
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
