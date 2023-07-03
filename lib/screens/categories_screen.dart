import 'package:flutter/material.dart';
import 'package:wowquotes/screens/quote_list_screen.dart';
import '../utils/dummy_quotes.dart' as dummy_quotes;

class CategoriesScreen extends StatelessWidget {
  final List<String> _categories = dummy_quotes.dummyQuotes.map((quote) => quote.category).toSet().toList();

  CategoriesScreen({super.key}); // Get unique categories

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF000000), Color(0xFF1E1E1E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: _categories.length,
          itemBuilder: (context, index) {
            final category = _categories[index];
            final quotesInCategory = dummy_quotes.dummyQuotes.where((quote) => quote.category == category).toList();
            return ListTile(
              title: Text(
                category,
                style: const TextStyle(color: Colors.white),
              ),
              trailing: const Icon(Icons.arrow_forward, color: Colors.white),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuoteListScreen(quotes: quotesInCategory),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
