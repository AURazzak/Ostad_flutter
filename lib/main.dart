import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeScreen(),
    );

  }

}

class HomeScreen extends StatelessWidget {
  final List<String> imageUrls = [
    'https://townsquare.media/site/366/files/2014/12/Linkin-Park.jpg?w=980&q=75',
    'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcTd1_iWo6pkzwjv1s_rcNCEGHfBBM5ct8UuSFPpTXBBlPc_AwImJwXxKJmnQnzPDxNBfUrJN34J2dp74OY',
    'https://i.natgeofe.com/n/16df64db-d138-4fe4-b537-4a5db584131c/linkinpark.jpg',
    'https://phantom-marca.unidadeditorial.es/a739fef8830722affb518668aac28d65/resize/828/f/jpg/assets/multimedia/imagenes/2023/02/10/16760176586593.jpg',
    'https://www.billboard.com/wp-content/uploads/stylus/1004339-Linkin-Park-617.jpg?w=617',
    'https://s.yimg.com/ny/api/res/1.2/UWpuHC6u.4GB4I2xObsnGA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD05ODA-/https://media.zenfs.com/no/gotv_ctitv_com_tw_678/9bede91f82decb1155071f3c4dc67426',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:Center(child: Text('Photo Gallery')),

      ),
      body: SingleChildScrollView(

        padding: EdgeInsets.all(6),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for photos...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ),
            ),
            GridView.builder(

              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Photo ${index + 1} Clicked!!'),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.network(

                          imageUrls[index],
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        Padding(

                          padding: const EdgeInsets.all(4.0),
                          child: Center(child: Text('Photo ${index + 1}')),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Image.network(
                'https://www.billboard.com/wp-content/uploads/2023/02/linkin-park-matrix-reloaded-2003-billboard-1548.jpg',
                height: 80,
                width: 70,
                fit: BoxFit.cover,
              ),
              title: Text('Photo 1'),
              subtitle: Text('Description for Photo 1'),
            ),

            ListTile(
              leading: Image.network(
                'https://i.scdn.co/image/ab6761610000e5eb832fc5db6a21963b110a468b',
                height: 80,
                width: 70,
                fit: BoxFit.cover,
              ),
              title: Text('Photo 2'),
              subtitle: Text('Description for Photo 2'),
            ),

            ListTile(
              leading: Image.network(
                'https://wallpaperaccess.com/full/7111704.jpg',
                height: 80,
                width: 70,
                fit: BoxFit.cover,
              ),
              title: Text('Photo 3'),
              subtitle: Text('Description for Photo 3'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                elevation: 18,
                child: Icon(Icons.upload),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Photos Uploaded Successfully!'),
                    ),
                  );
                },
                //child: Icon(Icons.upload),
              ),
            ),
          ],
        ),
      ),
    );
  }
}