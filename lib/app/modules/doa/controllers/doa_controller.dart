import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/doa_model.dart';

import '../../../routes/app_pages.dart';

class DoaController extends GetxController with StateMixin {
  var allDoa = Doas();
  var listAllDoa = <Doa>[];
  var listChapters = <Chapters>[];

  final doaList = [].obs;

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.loading());
    allDoa = Doas.fromJson(
      jsonDecode(
        await rootBundle.loadString('assets/json/doa.json'),
      ),
    );

    allDoa.doa!.forEach((element) {
      element.chapters!.forEach((element) {
        listChapters.add(element);
      });
    });

    doaList.value = allDoa.doa!.map((e) => e.categoryName).toList();
    change(null, status: RxStatus.success());
  }
}

class DoaSearchDelegate extends SearchDelegate {
  DoaSearchDelegate(this.listChapters);

  final List<Chapters> listChapters;

  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () {
        query = "";
      },
    );
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.adaptive.arrow_back_outlined),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      return ListView.builder(
        itemCount: listChapters.length,
        itemBuilder: (context, index) {
          if (query.isNotEmpty &&
              listChapters[index].chapterName!.toLowerCase().contains(query)) {
            return Card(
              elevation: 0,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.DOA_LIST_DETAIL,
                      arguments: listChapters[index]);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                  ),
                  width: 1.sw,
                  height: 70.h,
                  child: Row(
                    children: [
                      const Icon(Icons.more_vert),
                      10.horizontalSpace,
                      Flexible(
                        child: Text(
                          '${listChapters[index].chapterName!}',
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ).paddingSymmetric(horizontal: 20.w),
              ),
            ).paddingSymmetric(
              horizontal: 10.w,
            );
          } else {
            return Container();
          }
        },
      );
    } else {
      return ListView.builder(
        itemCount: listChapters.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.DOA_LIST_DETAIL,
                    arguments: listChapters[index]);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white,
                ),
                width: 1.sw,
                height: 70.h,
                child: Row(
                  children: [
                    const Icon(Icons.more_vert),
                    10.horizontalSpace,
                    Flexible(
                      child: Text(
                        listChapters[index].chapterName!,
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ).paddingSymmetric(horizontal: 20.w),
            ),
          ).paddingSymmetric(
            horizontal: 10.w,
          );
        },
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      return ListView.builder(
        itemCount: listChapters.length,
        itemBuilder: (context, index) {
          if (query.isNotEmpty &&
              listChapters[index].chapterName!.toLowerCase().contains(query)) {
            return Card(
              elevation: 0,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.DOA_LIST_DETAIL,
                      arguments: listChapters[index]);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                  ),
                  width: 1.sw,
                  height: 70.h,
                  child: Row(
                    children: [
                      const Icon(Icons.more_vert),
                      10.horizontalSpace,
                      Flexible(
                        child: Text(
                          '${listChapters[index].chapterName!}',
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ).paddingSymmetric(horizontal: 20.w),
              ),
            ).paddingSymmetric(
              horizontal: 10.w,
            );
          } else {
            return Container();
          }
        },
      );
    } else {
      return ListView.builder(
        itemCount: listChapters.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.DOA_LIST_DETAIL,
                    arguments: listChapters[index]);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white,
                ),
                width: 1.sw,
                height: 70.h,
                child: Row(
                  children: [
                    const Icon(Icons.more_vert),
                    10.horizontalSpace,
                    Flexible(
                      child: Text(
                        '${listChapters[index].chapterName!}',
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ).paddingSymmetric(horizontal: 20.w),
            ),
          ).paddingSymmetric(
            horizontal: 10.w,
          );
        },
      );
    }
  }
}
