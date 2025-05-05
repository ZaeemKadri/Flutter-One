import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_one/models/medicine_model.dart';
import 'package:flutter_one/services/medicine_api_service.dart';

class MedicineDisplayScreen extends StatefulWidget {
  const MedicineDisplayScreen({super.key});

  @override
  State<MedicineDisplayScreen> createState() => _MedicineDisplayScreenState();
}

class _MedicineDisplayScreenState extends State<MedicineDisplayScreen> {
  List<MedicineModel> medicine = [];
  bool isLoading = true;

  @override
  void initState(){
    super.initState();
    fetchData();
  }

  fetchData() async{
    try{
      medicine = await MedicineApiService().fetchMedicineInfo();
    }
    catch (e){
      print(e);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: isLoading
            ? Center(child: CircularProgressIndicator(),)
            : ListView.builder(
          itemCount: medicine.length,
          itemBuilder: (context, index){
            final medicines = medicine[index];
            String image1Url = medicines.image1!.isNotEmpty
            ? medicine[index].image1!
                : '';
            String image2Url = medicines.image2!.isNotEmpty
                ? medicine[index].image2!
                : '';
            String image3Url = medicines.image3!.isNotEmpty
                ? medicine[index].image3!
                : '';
            print('Image URL: $image1Url');
            print('Image URL: $image2Url');
            print('Image URL: $image3Url\n');
            return Center(
              child: Row(
                children: [
                  ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.network(image1Url, height: 100, width: 100, fit: BoxFit.cover,),),
                  ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.network(image2Url, height: 100, width: 100, fit: BoxFit.cover,),),
                  ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.network(image3Url, height: 100, width: 100, fit: BoxFit.cover,),),
                ],
              )
            );
          },

        )
      ),
    );
  }
}
