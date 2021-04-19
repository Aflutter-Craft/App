import 'package:aflutter_craft/utils/utils.dart';
import 'package:aflutter_craft/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StyleView extends ConsumerWidget {
  StyleView({this.provider, Key? key}) : super(key: key);

  final provider;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var prov = watch(provider);

    print(styleImagesProviders.length);
    return Scaffold(
        appBar: desktopAppBar(context: context, enableBack: true),
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
                NetworkImageContainer(
                  imgName: data[index],
                ),
              ],
            ),
            loading: () => CupertinoActivityIndicator(),
            error: (err, stack) => Text(
              err.toString(),
            ),
          ),
        ));
  }
}
