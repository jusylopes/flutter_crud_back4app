import 'package:flutter/material.dart';

import 'package:flutter_crud_back4app/screens/history_cep_screen.dart';
import 'package:flutter_crud_back4app/screens/search_cep_screen.dart';

class HomeScreen extends StatefulWidget {
  final int initialIndex;
  const HomeScreen({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.edit_note),
      label: 'Cadastrados',
    ),
  ];

  final List<Widget> _screens = [
    const SearchCepScreen(),
    const HistoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItems,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        iconSize: 30,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
