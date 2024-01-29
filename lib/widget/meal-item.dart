import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_application_1/widget/meal_item_trait.dart';

class MealITem extends StatelessWidget {
    const MealITem({super.key, required this.meal,required this.onSelectMeal});
  final Meal meal;
  final  void Function(Meal meal)  onSelectMeal;
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap:(){
        onSelectMeal(meal);
        } ,
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              // top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                // height: 12,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                color: Colors.black54,
                child: Column(children: [
                  Text(
                    meal.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis, // tasdasd text ds...
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // use expanded befor mealItemtrait
                      MealItemTrait(
                        // u should use expanded here but thanks to left = 0 and right = 0 in positioned Widget we dont need
                        icon: Icons.schedule,
                        lable:
                            '${meal.duration} min', // meal.duration.toString() whiout min
                      ),
                      const SizedBox(width: 12),
                      MealItemTrait(
                        icon: Icons.work,
                        lable: complexityText,
                      ),
                      const SizedBox(width: 12),
                      MealItemTrait(
                        icon: Icons.attach_money,
                        lable: affordabilityText,
                      ),
                    ],
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
