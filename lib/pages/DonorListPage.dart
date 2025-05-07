import 'package:blood_donetion/pages/DonorCard.dart';
import 'package:blood_donetion/pages/donordata.dart';
import 'package:flutter/material.dart';

class DonorListPage extends StatelessWidget {
  final String bloodType;

  const DonorListPage({super.key, required this.bloodType});

  @override
  Widget build(BuildContext context) {
    final donors = DonorData.getDonorsByBloodType(bloodType);

    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Donors for $bloodType',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final gridCount = _getGridCount(constraints.maxWidth);

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: donors.length,
                  itemBuilder: (context, index) {
                    final donor = donors[index];
                    return DonorCard(donor: donor);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // Function to make grid count responsive based on screen width
  int _getGridCount(double maxWidth) {
    const double minCardWidth = 180; // or 160 if you want tighter fit
    int count = (maxWidth / minCardWidth).floor();
    return count < 1 ? 1 : count;
  }
}

// Function to make grid count responsive based on screen width
int _getGridCount(double maxWidth) {
  const double minCardWidth = 180; // or 160 if you want tighter fit
  int count = (maxWidth / minCardWidth).floor();
  return count < 1 ? 1 : count;
}
