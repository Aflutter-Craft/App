import 'dart:io';

import 'package:aflutter_craft/screens/common/common.dart';
import 'package:aflutter_craft/screens/screens.dart';
import 'package:aflutter_craft/utils/utils.dart';
import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MobileHome extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final content = watch(contentProvider);
    final style = watch(styleProvider);

    return Scaffold(
      appBar: mobileAppBar(context: context, label: APP_NAME),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 20,
              bottom: 60,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () async {
                    final file = await pickMobileImage(context);
                    // update the content image provider(will update the ui image)
                    if (file != null) {
                      context
                          .read(contentProvider.notifier)
                          .setState(FileImage(File(file.path)));
                    }
                  },
                  onLongPress: () async => showImage(
                    context: context,
                    image: content,
                  ),
                  child: ContentContainer(
                    content: content,
                    desc: mobileTip,
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => StyleStore(
                        rowSize: 2,
                      ),
                    ),
                  ),
                  onLongPress: () async => showImage(
                    context: context,
                    image: style,
                  ),
                  child: GenericContainer(
                    image: style,
                    ratio: 0.4,
                  ),
                ),
                SizedBox(height: 30),
                StyledSlider(),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundCol,
      floatingActionButton: StyledButton(
        btnLabel: "Apply Style",
        icon: Icons.check_circle,
        // only enable the button when the current
        // style and content are not the default ones
        onPressed: checkDefault(content, style)
            ? () => showToast(
                  context: context,
                  text: "Select content and style images first!",
                )
            : () async => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => ResultsView(),
                  ),
                ).then(
                  (value) async => await performTransfer(watch),
                ),
      ),
    );
  }
}
