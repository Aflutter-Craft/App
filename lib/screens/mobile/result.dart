import 'dart:typed_data';

import 'package:aflutter_craft/utils/utils.dart';
import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:social_share/social_share.dart';

class ResultsView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final content = watch(contentProvider);
    final style = watch(styleProvider);
    final result = watch(resultProvider);
    final cache = watch(cacheProvider);
    return Scaffold(
      appBar: mobileAppBar(context: context, label: "Stylized Image"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onLongPress: () async => showImage(
                    context: context,
                    image: content,
                  ),
                  child: GenericContainer(
                    image: content,
                    ratio: 0.2,
                  ),
                ),
                GestureDetector(
                  onLongPress: () async => showImage(
                    context: context,
                    image: style,
                  ),
                  child: GenericContainer(
                    image: style,
                    ratio: 0.2,
                  ),
                ),
              ],
            ),
            GestureDetector(
                onLongPress: () async => showImage(
                      context: context,
                      image: result,
                    ),
                child: GenericContainer(image: result)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StyledButton(
                  btnLabel: "Save",
                  icon: Icons.save_alt,
                  // only enable if style transfer has compeleted
                  onPressed: result is FileImage
                      ? () async {
                          // retrive image from temp directory
                          // using the caching functionality of CachedNetworkImage
                          final file = await cache.getSingleFile(API_ENDPOINT);

                          // save the image to user gallery
                          await ImageGallerySaver.saveImage(
                            Uint8List.fromList(
                              await file.readAsBytes(),
                            ),
                          );

                          // show a snackbar
                          showToast(
                            context: context,
                            text: "Image saved to Gallery!",
                          );
                        }
                      : null,
                ),
                StyledButton(
                  btnLabel: "Share",
                  icon: Icons.share,
                  // only enable if style transfer has compeleted
                  onPressed: result is FileImage
                      ? () async {
                          // get image from cache
                          final file = await cache.getSingleFile(API_ENDPOINT);

                          // share it using default system share options
                          SocialShare.shareOptions(
                            "checkout this Image i made with an App called Aflutter Craft!",
                            imagePath: file.path,
                          );
                        }
                      : null,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
