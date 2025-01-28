import 'package:flutter/material.dart';
import 'dart:io'; // Importing dart:io to work with File images

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of image file paths (local images)
    final List<String> imageUrls = [
      "E:/Desktop/eclectic/1.jpg", // Local image 1
      "E:/Desktop/eclectic/2.jpg", // Local image 2
      "E:/Desktop/eclectic/3.jpg", // Local image 3
      "E:/Desktop/eclectic/4.jpg", // Local image 4
      "E:/Desktop/eclectic/5.jpg", // Local image 5
      "E:/Desktop/eclectic/6.jpg", // Local image 6
      "E:/Desktop/eclectic/7.jpg", // Local image 7
      "E:/Desktop/eclectic/8.jpg", // Local image 8
      "E:/Desktop/eclectic/9.jpg", // Local image 9
      "E:/Desktop/eclectic/10.jpg", // Local image 10
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Now'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Trending Header
          const TrendingHeader(),

          // Search Bar
          const SearchBar(),

          // Display Image List (Instead of Carousel)
          Expanded(
            child: ImageList(imageUrls: imageUrls),
          ),

          // Login Button at the bottom of the page
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // You can add your login navigation logic here
                showDialog(
                  context: context,
                  builder: (_) => const AlertDialog(
                    title: Text('Login button clicked'),
                  ),
                );
              },
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}

// Model 1: Trending Header
class TrendingHeader extends StatelessWidget {
  const TrendingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.pinkAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Trending Now",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Explore what's happening!",
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

// Model 2: Search Bar
class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

// Model 3: Image List (Replaces Carousel)
class ImageList extends StatelessWidget {
  final List<String> imageUrls;

  const ImageList({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imageUrls.length,
      itemBuilder: (BuildContext context, int index) {
        final filePath = imageUrls[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[200],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: filePath.isNotEmpty
                ? Image.file(
                    File(filePath), // Load the local image file
                    fit: BoxFit.cover,
                    height: 200, // Fixed height for each image
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
