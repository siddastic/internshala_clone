import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internshala_search/models/filter_choice.dart';
import 'package:internshala_search/providers/data_provider.dart';
import 'package:internshala_search/providers/filters_provider.dart';
import 'package:internshala_search/screens/filter_chooser.dart';
import 'package:internshala_search/widgets/placeholder_box.dart';
import 'package:internshala_search/widgets/primary_chip.dart';
import 'package:internshala_search/widgets/space.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FiltersProvider filtersProvider = Provider.of<FiltersProvider>(context);
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
                children: [
                  Text(
                    "PROFILE",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Wrap(
                    spacing: 4,
                    children: [
                      for (var item in filtersProvider.selectedProfiles)
                        PrimaryChip(
                          label: item,
                          onDeleted: () {
                            filtersProvider.removeProfile(item);
                          },
                        ),
                    ],
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                    ),
                    onPressed: () async {
                      final profiles =
                          await Navigator.of(context).push<List<String>>(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return FilterChooser(
                              filterChoice: FilterChoice(
                                categoryName: "Profile",
                                options: filtersProvider.availableProfiles,
                              ),
                              preSelectedOptions:
                                  filtersProvider.selectedProfiles,
                            );
                          },
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                      if (profiles != null) {
                        filtersProvider.setSelectedProfiles(profiles);
                      }
                    },
                    icon: const Icon(CarbonIcons.add),
                    label: const Text("Add profile"),
                  ),
                  Space.def,
                  Text(
                    "CITY",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Wrap(
                    spacing: 4,
                    children: [
                      for (var item in filtersProvider.selectedCities)
                        PrimaryChip(
                          label: item,
                          onDeleted: () {
                            filtersProvider.removeCity(item);
                          },
                        ),
                    ],
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                    ),
                    onPressed: () async {
                      final cities =
                          await Navigator.of(context).push<List<String>>(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return FilterChooser(
                              filterChoice: FilterChoice(
                                categoryName: "City",
                                options: filtersProvider.availableCities,
                              ),
                              preSelectedOptions:
                                  filtersProvider.selectedCities,
                            );
                          },
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                      if (cities != null) {
                        filtersProvider.setSelectedCities(cities);
                      }
                    },
                    icon: const Icon(CarbonIcons.add),
                    label: const Text("Add city"),
                  ),
                  Space.def,
                  Text(
                    "INTERNSHIP TYPE",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const Space(10),
                  CheckboxListTile(
                    value: filtersProvider.isWorkFromHome ?? false,
                    onChanged: (v) {
                      filtersProvider
                          .setIsWorkFromHome(v == true ? true : null);
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: const Text("Work from home"),
                  ),
                  CheckboxListTile(
                    value: filtersProvider.isPartTime ?? false,
                    onChanged: (v) {
                      filtersProvider.setIsPartTime(v == true ? true : null);
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: const Text("Part-time"),
                  ),
                  Space.def,
                  Text(
                    "MAXIMUM DURATION (IN MONTHS)",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const Space(10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.withOpacity(.5),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<int>(
                        isExpanded: true,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        hint: const Text("Choose duration"),
                        underline: const SizedBox(),
                        icon: const Icon(CarbonIcons.caret_down),
                        onChanged: (value) {
                          filtersProvider.setMaximumDuration(value);
                        },
                        value: filtersProvider.maximumDuration,
                        dropdownColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        items: [
                          for (int i = 1; i <= 4; i++)
                            DropdownMenuItem(
                              value: i,
                              child: Text("$i"),
                            ),
                          // multiples of 6
                          for (int i = 6; i <= 36; i += 6)
                            if ([6, 12, 24, 36].contains(i))
                              DropdownMenuItem(
                                value: i,
                                child: Text("$i"),
                              ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                        foregroundColor: Theme.of(context).colorScheme.primary,
                        // change border radius
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        filtersProvider.clearAll();
                        Navigator.of(context).pop();
                      },
                      child: const Text("Clear All"),
                    ),
                  ),
                  Space.horizontal,
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        // change border radius
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        var dataProvider =
                            Provider.of<DataProvider>(context, listen: false);
                        filtersProvider.applyFilters(dataProvider.internships);
                        Navigator.of(context).pop();
                      },
                      child: const Text("Apply",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
