import 'package:aflutter_craft/models/models.dart';
import 'package:aflutter_craft/utils/utils.dart';
import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  itemCount: faqs.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          faqs[index].question,
                          style: TextStyle(
                            color: AppColors.accentColor,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10),
                        Text(
                          faqs[index].answer,
                          style: TextStyle(
                            color: Colors.black,
                            height: 1.8,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        // show images if there are any
                        if (faqs[index].images != null)
                          ...faqs[index].images!.map(
                                (image) => Column(
                                  children: [
                                    Image(
                                      image: AssetImage("assets/images/$image"),
                                      alignment: Alignment.center,
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
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
