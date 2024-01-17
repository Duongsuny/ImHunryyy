import 'package:flutter/material.dart';
import 'package:im_hungry/colors.dart';

class DayTogether extends StatelessWidget {
  const DayTogether({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HungryColors().backYellow,
      ),
      backgroundColor: HungryColors().backYellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Thời gian bên nhau",
            style: TextStyle(
              color: HungryColors().surfaceBrown,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: HungryColors().backYellow,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 30,
                    offset: Offset(-20, -20),
                    color: Colors.white.withOpacity(.2)
                  ),
                  BoxShadow(
                    blurRadius: 30,
                    offset: Offset(20, 20),
                    color: Colors.brown.withOpacity(.1)
                  )
                ]
              )),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: HungryColors().backYellow,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30,
                      offset: Offset(-20, -20),
                      color: Colors.white.withOpacity(.2)
                    ),
                    BoxShadow(
                      blurRadius: 30,
                      offset: Offset(20, 20),
                      color: Colors.brown.withOpacity(.1)
                    )
                  ],
                ),)
                //child: Placeholder(),),
              )
          ]
        ),
      )
    );
  }
}