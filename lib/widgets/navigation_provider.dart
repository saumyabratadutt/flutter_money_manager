import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_manager/fabs/fabs.dart';
import 'package:flutter_money_manager/widgets/category_list.dart';
import 'package:flutter_money_manager/widgets/home.dart';
import 'package:flutter_money_manager/widgets/report.dart';
import 'package:flutter_money_manager/widgets/settings.dart';

class NavigationProvider with ChangeNotifier {
  NavigationItem currentNav = NavigationItem.HOME;

  Widget get getNav {
    switch (currentNav) {
      case NavigationItem.REPORT:
        return Report();
      case NavigationItem.CATEGORIES:
        return Categories(
          onTap: (category) {
            // TODO : go to category detail page
            print(category.toString());
          },
        );
      case NavigationItem.SETTINGS:
        return Settings();
      default:
        return Home();
    }
  }

  Widget getAppBarTitle() {
    switch (currentNav) {
      case NavigationItem.REPORT:
        return Text('Report');
      case NavigationItem.CATEGORIES:
        return Text('Categories');
      case NavigationItem.SETTINGS:
        return Text('Settings');
      default:
      // Do not show title in Home.
        return Text('');
    }
  }

  Widget getFab(BuildContext context) {
    switch (currentNav) {
      case NavigationItem.CATEGORIES:
        return Fab().categoryFab(context);
      default:
        return Fab().transactionFab(context);
    }
  }

  void changeNavigation(NavigationItem newNav) {
    currentNav = newNav;
    notifyListeners();
  }
}

enum NavigationItem { HOME, REPORT, CATEGORIES, SETTINGS }
