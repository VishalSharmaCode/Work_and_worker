import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

// ignore: camel_case_types
class SignUp_Worker extends StatefulWidget {
  const SignUp_Worker({super.key});

  @override
  State<SignUp_Worker> createState() => _SignUp_WorkerState();
}

// ignore: camel_case_types
class _SignUp_WorkerState extends State<SignUp_Worker> {
  // 1. List of 50 professions for the search dropdown
  final List<String> professions = [
    'Electrician',
    'Plumber',
    'Carpenter',
    'Painter',
    'Mason',
    'Welder',
    'Mechanic',
    'Driver',
    'Gardener',
    'Chef',
    'Waiter',
    'Tailor',
    'Blacksmith',
    'Locksmith',
    'AC Technician',
    'Cleaner',
    'Security Guard',
    'Delivery Boy',
    'Plasterer',
    'Tiler',
    'Roofer',
    'Glazier',
    'Scaffolder',
    'Crane Operator',
    'Excavator Operator',
    'Surveyor',
    'Architect',
    'Civil Engineer',
    'Interior Designer',
    'Landscaper',
    'Pest Control',
    'Solar Installer',
    'Handyman',
    'Flooring Specialist',
    'Cabinet Maker',
    'Upholsterer',
    'Glass Cutter',
    'Bricklayer',
    'Concrete Finisher',
    'Ironworker',
    'Pipefitter',
    'Steamfitter',
    'Sheet Metal Worker',
    'Insulation Worker',
    'Waterproofer',
    'Demolition Worker',
    'Janitor',
    'Housekeeper',
    'Nanny',
    'Dog Walker',
  ];

  String? selectedProfession;
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
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

              // --- Aadhar Number ---
              Container(
                height: 60,
                width: 325,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(
                      12,
                    ), // Hard limit to 10 characters
                    FilteringTextInputFormatter
                        .digitsOnly, // Only allow 0-9 (prevents dots/dashes)
                  ],
                  decoration: InputDecoration(
                    labelText: "Aadhar Number",
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

              const SizedBox(height: 10),
              Container(
                height: 60,
                width: 325,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1.0),
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

              // --- Name as per Aadhar ---
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Name as per Aadhar',
                icon: Icons.person,
                type: TextInputType.name,
              ),

              // --- Work Profession (Searchable Dropdown) ---
              const SizedBox(height: 10),
              Container(
                width: 325,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(217, 217, 217, 1.0),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: const Text(
                      'Select Profession',
                      style: TextStyle(color: Colors.black87),
                    ),
                    items: professions
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        )
                        .toList(),
                    value: selectedProfession,
                    onChanged: (value) {
                      setState(() {
                        selectedProfession = value;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(height: 58),
                    dropdownStyleData: const DropdownStyleData(maxHeight: 300),
                    dropdownSearchData: DropdownSearchData(
                      searchController: searchController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          controller: searchController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Search profession...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value.toString().toLowerCase().contains(
                          searchValue.toLowerCase(),
                        );
                      },
                    ),
                  ),
                ),
              ),

              // --- Aadhar OTP Validation ---
              const SizedBox(height: 10),
              _buildTextField(
                label: "Enter OTP",
                icon: Icons.lock_clock,
                type: TextInputType.number,
                limit: 6,
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(217, 217, 217, 1.0),
                  minimumSize: const Size(224, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  side: const BorderSide(color: Colors.black, width: 1),
                ),
                onPressed: () {
                  // Final logic for Signup
                },
                child: const Text(
                  "Signup",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget to keep the code clean and reusable
  Widget _buildTextField({
    required String label,
    IconData? icon,
    required TextInputType type,
    int? limit,
  }) {
    return Container(
      height: 60,
      width: 325,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(217, 217, 217, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        keyboardType: type,
        inputFormatters: limit != null
            ? [
                LengthLimitingTextInputFormatter(limit),
                FilteringTextInputFormatter.digitsOnly,
              ]
            : null,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon != null ? Icon(icon) : null,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 1),
          ),
        ),
      ),
    );
  }
}
