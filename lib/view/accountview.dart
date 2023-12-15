import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // Import dart:io untuk menggunakan File
import 'package:webview_flutter/webview_flutter.dart';

class UserProfileView extends StatelessWidget {
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      final imageUrl = pickedFile.path;
      profileController.setImageUrl(imageUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              final imageUrl = profileController.imageUrl.value;
              return CircleAvatar(
                radius: 120,
                backgroundImage:
                    imageUrl.isNotEmpty ? FileImage(File(imageUrl)) : null,
              );
            }),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.camera),
                  child: const Row(
                    children: [
                      Icon(Icons.camera_alt), // Icon kamera
                      Text('Ambil Foto'),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  child: const Row(
                    children: [
                      Icon(Icons.image), // Icon galeri
                      Text('Pilih Galeri'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WebPageView(),
                ));
              },
              child: const Row(
                children: [
                  Icon(Icons.web), // Icon untuk WebView
                  Text('Buka Web'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300, // Sesuaikan lebar WebView sesuai kebutuhan
              height: 300, // Sesuaikan tinggi WebView sesuai kebutuhan
              child: WebView(
                initialUrl:
                    'https://flutter.dev/', // Ganti URL sesuai kebutuhan
                javascriptMode: JavascriptMode.unrestricted,
                onWebResourceError: (WebResourceError error) {
                  print('WebView error: ${error.description}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

WebView(
    {required String initialUrl,
    required javascriptMode,
    required Null Function(WebResourceError error) onWebResourceError}) {}

mixin JavascriptMode {
  static var unrestricted;
}

class WebPageView extends StatelessWidget {
  final CController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://flutter.dev'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Page'),
      ),
      body: WebViewWidget(
        controller: CController,

        // initialUrl: 'https://www.youtube.com/', // Ganti URL sesuai kebutuhan
        // javascriptMode: JavascriptMode.unrestricted,
        // onWebResourceError: (WebResourceError error) {
        //   print('WebView error: ${error.description}');
        // },
      ),
    );
  }
}

class ProfileController extends GetxController {
  RxString imageUrl = ''.obs;

  void setImageUrl(String url) {
    imageUrl.value = url;
  }
}

final profileController = ProfileController();
