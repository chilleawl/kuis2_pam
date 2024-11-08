import 'package:flutter/material.dart';

class CekHari extends StatefulWidget {
  const CekHari({super.key});

  @override
  State<CekHari> createState() => _CekHariState();
}

class _CekHariState extends State<CekHari> {
  final _numberController = TextEditingController();
  String? dayResult;

  void checkDay() {
    final dayNumber = int.tryParse(_numberController.text);

    setState(() {
      switch (dayNumber) {
        case 1:
          dayResult = "Senin";
          break;
        case 2:
          dayResult = "Selasa";
          break;
        case 3:
          dayResult = "Rabu";
          break;
        case 4:
          dayResult = "Kamis";
          break;
        case 5:
          dayResult = "Jumat";
          break;
        case 6:
          dayResult = "Sabtu";
          break;
        case 7:
          dayResult = "Minggu";
          break;
        default:
          dayResult = "Nomor tidak valid. Masukkan angka antara 1 dan 7.";
      }
    });
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cekHariKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Cek Hari Berdasarkan Nomor'),
      ),
      body: Center(
        child: Form(
          key: cekHariKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Input nomor hari
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor hari tidak boleh kosong';
                    }
                    return null;
                  },
                  controller: _numberController,
                  decoration: InputDecoration(
                    labelText: 'Masukkan nomor(1-7) untuk cek hari',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue, width: 2),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                // Tombol cek hari
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (cekHariKey.currentState!.validate()) {
                          checkDay();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        foregroundColor: Colors.black,
                        side: BorderSide(color: Colors.grey, width: 0.5),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      child: Text(
                        "Cek Hari",
                        style: TextStyle(fontSize: 15),
                      ),
                    )),
                const SizedBox(height: 20),
                // Tampilkan hasil hari
                if (dayResult != null)
                  Text(
                    dayResult!,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
