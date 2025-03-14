import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // ✅ Import Firebase
import 'trending_page.dart'; // Import the trending_page.dart file
import 'splashscreen.dart'; // Import the separate splash screen file

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // ✅ Ensures async code runs properly
  await Firebase.initializeApp(); // ✅ Initializes Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eclectic',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(), // Start with SplashScreen
    );
  }
}

class SimplePage extends StatelessWidget {
  const SimplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eclectic'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Welcome to Eclectic – where every moment is an opportunity to discover, connect, and celebrate the beauty of life's events.",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const TrendingPage(), // Navigate to TrendingPage
                  ),
                );
              },
              child: const Text('Begin Your Journey'),
            ),
          ],
        ),
      ),
    );
  }
}
