import 'package:flutter/material.dart';

class CatererPage extends StatelessWidget {
  const CatererPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Caterers in Gujarat"),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTableHeader("Top Caterers in Gujarat"),
              _buildTable([
                ["Shree Ram Caterers", "Ahmedabad", "₹80,000"],
                ["Rajwadu Caterers", "Ahmedabad", "₹78,000"],
                ["Maharaja Caterers", "Surat", "₹75,000"],
                ["Sangam Caterers", "Surat", "₹72,000"],
                ["Swaad Caterers", "Surat", "₹70,000"],
                ["Patel Caterers", "Surat", "₹68,000"],
                ["Jalaram Caterers", "Vadodara", "₹70,000"],
                ["Annapurna Caterers", "Rajkot", "₹65,000"],
                ["Swagat Caterers", "Gandhinagar", "₹68,000"],
                ["Saffron Caterers", "Bhavnagar", "₹60,000"],
                ["Tirupati Caterers", "Jamnagar", "₹55,000"],
                ["Radhe Caterers", "Jamnagar", "₹53,000"],
                ["Surbhi Caterers", "Navsari", "₹50,000"],
                ["Vimal Caterers", "Navsari", "₹48,000"],
                ["Golden Spoon Caterers", "Navsari", "₹46,000"],
                ["Tasty Bites Caterers", "Navsari", "₹44,000"],
                ["Purohit Caterers", "Valsad", "₹48,000"],
                ["Delight Caterers", "Valsad", "₹46,000"],
                ["Evergreen Caterers", "Valsad", "₹44,000"],
                ["Sattvik Caterers", "Valsad", "₹42,000"],
                ["Royal Feast Caterers", "Junagadh", "₹45,000"],
              ]),
            ],
          ),
        ),
      ),
    );
  }

  /// Function to create table headers
  Widget _buildTableHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  /// Function to create caterers table
  Widget _buildTable(List<List<String>> rows) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        border: TableBorder.all(color: Colors.black),
        columns: const [
          DataColumn(
              label: Text('Caterer Group',
                  style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(
              label:
                  Text('City', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Cost per Event (₹)',
                  style: TextStyle(fontWeight: FontWeight.bold))),
        ],
        rows: rows.map((row) {
          return DataRow(
            cells: row.map((cell) => DataCell(Text(cell))).toList(),
          );
        }).toList(),
      ),
    );
  }
}
