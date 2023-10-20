import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_grocery/components/main_header.dart';
import 'package:my_grocery/controller/controllers.dart';
import 'package:my_grocery/view/home/components/carousel_slider/carousel_loading.dart';
import 'package:my_grocery/view/home/components/carousel_slider/carousel_slider_view.dart';
import 'package:my_grocery/view/home/components/popular_category/popular_categort_loading.dart';
import 'package:my_grocery/view/home/components/popular_category/popular_category.dart';
import 'package:my_grocery/view/home/components/popular_product/popular_product.dart';
import 'package:my_grocery/view/home/components/popular_product/popular_product_loading.dart';
import 'package:my_grocery/view/home/components/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const MainHeader(),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Obx(() {
                  if (homeController.isBannerLoading.value) {
                    return const CarouselLoading();
                  } else {
                    return CarouselSliderView(
                      bannerList: homeController.bannerList,
                    );
                  }
                }),
                const SectionTitle(title: 'Popular Categories'),
                Obx(() {
                  if (homeController.popularCategoryList.isNotEmpty) {
                    return PopularCategory(
                      categories: homeController.popularCategoryList,
                    );
                  } else {
                    return const PopularCategoryLoading();
                  }
                }),
                const SectionTitle(title: 'Popular Products'),
                Obx(() {
                  if (homeController.popularCategoryList.isNotEmpty) {
                    return PopularProduct(
                        popularProducts: homeController.popularProductList);
                  } else {
                    return const PopularProductLoading();
                  }
                })
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
