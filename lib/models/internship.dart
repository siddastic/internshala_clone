class Internship {
  final String title;
  final String companyName;
  final List<String> labels;
  final bool isWorkFromHome;
  final List<String> locationNames;
  final String stipend;
  final String duration;
  final String postedByLabel;
  final String postedByLabelType;
  final String startDate;
  final String profileName;

  Internship({
    required this.title,
    required this.companyName,
    required this.labels,
    required this.isWorkFromHome,
    required this.locationNames,
    required this.stipend,
    required this.duration,
    required this.postedByLabel,
    required this.postedByLabelType,
    required this.startDate,
    required this.profileName,
  });

  factory Internship.fromJson(Map<String, dynamic> json) {
    return Internship(
      title: json['title'],
      companyName: json['company_name'],
      labels: List<String>.from(json['labels_app_in_card']),
      isWorkFromHome: json['work_from_home'],
      locationNames: List<String>.from(json['location_names']),
      stipend: json['stipend']['salary'],
      duration: json['duration'],
      postedByLabel: json['posted_by_label'],
      postedByLabelType: json['posted_by_label_type'],
      startDate: json['start_date'],
      profileName: json['profile_name'],
    );
  }
}
