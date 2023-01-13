// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, duplicate_ignore, file_names

import 'package:flutter/material.dart';
import 'package:techinical/api/component/color.dart';

class CustomText {
  static Text titleText(String Content,
      {Color textColor = ColorPallete.hitam,
      double fontSize = 14,
      FontWeight fontWeight = FontWeight.bold}) {
    return Text(
      Content,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: textColor, fontWeight: fontWeight, fontSize: fontSize),
    );
  }

  static Text normalText(String Content,
      {Color textColor = ColorPallete.hitam,
      FontWeight fontWeight = FontWeight.normal,
      double fontSize = 14,
      TextAlign textAlign = TextAlign.start}) {
    return Text(
      Content,
      textAlign: textAlign,
      style: TextStyle(
          color: textColor, fontWeight: fontWeight, fontSize: fontSize),
    );
  }

  // ignore: non_constant_identifier_names
  static String Capitalize(String content) {
    return "${content[0].toUpperCase()}${content.substring(1).toLowerCase()}";
  }

  static Text longText(String Content,
      {Color textColor = ColorPallete.hitam, double fontSize = 14}) {
    return Text(
      Content,
      softWrap: true,
      textAlign: TextAlign.justify,
      style: TextStyle(
          height: 1.3,
          color: textColor,
          fontWeight: FontWeight.normal,
          fontSize: fontSize),
    );
  }

  static Widget titleTextWithIcon(String Content, IconData icon,
      {Color textColor = ColorPallete.white,
      double fontSize = 14,
      Color iconColor = ColorPallete.softWhite,
      bool isBack = false,
      bool isCenter = false,
      FontWeight fontWeight = FontWeight.bold}) {
    return Row(
      mainAxisAlignment:
          isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        isBack
            ? Icon(
                icon,
                color: iconColor,
              )
            : Container(),
        Text(
          Content,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: textColor, fontWeight: fontWeight, fontSize: fontSize),
        ),
        !isBack
            ? Icon(
                icon,
                color: iconColor,
              )
            : Container()
      ],
    );
  }

  static Widget bulletList(String Content,
      {Color textColor = ColorPallete.hitam,
      double fontSize = 14,
      FontWeight fontWeight = FontWeight.bold}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // ignore: prefer_const_constructors
        Text("• "),
        Expanded(
          child: Text(
            Content,
            style: TextStyle(
              color: textColor,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
        ),
      ],
    );
  }

  static Widget titleTextWithWidgetIcon(String Content, Widget icon,
      {Color textColor = ColorPallete.white,
      double fontSize = 14,
      Color iconColor = ColorPallete.softWhite,
      bool isBack = false,
      bool isMaxWidth = false,
      // double width = Get.width,
      FontWeight fontWeight = FontWeight.bold}) {
    return Row(
      children: [
        isBack
            ? Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: icon,
              )
            : Container(),
        Container(
          width: isMaxWidth ? null : 77,
          child: Text(
            Content,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: textColor, fontWeight: fontWeight, fontSize: fontSize),
          ),
        ),
        !isBack
            ? Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: icon,
              )
            : Container()
      ],
    );
  }
}
