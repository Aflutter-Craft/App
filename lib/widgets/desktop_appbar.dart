import 'package:aflutter_craft/screens/common/common.dart';
import 'package:aflutter_craft/screens/desktop/desktop.dart';
import 'package:aflutter_craft/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget? desktopAppBar({context, label = "Aflutter Craft"}) {
  List actions = ["Community", "Style Store", "About"];
  List routes = [DesktopCommunity(), StyleStore(rowSize: 4), About()];
  return AppBar(
    actions: [
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...actions.map(
            (action) {
              // this is not very efficient when there are many elements in actions
              var index = actions.indexOf(action);
              return Row(
                children: [
                  buildLink(
                    label: action,
                    context: context,
                    routeFun: makeRoute(
                      label: action,
                      context: context,
                      route: routes[index],
                    ),
                  ),
                  SizedBox(width: 30),
                ],
              );
            },
          ),
        ],
      )
    ],
    title: buildLink(
      label: label,
      context: context,
      routeFun: label == "Aflutter Craft"
          ? makeRoute(
              label: label,
              context: context,
              route: DesktopHome(),
            )
          : () => {},
    ),
    elevation: 0,
    backgroundColor: AppColors.accentColor,
    automaticallyImplyLeading: true,
    leadingWidth: 56,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  );
}

makeRoute({context, route, label}) {
  return () => Navigator.push(
        context,
        CupertinoPageRoute(
          fullscreenDialog: true,
          title: label,
          builder: (context) => route,
        ),
      );
}

Widget buildLink({label, routeFun, context}) {
  return InkWell(
    onTap: routeFun,
    enableFeedback: false,
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    child: Text(
      label,
      style: TextStyle(color: Colors.white),
    ),
  );
}
