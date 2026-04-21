import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: ArtistLoginScreen(), 
      ),
    ));


class ArtistLoginScreen extends StatelessWidget {
  final TextEditingController _userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3E5F5), 
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              SizedBox(height: 100),
              
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Icon(Icons.auto_fix_high, size: 60, color: Colors.purple[300]),
              ),
              SizedBox(height: 20),
              Text('تسجيل دخول الفنانين', 
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple[900])),
              SizedBox(height: 40),
              
             
              TextField(
                controller: _userController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'اسم الفنان',
                  prefixIcon: Icon(Icons.person_outline, color: Colors.purple[300]),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
                ),
              ),
              SizedBox(height: 15),
              
              
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'كلمة المرور',
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.purple[300]),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
                ),
              ),
              SizedBox(height: 30),
              
              
              MaterialButton(
                onPressed: () {
                 
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => CreativeStudioHome()),
                  );
                },
                color: Colors.purple[300],
                textColor: Colors.white,
                minWidth: double.infinity,
                height: 55,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                ),
                child: Text('دخول للمرسم', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CreativeStudioHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3E5F5),
      appBar: AppBar(
        title: Text('مرسم الإبداع'),
        backgroundColor: Colors.purple[200],
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Icon(Icons.palette_outlined, size: 70, color: Colors.purple[300]),
            ),
            SizedBox(height: 30),
            Text('مرحباً بكِ في عالم الفن', style: TextStyle(fontSize: 20, color: Colors.purple[900])),
            SizedBox(height: 25),
            MaterialButton(
              color: Colors.purple[300],
              textColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Text('تفاصيل: طقم ألوان زيتية'),
              onPressed: () async {
                final message = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArtItemScreen(toolName: 'طقم ألوان زيتية')),
                );

                if (message != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.purple[400],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}


class ArtItemScreen extends StatelessWidget {
  final String toolName;
  ArtItemScreen({required this.toolName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل الأدوات'),
        backgroundColor: Colors.purple[100],
        foregroundColor: Colors.purple[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.brush, color: Colors.purple),
              title: Text('القطعة المختارة:', style: TextStyle(color: Colors.grey)),
              subtitle: Text(toolName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.purple[800])),
            ),
            Divider(color: Colors.purple[100], thickness: 2),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.pop(context, 'تم حجز $toolName للإبداع 🎨');
              },
              child: Container(
                width: double.infinity,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.purple[200]!, Colors.purple[400]!]),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('تأكيد الحجز', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}