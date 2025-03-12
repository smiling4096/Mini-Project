import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meet Our Team"),
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
        child: Column(
          children: [
            _buildTeamMemberCard(
              name: "Amee Abhilash Desai",
              position: "Event Manager",
              contact: "9327957711",
              email: "ameedesai4096@gmail.com",
              address: "Surat",
              education: "B.Tech [IT]",
            ),
            const SizedBox(height: 20),
            _buildTeamMemberCard(
              name: "Tamanna Ketankumar Pithadia", // UPDATED NAME
              position: "Event Manager",
              contact: "8160762757",
              email: "tamanna.pithadia@gmail.com", // UPDATED EMAIL
              address: "Vyara",
              education: "B.Tech [IT]",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMemberCard({
    required String name,
    required String position,
    required String contact,
    required String email,
    required String address,
    required String education,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0)
                .withValues(red: 0, green: 0, blue: 0, alpha: 50),
            blurRadius: 5,
            offset: const Offset(-3, 3), // Bottom-left shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Name: $name", style: _infoTextStyle()),
          Text("Position: $position", style: _infoTextStyle()),
          Text("Contact: $contact", style: _infoTextStyle()),
          Text("Email: $email", style: _infoTextStyle()),
          Text("Address: $address", style: _infoTextStyle()),
          Text("Education: $education", style: _infoTextStyle()),
        ],
      ),
    );
  }

  TextStyle _infoTextStyle() {
    return const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  }
}
