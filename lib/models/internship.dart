class Internship {
  final String title;
  final String company_name;
  final List<String> labels;
  final bool isWorkFromHome;
  final List<String> location_names;
  final String stipend;
  final String duration;
  final String postedByLabel;
  final String postedByLabelType;
  final String start_date;

  Internship({
    required this.title,
    required this.company_name,
    required this.labels,
    required this.isWorkFromHome,
    required this.location_names,
    required this.stipend,
    required this.duration,
    required this.postedByLabel,
    required this.postedByLabelType,
    required this.start_date,
  });

  factory Internship.fromJson(Map<String, dynamic> json) {
    return Internship(
      title: json['title'],
      company_name: json['company_name'],
      labels: List<String>.from(json['labels_app_in_card']),
      isWorkFromHome: json['work_from_home'],
      location_names: List<String>.from(json['location_names']),
      stipend: json['stipend']['salary'],
      duration: json['duration'],
      postedByLabel: json['posted_by_label'],
      postedByLabelType: json['posted_by_label_type'],
      start_date: json['start_date'],
    );
  }
}
