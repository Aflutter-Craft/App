import 'package:aflutter_craft/utils/theme.dart';

import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DesktopHome extends StatefulWidget {
  DesktopHome({Key key}) : super(key: key);

  @override
  _DesktopHomeState createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: desktopAppBar(),
      body: Container(
        color: AppColors.backgroundCol,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageContainer(
                    imgPath: "assets/images/default_content.jpg",
                    isResult: false,
                    buttonText: "Select Content",
                    buttonFunc: () => {},
                  ),
                  ImageContainer(
                    imgPath: "assets/images/default_style.jpg",
                    isResult: false,
                    buttonText: "Select Style",
                    buttonFunc: () => {},
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageContainer(
                        imgPath: "./assets/images/default_result.jpg",
                        isResult: true,
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          StyledButton(
                            btnLabel: "Save",
                            icon: Icons.download_outlined,
                            onPressed: () => {},
                          ),
                          SizedBox(width: 70),
                          StyledButton(
                            btnLabel: "Share",
                            icon: Icons.share_rounded,
                            onPressed: () => {},
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 80),
              StyledButton(
                btnLabel: "Apply Style",
                icon: Icons.check_circle,
                onPressed: () => {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
