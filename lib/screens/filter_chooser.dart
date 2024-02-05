import 'package:flutter/material.dart';
import 'package:internshala_search/models/filter_choice.dart';
import 'package:internshala_search/widgets/space.dart';

class FilterChooser extends StatefulWidget {
  final FilterChoice filterChoice;
  final List<String> preSelectedOptions;
  const FilterChooser({
    super.key,
    required this.filterChoice,
    required this.preSelectedOptions,
  });

  @override
  State<FilterChooser> createState() => _FilterChooserState();
}

class _FilterChooserState extends State<FilterChooser> {
  final TextEditingController _searchController = TextEditingController();
  List<String> selectedOptions = [];

  @override
  void initState() {
    selectedOptions = widget.preSelectedOptions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.filterChoice.categoryName),
        actions: [
          Transform.scale(
            scale: 0.8,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary,
                // change border radius
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                setState(() {
                  selectedOptions.clear();
                });
              },
              child: const Text("Clear All"),
            ),
          ),
          Transform.scale(
            scale: 0.8,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                // change border radius
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(selectedOptions);
              },
              child: const Text("Apply", style: TextStyle(color: Colors.white)),
            ),
          ),
          const Space(7, isHorizontal: true),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                for (var option in widget.filterChoice.options)
                  if (option.toLowerCase().contains(_searchController.text))
                    CheckboxListTile(
                      dense: true,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: selectedOptions.contains(option),
                      onChanged: (value) {
                        setState(() {
                          if (value!) {
                            selectedOptions.add(option);
                          } else {
                            selectedOptions.remove(option);
                          }
                        });
                      },
                      title: Text(option),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
