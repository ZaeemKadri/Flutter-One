import 'package:flutter/material.dart';

class Codefile extends StatefulWidget {
  const Codefile({super.key});

  @override
  State<Codefile> createState() => _CodefileState();
}

class _CodefileState extends State<Codefile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Expanded(
                child: Row(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Search Books By Name Or Subject",
                          prefixIcon: Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                        ),
                      ),
                    ],
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
