import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_getx_template/app/modules/main/model/menu_item.dart';

enum MenuCode { HOME, SEARCH, BOOKMARKS, SETTINGS }

extension MenuCodeExtensions on MenuCode {
  BottomNavItem toBottomNavItem(AppLocalizations appLocalization) {
    switch (this) {
      case MenuCode.HOME:
        return BottomNavItem(
          navTitle: '',
          iconSvgName: "home.png",
          menuCode: MenuCode.HOME,
        );
      case MenuCode.SEARCH:
        return BottomNavItem(
            navTitle: '',
            iconSvgName: "search.png",
            menuCode: MenuCode.SEARCH);
      case MenuCode.BOOKMARKS:
        return BottomNavItem(
            navTitle: '',
            iconSvgName: "bookmark.png",
            menuCode: MenuCode.BOOKMARKS);
      case MenuCode.SETTINGS:
        return BottomNavItem(
            navTitle: '',
            iconSvgName: "settings.png",
            menuCode: MenuCode.SETTINGS);
    }
  }
}
