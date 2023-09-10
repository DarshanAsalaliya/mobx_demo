import 'package:flutter/material.dart';
import 'package:mobx_demo/screens/posts/post_list_screen.dart';

import 'album/album_screen.dart';
import 'todolist_screen.dart';

class MainScreen extends StatefulWidget {
  final String id;
  int? selectedScreen;
  MainScreen({Key? key, required this.id, this.selectedScreen})
      : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  late int _selectedTab;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    print(widget.selectedScreen);
    _selectedTab = widget.selectedScreen ?? 0;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state = $state');
    print(widget.selectedScreen);
    if (state == AppLifecycleState.resumed &&
        widget.selectedScreen != _selectedTab) {
      setState(() {
        _selectedTab = widget.selectedScreen ?? _selectedTab;
      });
    }
  }

  static const List<BottomNavigationBarItem> tabs = [
    BottomNavigationBarItem(icon: Icon(Icons.post_add), label: 'Post'),
    BottomNavigationBarItem(icon: Icon(Icons.album), label: 'Album'),
    BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Todo List'),
  ];

  Widget getScreenFromBottomNav(index) {
    switch (index) {
      case 0:
        return PostListScreen(
          id: widget.id,
        );
      case 1:
        return AlbumScreen(id: widget.id);
      case 2:
        return TodoListScreen(id: widget.id);
      default:
        return PostListScreen(id: widget.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getScreenFromBottomNav(_selectedTab),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: tabs,
        onTap: (index) {
          if (index == _selectedTab) return;
          setState(() {
            _selectedTab = index;
          });
        },
      ),
    );
  }
}
