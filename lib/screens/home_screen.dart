import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/country_provider.dart';
import 'detail_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<CountryProvider>(context, listen: false).fetchCountries();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CountryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('🌍 Country Explorer'),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,

                MaterialPageRoute(builder: (_) => const SearchScreen()),
              );
            },

            icon: const Icon(Icons.search),
          ),
        ],
      ),

      body: _buildBody(provider),
    );
  }

  Widget _buildBody(CountryProvider provider) {
    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Icon(Icons.wifi_off, size: 90, color: Colors.red),

            const SizedBox(height: 20),

            Text(provider.errorMessage!),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: provider.retryFetch,

              icon: const Icon(Icons.refresh),

              label: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(14),

      itemCount: provider.countries.length,

      itemBuilder: (context, index) {
        final country = provider.countries[index];

        return Card(
          elevation: 4,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),

          child: ListTile(
            contentPadding: const EdgeInsets.all(14),

            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),

              child: Image.network(
                country.flagImage,

                width: 50,
                height: 35,

                fit: BoxFit.cover,

                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.flag, size: 35);
                },
              ),
            ),

            title: Text(
              country.name,

              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

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
    );
  }
}
