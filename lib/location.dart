import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Locations"),
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
              _buildTableHeader("Marriage Venues"),
              _buildTable([
                ["Royal Banquet Hall", "Ahmedabad", "₹75,000"],
                ["Luxury Lawn", "Surat", "₹60,000"],
                ["Sunrise Garden", "Vadodara", "₹50,000"],
                ["Pearl Grand Hall", "Rajkot", "₹65,000"],
                ["Golden Palace", "Gandhinagar", "₹80,000"],
              ]),
              _buildTableHeader("Baby Shower Venues"),
              _buildTable([
                ["Blossom Banquet", "Surat", "₹40,000"],
                ["Sweet Memories Hall", "Ahmedabad", "₹35,000"],
                ["Little Angels Lawn", "Vadodara", "₹38,000"],
                ["Moments Hall", "Rajkot", "₹42,000"],
                ["Happy Nest", "Navsari", "₹30,000"],
              ]),
              _buildTableHeader("Engagement Venues"),
              _buildTable([
                ["Emerald Banquet", "Gandhinagar", "₹55,000"],
                ["Sapphire Lawn", "Surat", "₹50,000"],
                ["Diamond Palace", "Vadodara", "₹45,000"],
                ["Infinity Hall", "Bhavnagar", "₹52,000"],
                ["Serene Hall", "Jamnagar", "₹48,000"],
              ]),
              _buildTableHeader("Birthday Party Venues"),
              _buildTable([
                ["Fun World Party Hall", "Surat", "₹25,000"],
                ["Celebration Junction", "Ahmedabad", "₹22,000"],
                ["Little Stars Banquet", "Vadodara", "₹20,000"],
                ["Kids Paradise", "Rajkot", "₹28,000"],
                ["Fantasy Party Hall", "Valsad", "₹18,000"],
              ]),
              _buildTableHeader("Formal Party Venues"),
              _buildTable([
                ["Corporate Elite Hall", "Ahmedabad", "₹70,000"],
                ["Business Lounge", "Surat", "₹65,000"],
                ["Executive Banquet", "Vadodara", "₹60,000"],
                ["Boardroom Grand", "Rajkot", "₹68,000"],
                ["Skyline Business Hall", "Junagadh", "₹55,000"],
              ]),
              _buildTableHeader("Formal Conference Venues"),
              _buildTable([
                ["Summit Convention Center", "Ahmedabad", "₹90,000"],
                ["Grand Conference Hall", "Surat", "₹85,000"],
                ["Corporate Hub", "Vadodara", "₹80,000"],
                ["The Business Arena", "Rajkot", "₹95,000"],
                ["Cityview Conference Center", "Jamnagar", "₹75,000"],
              ]),
              _buildTableHeader("Seminar Venues"),
              _buildTable([
                ["IIM Ahmedabad", "Ahmedabad", "₹1,50,000"],
                ["MS University", "Vadodara", "₹1,20,000"],
                ["SVNIT Auditorium", "Surat", "₹1,00,000"],
                ["GTU Convention Center", "Gandhinagar", "₹1,30,000"],
                ["Town Hall", "Rajkot", "₹80,000"],
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

  /// Function to create event tables
  Widget _buildTable(List<List<String>> rows) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        border: TableBorder.all(color: Colors.black),
        columns: const [
          DataColumn(
              label: Text('Location',
                  style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(
              label:
                  Text('City', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Costing (₹)',
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
