import 'package:flutter/material.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file_plus/open_file_plus.dart';

class UploadPdfScreen extends StatefulWidget {
  const UploadPdfScreen({super.key});

  @override
  State<UploadPdfScreen> createState() => _UploadPdfScreenState();
}

class _UploadPdfScreenState extends State<UploadPdfScreen> {
  String? _selectedFilePath;

  Future<void> _pickPdf() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.single.path != null) {
        setState(() {
          _selectedFilePath = result.files.single.path!;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No PDF file selected')),
        );
      }
    } catch (e) {
      debugPrint('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick PDF: ${e.toString()}')),
      );
    }
  }

  void _showOpenWithDialog() {
    if (_selectedFilePath == null) return;

    OpenFile.open(_selectedFilePath!);

  }

  String truncateFileName(String fileName, {int maxLength = 25}) {
    if (fileName.length <= maxLength) return fileName;

    final extIndex = fileName.lastIndexOf('.');
    if (extIndex == -1) return fileName.substring(0, maxLength) + '...';

    final namePart = fileName.substring(0, extIndex);
    final extension = fileName.substring(extIndex);

    if (namePart.length > maxLength - extension.length - 3) {
      return namePart.substring(0, maxLength - extension.length - 3) + '...' + extension;
    } else {
      return fileName;
    }
  }

  void openPdfWithOtherApp(String filePath) {
    OpenFile.open(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: (){
                    _pickPdf();
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                    ),
                    child: Text("Search File"),
                  ),
                ),
                SizedBox(width: 10,),
                const SizedBox(height: 20),
                if (_selectedFilePath != null)
                  Expanded(
                    child: InkWell(
                      onTap: _showOpenWithDialog,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          truncateFileName(_selectedFilePath!.split('/').last),
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
              ],
            )
          ],
        )
      ),
    );
  }
}
