import 'package:flutter/material.dart';

class CardAthkar extends StatefulWidget {
  const CardAthkar({super.key});

  @override
  State<CardAthkar> createState() => _CardAthkarState();
}

class _CardAthkarState extends State<CardAthkar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffDDDAD5),
        title:
         Text('أسماء الله الحسنى',textAlign: TextAlign.center,),
        
         ),
      body: Container(
         color:Color(0xffDDDAD5),
        child: Center(
          child: ListView(
            
            children: [
              Container(height:100 ,width:200 , child: Image.asset("images/logo.png")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center
                   ,children: [
                      Text("name"),
            
                   ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}