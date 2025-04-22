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
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xFF7B61FF).withOpacity(0.3),
            centerTitle: true,
            title: const Text(
              "X-Ray Viewer",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFF6A5ACD),
              ),
            ),
            bottom: const TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: "Medical Reports"),
                Tab(text: "X-Rays"),
              ],
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF6A5ACD).withOpacity(0.6),
                  Colors.white.withOpacity(0.9),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TabBarView(
                children: [
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      buildCategoryCard(Icons.bloodtype, "Complete Blood Count (CBC)", Colors.red, context, MedicalTestPage(title: "(CBC)")),
                      buildCategoryCard(Icons.water_drop, "Glucose Test", Colors.white, context, MedicalTestPage(title: "Glucose Test")),
                      buildCategoryCard(Icons.pregnant_woman, "Pregnancy Test", Colors.pinkAccent, context, MedicalTestPage(title: "Pregnancy Test")),
                      buildCategoryCard(Icons.vaccines, "Drug Test", Colors.white, context, MedicalTestPage(title: "Drug Test")),
                      buildCategoryCard(Icons.water_drop, "Urinalysis", Colors.yellowAccent , context, MedicalTestPage(title: "Urinalysis")),
                      buildCategoryCard(Icons.water_drop, "Kidney Function Test", Color(0xFFFCE77D), context, MedicalTestPage(title: "Kidney Function Test")),
                    ],
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      buildCategoryCard(Icons.favorite, "Chest X-Ray", Colors.orange, context, XRayPage(title: "Chest X-Ray")),
                      buildCategoryCard(Icons.radio, "Therapeutic X-Ray", Colors.red, context, XRayPage(title: "Therapeutic X-Ray")),
                      buildCategoryCard(Icons.public, "Environmental X-Ray", Colors.green, context, XRayPage(title: "Environmental X-Ray")),
                      buildCategoryCard(Icons.camera, "Fluoroscopy X-Ray", Colors.yellow, context, XRayPage(title: "Fluoroscopy X-Ray")),
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

  Widget buildCategoryCard(IconData icon, String title, Color color, BuildContext context, Widget page) {
    return Builder(
      builder: (BuildContext innerContext) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              innerContext,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          child: Container(
            width: 110,
            height: 110,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 50, color: color),
                const SizedBox(height: 10),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MedicalTestPage extends StatefulWidget {
  final String title;
  const MedicalTestPage({Key? key, required this.title}) : super(key: key);

  @override
  _MedicalTestPageState createState() => _MedicalTestPageState();
}

class _MedicalTestPageState extends State<MedicalTestPage> {
  late List<String> fields;
  final Map<String, TextEditingController> controllers = {};

  @override
  void initState() {
    super.initState();
    switch (widget.title) {
      case "(CBC)":
        fields = ["Hemoglobin", "WBC", "RBC", "Platelets"];
        break;
      case "Glucose Test":
        fields = ["Fasting Glucose", "Postprandial Glucose"];
        break;
      case "Pregnancy Test":
        fields = ["hCG Level"];
        break;
      case "Kidney Function Test":
        fields = ["Creatinine", "BUN", "eGFR"];
        break;
      default:
        fields = ["Value 1", "Value 2"];
    }
    for (var field in fields) {
      controllers[field] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _sendDataToBackend() async {
    Map<String, dynamic> data = {
      "testType": widget.title,
      "values": {
        for (var field in fields) field: controllers[field]!.text,
      }
    };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(data: data),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: fields.length,
                itemBuilder: (context, index) {
                  final field = fields[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(field, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 3,
                          child: TextField(
                            controller: controllers[field],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Enter value",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton.icon(
              onPressed: _sendDataToBackend,
              icon: const Icon(Icons.send),
              label: const Text("إرسال البيانات"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultsPage extends StatelessWidget {
  final Map<String, dynamic> data;
  const ResultsPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("نتائج الاختبار")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "اختبار: ${data['testType']}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...data['values'].entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text("${entry.key}: ${entry.value}"),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class XRayPage extends StatelessWidget {
  final String title;
  const XRayPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text("Details for $title")),
    );
  }
}
