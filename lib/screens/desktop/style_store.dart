import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:aflutter_craft/models/models.dart';
import 'package:aflutter_craft/screens/desktop/desktop.dart';
import 'package:aflutter_craft/utils/utils.dart';
import 'package:aflutter_craft/widgets/widgets.dart';

class StyleStore extends ConsumerWidget {
  StyleStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // watch all 14 providers at the same time (this is big brain code)
    // no need to use hookwidget for auto dispose becuase all
    // these providers are auto disposable
    var provs =
        styleImagesProviders.map((provider) => watch(provider)).toList();

    return Scaffold(
      appBar: desktopAppBar(context: context, label: "Style Store"),
      floatingActionButton: StyledButton(
        btnLabel: "Upload Style",
        icon: Icons.add,
        onPressed: () async {
          final typeGroup = XTypeGroup(
            label: 'images',
            extensions: ['jpg', 'png'],
          );
          final file = await openFile(
            acceptedTypeGroups: [typeGroup],
          );
          // update the style image provider(will update the ui image)
          if (file != null) {
            context
                .read(styleProvider.notifier)
                .setImage(AssetImage(file.path));

            // go back to main screen
            Navigator.pop(context);
          }
        },
      ),
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
                      builder: (context) => StyleView(
                        provider: styleImagesProviders[index],
                        category: Categories.values[index]
                            .toShortString()
                            .replaceAll("-", " ")
                            .toTitleCase(),
                      ),
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
