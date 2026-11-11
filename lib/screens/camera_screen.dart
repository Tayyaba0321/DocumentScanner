import 'package:flutter/material.dart';
import '../app_theme.dart';
import 'save_share_screen.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navy,

      appBar: AppBar(
        backgroundColor: AppColors.navy,
        foregroundColor: Colors.white,

        title: const Text(
          'Scan Document',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        iconTheme: const IconThemeData(color: Colors.white),

        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Flash preview is not connected.'),
                ),
              );
            },
            icon: const Icon(Icons.flash_on),
          ),
        ],
      ),

      body: Column(
        children: [

          const SizedBox(height: 20),

          const Text(
            'Position your document inside the frame',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),

          Expanded(
            child: Center(
              child: Container(
                width: 290,
                height: 390,

                decoration: BoxDecoration(
                  color: const Color(0xFF1D3553),
                  border: Border.all(
                    color: Colors.lightBlueAccent,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.document_scanner_outlined,
                      color: Colors.white54,
                      size: 90,
                    ),

                    SizedBox(height: 20),

                    Text(
                      'Document Preview',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      'Camera preview area',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 25,
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Gallery selection is not connected yet.',
                        ),
                      ),
                    );
                  },

                  icon: const Icon(
                    Icons.photo_library_outlined,
                    color: Colors.white,
                    size: 32,
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const SaveShareScreen(),
                      ),
                    );
                  },

                  child: Container(
                    height: 78,
                    width: 78,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: AppColors.blue,
                        width: 7,
                      ),
                    ),

                    child: const Icon(
                      Icons.camera_alt,
                      color: AppColors.navy,
                      size: 32,
                    ),
                  ),
                ),

                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Camera switching is not connected yet.',
                        ),
                      ),
                    );
                  },

                  icon: const Icon(
                    Icons.flip_camera_ios_outlined,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}