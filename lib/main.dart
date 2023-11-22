import 'package:flutter/material.dart';
import 'food_menu.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.pink),
        debugShowCheckedModeBanner: false,
        title: "Myapp",
        home: Myhome());
  }
}

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  // int number = 0; //การสร้างตัวแปร
  List<FoodMenu> menu = [
    FoodMenu("หมูน้ำตก", "60", "assets/images/f1.jpg"),
    FoodMenu("ต้มแซ่บกระดูกหมู", "120", "assets/images/f2.jpg"),
    FoodMenu("ไส้ย่างพร้อมข้าวเหนียว", "90", "assets/images/f3.jpg"),
    FoodMenu("ตำไทยข้าวโพดไข่เค็ม", "80", "assets/images/f4.jpg"),
    FoodMenu("ตำทะเลรวม", "230", "assets/images/f5.jpg"),
    FoodMenu("ผัดกะเพราหมูสับ", "50", "assets/images/f6.jpg"),
    FoodMenu("ผัดกะเพราหมู", "50", "assets/images/f7.jpg"),
    FoodMenu("ผัดพริกแกงไก่", "50", "assets/images/f8.jpg"),
    FoodMenu("ผัดกะเพราเนื้อไข่ดาว", "100", "assets/images/f9.jpg"),
    FoodMenu("ผัดกะเพราหมูกรอบ", "120", "assets/images/f10.jpg"),
    FoodMenu("ข้าวไข่เจียว", "40", "assets/images/f11.jpg"),
    FoodMenu("ผัดซีอิ๊วหมู", "40", "assets/images/f12.jpg"),
    FoodMenu("ผัดมะกะโรนีกุ้ง", "70", "assets/images/f13.jpg"),
    FoodMenu("ผัดขี้เมาทะเล", "90", "assets/images/f14.jpg"),
    FoodMenu("ข้าวผัดคะน้าปลาเค็ม", "100", "assets/images/f15.jpg"),
    // เพิ่มรายการอาหารเพิ่มเติมที่นี่
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "น้องแนนอีสานพาเพลิน",
          style: TextStyle(color: Colors.white, fontSize: 30),
        )), //จัดการส่วนของ appbar ด้านบน

        body: ListView.builder(
            itemCount: menu.length,
            itemBuilder: (BuildContext context, int index) {
              FoodMenu food = menu[index];
              return ListTile(
                leading: Image.asset(food.img),
                title: Text(
                  food.name,
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text("ราคา " + food.price + " บาท"),
                onTap: () {
                  print("คุณเลือกเมนูอาหาร " + food.name);
                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return AlertDialog(
                  //       content: Text(food.name),
                  //     );
                  //   },
                  // );
                  showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "คุณเลือกเมนูอาหาร คือ " + food.name,
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  },
                );

                },
              );
            }));
  }

  List<Widget> getData(int count) {
    List<Widget> data = [];

    for (var i = 0; i < count; i++) {
      var menu = ListTile(
        title: Text(
          "Menu ${i + 1} ",
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          "Detail ${i + 1} ",
          style: TextStyle(fontSize: 10),
        ),
      );
      data.add(menu);
    }

    return data;
  }
}
