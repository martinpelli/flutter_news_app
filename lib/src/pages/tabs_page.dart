import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _Pages(), bottomNavigationBar: _NavigationBar());
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "For you"),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: "Headers")
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        ),
      ],
    );
  }
}
