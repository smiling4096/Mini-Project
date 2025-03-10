import 'package:flutter/material.dart';
import 'signup.dart'; // Import SignUpPage

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBarWidget(),
      body: const _BodyWidget(),
    );
  }
}

class _AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarWidget();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Eclectic'),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/11.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _LoginForm(),
                const SizedBox(height: 20),
                const _LoginButton(),
                const SizedBox(height: 20),
                _CreateAccountButton(), // Navigate to SignUp Page
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TextFieldWidget(label: 'Username', obscureText: false),
        const SizedBox(height: 20),
        _TextFieldWidget(label: 'Password', obscureText: true),
      ],
    );
  }
}

class _TextFieldWidget extends StatelessWidget {
  final String label;
  final bool obscureText;

  const _TextFieldWidget({required this.label, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.blueGrey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blueGrey, width: 1.5),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle login action here
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        'Login',
        style: TextStyle(color: Colors.blueAccent),
      ),
    );
  }
}

class _CreateAccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to Sign Up Page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignUpPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        'Create Account if you don\'t have one',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
