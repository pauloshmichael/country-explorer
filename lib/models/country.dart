class Country {
  final String name;
  final String flag;
  final String flagImage;
  final String region;
  final String capital;
  final int population;
  final String alpha3Code;

  const Country({
    required this.name,
    required this.flag,
    required this.flagImage,
    required this.region,
    required this.capital,
    required this.population,
    required this.alpha3Code,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'] ?? '',

      flag: json['flag'] ?? '',

      flagImage: json['flags']['png'] ?? '',

      region: json['region'] ?? '',

      capital: (json['capital'] != null && json['capital'].isNotEmpty)
          ? json['capital'][0]
          : 'N/A',

      population: json['population'] ?? 0,

      alpha3Code: json['cca3'] ?? '',
    );
  }
}
