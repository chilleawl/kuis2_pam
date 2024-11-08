import 'dart:math';
import 'package:flutter/material.dart';

class Piramida extends StatefulWidget {
  const Piramida({super.key});

  @override
  State<Piramida> createState() => _PiramidaState();
}

class _PiramidaState extends State<Piramida> {
  final _baseController = TextEditingController();
  final _heightController = TextEditingController();
  double? volume;
  double? perimeter;

  void calculate() {
    final base = double.tryParse(_baseController.text);
    final height = double.tryParse(_heightController.text);

    if (base != null && height != null) {
      setState(() {
        // hitung volume
        volume = (1 / 3) * pow(base, 2) * height;

        // hitung keliling alas
        perimeter = 4 * base;
      });
    }
  }

  @override
  void dispose() {
    _baseController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final piramidaKey = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Kalkulator Piramida',
          ),
        ),
        body: Form(
          key: piramidaKey,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 62.0, left: 32, right: 32, bottom: 21),
            child: SizedBox(
              height: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Input panjang alas
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Tinggi Tidak Boleh Kosong";
                      }
                      return null;
                    },
                    controller: _baseController,
                    decoration: InputDecoration(
                      labelText: 'Panjang sisi alas (m)',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  // Input tinggi piramida
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Tinggi Tidak Boleh Kosong";
                      }
                      return null;
                    },
                    controller: _heightController,
                    decoration: InputDecoration(
                      labelText: 'Tinggi piramida (m)',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  // Tombol hitung
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (piramidaKey.currentState!.validate()) {
                          calculate();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                        foregroundColor: Colors.black,
                        side: BorderSide(color: Colors.grey, width: 0.5),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      child: const Text(
                        "Hitung",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  // Tampilkan hasil
                  if (volume != null && perimeter != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Volume Piramida: ${volume!.toStringAsFixed(2)} m³',
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Keliling Alas Piramida: ${perimeter!.toStringAsFixed(2)} m',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
