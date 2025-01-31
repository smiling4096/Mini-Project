import 'package:flutter/material.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trending Now"),
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
      body: SingleChildScrollView(
        // This makes the entire page scrollable
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                "Trending Memories",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // Subheading Text Line
              const Text(
                "Scroll through some of our best memories",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),

              // Search Panel
              TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Scrollable Content Section
              Container(
                height: 300, // Set the desired height for the scroll section
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: const [
                      AssetImageWidget(imagePath: 'assets/images/1.jpg'),
                      AssetImageWidget(imagePath: 'assets/images/2.jpg'),
                      AssetImageWidget(imagePath: 'assets/images/3.jpg'),
                      AssetImageWidget(imagePath: 'assets/images/4.jpg'),
                      AssetImageWidget(imagePath: 'assets/images/5.jpg'),
                      AssetImageWidget(imagePath: 'assets/images/6.jpg'),
                      AssetImageWidget(imagePath: 'assets/images/7.jpg'),
                      AssetImageWidget(imagePath: 'assets/images/8.jpg'),
                      AssetImageWidget(imagePath: 'assets/images/9.jpg'),
                      AssetImageWidget(imagePath: 'assets/images/10.jpg'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Login Button at the End
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle login action
                  },
                  child: const Text('Login'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AssetImageWidget extends StatelessWidget {
  final String imagePath;

  const AssetImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(
                Icons.broken_image,
                size: 50,
                color: Colors.grey,
              ),
            );
          },
        ),
      ),
    );
  }
}
