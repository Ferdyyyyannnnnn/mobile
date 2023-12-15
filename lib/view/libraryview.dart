import 'package:flutter/material.dart';
import 'package:spotify/model/api.dart';

class MusicLibraryController {
  Future<String> fetchImage() async {
    return MusicApi.fetchImage();
  }
}

class MusicLibraryView extends StatelessWidget {
  final MusicLibraryController controller;

  const MusicLibraryView(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: controller.fetchImage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); 
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final imageUrl = snapshot.data;

          if (imageUrl == null) {
            return const Text(
                'Gambar tidak tersedia'); // Menangani kasus gambar tidak tersedia
          }

          return Image.network(
              'https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228'); // Menampilkan gambar dari URL
        }
      },
    );
  }
}
