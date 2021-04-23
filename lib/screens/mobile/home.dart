import 'package:aflutter_craft/utils/utils.dart';
import 'package:aflutter_craft/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MobileHome extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var content = watch(contentProvider);
    var style = watch(styleProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundCol,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Aflutter Craft",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageContainer(
                  image: content,
                  ratio: 0.4,
                ),
                SizedBox(height: 30),
                ImageContainer(
                  image: style,
                  ratio: 0.4,
                ),
                SizedBox(height: 20),
                StyledButton(
                  btnLabel: "Apply Style",
                  icon: Icons.check_circle,
                  onPressed: () => {},
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundCol,
    );
  }
}
