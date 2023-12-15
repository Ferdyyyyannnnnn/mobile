import 'package:flutter/material.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assetsu/wallpaper.jpg', // Ganti dengan path gambar latar belakang ala Spotify
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10),
            Image.asset(
              'assetsu/burger.jpg', // Ganti dengan path gambar album musik Anda
              width: 360, // Mengkecilkan gambar
              height: 360, // Mengkecilkan gambar
            ),
            SizedBox(height: 20),
            Text(
              'Cat BURGER',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              ' POWERRANGERS ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.skip_previous),
                  onPressed: () {
                    // Tambahkan logika tombol previous di sini
                  },
                  iconSize: 32, // Mengkecilkan ikon
                ),
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  onPressed: () {
                    // Tambahkan logika pemutaran musik di sini
                  },
                  iconSize: 48, // Mengkecilkan ikon
                ),
                IconButton(
                  icon: Icon(Icons.skip_next),
                  onPressed: () {
                    // Tambahkan logika tombol next di sini
                  },
                  iconSize: 32, // Mengkecilkan ikon
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '00:45',
                  style: TextStyle(fontSize: 16),
                ),
                Expanded(
                  child: Slider(
                    value: 0.2, // Ganti dengan nilai slider waktu aktual
                    onChanged: (value) {
                      // Tambahkan logika untuk mengatur posisi waktu di sini
                    },
                  ),
                ),
                Text(
                  '03:45',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.volume_up),
                  onPressed: () {
                    // Tambahkan logika untuk mengatur volume
                  },
                  iconSize: 20, // Mengkecilkan ikon
                ),
                Slider(
                  value: 1, // Ganti dengan nilai volume aktual
                  onChanged: (value) {
                    // Tambahkan logika pengaturan volume di sini
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
