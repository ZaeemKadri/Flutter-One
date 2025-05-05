import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  String selectedView = "Description";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTab("Description"),
                    SizedBox(width: 10,),
                    _buildTab("How It Works"),
                    SizedBox(width: 10,),
                    _buildTab("What's Inside"),
                  ],
                ),
                SizedBox(height: 10,),
                SizedBox(
                  child: _buildContainer(),
                ),
              ],
            )
        ),
      )
    );
  }

  Widget _buildTab(String title) {
    return Expanded(
      child: InkWell(
        onTap: (){
          setState(() {
            selectedView = title;
          });
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: selectedView == title ? Color(0xFF003706) : Color(0xFFA1D8A6),
          ),
          child: Center(
            child: Text(title, style: TextStyle(color: selectedView == title ? Colors.white : Color(0xFF003706), fontWeight: FontWeight.bold),),
          ),
        ),
      )
    );
  }

  Widget _buildContainer() {
    if (selectedView == "Description"){
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ease Your Period Naturally", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),
            Text("This fresh herbal decoration with drumstick, ginger, fennel, and tumeric helps reduce menstrual cramps with natural anti-infalmatory properties. start sipping a week before your period for smoother, more comfortable days."),
            SizedBox(height: 15,),
            Text("100% Fresh & Natural\nDelivered daily to your doorstep\nJust sip. Feel better."),
          ],
        ),
      );
    } else if (selectedView == "How It Works"){
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("How It Works", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),
            Text("Description"),
            SizedBox(height: 15,),
            Text("abx"),
          ],
        ),
      );
    } else {
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("What's Inside", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),
            Text("Description"),
            SizedBox(height: 15,),
            Text("xyz"),
          ],
        ),
      );
    }
  }
}
