import 'package:aflutter_craft/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StyledSlider extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final alpha = watch(alphaProvider);
    return Column(
      children: [
        Text.rich(
          TextSpan(
            text: "Content Style trade-off\n",
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
            ),
            children: [
              TextSpan(
                text: "(amount of style to apply to image)",
                style: TextStyle(
                  fontSize: 11,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColors.accentColor,
            inactiveTrackColor: Colors.red[100],
            trackShape: RoundedRectSliderTrackShape(),
            trackHeight: 4.0,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
            thumbColor: Colors.redAccent,
            overlayColor: Colors.red.withAlpha(32),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
            tickMarkShape: RoundSliderTickMarkShape(),
            activeTickMarkColor: AppColors.accentColor,
            inactiveTickMarkColor: Colors.red[100],
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Colors.redAccent,
            valueIndicatorTextStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          child: Slider(
            // the value should be between 0 and 1
            // but set it to 100 so division and label work
            label: "${alpha / 100}",
            min: 0,
            max: 100,
            divisions: 10,
            value: alpha,
            onChanged: (newVal) {
              // update the alpha value provider (imagine using setState eww)
              context.read(alphaProvider.notifier).setState(newVal);
            },
          ),
        ),
      ],
    );
  }
}
