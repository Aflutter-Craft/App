import 'dart:typed_data';

import 'package:aflutter_craft/utils/utils.dart';
import 'package:aflutter_craft/widgets/image_container.dart';
import 'package:aflutter_craft/widgets/mobile_appbar.dart';
import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:social_share/social_share.dart';

class ResultsView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final content = watch(contentProvider);
    final style = watch(styleProvider);
    final result = watch(resultProvider);
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
                ImageContainer(
                  image: content,
                  ratio: 0.2,
                ),
                Text(
                  "+",
                  style: TextStyle(
                    color: AppColors.accentColor,
                    fontSize: 20,
                  ),
                ),
                ImageContainer(
                  image: style,
                  ratio: 0.2,
                ),
              ],
            ),
            ImageContainer(image: result),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StyledButton(
                  btnLabel: "Save",
                  icon: Icons.save_alt,
                  // only enable if style transfer has compeleted
                  onPressed: result is AssetImage
                      ? null
                      : () async {
                          // retrive image from temp directory
                          // using the caching functionality of CachedNetworkImage
                          final cache = DefaultCacheManager();
                          final file = await cache.getSingleFile(result.url);

                          // save the image to user gallery
                          await ImageGallerySaver.saveImage(
                            Uint8List.fromList(
                              await file.readAsBytes(),
                            ),
                          );
                        },
                ),
                StyledButton(
                  btnLabel: "Share",
                  icon: Icons.share,
                  // only enable if style transfer has compeleted
                  onPressed: result is AssetImage
                      ? null
                      : () async {
                          // get image from cache
                          final cache = DefaultCacheManager();
                          final file = await cache.getSingleFile(result.url);

                          // share it using default system share options
                          SocialShare.shareOptions(
                            "Share image to social media",
                            imagePath: file.path,
                          );
                        },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
