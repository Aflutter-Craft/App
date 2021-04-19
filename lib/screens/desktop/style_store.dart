import 'package:aflutter_craft/models/models.dart';
import 'package:aflutter_craft/screens/desktop/desktop.dart';
import 'package:aflutter_craft/utils/utils.dart';
import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StyleStore extends ConsumerWidget {
  StyleStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // watch all 14 providers at the same time (this is big brain code)
    var provs =
        styleImagesProviders.map((provider) => watch(provider)).toList();

    print(styleImagesProviders.length);
    return Scaffold(
      appBar: desktopAppBar(context: context),
      body: GridView.builder(
        padding: EdgeInsets.all(30),
        primary: true,
        scrollDirection: Axis.vertical,
        itemCount: provs.length,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) => provs[index].when(
          data: (data) => Column(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>
                          StyleView(provider: styleImagesProviders[index]),
                    ),
                  ),
                  child: NetworkImageContainer(
                    imgName: data[randomNumber],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                Categories.values[index]
                    .toShortString()
                    .replaceAll("-", " ")
                    .toTitleCase(),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          loading: () => CircularProgressIndicator(),
          error: (err, stack) => Text(
            err.toString(),
          ),
        ),
      ),
    );
  }
}
