import 'package:flutter/material.dart';

class PlaceDetailsScreen extends StatelessWidget {
  final String name;
  final String location;
  final String imageUrl;
  final String duration;

  const PlaceDetailsScreen({
    super.key,
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Back Button
          Positioned(
            top: 50,
            left: 16,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              style: IconButton.styleFrom(
                backgroundColor: Colors.black26,
                padding: const EdgeInsets.all(12),
              ),
            ),
          ),
          // Content
          DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.4,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey[600],
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: Colors.blue, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              location,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                duration,
                                style: const TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Overview',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'This spot provides breathtaking views and remarkable diversity in terms of topography and climate. A perfect destination for nature lovers looking to explore pristine landscapes and experience unique adventures.',
                          style: TextStyle(color: Colors.grey, height: 1.5),
                        ),
                        const SizedBox(height: 24),
                        // Features Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildFeatureItem(Icons.terrain, 'Mountain'),
                            _buildFeatureItem(Icons.wb_sunny, 'Weather'),
                            _buildFeatureItem(Icons.landscape, 'Scenery'),
                          ],
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Book Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.blue),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
