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
            backgroundColor: const Color(0xFF7B61FF).withOpacity(0.2),
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
          body: TabBarView(
            children: [
              // ✅ Medical Tests
              GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  buildCategoryCard(Icons.bloodtype, "Blood Test", Colors.blue, context, MedicalTestPage(title: "Blood Test")),
                  buildCategoryCard(Icons.biotech, "DNA Test", Colors.green, context, MedicalTestPage(title: "DNA Test")),
                  buildCategoryCard(Icons.water_drop, "Diabetes Test", Colors.red, context, MedicalTestPage(title: "Diabetes Test")),
                ],
              ),
              // ✅ X-Ray Scans
              GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  buildCategoryCard(Icons.medical_services, "Bone X-Ray", Colors.purple, context, XRayPage(title: "Bone X-Ray")),
                  buildCategoryCard(Icons.favorite, "Chest X-Ray", Colors.orange, context, XRayPage(title: "Chest X-Ray")),
                  buildCategoryCard(Icons.headset, "Brain Scan", Colors.cyan, context, XRayPage(title: "Brain Scan")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ دالة بناء حاوية مع الأيقونة والنص واللون
  Widget buildCategoryCard(IconData icon, String title, Color color, BuildContext context, Widget page) {
    return Builder(
      builder: (BuildContext innerContext) {
        return GestureDetector(
          onTap: () {
            // ✅ عند الضغط، الانتقال إلى الصفحة الجديدة باستخدام السياق الصحيح
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
                Icon(icon, size: 40, color: color),
                const SizedBox(height: 10),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MedicalTestPage extends StatelessWidget {
  final String title;

  const MedicalTestPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text("Details for $title")),
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
