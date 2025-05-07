import 'package:blood_donetion/pages/DonorListPage.dart';
import 'package:blood_donetion/pages/donordata.dart';
import 'package:flutter/material.dart';

class BloodTypeSelectionPage extends StatefulWidget {
  const BloodTypeSelectionPage({super.key});

  @override
  State<BloodTypeSelectionPage> createState() => _BloodTypeSelectionPageState();
}

class _BloodTypeSelectionPageState extends State<BloodTypeSelectionPage> {
  final List<String> bloodTypes = const [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];

  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredDonors = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();

    setState(() {
      if (query.isEmpty) {
        _filteredDonors = [];
      } else {
        final allDonors = DonorData.getAllDonors();
        _filteredDonors = allDonors
            .where((donor) => donor['name']!.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Search or Select Blood Type',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔍 Search bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Donor by Name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 🔁 Show either search results or blood type grid
            Expanded(
              child: _searchController.text.isNotEmpty
                  ? _buildSearchResults()
                  : _buildBloodTypeGrid(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBloodTypeGrid(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5,
      ),
      itemCount: bloodTypes.length,
      itemBuilder: (context, index) {
        final type = bloodTypes[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DonorListPage(bloodType: type),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.red.shade100,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                type,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchResults() {
    if (_filteredDonors.isEmpty) {
      return const Center(child: Text("No donor found."));
    }

    return ListView.builder(
      itemCount: _filteredDonors.length,
      itemBuilder: (context, index) {
        final donor = _filteredDonors[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(donor['image']!),
            ),
            title: Text(donor['name']!),
            subtitle: Text('${donor['contact']} • ${donor['bloodType']}'),
            trailing: Icon(
              donor['status'] == 'Available'
                  ? Icons.check_circle
                  : Icons.cancel,
              color: donor['status'] == 'Available' ? Colors.green : Colors.red,
            ),
          ),
        );
      },
    );
  }
}
