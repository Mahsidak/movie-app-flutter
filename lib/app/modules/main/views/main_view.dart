import 'package:flutter/material.dart';
import '/app/modules/home/views/home_view.dart';
import '/app/modules/search/views/search_view.dart';
import '/app/modules/settings/views/settings_view.dart';
import '/app/modules/main/views/bottom_nav_bar.dart';
import '/app/modules/main/model/menu_code.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  MenuCode _selectedMenuCode = MenuCode.HOME;

  final HomeView homeView = HomeView();
  final SearchView searchView = SearchView();
  SettingsView? settingsView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        key: UniqueKey(),
        child: getPageOnSelectedMenu(_selectedMenuCode),
      ),
      bottomNavigationBar: BottomNavBar(
        onItemSelected: (MenuCode selectedMenu) {
          setState(() {
            _selectedMenuCode = selectedMenu;
          });
        },
      ),
    );
  }

  Widget getPageOnSelectedMenu(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.HOME:
        return homeView;
      case MenuCode.SEARCH:
        return searchView;
      case MenuCode.BOOKMARKS:
        return homeView;
      case MenuCode.SETTINGS:
        settingsView ??= SettingsView();
        return settingsView!;
      default:
        return homeView;
    }
  }
}