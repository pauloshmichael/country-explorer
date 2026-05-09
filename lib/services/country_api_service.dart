import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/country.dart';
import 'api_exception.dart';

class CountryApiService {

  final String _baseUrl =
      'restcountries.com';

  final Duration _timeout =
      const Duration(seconds: 10);

  final Map<String, String> _headers = {

    'Content-Type':
        'application/json',

    'Accept':
        'application/json',
  };

  void _checkResponse(
      http.Response response) {

    if (response.statusCode != 200) {

      throw ApiException(

        message:
            'Server Error',

        statusCode:
            response.statusCode,
      );
    }
  }

  // ==========================
  // FETCH ALL COUNTRIES
  // ==========================

  Future<List<Country>>
      fetchAllCountries() async {

    try {

      final uri = Uri.https(

        _baseUrl,

        '/v3.1/all',

        {
          'fields':
              'name,flag,flags,region,population,capital,cca3'
        },
      );

      final response =
          await http
              .get(
                uri,
                headers: _headers,
              )
              .timeout(_timeout);

      _checkResponse(response);

      final List<dynamic> data =
          json.decode(response.body);

      return data
          .map(
            (e) =>
                Country.fromJson(e),
          )
          .toList();

    } on SocketException {

      throw Exception(
          'No internet connection');

    } on TimeoutException {

      throw Exception(
          'Request timeout');

    } on FormatException {

      throw Exception(
          'Invalid data format');

    } catch (e) {

      throw Exception(
          'Unexpected Error: $e');
    }
  }

  // ==========================
  // SEARCH COUNTRIES
  // ==========================

  Future<List<Country>>
      searchCountries(
          String name) async {

    try {

      final uri = Uri.https(

        _baseUrl,

        '/v3.1/name/$name',
      );

      final response =
          await http
              .get(
                uri,
                headers: _headers,
              )
              .timeout(_timeout);

      _checkResponse(response);

      final List<dynamic> data =
          json.decode(response.body);

      return data
          .map(
            (e) =>
                Country.fromJson(e),
          )
          .toList();

    } on SocketException {

      throw Exception(
          'No internet connection');

    } on TimeoutException {

      throw Exception(
          'Request timeout');

    } catch (e) {

      throw Exception(
          'Search Error: $e');
    }
  }
}