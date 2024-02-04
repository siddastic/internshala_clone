import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:internshala_search/providers/data_provider.dart';
import 'package:internshala_search/widgets/internship_card.dart';
import 'package:internshala_search/widgets/placeholder_box.dart';
import 'package:internshala_search/widgets/space.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    Provider.of<DataProvider>(context, listen: false).load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = Provider.of<DataProvider>(context);
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
      body: ListView.builder(
        itemCount: dataProvider.isLoaded ? dataProvider.internships.length : 3,
        itemBuilder: (context, index) {
          if (dataProvider.isLoaded) {
            return InternshipCard(
              internship: dataProvider.internships[index],
            );
          }
          return InternshipCard.loading(context, index);
        },
      ),
    );
  }
}
