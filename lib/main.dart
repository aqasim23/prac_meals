import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/filters_screen.dart';

import './screens/tabs_screen.dart';
import './screens/meals_details_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './dummy_data.dart';
import './models/meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meals> _availableMeals = DUMMY_MEALS;
  List<Meals> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meals) {
        if(_filters['gluten'] && !meals.isGlutenFree) {
          return false;
        }
        if(_filters['vegan'] && !meals.isVegan) {
          return false;
        }
        if(_filters['vegetarian'] && !meals.isVegetarian) {
          return false;
        }
        if(_filters['lactose'] && !meals.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite (String mealId) {
    final existingIndex = _favouriteMeals.indexWhere((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        //primarySwatch: Colors.pink,
        //accentColor: Colors.amber,
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline1: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: Categories_screen(),
      routes: {
        '/': (ctx) => TabsScreen(_favouriteMeals),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routename: (ctx) => MealDetailScreen(),
        FiltersScreen.routename: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.name);
        return MaterialPageRoute(builder: ((ctx) => Categories_screen()));
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => Categories_screen());
      },
    );
  }
}
