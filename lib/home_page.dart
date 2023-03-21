import 'package:flutter/material.dart';
import 'data_buku.dart';
import 'detail_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Data Buku"),),

      ),

      body: ListView.builder(
          itemCount: listBuku.length,
          itemBuilder:(context, index){
            final DataBuku data = listBuku[index];
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(data : data),),);
              },
              child: Card(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/5,
                      height: MediaQuery.of(context).size.height/3,
                      child: Image.network(data.imageLink, fit: BoxFit.fill,),
                    ),
                    SizedBox(height: 30,),

                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30), overflow: TextOverflow.fade,),
                          SizedBox(height: 20,),
                          Text(data.author),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } ),
    );
  }
}
