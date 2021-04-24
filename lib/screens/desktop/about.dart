import 'package:aflutter_craft/utils/utils.dart';
import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ques = QUES.split("!!");
    final ans = ANS.split("!!");
    return Scaffold(
      appBar: desktopAppBar(context: context, label: "About"),
      body: Scrollbar(
        isAlwaysShown: true,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 200,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage("assets/images/logo.png"),
                  height: 150,
                  width: 170,
                ),
                SizedBox(height: 10),
                Text(
                  "Aflutter Craft\n",
                  style: TextStyle(
                    color: AppColors.accentColor,
                    fontSize: 24,
                  ),
                ),
                Text(
                  APP_DISC,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: ques.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          ques[index],
                          style: TextStyle(
                            color: AppColors.accentColor,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10),
                        Text(
                          ans[index],
                          style: TextStyle(
                            color: Colors.black,
                            height: 1.8,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        // show network architecture after the first question
                        if (index == 0)
                          Column(
                            children: [
                              Image(
                                image: AssetImage("assets/images/network.png"),
                                alignment: Alignment.center,
                              ),
                              SizedBox(height: 30),
                              Image(
                                image:
                                    AssetImage("assets/images/attention.png"),
                                alignment: Alignment.center,
                              ),
                            ],
                          )
                        else if (index == 1)
                          Image(
                            image: AssetImage("assets/images/api.png"),
                          )
                      ],
                    );
                  },
                ),
                SizedBox(height: 30),
                Text.rich(
                  TextSpan(
                    text: "Copyright © ",
                    children: [
                      WidgetSpan(
                        child: InkWell(
                          onTap: () async {
                            await canLaunch(PER_SITE)
                                ? launch(PER_SITE)
                                : throw "could not luanch $PER_SITE";
                          },
                          child: Text(
                            "Blacksuan19",
                            style: TextStyle(
                              color: Colors.blue[200],
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
