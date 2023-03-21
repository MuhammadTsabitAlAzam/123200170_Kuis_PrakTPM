import 'package:flutter/material.dart';
import 'package:perpustakaan/data_buku.dart';
/*import 'package:url_launcher/url_launcher.dart';*/

class DetailsPage extends StatefulWidget {
  final DataBuku data;
  const DetailsPage({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String ketersediaan = "Tersedia";
  var warna ;
  statusbutton() {
    if (widget.data.isAvailable == false) {
      return null;
    } else {
      return () {
        String text = " ";
        if (widget.data.isAvailable == true) {
          setState(() {
            text = "Berhasil Meminjam Buku";
            ketersediaan = "Tidak Tersedia";
            warna = Colors.green;
            widget.data.isAvailable = false;
          });
        }
        SnackBar snackBar = SnackBar(content: Text(text), backgroundColor: warna,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      };
    }
  }

  @override
  Widget build(BuildContext context) {

    /*Future<void> _launchUrl() async {
      if (!await launchUrl(widget.data.link)) {
        throw Exception('Could not launch URL');
      }
    }*/
    return Scaffold(
      appBar: AppBar(
        title:
        Text ("${widget.data.title}"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              /*const url = widget.data.link.toString();
              if (await canLaunchUrl(url))
              await launchUrl(url);
              else
              // can't launch url, there is some error
              throw "Could not launch $url";*/
            },
          ),
        ],
      ),

      body:ListView(
        padding: const EdgeInsets.all(10),
          children: [
            Container(
              width: MediaQuery.of(context).size.width/4,
              height: MediaQuery.of(context).size.height/2,
              padding: const EdgeInsets.all(12),
              child: Center( child : Image.network(widget.data.imageLink),),
            ),
            SizedBox(height: 20,),
            Text("Judul                           " + widget.data.title),
            Text("Penulis                       :  " + widget.data.author),
            Text("Bahasa                       :  " + widget.data.language),
            Text("Negara                       :  " + widget.data.country),
            Text("Jumlah Halaman     :  " + widget.data.pages.toString()),
            Text("Tahun Terbit             :  " + widget.data.year.toString()),
            Text("Status                        :  " + ketersediaan),
            SizedBox(height: 20,),
            Container(
              height: MediaQuery.of(context).size.height/12,
              width: MediaQuery.of(context).size.width/5,
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(20),
                ),
                onPressed: statusbutton(),
                child: const Text('Pesan'),
              ),
            ),
          ],
        ),

    );
  }
}
