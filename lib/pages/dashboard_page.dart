import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techinical/api/component/color.dart';
import 'package:techinical/api/component/customText.dart';
import 'package:techinical/api/component/customWidget.dart';
import 'package:techinical/api/component/dateFormat.dart';
import 'package:techinical/api/component/fontSize.dart';
import 'package:techinical/controller/main_controller.dart';

class DashboardPage extends GetView<MainController> {
  const DashboardPage({Key? key}) : super(key: key);

  Widget resetFilter() {
    if (controller.filterDate.value ||
        controller.filterStatus.value ||
        controller.filterType.value ||
        controller.selectedStatus != "" ||
        controller.selectedType != "") {
      return OutlinedButton(
        onPressed: () {
          controller.resetAllFilter();
        },
        style: OutlinedButton.styleFrom(
          elevation: 5.0,
          backgroundColor: ColorPallete.grey,
          side: const BorderSide(color: ColorPallete.biruTua, width: 1.1),
          shape: const StadiumBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(
              Icons.restart_alt_outlined,
              color: ColorPallete.biruTua,
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Widget filterWidget() {
    return Positioned(
        top: 0,
        left: 0,
        child: Container(
          decoration: const BoxDecoration(color: ColorPallete.white),
          width: Get.width,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Center(
              child: ListView(
                padding: const EdgeInsets.all(5),
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 9.0),
                    child: resetFilter(),
                  ),
                  for (var i in controller.listCategory)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: OutlinedButton(
                        onPressed: () {
                          controller.getDataAPI("id", i);
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: controller.category == i
                              ? ColorPallete.biru2
                              : ColorPallete.grey,
                          side: const BorderSide(color: Colors.transparent),
                          shape: const StadiumBorder(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText.normalText(CustomText.Capitalize(i),
                                fontSize: FontSize.small,
                                textColor: controller.category == i
                                    ? ColorPallete.white
                                    : ColorPallete.softBlack)
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    controller.onBuildPage();
    return GetBuilder<MainController>(
        init: MainController(), // INIT IT ONLY THE FIRST TIME
        builder: (_) => Stack(
              children: [
                Scaffold(
                  resizeToAvoidBottomInset: true,
                  backgroundColor: ColorPallete.grey,
                  appBar: AppBar(
                    elevation: 0,
                    title: CustomText.titleText("News APP",
                        fontSize: FontSize.big),
                    backgroundColor: ColorPallete.white,
                    centerTitle: true,
                  ),
                  body: SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: Stack(
                      children: [
                        filterWidget(),
                        Positioned(
                            bottom: 0,
                            child: Container(
                              height: Get.height - 140,
                              width: Get.width,
                              decoration: const BoxDecoration(
                                  color: ColorPallete.white),
                              child: controller.dataAPI.totalResults == 0
                                  ? Center(
                                      child: CustomText.titleText(
                                          "Data not found"),
                                    )
                                  : ListView.builder(
                                      controller:
                                          controller.scrollControllerList,
                                      itemCount:
                                          controller.dataAPI.articles!.length *
                                              controller.page.value,
                                      itemBuilder: (context, snapshot) {
                                        var data = controller
                                            .dataAPI.articles![snapshot];
                                        return GestureDetector(
                                          onTap: () {
                                            controller.detailArticle(data);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 7),
                                            child: Container(
                                              width: Get.width,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                  color: ColorPallete.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Row(children: [
                                                SizedBox(
                                                    width:
                                                        0.4 * (Get.width - 20),
                                                    height: 100,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12.0),
                                                        child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            child: data.urlToImage ==
                                                                    ""
                                                                ? Image.asset(
                                                                    "lib/assets/image_not_found.png")
                                                                : Image.network(
                                                                    data.urlToImage,
                                                                    fit: BoxFit
                                                                        .fitHeight,
                                                                  )))),
                                                SizedBox(
                                                  width:
                                                      0.59 * (Get.width - 20),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5.0),
                                                    child: Stack(
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            CustomText.titleText(
                                                                data.title,
                                                                fontSize:
                                                                    FontSize
                                                                        .title),
                                                            CustomText.normalText(
                                                                CustomFormatDate
                                                                    .formatDateID(data
                                                                        .publishedAt
                                                                        .toIso8601String()),
                                                                fontSize: FontSize
                                                                    .subtitle)
                                                          ],
                                                        ),
                                                        Positioned(
                                                            right: 0,
                                                            top: 0,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 5.0),
                                                              child: CustomWidget
                                                                  .labelGreen(data
                                                                      .source
                                                                      .name
                                                                      .toString()),
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ]),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                            )),
                      ],
                    ),
                  ),
                ),
                controller.isLoading.value
                    ? Positioned(
                        top: 0,
                        bottom: 0,
                        child: Container(
                          height: Get.height,
                          width: Get.width,
                          color: ColorPallete.softBlack.withOpacity(0.7),
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ColorPallete.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 30),
                                child: CircularProgressIndicator(
                                    color: ColorPallete.biru2),
                              ),
                            ),
                          ),
                        ))
                    : Container()
              ],
            ));
  }
}
