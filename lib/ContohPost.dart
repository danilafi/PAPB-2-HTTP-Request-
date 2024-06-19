import 'package:flutter/material.dart';
import 'PostResultModel.dart';

// |Danila Fitria - Tugas PAPB - HTTP Request|

//StatefulWidget
class ContohPost extends StatefulWidget {
  const ContohPost({Key? key}) : super(key: key);

  @override
  State<ContohPost> createState() => _ContohPostState();
}

class _ContohPostState extends State<ContohPost> {
  PostResultModel? postResultModel; //Menyimpan hasil dari POST request

  @override
  Widget build(BuildContext context) {
    //MaterialApp dan Scaffold
    return MaterialApp(
      home: Scaffold(
        //AppBar menampilkan judul aplikasi
        appBar: AppBar(
          title: const Text("Danila Fitria | Tugas 02 PAPB - HTTP REQUEST"),
          backgroundColor: Color.fromARGB(255, 120, 178, 255),
        ),
        //Body
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text((postResultModel != null)
                  ? postResultModel!.id +
                      " | " +
                      postResultModel!.name +
                      " | " +
                      postResultModel!.job +
                      " | " +
                      postResultModel!.dibuatPada
                  : "Tidak Ada Data"),
              ElevatedButton(
                  onPressed: () {
                    PostResultModel.hubungkanAPI("Danila Fitria", "Mahasiswa")
                        .then((value) {
                      setState(() {
                        postResultModel = value;
                      });
                    });
                  },
                  child: const Text("POST"))
            ],
          ),
        ),
      ),
    );
  }
}
