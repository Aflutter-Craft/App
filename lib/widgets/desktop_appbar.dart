import 'package:aflutter_craft/screens/screens.dart';
import 'package:aflutter_craft/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget? desktopAppBar({context}) {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildLink(label: "Community", route: DesktopHome()),
            SizedBox(width: 20),
            buildLink(
              label: "Style Store",
              route: StyleStore(),
              context: context,
            ),
            SizedBox(width: 20),
            buildLink(
              label: "About",
              route: About(),
              context: context,
            ),
          ],
        ),
      )
    ],
    title: buildLink(
      label: "Aflutter Craft",
      route: DesktopHome(),
      context: context,
    ),
    elevation: 0,
    backgroundColor: AppColors.accentColor,
    leading: Container(),
    leadingWidth: 0,
  );
}

Widget buildLink({label, route, context}) {
  return InkWell(
    onTap: () => Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) => route,
      ),
    ),
    enableFeedback: false,
    hoverColor: Colors.transparent,
    child: Text(
      label,
      style: TextStyle(color: Colors.white),
    ),
  );
}
