import 'package:aflutter_craft/screens/desktop/desktop.dart';
import 'package:aflutter_craft/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget? desktopAppBar({context, label = "Aflutter Craft"}) {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildLink(
                label: "Community",
                routeFun: makeRoute(
                  label: "Community",
                  context: context,
                  route: DesktopHome(),
                )),
            SizedBox(width: 30),
            buildLink(
              label: "Style Store",
              routeFun: makeRoute(
                label: "Style Store",
                context: context,
                route: StyleStore(),
              ),
              context: context,
            ),
            SizedBox(width: 30),
            buildLink(
              label: "About",
              routeFun: makeRoute(
                label: "About",
                context: context,
                route: About(),
              ),
              context: context,
            ),
          ],
        ),
      )
    ],
    title: buildLink(
      label: label,
      routeFun: label == "Aflutter Craft"
          ? makeRoute(
              label: label,
              context: context,
              route: DesktopHome(),
            )
          : () => {},
      context: context,
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
