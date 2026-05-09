import 'package:flutter/material.dart';

import '../models/country.dart';
import '../services/country_api_service.dart';

class CountryProvider
    extends ChangeNotifier {

  final CountryApiService
      _apiService =
      CountryApiService();

  List<Country> _countries = [];

  List<Country> _searchResults = [];

  bool _isLoading = false;

  bool _isSearching = false;

  String? _errorMessage;

  // ==========================
  // GETTERS
  // ==========================

  List<Country> get countries =>
      _countries;

  List<Country> get searchResults =>
      _searchResults;

  bool get isLoading =>
      _isLoading;

  bool get isSearching =>
      _isSearching;

  String? get errorMessage =>
      _errorMessage;

  // ==========================
  // FETCH COUNTRIES
  // ==========================

  Future<void>
      fetchCountries() async {

    _isLoading = true;

    _errorMessage = null;

    notifyListeners();

    try {

      _countries =
          await _apiService
              .fetchAllCountries();

    } catch (e) {

      _errorMessage = e.toString();

    } finally {

      _isLoading = false;

      notifyListeners();
    }
  }

  // ==========================
  // SEARCH COUNTRIES
  // ==========================

  Future<void>
      searchCountries(
          String query) async {

    if (query.trim().isEmpty) {

      _searchResults = [];

      notifyListeners();

      return;
    }

    _isSearching = true;

    _errorMessage = null;

    notifyListeners();

    try {

      _searchResults =
          await _apiService
              .searchCountries(
                  query);

    } catch (e) {

      _errorMessage = e.toString();

    } finally {

      _isSearching = false;

      notifyListeners();
    }
  }

  // ==========================
  // RETRY
  // ==========================

  Future<void> retryFetch() async {

    await fetchCountries();
  }

  // ==========================
  // CLEAR SEARCH
  // ==========================

  void clearSearch() {

    _searchResults = [];

    notifyListeners();
  }
}