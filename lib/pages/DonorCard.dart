import 'package:blood_donetion/pages/DonorDetailsPage.dart';
import 'package:flutter/material.dart';

class DonorCard extends StatelessWidget {
  final Map<String, String> donor;

  const DonorCard({super.key, required this.donor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DonorDetailsPage(donor: donor),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.red.shade100,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
          image: DecorationImage(
            image: AssetImage(donor['image']!),
            fit: BoxFit.cover,
            opacity: 0.3,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                donor['image']!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                donor['name']!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('📞 ${donor['contact']}'),
                    // Text('📱 Emergency: ${donor['emergency']}'),
                    Text('🏠 ${donor['address']}'),
                    const SizedBox(height: 8),
                    Text('🩸 Last Donation: ${donor['lastDonation']}'),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          donor['status'] == 'Available'
                              ? Icons.check_circle
                              : Icons.cancel,
                          color: donor['status'] == 'Available'
                              ? Colors.green
                              : Colors.red,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          donor['status']!,
                          style: TextStyle(
                            color: donor['status'] == 'Available'
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
