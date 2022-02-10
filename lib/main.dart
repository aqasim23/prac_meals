import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/filters_screen.dart';

import './screens/tabs_screen.dart';
import './screens/meals_details_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routename: (ctx) => MealDetailScreen(),
        FiltersScreen.routename: (ctx) => FiltersScreen(),
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
