import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Biodata',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const BiodataPage(),
    );
  }
}

class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final courseController = TextEditingController();

  bool showBiodata = false;

  void submitBiodata() {
    setState(() {
      showBiodata = true;
    });
  }

  void clearBiodata() {
    nameController.clear();
    ageController.clear();
    addressController.clear();
    emailController.clear();
    phoneController.clear();
    courseController.clear();

    setState(() {
      showBiodata = false;
    });
  }

  Widget inputField(
    String label,
    TextEditingController controller,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY BIODATA'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const CircleAvatar(
              radius: 45,
              child: Icon(
                Icons.person,
                size: 55,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Personal Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            // INPUT INFORMATION

            inputField(
              'John Mark Caberoy',
              nameController,
              Icons.person,
            ),

            inputField(
              '22',
              ageController,
              Icons.cake,
            ),

            inputField(
              'Hernandez st.catmon malabon city',
              addressController,
              Icons.home,
            ),

            inputField(
              'johnmarkcaberoy4@gmail.com',
              emailController,
              Icons.email,
            ),

            inputField(
              '09628911303',
              phoneController,
              Icons.phone,
            ),

            inputField(
              'BSIT-306',
              courseController,
              Icons.school,
            ),

            const SizedBox(height: 10),

            // BUTTONS

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: submitBiodata,
                    child: const Text('SUBMIT'),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: OutlinedButton(
                    onPressed: clearBiodata,
                    child: const Text('CLEAR'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // BIODATA RESULT

            if (showBiodata)
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'BIODATA',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const Divider(),

                      const SizedBox(height: 10),

                      information(
                        'Full Name',
                        nameController.text,
                      ),

                      information(
                        'Age',
                        ageController.text,
                      ),

                      information(
                        'Address',
                        addressController.text,
                      ),

                      information(
                        'Email',
                        emailController.text,
                      ),

                      information(
                        'Phone',
                        phoneController.text,
                      ),

                      information(
                        'Course',
                        courseController.text,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget information(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$title:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    addressController.dispose();
    emailController.dispose();
    phoneController.dispose();
    courseController.dispose();

    super.dispose();
  }
}