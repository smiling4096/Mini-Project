import 'package:flutter/material.dart';
import 'location.dart';
import 'caterer.dart';
import 'photographer.dart';
import 'cart.dart';
import 'chatbot.dart';
import 'team.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  bool isAtTop = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          isAtTop = _scrollController.offset <= 0;
        });
      });
  }

  void scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink.shade200, Colors.purple.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategoryCard(context, "Location", "assets/images/h1.jpg",
                  const LocationPage()),
              _buildCategoryCard(context, "Caterers", "assets/images/h2.jpg",
                  const CatererPage()),
              _buildCategoryCard(context, "Photographers",
                  "assets/images/h3.jpg", const PhotographerPage()),
              _buildCategoryCard(context, "Cost", "assets/images/h4.jpg",
                  const CartPage()), // Example navigation
              _buildCategoryCard(context, "Offers", "assets/images/h5.jpg",
                  const CartPage()), // Example navigation
              _buildCategoryCard(context, "Decoration", "assets/images/h6.jpg",
                  const CartPage()), // Example navigation
              _buildCategoryCard(
                  context,
                  "Screening (For Formal Events Only)",
                  "assets/images/screening.jpg",
                  const CartPage()), // Example navigation
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBottomIcon(
                  isAtTop
                      ? "assets/images/button1.jpg"
                      : "assets/images/button5.jpg", () {
                if (!isAtTop) scrollToTop();
              }),
              _buildBottomIcon("assets/images/button2.jpg", () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
              }),
              _buildBottomIcon("assets/images/button3.jpg", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChatbotPage()));
              }),
              _buildBottomIcon("assets/images/button4.jpg", () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TeamPage()));
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, String title, String imagePath, Widget page) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomIcon(String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(imagePath, width: 40, height: 40), // Increased size
    );
  }
}
