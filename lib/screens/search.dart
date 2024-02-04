import 'package:flutter/material.dart';
import 'package:internshala_search/providers/data_provider.dart';
import 'package:internshala_search/widgets/internship_card.dart';
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
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Text('Internshala Search'),
      ),
      body: ListView.builder(
        itemCount: dataProvider.isLoaded ? dataProvider.internships.length : 3,
        itemBuilder: (context, index) {
          if (dataProvider.isLoaded) {
            return InternshipCard(
                // internship: dataProvider.internships[index],
                );
          }
          return InternshipCard.loading(context, index);
        },
      ),
    );
  }
}
