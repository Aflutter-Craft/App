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
            buildLink(label: "Community", link: () => {}),
            SizedBox(width: 20),
            buildLink(
              label: "Style Store",
              link: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => StyleStore(),
                ),
              ),
            ),
            SizedBox(width: 20),
            buildLink(
              label: "About",
              link: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => About(),
                ),
              ),
            ),
          ],
        ),
      )
    ],
    title: Text(
      "Aflutter Craft",
      style: TextStyle(
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    ),
    elevation: 0,
    backgroundColor: AppColors.accentColor,
  );
}

Widget buildLink({label, link}) {
  return InkWell(
    onTap: link,
    enableFeedback: false,
    child: Text(
      label,
      style: TextStyle(color: Colors.white),
    ),
  );
}
