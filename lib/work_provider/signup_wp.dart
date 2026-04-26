import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp_Wp extends StatelessWidget {
  const SignUp_Wp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                "Find your work\nand\nWorker",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                height: 60,
                width: 325,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(217, 217, 217, 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(
                      10,
                    ), // Hard limit to 10 characters
                    FilteringTextInputFormatter
                        .digitsOnly, // Only allow 0-9 (prevents dots/dashes)
                  ],
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    prefixIcon: const Icon(Icons.phone),
                    // Helps center the text vertically inside your fixed-height container
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 22,
                      horizontal: 15,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      // This creates the line around the field
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    // Styles when the user clicks inside the field
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
