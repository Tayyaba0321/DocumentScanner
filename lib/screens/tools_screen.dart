
import 'package:flutter/material.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  final List<Map<String, dynamic>> tools = const [
    {
      'name': 'Image to PDF',
      'description': 'Convert images into PDF',
      'icon': Icons.image,
    },
    {
      'name': 'Merge PDF',
      'description': 'Combine multiple PDF files',
      'icon': Icons.call_merge,
    },
    {
      'name': 'Split PDF',
      'description': 'Separate PDF pages',
      'icon': Icons.content_cut,
    },
    {
      'name': 'Rotate PDF',
      'description': 'Rotate PDF pages',
      'icon': Icons.rotate_right,
    },
    {
      'name': 'Compress PDF',
      'description': 'Reduce PDF file size',
      'icon': Icons.compress,
    },
    {
      'name': 'OCR Scanner',
      'description': 'Extract text from images',
      'icon': Icons.text_snippet,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FC),
      appBar: AppBar(
        title: const Text(
          'PDF Tools',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF123B68),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explore Tools',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF123B68),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Choose a tool to manage your documents.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: GridView.builder(
                itemCount: tools.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.95,
                ),
                itemBuilder: (context, index) {
                  final tool = tools[index];

                  return InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ToolDetailScreen(
                            toolName: tool['name'],
                            description: tool['description'],
                            icon: tool['icon'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE7F2FC),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              tool['icon'],
                              color: const Color(0xFF2878C8),
                              size: 30,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            tool['name'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFF123B68),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            tool['description'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ToolDetailScreen extends StatelessWidget {
  final String toolName;
  final String description;
  final IconData icon;

  const ToolDetailScreen({
    super.key,
    required this.toolName,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FC),
      appBar: AppBar(
        title: Text(toolName),
        backgroundColor: const Color(0xFF123B68),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 75,
                color: const Color(0xFF2878C8),
              ),
              const SizedBox(height: 20),
              Text(
                toolName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF123B68),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 25),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'This feature will be implemented next.',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('Select File'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2878C8),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 14,
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
