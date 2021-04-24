import 'package:aflutter_craft/models/models.dart';
import 'package:aflutter_craft/screens/common/common.dart';
import 'package:aflutter_craft/utils/utils.dart';
import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StyleStore extends StatefulWidget {
  final rowSize;
  final bool isMobile;

  StyleStore({this.rowSize, this.isMobile = false, Key? key}) : super(key: key);

  @override
  _StyleStoreState createState() => _StyleStoreState();
}

class _StyleStoreState extends State<StyleStore> with TickerProviderStateMixin {
  // animation used to control the fab button visability
  // there is some text where its located
  // so gradually hide it when the user scrolls down
  late AnimationController _hideFabAnimation;

  // for handling scroll notification (user has scrolled)
  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            if (userScroll.metrics.maxScrollExtent !=
                userScroll.metrics.minScrollExtent) {
              _hideFabAnimation.forward();
            }
            break;
          case ScrollDirection.reverse:
            if (userScroll.metrics.maxScrollExtent !=
                userScroll.metrics.minScrollExtent) {
              _hideFabAnimation.reverse();
            }
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }

  @override
  initState() {
    super.initState();
    // initialize the animation controller
    _hideFabAnimation =
        AnimationController(vsync: this, duration: kThemeAnimationDuration);
    _hideFabAnimation.forward(); // show the fab button when the page is opened
  }

  @override
  void dispose() {
    // dispose of the animation controller when the page is disposed
    _hideFabAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: _handleScrollNotification,
      child: Scaffold(
        backgroundColor: AppColors.backgroundCol,
        appBar: widget.isMobile
            ? mobileAppBar(context: context, label: "Style Store")
            : desktopAppBar(context: context, label: "Style Store"),
        floatingActionButton: ScaleTransition(
          scale: _hideFabAnimation,
          child: StyledButton(
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
        ),
        body: Consumer(
          builder: (context, watch, child) {
            // watch all 14 providers at the same time (this is big brain code)
            // no need to use hookwidget for auto dispose becuase all
            // these providers are auto disposable
            var provs = styleImagesProviders
                .map(
                  (provider) => watch(provider),
                )
                .toList();

            return GridView.builder(
              padding: EdgeInsets.all(widget.isMobile ? 10 : 20),
              primary: true,
              scrollDirection: Axis.vertical,
              itemCount: provs.length,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.rowSize,
                childAspectRatio: 1,
                crossAxisSpacing: widget.isMobile ? 10 : 20,
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
                              isMobile: widget.isMobile,
                              rowSize: widget.rowSize,
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
                    SizedBox(height: widget.isMobile ? 5 : 10),
                    Text(
                      Categories.values[index]
                          .toShortString()
                          .replaceAll("-", " ")
                          .toTitleCase(),
                      style: TextStyle(
                        fontSize: widget.isMobile ? 13 : 15,
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
            );
          },
        ),
      ),
    );
  }
}
