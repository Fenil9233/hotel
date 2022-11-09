import 'package:flutter/material.dart';
import 'package:hotel/bill.dart';
import 'package:hotel/model.dart';

class restaurant extends StatefulWidget {
  const restaurant({Key? key}) : super(key: key);

  @override
  State<restaurant> createState() => _restaurantState();
}

class _restaurantState extends State<restaurant> {
  List check = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
   List item = [];
   List price = [];
   double total = 0;
   double gst = 0;
   double tbill = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: ListView.builder(
              itemCount: model.images.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(model.images[index]),
                              fit: BoxFit.cover)),
                    ),
                    Expanded(
                        child: Container(
                      child: Text("${model.product[index]}\nRs. : ${model.price[index]}"),
                    )),
                    Container(
                      child: Checkbox(
                          onChanged: (value) {
                            if (check[index] != null) {
                              check[index] = value;
                            }
                            double a = double.parse(model.price[index]);
                            if (check[index] == true) {
                              total = total + a;
                              item.add(model.product[index]);
                              price.add(model.price[index]);
                              gst = total * (18 / 100);
                              tbill = total + gst;
                            } else {
                              total = total - a;
                              item.remove(model.product[index]);
                              price.remove(model.price[index]);
                              gst = total * (18 / 100);
                              tbill = total - gst;
                            }
                            setState(() {});
                          },
                          value: check[index]),
                    ),
                  ],
                );
              },
            ),
          )),
          InkWell(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return bill();
            },));
          },
            child: Container(
                height: 50,
                width: 150,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(style: BorderStyle.solid)),
                child: Text(
                  "Done",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
