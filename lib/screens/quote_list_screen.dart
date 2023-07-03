import 'package:flutter/material.dart';
import 'package:wowquotes/components/quote_card.dart';
import 'package:wowquotes/model/quote.dart';

class QuoteListScreen extends StatelessWidget {
  final List<Quote> quotes;

  QuoteListScreen({required this.quotes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quotes[0].category),
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
          itemCount: quotes.length,
          itemBuilder: (context, index) {
            return QuoteCard(
              quote: quotes[index],
            );
          },
        ),
      ),
    );
  }
}
