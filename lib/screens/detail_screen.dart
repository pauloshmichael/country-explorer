import 'package:flutter/material.dart';

import '../models/country.dart';

class DetailScreen extends StatelessWidget {
  final Country country;

  const DetailScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(country.name)),

      body: FutureBuilder(
        future: Future.delayed(const Duration(milliseconds: 500)),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),

            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),

                  child: Image.network(
                    country.flagImage,

                    width: 180,
                    height: 120,

                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 30),

                _buildCard('Country', country.name, Icons.flag),

                _buildCard('Capital', country.capital, Icons.location_city),

                _buildCard('Region', country.region, Icons.public),

                _buildCard(
                  'Population',
                  country.population.toString(),
                  Icons.people,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCard(String title, String value, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),

      child: ListTile(
        leading: Icon(icon, color: Colors.indigo),

        title: Text(title),

        subtitle: Text(
          value,

          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
