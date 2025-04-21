import 'package:flutter/material.dart';
import 'package:flutter_one/models/character_info.dart';
import 'package:flutter_one/services/api_service.dart';
import 'package:flutter_one/screens/display_screen.dart';

class InfoScreen extends StatefulWidget {
  final CharacterInfo character;
  const InfoScreen({super.key, required this.character});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
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
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.character.image != null
                    ? CircleAvatar(
                  backgroundImage: NetworkImage(widget.character.image!),
                  radius: 70,
                )
                    : CircleAvatar(radius: 70, child: Icon(Icons.person_off_outlined),),
              ],
            ),
            SizedBox(height: 15,),
            Text(widget.character.name!, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),
            widget.character.alternateNames != null
            ? Text("Alternate Names: " + widget.character.alternateNames!.join(", "),)
            : SizedBox(),
            SizedBox(height: 15,),
            Text("House: " + widget.character.house!),
            SizedBox(height: 15,),
            Text("Ancestry: " + widget.character.ancestry!),
            SizedBox(height: 15,),
            Text("Eye Colour: " + widget.character.eyeColour!),
            SizedBox(height: 15,),
            Text("Hair Colour: " + widget.character.hairColour!),
            SizedBox(height: 15,),
            Text("Actor: " + widget.character.actor!),
          ],
        ),
      ),
    );
  }
}
