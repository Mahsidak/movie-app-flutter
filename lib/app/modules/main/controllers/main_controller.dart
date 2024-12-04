import '/app/core/base/base_controller.dart';
import '/app/modules/main/model/menu_code.dart';

class MainController extends BaseController {
  MenuCode _selectedMenuCode = MenuCode.HOME;

  MenuCode get selectedMenuCode => _selectedMenuCode;

  bool lifeCardUpdate = false;

  onMenuSelected(MenuCode menuCode) {
  print('');
  }
}
