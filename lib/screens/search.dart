import 'dart:developer';

import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:internshala_search/providers/data_provider.dart';
import 'package:internshala_search/providers/filters_provider.dart';
import 'package:internshala_search/screens/filters.dart';
import 'package:internshala_search/widgets/internship_card.dart';
import 'package:internshala_search/widgets/placeholder_box.dart';
import 'package:internshala_search/widgets/primary_chip.dart';
import 'package:internshala_search/widgets/space.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    var filterProvider = Provider.of<FiltersProvider>(context, listen: false);
    Provider.of<DataProvider>(context, listen: false).load((internships) {
      // var cities = internships.map((e) => e.locationNames.).toList();
      // var profiles = internships.map((e) => e.profileName).toSet().toList();
      // log(cities.toString());
      // filterProvider.setAvailableCities(cities);
      // filterProvider.setProfiles(profiles);
      List<String> cities = [];
      List<String> profiles = [];

      internships.forEach((internship) {
        // cities.addAll(internship.locationNames);
        for (var element in internship.locationNames) {
          if (!cities.contains(element)) {
            cities.add(element);
          }
        }
        if (!profiles.contains(internship.profileName)) {
          profiles.add(internship.profileName);
        }
      });

      filterProvider.setAvailableCities(cities);
      filterProvider.setAvailableProfiles(profiles);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = Provider.of<DataProvider>(context);
    FiltersProvider filtersProvider = Provider.of<FiltersProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xff333333),
      drawer: Drawer(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space(MediaQuery.of(context).padding.top),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const ListTile(
              title: Text("Siddhant Sharma", style: TextStyle(fontSize: 20)),
              subtitle: Text(
                "siddhantgaurav2003@gmail.com",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              trailing: PlaceholderBox(width: 50, shimmerEnabled: false),
            ),
            Space.def,
            Divider(
              color: Colors.grey.withOpacity(.5),
              height: 0,
            ),
            Space.def,
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Explore",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            const Space(10),
            ListTile(
              onTap: () => Navigator.pop(context),
              leading: const Icon(Icons.home_outlined),
              title: const Text("Internships"),
            ),
            for (int i = 0; i < 4; i++) ...[
              const ListTile(
                title: Row(
                  children: [
                    PlaceholderBox(width: 150, shimmerEnabled: false),
                  ],
                ),
                leading: PlaceholderBox(width: 50, shimmerEnabled: false),
              ),
            ],
            Space.def,
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "HELP & SUPPORT",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            const Space(10),
            for (int i = 0; i < 3; i++) ...[
              const ListTile(
                title: Row(
                  children: [
                    PlaceholderBox(width: 150, shimmerEnabled: false),
                  ],
                ),
                leading: PlaceholderBox(width: 50, shimmerEnabled: false),
              ),
            ],
          ],
        ),
      ),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Text('Internshala Search'),
        actions: [
          for (int i = 0; i < 3; i++) ...[
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
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: [
                if (filtersProvider.filtersAvailable)
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            visualDensity: VisualDensity.compact,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            primary: Theme.of(context).colorScheme.primary,
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(FiltersScreen.routeName);
                          },
                          icon: const Text("Filters"),
                          label: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                filtersProvider.selectedFiltersCount.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Space(8, isHorizontal: true),
                        for (var filter in filtersProvider.selectedFilters)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: PrimaryChip(
                              label: filter,
                              onDeleted: () {
                                Navigator.of(context)
                                    .pushNamed(FiltersScreen.routeName);
                              },
                              radius: 25,
                            ),
                          ),
                      ],
                    ),
                  )
                else
                  Center(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        primary: Theme.of(context).colorScheme.primary,
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(FiltersScreen.routeName);
                      },
                      icon: const Icon(CarbonIcons.filter),
                      label: const Text("Filter"),
                    ),
                  ),
                const Space(10),
                Center(
                  child: Text(
                    "Showing ${dataProvider.isLoaded ? dataProvider.internships.length : 3} internships",
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const Space(10),
              ],
            ),
          ),
          const Space(5),
          Expanded(
            child: ListView.builder(
              itemCount:
                  dataProvider.isLoaded ? dataProvider.internships.length : 3,
              itemBuilder: (context, index) {
                if (dataProvider.isLoaded) {
                  return InternshipCard(
                    internship: dataProvider.internships[index],
                  );
                }
                return InternshipCard.loading(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
