import 'package:flutter/material.dart';
import 'package:internshala_search/widgets/placeholder_box.dart';
import 'package:internshala_search/widgets/space.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
          actions: [
            for (int i = 0; i < 2; i++) ...[
              const PlaceholderBox(width: 25, shimmerEnabled: false),
              const Space(
                8,
                isHorizontal: true,
              )
            ],
            Space.horizontal,
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [],
              ),
            ),
            Space.def,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Theme.of(context).colorScheme.primary,
                        // change border radius
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Clear All"),
                    ),
                  ),
                  Space.horizontal,
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).colorScheme.primary,
                        // change border radius
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child:
                          Text("Apply", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
