import 'package:flutter/material.dart';
import 'package:internshala_search/widgets/chip_label.dart';
import 'package:internshala_search/widgets/icon_label.dart';
import 'package:internshala_search/widgets/space.dart';

class InternshipCard extends StatelessWidget {
  const InternshipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.only(bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Marketing",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Careers360",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Spacer(),
              FlutterLogo(),
            ],
          ),
          Space.def,
          IconLabel(icon: Icons.home_outlined, label: "Work from home"),
          Space.def,
          Row(
            children: [
              IconLabel(
                  icon: Icons.play_circle_outline_rounded,
                  label: "Starts Immediately"),
              Space.horizontal,
              IconLabel(
                icon: Icons.calendar_today_rounded,
                label: "2 Months",
                iconSize: 15,
              ),
            ],
          ),
          Space.def,
          IconLabel(icon: Icons.money_rounded, label: "₹ 10000 /month"),
          Space.def,
          Wrap(
            spacing: 8,
            children: [
              ChipLabel(label: "Internship"),
              ChipLabel(label: "Part Time"),
            ],
          ),
          Space.def,
          FittedBox(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(.25),
                borderRadius: BorderRadius.circular(4),
              ),
              child: IconLabel(
                icon: Icons.access_time_rounded,
                label: "2 days ago",
                iconSize: 12,
                textSize: 12,
                color: Color(0xff13800D),
              ),
            ),
          ),
          Space.def,
          Divider(
            indent: 8,
            endIndent: 8,
            thickness: .5,
            color: Colors.grey.withOpacity(.5),
            height: 0,
          ),
          Space.def,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text("View Details"),
              ),
              Space.horizontal,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {},
                child: Text(
                  "Apply now",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}