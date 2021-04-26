import 'package:aflutter_craft/screens/common/common.dart';
import 'package:aflutter_craft/utils/utils.dart';
import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MobileHome extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var content = watch(contentProvider);
    var style = watch(styleProvider);
    return Scaffold(
      appBar: mobileAppBar(context: context, label: APP_NAME),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  final typeGroup = XTypeGroup(
                    label: 'images',
                    extensions: ['jpg', 'png'],
                  );
                  final file = await openFile(
                    acceptedTypeGroups: [typeGroup],
                  );
                  // update the content image provider(will update the ui image)
                  if (file != null) {
                    context
                        .read(contentProvider.notifier)
                        .setImage(AssetImage(file.path));
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
                child: ImageContainer(
                  image: style,
                  ratio: 0.4,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundCol,
      floatingActionButton: StyledButton(
        btnLabel: "Apply Style",
        icon: Icons.check_circle,
        // only enable the button when the current
        // style and content are not the default ones
        onPressed: checkDefault(content, style) ? null : () => {},
      ),
    );
  }
}
