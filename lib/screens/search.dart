import 'package:flutter/material.dart';
import 'package:internshala_search/widgets/internship_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff333333),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Text('Internshala Search'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return InternshipCard();
        },
      ),
    );
  }
}
