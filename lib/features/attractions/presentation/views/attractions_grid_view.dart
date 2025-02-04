import 'package:flutter/material.dart';
import 'package:tourista/features/attractions/data/models/attractions_model/attractions_model.dart';
import 'custom_attractions_grid_item.dart';

class AttractionsGridView extends StatelessWidget {
  const AttractionsGridView({super.key, required this.attractionsModel});
  final AttractionsModel attractionsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Adjust for fitting your custom width
          childAspectRatio: 0.55, // Aspect ratio for the custom widget
          crossAxisSpacing: 20.0,
        ),
        itemCount: attractionsModel.attraction!.length,
        itemBuilder: (context, index) {
          return CustomAttractionsGridItem(
            attractionsModel: attractionsModel,
            attractionIndex: index,
          );
        },
      ),
    );
  }
}
