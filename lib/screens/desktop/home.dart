import 'package:aflutter_craft/utils/utils.dart';
import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DesktopHome extends HookWidget {
  DesktopHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = useProvider(contentProvider).state;
    var style = useProvider(styleProvider).state;
    var result = useProvider(resultProvider.notifier).state;
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
                  Column(
                    children: [
                      ImageContainer(
                        image: content.state,
                        isResult: false,
                      ),
                      SizedBox(height: 15),
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
                          content.setImage(AssetImage(file!.path));
                        },
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageContainer(
                        image: style.state,
                        isResult: false,
                      ),
                      SizedBox(height: 15),
                      StyledButton(
                        btnLabel: "Select Style",
                        icon: Icons.brush_outlined,
                        onPressed: () async {
                          final typeGroup = XTypeGroup(
                            label: 'images',
                            extensions: ['jpg', 'png'],
                          );
                          final file = await openFile(
                            acceptedTypeGroups: [typeGroup],
                          );
                          style.setImage(AssetImage(file!.path));
                        },
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageContainer(
                        image: result.state,
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
