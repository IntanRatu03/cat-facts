// lib/pages/cat_facts_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cat_fact_provider.dart';

class CatFactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Facts'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 219, 206, 30),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[200]!, Colors.teal[50]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FutureBuilder(
          future: Provider.of<CatFactProvider>(context, listen: false)
              .fetchCatFacts(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.error != null) {
              return Center(child: Text('An error occurred!'));
            } else {
              return Consumer<CatFactProvider>(
                builder: (ctx, catFactProvider, child) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemBuilder: (ctx, index) {
                      final catFact = catFactProvider.catFacts[index];
                      return Card(
                        elevation: 8, // Meningkatkan elevasi untuk bayangan yang lebih baik
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // Menambahkan border radius
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'https://img.freepik.com/free-vector/flat-international-cat-day-background_52683-87035.jpg?ga=GA1.1.1779501480.1717487716&semt=ais_hybrid',
                                height: 120,
                                fit: BoxFit.cover,
                                // Menambahkan border radius pada gambar
                                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: child,
                                  );
                                },
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                catFact.fact,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
