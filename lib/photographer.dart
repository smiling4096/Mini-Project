import 'package:flutter/material.dart';

class PhotographerPage extends StatelessWidget {
  const PhotographerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photographers in Gujarat"),
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
              _buildTableHeader("Top Photographers in Gujarat"),
              _buildTable([
                ["Harsh Patel", "9876543210", "Ahmedabad", "₹50,000"],
                ["Kiran Shah", "9876541230", "Ahmedabad", "₹48,000"],
                ["Amit Shah", "9823456789", "Surat", "₹45,000"],
                ["Ravi Solanki", "9823987654", "Surat", "₹43,000"],
                ["Vishal Joshi", "9765432109", "Vadodara", "₹40,000"],
                ["Rohan Trivedi", "9745632109", "Vadodara", "₹38,000"],
                ["Nirav Mehta", "9898765432", "Rajkot", "₹48,000"],
                ["Bhavesh Panchal", "9898761200", "Rajkot", "₹46,000"],
                ["Krunal Desai", "9876098765", "Gandhinagar", "₹42,000"],
                ["Dev Mehta", "9867565432", "Gandhinagar", "₹40,000"],
                ["Dhaval Trivedi", "9765123456", "Bhavnagar", "₹38,000"],
                ["Raj Joshi", "9765234500", "Bhavnagar", "₹35,000"],
                ["Pratik Thakkar", "9988776655", "Jamnagar", "₹35,000"],
                ["Vimal Dave", "9955332211", "Jamnagar", "₹33,000"],
                ["Ronak Bhatt", "9856231470", "Navsari", "₹30,000"],
                ["Sagar Patel", "9844123456", "Navsari", "₹28,000"],
                ["Meet Panchal", "9944225566", "Valsad", "₹28,000"],
                ["Naman Gajjar", "9922334455", "Valsad", "₹26,000"],
                ["Devang Solanki", "9933114455", "Junagadh", "₹25,000"],
                ["Jatin Makwana", "9900223344", "Junagadh", "₹24,000"],
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

  /// Function to create photographers table
  Widget _buildTable(List<List<String>> rows) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        border: TableBorder.all(color: Colors.black),
        columns: const [
          DataColumn(
              label:
                  Text('Name', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Contact Details',
                  style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(
              label:
                  Text('City', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Cost for 1 Event (₹)',
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
