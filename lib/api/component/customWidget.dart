// ignore_for_file: non_constant_identifier_names, file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techinical/api/component/color.dart';
import 'package:techinical/api/component/fontSize.dart';
import 'customText.dart';

class CustomWidget {
  static showSnackBar(String message) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      duration: const Duration(seconds: 1),
    ));
  }

  static Widget IconMenu(IconData icon, String content,
      {required void Function() callBack,
      Color IconColor = ColorPallete.softBlueCyan,
      String text2nd = ""}) {
    return GestureDetector(
      onTap: callBack,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: ColorPallete.abuMudaBG,
                  borderRadius: BorderRadius.circular(100)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icon, size: Get.height / 22, color: IconColor),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Column(
              children: [
                CustomText.normalText(content,
                    textColor: ColorPallete.softBlack, fontSize: 12),
                text2nd == ""
                    ? Container()
                    : CustomText.normalText(text2nd,
                        fontSize: 12, textColor: ColorPallete.softBlack),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cardWidget(Widget content,
      {Color colorBorder = ColorPallete.softIjoMuda,
      Color colorBg = ColorPallete.softIjoMedium}) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: Container(
        // width: Get.width / 2.5,
        decoration: BoxDecoration(
            border: Border.all(color: colorBorder),
            borderRadius: BorderRadius.circular(10),
            color: colorBg),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: content,
        ),
      ),
    );
  }

  static Widget labelGreen(String message) {
    return Container(
        decoration: BoxDecoration(
            color: ColorPallete.softIjoMuda.withOpacity(0.35),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(6, 3, 6, 3),
            child: CustomText.titleText(message,
                textColor: ColorPallete.green, fontSize: FontSize.small)));
  }

  Widget cardWidgetAnime(Widget content,
      {Color colorBorder = ColorPallete.softIjoMuda,
      Color colorBg = ColorPallete.softIjoMedium,
      required void Function() callBack,
      bool isPopular = false}) {
    return GestureDetector(
      onTap: callBack,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 0.0),
            child: Container(
              // width: Get.width / 2.5,
              decoration: BoxDecoration(
                  border: Border.all(color: colorBorder),
                  borderRadius: BorderRadius.circular(10),
                  color: colorBg),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: content,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 0,
              child: isPopular
                  ? AnimatedContainer(
                      // width: 100,
                      // height: 15,
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInQuad,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                              colors: [Color(0xff2196f3), Color(0xff8bc34a)])),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 10),
                        child: CustomText.titleText("Most Popular",
                            textColor: ColorPallete.white, fontSize: 10),
                      ),
                    )
                  : Container())
        ],
      ),
    );
  }

  static Future<dynamic> showDialog(String title, String content) {
    return Get.defaultDialog(
        title: title,
        content: Center(
          child: CustomText.normalText(content),
        ));
  }

  Widget dialogDate(bool confirm) {
    return SizedBox(
      width: Get.width / 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedButton(
            onPressed: () {
              // Get.off(PageDashboard());
            },
            style: OutlinedButton.styleFrom(
                elevation: 5.0,
                backgroundColor: ColorPallete.white,
                side: const BorderSide(color: ColorPallete.biruTua, width: 1.1),
                shape: const StadiumBorder(),
                fixedSize: Size(Get.width / 5, 20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Icon(
                //   Icons.arrow_left_outlined,
                //   color: ColorPallete.biruTua,
                // ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Confirm',
                    style: TextStyle(color: ColorPallete.biruTua),
                  ),
                )
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {
              // Get.off(PageDashboard());
            },
            style: OutlinedButton.styleFrom(
                elevation: 5.0,
                backgroundColor: ColorPallete.white,
                side: const BorderSide(color: ColorPallete.biruTua, width: 1.1),
                shape: const StadiumBorder(),
                fixedSize: Size(Get.width / 5, 20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Icon(
                //   Icons.arrow_left_outlined,
                //   color: ColorPallete.biruTua,
                // ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Back',
                    style: TextStyle(color: ColorPallete.biruTua),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget ListTileTopUpProfile(
      {String leadIconLocation = "",
      required String title,
      Widget? message,
      double borderRadius = 20,
      required void Function() callBack,
      double imageWidth = 10,
      Widget? leadIconFromWidget,
      double elevation = 2,
      Color bgColor = ColorPallete.white,
      Color iconColor = ColorPallete.softSilver,
      Color textColor = ColorPallete.softBlack,
      Color borderColor = ColorPallete.silver,
      EdgeInsetsGeometry? padding}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: GestureDetector(
        onTap: callBack,
        child: Card(
          color: Colors.transparent,
          elevation: elevation,
          shape: RoundedRectangleBorder(
              // side: BorderSide(
              //   color: borderColor,
              // ),
              borderRadius: BorderRadius.circular(borderRadius)),
          child: ListTile(
            // iconColor: ColorPallete.red,
            contentPadding: padding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            trailing: Icon(
              Icons.keyboard_arrow_right_outlined,
              color: iconColor,
              size: 30,
            ),
            leading: leadIconFromWidget ??
                (leadIconLocation != ""
                    ? Image.asset(
                        leadIconLocation,
                        width: imageWidth == 10 ? Get.width / 13 : imageWidth,
                      )
                    : null),
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: borderColor,
                ),
                borderRadius: BorderRadius.circular(borderRadius)),

            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                message ?? Container()
              ],
            ),
            tileColor: bgColor,
            textColor: textColor,
          ),
        ),
      ),
    );
  }
}
