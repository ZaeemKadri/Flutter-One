import 'package:flutter/material.dart';
import 'package:flutter_one/models/disease_info.dart';
import 'package:flutter_one/services/disease_api_service.dart';

class DisplayDiseaseScreen extends StatefulWidget {
  const DisplayDiseaseScreen({super.key});

  @override
  State<DisplayDiseaseScreen> createState() => _DisplayDiseaseScreenState();
}

class _DisplayDiseaseScreenState extends State<DisplayDiseaseScreen> {
  List<DiseaseInfo> disease = [];
  bool isLoading = true;

  @override
  void initState(){
    super.initState();
    fetchData();
  }

  fetchData() async {
    try {
      disease = await DiseaseApiService().fetchDiseaseInfo();
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
      backgroundColor: Colors.green,
      body: isLoading
          ? Center(child: CircularProgressIndicator(),)
          : ListView.builder(
        itemCount: disease.length,
          itemBuilder: (context, index){
            final diseases = disease[index];
            String imageUrl = diseases.image!.isNotEmpty
            ? disease[index].image!.first
            : '';
            return Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                  child: ClipRRect(
                    child: Stack(
                      children: [
                        imageUrl.isNotEmpty
                            ? ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network(imageUrl, height: 100, width: 100, fit: BoxFit.cover,),)
                            : Icon(Icons.image, color: Colors.grey,),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 100,
                          width: 100,
                          child: Text(diseases.diseaseName!, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                        )
                      ],
                    ),
                  )
              ),
            );
          },
      )
    );
  }
}
