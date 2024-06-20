import 'package:flutter/material.dart';

class CardName extends StatefulWidget {
  final data;
  const CardName({super.key, this.data});
  @override
  State<CardName> createState() => _CardNameState();
}

class _CardNameState extends State<CardName> {
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
                      Text(widget.data["name"]),
                Text(widget.data["transliteration"]),
                Text(widget.data["number"].toString()),
                Text("المـعني باللغة الانجليزية"),
                Text(widget.data["en"].toString())
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