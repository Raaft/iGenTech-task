import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'display_screen.dart';




class QRCodeScannerScreen extends StatefulWidget {
  const QRCodeScannerScreen({super.key});

  @override
  _QRCodeScannerScreenState createState() => _QRCodeScannerScreenState();
}

class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController _controller;
  String scannedData = "Scan a QR code";
  Timer? _debounceTimer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Scanner"),
      ),
      body: Column(
        children: [
          Expanded(
            child: QRView(
              key: _qrKey,
              onQRViewCreated: (controller) {
                setState(() {
                  _controller = controller;
                });
                controller.scannedDataStream.listen((scanData) {
                  if (_debounceTimer == null || !_debounceTimer!.isActive) {
                    setState(() {
                      scannedData = scanData.code??'';
                    });

                    // Navigate to the display screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayScreen(scannedData: scannedData),
                      ),
                    );

                    // Debounce for 2 seconds
                    _debounceTimer = Timer(const Duration(seconds: 2), () {
                      _debounceTimer?.cancel();
                    });
                  }
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              scannedData,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }
}


