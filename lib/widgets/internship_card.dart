import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:internshala_search/models/internship.dart';
import 'package:internshala_search/widgets/chip_label.dart';
import 'package:internshala_search/widgets/icon_label.dart';
import 'package:internshala_search/widgets/placeholder_box.dart';
import 'package:internshala_search/widgets/space.dart';

class InternshipCard extends StatelessWidget {
  final Internship internship;
  const InternshipCard({
    required this.internship,
    super.key,
  });

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
                    internship.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    internship.company_name.length > 40
                        ? internship.company_name.substring(0, 40) +
                            "\n" +
                            internship.company_name.substring(40)
                        : internship.company_name,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const FlutterLogo(),
            ],
          ),
          Space.def,
          if (internship.isWorkFromHome)
            const IconLabel(icon: Icons.home_outlined, label: "Work from home")
          else
            IconLabel(
              icon: Icons.location_on_rounded,
              label: internship.location_names.join(", "),
            ),
          Space.def,
          Row(
            children: [
              IconLabel(
                  icon: Icons.play_circle_outline_rounded,
                  label: internship.start_date),
              Space.horizontal,
              IconLabel(
                icon: Icons.calendar_today_rounded,
                label: internship.duration,
                iconSize: 15,
              ),
            ],
          ),
          Space.def,
          IconLabel(icon: Icons.money_rounded, label: internship.stipend),
          Space.def,
          Wrap(
            spacing: 8,
            children: [
              for (var label in internship.labels) ChipLabel(label: label),
            ],
          ),
          Space.def,
          FittedBox(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: internship.postedByLabelType == "success"
                    ? Colors.green.withOpacity(.25)
                    : Colors.grey.withOpacity(.25),
                borderRadius: BorderRadius.circular(4),
              ),
              child: IconLabel(
                icon: Icons.access_time_rounded,
                label: internship.postedByLabel,
                iconSize: 12,
                textSize: 12,
                color: internship.postedByLabelType == "success"
                    ? const Color(0xff13800D)
                    : Colors.grey,
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
                child: const Text("View Details"),
              ),
              Space.horizontal,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {},
                child: const Text(
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

  static Widget loading(BuildContext context, int index) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.only(bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PlaceholderBox(width: 100),
                  Space.def,
                  const PlaceholderBox(width: 200),
                ],
              ),
              const Spacer(),
              const PlaceholderBox(width: 50),
            ],
          ),
          Space.def,
          const PlaceholderBox(width: 150),
          Space.def,
          Row(
            children: [
              const PlaceholderBox(width: 100),
              Space.horizontal,
              const PlaceholderBox(width: 100),
            ],
          ),
          Space.def,
          const PlaceholderBox(width: 150),
          Space.def,
          const Wrap(
            spacing: 8,
            children: [
              PlaceholderBox(width: 50),
              PlaceholderBox(width: 50),
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
              child: const PlaceholderBox(width: 50),
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
              const PlaceholderBox(width: 100),
              Space.horizontal,
              const PlaceholderBox(width: 100),
            ],
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(
          duration: const Duration(milliseconds: 500),
          delay: Duration(milliseconds: 100 * index),
        )
        .slideY(
          begin: .5,
          end: 0,
          delay: Duration(milliseconds: 100 * index),
          duration: const Duration(milliseconds: 500),
        );
  }
}
