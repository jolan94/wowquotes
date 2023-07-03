import 'package:flutter/material.dart';
import 'package:wowquotes/model/quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;

  const QuoteCard({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            quote.quote,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            '- ${quote.author}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
