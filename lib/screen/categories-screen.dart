import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/dummy-data.dart';
import 'package:flutter_application_1/models/category.dart';
import 'package:flutter_application_1/screen/meals.dart';
import 'package:flutter_application_1/widget/category-grid-item.dart';

// import 'package:flutter_application_1/data/dummy-data.dart';
// import 'package:flutter_application_1/models/meal.dart';
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filterMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
        print(filterMeals);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(title: category.title, meals: filterMeals),
      ),
    ); //navigator .of(context).push(route)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // ...availableCategories.map((category) => CategoryGridItem(
          //       category: category,
          //       onSelectCategory: () {
          //         _selectCategory(context,category);

          //       },
          //     )),
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
