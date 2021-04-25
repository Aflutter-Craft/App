import 'package:aflutter_craft/screens/common/common.dart';
import 'package:aflutter_craft/utils/utils.dart';
import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

class DesktopHome extends ConsumerWidget {
  DesktopHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var content = watch(contentProvider);
    var style = watch(styleProvider);
    var result = watch(resultProvider);
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
                    GestureDetector(
                      onTap: () async =>
                          showImage(context: context, image: content),
                      child: ImageContainer(
                        image: content,
                      ),
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
                        if (file != null) {
                        context
                            .read(contentProvider.notifier)
                              .setImage(AssetImage(file.path));
                        }
                      },
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () async =>
                          showImage(context: context, image: style),
                      child: ImageContainer(
                        image: style,
                      ),
                    ),
                    SizedBox(height: 20),
                    StyledButton(
                      btnLabel: "Select Style",
                      icon: Icons.brush_outlined,
                      onPressed: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => StyleStore(
                            rowSize: 4,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () async =>
                          showImage(context: context, image: result),
                      child: ImageContainer(
                        image: result,
                      ),
                    ),
                    SizedBox(height: 20),
                    StyledButton(
                      btnLabel: "Save Image",
                      icon: Icons.download_outlined,
                      // only enable the save functionality when
                      // style transfer has already been performed
                      // if it has already been performed
                      // the result type will be CachedNetworkImageProvider
                      onPressed: result is AssetImage
                          ? null
                          : () async {
                              // retrive image from temp directory
                              // using the caching functionality of CachedNetworkImage
                              final cache = DefaultCacheManager();
                              final file =
                                  await cache.getSingleFile(result.url);

                              // get system documents path
                              final path =
                                  (await getApplicationDocumentsDirectory())
                                      .path;

                              // copy the file from cache to user directory
                              await file.copy(path + file.basename);
                            },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 80),
            StyledButton(
              btnLabel: "Apply Style",
              icon: Icons.check_circle,
              // only enable the button when the current
              // style and content are not the default ones
              onPressed: checkDefault(style, content) ? null : () => {},
            )
          ],
        ),
      ),
    );
  }
}
