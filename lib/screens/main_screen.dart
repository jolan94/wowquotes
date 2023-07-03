import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wowquotes/components/quote_card.dart';
import 'package:wowquotes/model/quote.dart';
import 'package:wowquotes/screens/categories_screen.dart';
import '../utils/dummy_quotes.dart' as dummy_quotes;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isFav = false;
  Quote _currentQuote = dummy_quotes.dummyQuotes[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF000000), Color(0xFF1E1E1E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                children: [
                  // Image.asset(
                  //   'assets/images/background.jpg',
                  //   fit: BoxFit.cover,
                  //   height: double.infinity,
                  //   width: double.infinity,
                  // ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          const Color(0xFF1E1E1E).withOpacity(0.8),
                          const Color(0xFF1E1E1E),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Center(
                      child: QuoteCard(
                        quote: _currentQuote,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 20,
                    child: IconButton(
                      icon: const Icon(
                        Icons.category,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoriesScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: 20,
                    child: IconButton(
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isFav = !isFav;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentQuote = dummy_quotes.dummyQuotes[Random().nextInt(dummy_quotes.dummyQuotes.length)];
                });
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'New Quote',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
