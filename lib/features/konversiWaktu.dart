import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KonversiWaktu extends StatefulWidget {
  const KonversiWaktu({super.key});

  @override
  State<KonversiWaktu> createState() => _KonversiWaktuState();
}

class _KonversiWaktuState extends State<KonversiWaktu> {
  int jam = 0;
  int menit = 0;
  String wib = '';
  String wita = '';
  String wit = '';

  void convert() {
    setState(() {
      jam = jam % 24;

      int jamWita = (jam + 1) % 24;
      int jamWit = (jam + 2) % 24;

      String formatMenit = menit < 10 ? '0$menit' : '$menit';

      wib = '$jam:$formatMenit WIB';
      wita = '$jamWita:$formatMenit WITA';
      wit = '$jamWit:$formatMenit WIT';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Konversi Waktu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Silahkan Input Waktu',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),

            // Input Field
            SizedBox(
              width: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: 32,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            jam = int.parse(value);
                          });
                        },
                        keyboardType: TextInputType.numberWithOptions(),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2),
                        ],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                  Text(
                    ':',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      width: 32,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            menit = int.parse(value);
                          });
                        },
                        keyboardType: TextInputType.numberWithOptions(),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2),
                        ],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),

            SizedBox(
              height: 22,
            ),

            SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      convert();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300,
                      foregroundColor: Colors.black,
                      side: BorderSide(color: Colors.grey, width: 0.5),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text('Konversi'))),

            SizedBox(
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    wib,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    wita,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    wit,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
