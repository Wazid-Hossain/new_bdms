import 'package:flutter/material.dart';

class DonorDetailsPage extends StatelessWidget {
  final Map<String, String> donor;

  const DonorDetailsPage({super.key, required this.donor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          donor['name']!,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  donor['image']!,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                donor['name']!,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('🩸 Blood Type: ${donor['bloodType']}'),
                      const SizedBox(height: 8),
                      Text('📞 Contact: ${donor['contact']}'),
                      const SizedBox(height: 8),
                      // Text('📱 Emergency: ${donor['emergency']}'),
                      const SizedBox(height: 8),
                      Text('🏠 Address: ${donor['address']}'),
                      const SizedBox(height: 8),
                      Text('🕒 Last Donation: ${donor['lastDonation']}'),
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
                          ),
                          const SizedBox(width: 6),
                          Text(
                            donor['status']!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
