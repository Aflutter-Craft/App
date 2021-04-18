import 'package:aflutter_craft/utils/theme.dart';
import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          "Aflutter Craft",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.accentColor,
      ),
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
                    showBtn: true,
                    buttonText: "Select Content",
                    buttonFunc: () => {},
                  ),
                  ImageContainer(
                    imgPath: "assets/images/default_style.jpg",
                    showBtn: true,
                    buttonText: "Select Style",
                    buttonFunc: () => {},
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageContainer(
                        imgPath: "./assets/images/default_result.jpg",
                        showBtn: false,
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
