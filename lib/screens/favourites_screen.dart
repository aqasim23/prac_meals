import 'package:flutter/material.dart';

import '../models/meals.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meals> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'You have no favourites yet - Start adding some!',
      ),
    );
  }
}
