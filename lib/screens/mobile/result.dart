import 'package:aflutter_craft/utils/utils.dart';
import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:social_share/social_share.dart';
import 'package:universal_io/io.dart';

class ResultsView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final content = watch(contentProvider);
    final style = watch(styleProvider);
    final result = watch(resultProvider);

    return Scaffold(
      appBar: mobileAppBar(context: context, label: "Stylized Image"),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              SizedBox(height: 20),
              GestureDetector(
                onLongPress: () async => showImage(
                  context: context,
                  image: result,
                ),
                child: GenericContainer(image: result),
              ),
              SizedBox(height: 20),
              StyledSlider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StyledButton(
                    btnLabel: "Save",
                    icon: Icons.save_alt,
                    // only enable if style transfer has compeleted
                    onPressed: result is MemoryImage
                        ? () async {
                            // save the image to user gallery
                            await ImageGallerySaver.saveImage(
                              result.bytes,
                              name:
                                  "style_transfer_result_${DateTime.now().millisecondsSinceEpoch}.png",
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
                    btnLabel: "Apply Style",
                    icon: Icons.check_circle,
                    // no need to check what the images are because if the user
                    // made it to this screen then they are already valid
                    onPressed: () async => await performTransfer(watch),
                  ),
                  StyledButton(
                    btnLabel: "Share",
                    icon: Icons.share,
                    // only enable if style transfer has compeleted
                    onPressed: result is MemoryImage
                        ? () async {
                            // save image to device cache before sharing
                            final path = await getTemporaryDirectory();
                            final file = await File(
                              path.path + "result.png",
                            ).create();
                            await file.writeAsBytes(result.bytes);

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
      ),
    );
  }
}
