import 'package:flutter/material.dart';

class CompactCourseItem extends StatelessWidget {
  final String courseTitle;
  final String bannerImageUrl;
  final String batchInfo;
  final String seatsInfo;
  final String daysInfo;
  final VoidCallback onSeeDetails;

  const CompactCourseItem({
    Key? key,
    required this.courseTitle,
    required this.bannerImageUrl,
    required this.batchInfo,
    required this.seatsInfo,
    required this.daysInfo,
    required this.onSeeDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Banner (Reduced height)
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              bannerImageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 100,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, size: 30),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Course Title (Compact)
                Text(
                  courseTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 10),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCompactInfo(Icons.group, batchInfo),
                      const SizedBox(width: 8),
                      _buildCompactInfo(Icons.event_seat_outlined, seatsInfo),
                      const SizedBox(width: 8),
                      _buildCompactInfo(Icons.access_time, daysInfo),
                    ],
                  ),
                ),

                const SizedBox(height: 4),

                // Compact Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onSeeDetails,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      textStyle: const TextStyle(fontSize: 12),
                    ),
                    child: const Text('See Details', style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompactInfo(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 8, color: Colors.grey.shade700),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class CourseGridScreen2 extends StatelessWidget {
  final List<Map<String, String>> courses = [
    {
      'title': 'Full stack web development with JavaScripts(MERN)',
      'banner': 'assets/images/img1.jpg',
      'batch': 'Batch 5',
      'seats': '10 left',
      'days': '30 days',
    },

    {
      'title': 'Full stack web development with Python, Django)',
      'banner': 'assets/images/img2.jpg',
      'batch': 'Batch 3',
      'seats': '5 left',
      'days': '45 days',
    },
    {
      'title': 'Full stack web development with ReAct, Python)',
      'banner': 'assets/images/img2.jpg',
      'batch': 'Batch 7',
      'seats': '15 left',
      'days': '21 days',
    },

    {
      'title': 'SQA: Manual and Automated testing)',
      'banner': 'assets/images/img3.jpg',
      'batch': 'Batch 4',
      'seats': '12 left',
      'days': '28 days',
    },
  ];

  CourseGridScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Courses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.65, // Adjusted for compact design
          ),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return CompactCourseItem(
              courseTitle: course['title']!,
              bannerImageUrl: course['banner']!,
              batchInfo: course['batch']!,
              seatsInfo: course['seats']!,
              daysInfo: course['days']!,
              onSeeDetails: () {
                print('See details for: ${course['title']}');
              },
            );
          },
        ),
      ),
    );
  }
}
