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
            backgroundColor: const Color(0xFF7B61FF).withOpacity(0.3), // جعل الشفافية أعلى قليلاً
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
            // ✅ إضافة تدرج لوني من اللون الأزرق إلى الأبيض
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter, // من الأعلى
                end: Alignment.bottomCenter, // إلى الأسفل
                colors: [
                  const Color(0xFF6A5ACD).withOpacity(0.6), // اللون الأزرق الفاتح مع بعض الشفافية
                  Colors.white.withOpacity(0.9), // التدرج إلى اللون الأبيض مع الشفافية
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10), // إضافة padding لعزل الحاويات
              child: TabBarView(
                children: [
                  // ✅ Medical Tests
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      buildCategoryCard(Icons.bloodtype, "Complete Blood Count (CBC)", Colors.red, context, MedicalTestPage(title: "Blood Test")),
                      buildCategoryCard(Icons.water_drop, "Glucose Test", Colors.white, context, MedicalTestPage(title: "Diabetes Test")),
                      buildCategoryCard(Icons.pregnant_woman, "Pregnancy Test", Colors.pinkAccent, context, MedicalTestPage(title: "DNA Test")),
                      buildCategoryCard(Icons.vaccines, "Drug Test", Colors.white, context, MedicalTestPage(title: "Diabetes Test")),
                      buildCategoryCard(Icons.water_drop, "Urinalysis", Colors.yellowAccent , context, MedicalTestPage(title: "Diabetes Test")),
                      buildCategoryCard(Icons.water_drop, "Kidney Function Test", Color(0xFFFCE77D), context, MedicalTestPage(title: "Diabetes Test")),
                      buildCategoryCard(Icons.coronavirus , "Urine Culture", Color(0xFFFCE77D), context, MedicalTestPage(title: "Diabetes Test")),
                      buildCategoryCard(Icons.male , "Testosterone Test", Colors.blue , context, MedicalTestPage(title: "Diabetes Test")),
                      buildCategoryCard(Icons.female , "Estrogen Test", Colors.pinkAccent , context, MedicalTestPage(title: "Diabetes Test")),
                      buildCategoryCard(Icons.emoji_objects, "Cortisol Test", Colors.deepOrange , context, MedicalTestPage(title: "Diabetes Test")),
                      buildCategoryCard(Icons.coronavirus, "COVID-19 Test", Colors.redAccent , context, MedicalTestPage(title: "Diabetes Test")),
                      buildCategoryCard(Icons.coronavirus, "HIV Test", Colors.deepPurple , context, MedicalTestPage(title: "Diabetes Test")),
                      buildCategoryCard(Icons.vaccines, "Hepatitis Test", Colors.greenAccent , context, MedicalTestPage(title: "Diabetes Test")),
                      buildCategoryCard(Icons.sick, "Tuberculosis (TB) Test", Colors.brown , context, MedicalTestPage(title: "Diabetes Test")),
                      buildCategoryCard(Icons.monitor_heart, "Cholesterol Test", Colors.orange, context, MedicalTestPage(title: "Diabetes Test")),
                    ],
                  ),
                  // ✅ X-Ray Scans
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      buildCategoryCard(Icons.favorite, "Chest X-Ray", Colors.orange, context, XRayPage(title: "Chest X-Ray")),
                      buildCategoryCard(Icons.radio, "Therapeutic X-Ray", Colors.red, context, XRayPage(title: "Therapeutic X-Ray")),
                      buildCategoryCard(Icons.public, "Environmental X-Ray", Colors.green, context, XRayPage(title: "Environmental X-Ray")),
                      buildCategoryCard(Icons.camera, "Fluoroscopy X-Ray", Colors.yellow, context, XRayPage(title: "Fluoroscopy X-Ray")),
                      buildCategoryCard(Icons.local_hospital, "Mammography X-Ray", Colors.pink, context, XRayPage(title: "Mammography X-Ray")),
                      buildCategoryCard(Icons.local_hospital, "Angiography X-Ray", Colors.orange, context, XRayPage(title: "Angiography X-Ray")),
                      buildCategoryCard(Icons.camera_alt, "Tomography X-Ray (CT Scan)", Colors.cyan, context, XRayPage(title: "Tomography X-Ray (CT Scan)")),
                      buildCategoryCard(Icons.access_alarm, "Digital X-Ray", Colors.teal, context, XRayPage(title: "Digital X-Ray")),
                      buildCategoryCard(Icons.ac_unit, "Radiology X-Ray", Colors.indigo, context, XRayPage(title: "Radiology X-Ray")),
                      buildCategoryCard(Icons.airline_seat_individual_suite, "Orthopedic X-Ray", Colors.lime, context, XRayPage(title: "Orthopedic X-Ray")),
                      buildCategoryCard(Icons.airplanemode_active, "Chest CT X-Ray", Colors.brown, context, XRayPage(title: "Chest CT X-Ray")),
                      buildCategoryCard(Icons.all_inbox, "Full Body X-Ray", Colors.deepPurple, context, XRayPage(title: "Full Body X-Ray")),
                      buildCategoryCard(Icons.alarm, "Abdominal X-Ray", Colors.amber, context, XRayPage(title: "Abdominal X-Ray")),
                      buildCategoryCard(Icons.animation, "Pelvic X-Ray", Colors.deepOrange, context, XRayPage(title: "Pelvic X-Ray")),
                      buildCategoryCard(Icons.apps, "Skull X-Ray", Colors.greenAccent, context, XRayPage(title: "Skull X-Ray")),
                      buildCategoryCard(Icons.backspace, "Spine X-Ray", Colors.lightGreen, context, XRayPage(title: "Spine X-Ray")),
                      buildCategoryCard(Icons.battery_alert, "Leg X-Ray", Colors.lightBlue, context, XRayPage(title: "Leg X-Ray")),
                      buildCategoryCard(Icons.beenhere, "Hand X-Ray", Colors.indigoAccent, context, XRayPage(title: "Hand X-Ray")),
                      buildCategoryCard(Icons.cabin, "Foot X-Ray", Colors.pinkAccent, context, XRayPage(title: "Foot X-Ray")),
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
