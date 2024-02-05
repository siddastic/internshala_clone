import 'package:flutter/material.dart';
import 'package:internshala_search/models/internship.dart';

class FiltersProvider extends ChangeNotifier {
  List<String> _availableProfiles = [];
  List<String> _availableCities = [];
  List<String> _selectedProfiles = [];
  List<String> _selectedCities = [];
  bool? _isWorkFromHome;
  bool? _isPartTime;
  int? _maximumDuration;
  List<Internship> _filteredInternships = [];

  List<Internship> get filteredInternships => _filteredInternships;
  List<String> get availableProfiles => _availableProfiles;
  List<String> get availableCities => _availableCities;
  List<String> get selectedProfiles => _selectedProfiles;
  List<String> get selectedCities => _selectedCities;
  bool? get isWorkFromHome => _isWorkFromHome;
  bool? get isPartTime => _isPartTime;
  int? get maximumDuration => _maximumDuration;
  bool get filtersAvailable =>
      _selectedProfiles.isNotEmpty ||
      _selectedCities.isNotEmpty ||
      _isWorkFromHome != null ||
      _isPartTime != null ||
      _maximumDuration != null;
  int get selectedFiltersCount =>
      _selectedProfiles.length +
      _selectedCities.length +
      (_isWorkFromHome != null ? 1 : 0) +
      (_isPartTime != null ? 1 : 0) +
      (_maximumDuration != null ? 1 : 0);
  List<String> get selectedFilters {
    List<String> filters = [];
    filters.addAll(_selectedProfiles);
    filters.addAll(_selectedCities);
    if (_isWorkFromHome != null) {
      filters.add('Work from home');
    }
    if (_isPartTime != null) {
      filters.add('Part time');
    }
    if (_maximumDuration != null) {
      filters.add('Max duration: $_maximumDuration months');
    }
    return filters;
  }

  void setAvailableProfiles(List<String> profiles) {
    _availableProfiles = profiles;
    notifyListeners();
  }

  void setAvailableCities(List<String> cities) {
    _availableCities = cities;
    notifyListeners();
  }

  void setSelectedProfiles(List<String> profiles) {
    _selectedProfiles = profiles;
    notifyListeners();
  }

  void setSelectedCities(List<String> cities) {
    _selectedCities = cities;
    notifyListeners();
  }

  void setIsWorkFromHome(bool? value) {
    _isWorkFromHome = value;
    notifyListeners();
  }

  void setIsPartTime(bool? value) {
    _isPartTime = value;
    notifyListeners();
  }

  void setMaximumDuration(int? value) {
    _maximumDuration = value;
    notifyListeners();
  }

  void removeProfile(String profile) {
    _selectedProfiles.remove(profile);
    notifyListeners();
  }

  void removeCity(String city) {
    _selectedCities.remove(city);
    notifyListeners();
  }

  void clearAll() {
    _selectedProfiles.clear();
    _selectedCities.clear();
    _isWorkFromHome = null;
    _isPartTime = null;
    _maximumDuration = null;
    _filteredInternships.clear();
    notifyListeners();
  }

  void applyFilters(List<Internship> internships) {
    _filteredInternships = internships.where((internship) {
      if (_selectedProfiles.isNotEmpty &&
          !_selectedProfiles.contains(internship.profileName)) {
        return false;
      }
      if (_selectedCities.isNotEmpty &&
          !_selectedCities.any((city) => internship.locationNames.any(
              (location) =>
                  location.toLowerCase().contains(city.toLowerCase())))) {
        return false;
      }
      if (_isWorkFromHome != null &&
          _isWorkFromHome != internship.isWorkFromHome) {
        return false;
      }
      if (_isPartTime != null &&
          _isPartTime != internship.labels.contains('Part-time')) {
        return false;
      }
      if (_maximumDuration != null &&
          int.parse(internship.duration.split(' ')[0]) > _maximumDuration!) {
        return false;
      }
      return true;
    }).toList();
    notifyListeners();
  }
}
