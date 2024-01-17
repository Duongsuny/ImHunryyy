import 'package:flutter/material.dart';
import 'package:im_hungry/colors.dart';
import 'package:im_hungry/components/shadow.dart';

class DayTogether extends StatelessWidget {
  const DayTogether({super.key});

  @override
  Widget build(BuildContext context) {
    //style constant
    TextStyle boldStyle = TextStyle(
        color: HungryColors().surfaceBrown,
        fontSize: 22,
        fontWeight: FontWeight.bold);
    TextStyle normalStyle = TextStyle(
      color: HungryColors().surfaceBrown,
      fontSize: 18,
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: HungryColors().backYellow,
        ),
        backgroundColor: HungryColors().backYellow,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Thời gian bên nhau",
                    style: TextStyle(
                        color: HungryColors().surfaceBrown,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        color: HungryColors().backYellow,
                        shape: BoxShape.circle,
                        boxShadow:
                            NeoShadow(blurRadius: 30, offset: 20, opacity: .1)
                                .shadow,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: HungryColors().backYellow,
                          boxShadow:
                              NeoShadow(blurRadius: 30, offset: 20, opacity: .1)
                                  .shadow),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("1", style: boldStyle),
                              Text("Năm", style: normalStyle)
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("252", style: boldStyle),
                              Text("Ngày", style: normalStyle)
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("11", style: boldStyle),
                              Text("Giờ", style: normalStyle)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Từ 21:30 ngày 10/05/2022",
                    style: TextStyle(
                        color: HungryColors().surfaceBrown,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ]),
          ),
        ));
  }
}
