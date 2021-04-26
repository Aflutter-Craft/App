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
        primary: AppColors.accentColor,
        onPrimary: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: isMobile ? 20 : 10,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            btnLabel,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: 10),
          Icon(
            icon,
            size: 18,
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
