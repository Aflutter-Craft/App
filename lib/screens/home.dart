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
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  ImageContainer(
                    imgPath: "./assets/images/default_result.jpg",
                    showBtn: false,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
