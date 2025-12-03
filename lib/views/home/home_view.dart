import 'package:coffee_app/theme/app_color.dart';
import 'package:coffee_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import '../../controllers/product_controller.dart';
import '../../widgets/coffee_card.dart';
import '../../widgets/promo_banner.dart';
import '../../widgets/category_chip.dart';
import '../product_detail/product_detail_view.dart';

class HomeView extends StatelessWidget {
  final c = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final categories = ['Cappuccino', 'Macchiato', 'Latte', 'Americano'];
    return Scaffold(
        backgroundColor: AppColors.scaffold,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18.0.w,
            ),
            child: Column(
              children: [
                // top row: location + avatar
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Location',
                              style: TextStyle(
                                  color: AppColors.greyText, fontSize: 12.sp)),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined,
                                  size: 16, color: AppColors.greyText),
                              SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  'Karachi, Sindh',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.dark),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 18.r,
                      backgroundImage:
                          AssetImage(profile),
                    )
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 48.h,
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          color: AppColors.softGrey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: AppColors.greyText),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration.collapsed(
                                    hintText: 'Search coffee'),
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            Icon(Icons.tune, color: AppColors.greyText),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
        
                // promo banner
                PromoBanner(),
                SizedBox(height: 18),
        
                // categories
                SizedBox(
                    height: 44,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      separatorBuilder: (_, __) => SizedBox(width: 10),
                      itemBuilder: (ctx, i) {
                        final t = categories[i];
                        return GestureDetector(
                          onTap: () => c.changeCategory(t),
                          child: Obx(() => CategoryChip(
                                text: t,
                                isSelected: c.selectedCategory.value == t,
                              )),
                        );
                      },
                    )),
                SizedBox(height: 18),
        
                // product grid
                Expanded(
                  child: Obx(() {
                    final list = c.coffees;
                    return GridView.builder(
                      padding: EdgeInsets.only(bottom: 20),
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.68,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: list.length,
                      itemBuilder: (ctx, idx) {
                        final coffee = list[idx];
                        return GestureDetector(
                          onTap: () {
                            final pc = Get.put(ProductController(),
                                permanent: false);
                            pc.setCoffee(coffee);
                            // Get.to(() => ProductDetailView());
                            Get.to(
                              () => ProductDetailView(),
                              transition: Transition.zoom,
                              duration: Duration(milliseconds: 350),
                              curve: Curves.easeInOutCirc,
                            );
                          },
                          child: CoffeeCard(coffee: coffee),
                        );
                      },
                    );
                  }),
                )
              ],
            ),
          ),
        ));
  }
}
