// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techinical/api/component/color.dart';
import 'package:techinical/api/component/customText.dart';
import 'package:techinical/api/component/dateFormat.dart';
import 'package:techinical/api/component/fontSize.dart';
import 'package:techinical/controller/main_controller.dart';

class DetailNewsPage extends GetView<MainController> {
  const DetailNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPallete.grey,
        body: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: SizedBox(
                  width: Get.width,
                  height: 220,
                  child: controller.dataArticle!.urlToImage == ""
                      ? Image.asset("lib/assets/image_not_found.png")
                      : Image.network(
                          controller.dataArticle!.urlToImage,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    width: Get.width,
                    height: Get.height - 240,
                    color: ColorPallete.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(
                              width: Get.width,
                              child: CustomText.normalText(
                                  controller.dataArticle!.title,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.bold,
                                  fontSize: FontSize.title)),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText.normalText(
                                  controller.dataArticle!.author ?? "",
                                  fontSize: FontSize.subtitle,
                                  textColor: ColorPallete.biru),
                              CustomText.normalText(
                                  CustomFormatDate.formatDateID(controller
                                      .dataArticle!.publishedAt
                                      .toIso8601String()),
                                  fontSize: FontSize.subtitle,
                                  textColor: ColorPallete.biru),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomText.longText(
                              controller.dataArticle!.description),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  )),
              Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorPallete.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                        color: ColorPallete.softBlack,
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.arrow_back_ios_sharp,
                          // size: 22,
                        )),
                  ))
            ],
          ),
        ));
  }
}
