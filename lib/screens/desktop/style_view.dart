import 'package:aflutter_craft/utils/utils.dart';
import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StyleView extends ConsumerWidget {
  StyleView({this.category, this.provider, Key? key}) : super(key: key);

  final provider;
  final String? category;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var prov = watch(provider);

    return Scaffold(
      appBar: desktopAppBar(context: context, label: category),
      body: GridView.builder(
        padding: EdgeInsets.all(30),
        primary: true,
        scrollDirection: Axis.vertical,
        itemCount: 100,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) => prov.when(
          data: (data) => Column(
            children: [
              InkWell(
                onTap: () async {
                  // update the content image provider(will update the ui image)
                  context.read(styleProvider.notifier).setImage(
                        CachedNetworkImageProvider(
                          BUCKET_PREFIX + data[index],
                        ),
                      );

                  // pop navigator twice to return to main page
                  final nav = Navigator.of(context);
                  nav.pop();
                  nav.pop();
                },
                child: NetworkImageContainer(
                  imgName: data[index],
                ),
              ),
            ],
          ),
          loading: () => CupertinoActivityIndicator(),
          error: (err, stack) => Text(
            err.toString(),
          ),
        ),
      ),
    );
  }
}
