import 'package:flutter/material.dart';
import 'package:get_api_class2/data/Models/PhotosModel.dart';
import 'package:get_api_class2/domain/photos_provider/photos_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final photosProvider = Provider.of<PhotosProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Api Example Two'),
      ),
      body: FutureBuilder(
        future: photosProvider.getPhotos(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: photosProvider.photosList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      Text('ID : ' +
                          photosProvider.photosList[index].id.toString()),
                    ],
                  ),
                  subtitle: Text('Title : ' +
                      photosProvider.photosList[index].title.toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
