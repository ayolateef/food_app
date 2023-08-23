import 'package:flutter/material.dart';
import 'package:recipe_app/recipe.dart';
import 'package:recipe_app/recipe_detail.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Calculator',
      theme: ThemeData(
          primaryColor: Colors.grey,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.black)),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          // 5
          itemCount: Recipe.samples.length,
          // 6
          itemBuilder: (BuildContext context, int index) {
            // TODO: Add GestureDetector
            return GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(
                    builder: (context) {
                  // 10
                  // TODO: Replace return with return RecipeDetail()
                      return RecipeDetail(recipe: Recipe.samples[index]);
                      },
                    ));
                },
                child: buildRecipeCard(Recipe.samples[index]));
          },
        ),
      ),
    );
  }
}

Widget buildRecipeCard(Recipe recipe) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Image(image: AssetImage(recipe.imageUrl)),
          const SizedBox(height: 16.0,),
          Text(recipe.label,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Palatino',
            ),

          ),
        ],
      ),
    ),
  );
}
