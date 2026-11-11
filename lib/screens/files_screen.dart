import 'package:flutter/material.dart';
import '../app_theme.dart';

class FilesScreen extends StatefulWidget {
  const FilesScreen({super.key});

  @override
  State<FilesScreen> createState() => _FilesScreenState();
}

class _FilesScreenState extends State<FilesScreen> {
  final searchController = TextEditingController();

  final List<String> documents = [
    'Assignment.pdf',
    'My Notes.pdf',
    'Report.pdf',
    'Lecture Notes.pdf',
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredDocuments = documents.where((file) {
      return file.toLowerCase().contains(
        searchController.text.toLowerCase(),
      );
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text(
          'My Files',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.navy,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextField(
              controller: searchController,

              onChanged: (value) {
                setState(() {});
              },

              decoration: const InputDecoration(
                hintText: 'Search your documents',
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.blue,
                ),
              ),
            ),

            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'All Documents',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.navy,
                  ),
                ),

                Text(
                  '${filteredDocuments.length} Files',
                  style: const TextStyle(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            Expanded(
              child: filteredDocuments.isEmpty
                  ? const Center(
                child: Text(
                  'No documents found',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 16,
                  ),
                ),
              )
                  : ListView.builder(
                itemCount: filteredDocuments.length,

                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 13),
                    padding: const EdgeInsets.all(15),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                    ),

                    child: Row(
                      children: [

                        Container(
                          height: 55,
                          width: 55,

                          decoration: BoxDecoration(
                            color: AppColors.lightBlue,
                            borderRadius: BorderRadius.circular(13),
                          ),

                          child: const Icon(
                            Icons.picture_as_pdf,
                            color: AppColors.blue,
                            size: 30,
                          ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                filteredDocuments[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: AppColors.navy,
                                ),
                              ),

                              const SizedBox(height: 6),

                              const Text(
                                'PDF Document',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == 'delete') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Sample files cannot be deleted.',
                                  ),
                                ),
                              );
                            }
                          },

                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete'),
                            ),
                          ],
                        ),
                      ],
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