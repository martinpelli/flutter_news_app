import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/pages/tab1_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => _NavigationModel(), child: Scaffold(body: _Pages(), bottomNavigationBar: _NavigationBar()));
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _NavigationModel _navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: _navigationModel.currentPage,
      onTap: ((index) => _navigationModel.currentPage = index),
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
    final _NavigationModel _navigationModel = Provider.of<_NavigationModel>(context);
    return PageView(
      controller: _navigationModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Tab1Screen(),
        Container(
          color: Colors.green,
        ),
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentPage = 0;
  PageController _pageController = PageController();

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _pageController.animateToPage(value, duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    _currentPage = value;
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
