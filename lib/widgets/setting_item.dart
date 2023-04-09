import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/res/colors.dart';

class SettingItem extends StatefulWidget {
  String title;
  SettingItem({super.key, required this.title});

  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: AppColors.text,
                fontSize: 20,
              ),
            ),
            Icon(
              (Icons.arrow_forward_ios),
              color: AppColors.text,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
