import 'package:aflutter_craft/utils/utils.dart';
import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final String btnLabel;
  final onPressed;
  final IconData? icon;

  const StyledButton({Key? key, this.btnLabel = "", this.onPressed, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: AppColors.accentColor, // background
          onPrimary: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ) // foreground
          ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            btnLabel,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: 5),
          Icon(
            icon,
            size: 17,
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
