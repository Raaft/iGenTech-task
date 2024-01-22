import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  final String scannedData;

  const DisplayScreen({Key? key, required this.scannedData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanned Data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Scanned Data:",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              scannedData,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 150,
              child: ElevatedButton(

                onPressed: () {
                  // Add your payment logic here
                  // For demonstration purposes, let's just show a simple dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Payment Successful"),
                        content: const Text("Thank you for your payment!"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the dialog
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text("Pay"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}