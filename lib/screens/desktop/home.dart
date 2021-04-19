import 'package:aflutter_craft/screens/screens.dart';
import 'package:aflutter_craft/utils/utils.dart';
import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DesktopHome extends HookWidget {
  DesktopHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = useProvider(contentProvider);
    var style = useProvider(styleProvider);
    var result = useProvider(resultProvider);
    return Scaffold(
      appBar: desktopAppBar(context: context),
      body: Container(
        color: AppColors.backgroundCol,
        padding: EdgeInsets.only(top: 50, right: 10, left: 10, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ImageContainer(
                      image: content,
                    ),
                    SizedBox(height: 20),
                    StyledButton(
                      btnLabel: "Select Content",
                      icon: Icons.photo_size_select_actual_outlined,
                      onPressed: () async {
                        final typeGroup = XTypeGroup(
                          label: 'images',
                          extensions: ['jpg', 'png'],
                        );
                        final file = await openFile(
                          acceptedTypeGroups: [typeGroup],
                        );
                        // update the content image provider(will update the ui image)
                        context
                            .read(contentProvider.notifier)
                            .setImage(AssetImage(file!.path));
                      },
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ImageContainer(
                      image: style,
                    ),
                    SizedBox(height: 20),
                    StyledButton(
                      btnLabel: "Select Style",
                      icon: Icons.brush_outlined,
                      onPressed: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => StyleStore(),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ImageContainer(
                      image: result,
                    ),
                    SizedBox(height: 20),
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
    );
  }
}
