import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app_ecommerce/controller/controllers.dart';
import 'package:my_app_ecommerce/view/category/components/category_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return Obx((){
        if(categoryController.categoryList.isNotEmpty){
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: categoryController.categoryList.length,
            itemBuilder: (context, index) =>
            CategoryCard(category: categoryController.categoryList[index]),
          );
        }else{
          return Container(

          );
        }
      });

  }
}

