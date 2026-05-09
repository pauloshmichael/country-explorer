import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/country_provider.dart';
import 'detail_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CountryProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Search Country')),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search countries...',

                prefixIcon: const Icon(Icons.search),

                filled: true,

                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),

                  borderSide: BorderSide.none,
                ),
              ),

              onChanged: (value) {
                provider.searchCountries(value);
              },
            ),

            const SizedBox(height: 20),

            if (provider.isSearching) const CircularProgressIndicator(),

            Expanded(
              child: ListView.builder(
                itemCount: provider.searchResults.length,

                itemBuilder: (context, index) {
                  final country = provider.searchResults[index];

                  return Card(
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),

                        child: Image.network(
                          country.flagImage,

                          width: 50,
                          height: 35,

                          fit: BoxFit.cover,
                        ),
                      ),

                      title: Text(country.name),

                      subtitle: Text(country.region),

                      trailing: const Icon(Icons.arrow_forward_ios),

                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => DetailScreen(country: country),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
