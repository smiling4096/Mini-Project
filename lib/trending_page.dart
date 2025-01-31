import 'package:flutter/material.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trending Now"),
        centerTitle: true,
      ),
      body: ListView(
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
