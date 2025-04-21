import 'package:flutter/material.dart';
import 'package:flutter_one/services/api_service.dart';
import 'package:flutter_one/models/character_info.dart';
import 'package:flutter_one/screens/info_screen.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({super.key});

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  List<CharacterInfo> characters = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    try {
      characters = await ApiService().fetchCharacters();
    } catch (e) {
      print(e);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Harry Potter Characters')),
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final character = characters[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen(character: character,),));
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(character.image ?? ''),
                  backgroundColor: Colors.grey[200],
                ),
                title: Text(character.name ?? 'Unknown'),
                subtitle: Text(character.house ?? 'No House'),
                trailing: Text(character.actor ?? 'No Actor'),
              ),
            )
          );
        },
      ),
    );
  }
}
