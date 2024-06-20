import 'dart:convert';
import 'package:allahnames/athkar.dart';
import 'package:allahnames/cardname.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {

   List names =[ 
    {"name":"الأول","decription":"name of God"},
    {"name":"الأخر","decription":"name of God"},
    {"name": "الظاهر","decription":"name of God"},
    {"name":"الباطن","decription":"name of God"},
    {"name": "الملك","decription":"name of God"},
     {"name":"الأول","decription":"name of God"},
    {"name":"الأخر","decription":"name of God"},
    {"name": "الظاهر","decription":"name of God"},
    {"name":"الباطن","decription":"name of God"},
    {"name": "الملك","decription":"name of God"}, 
     {"name":"الأول","decription":"name of God"},
    {"name":"الأخر","decription":"name of God"},
    {"name": "الظاهر","decription":"name of God"},
    {"name":"الباطن","decription":"name of God"},
    {"name": "الملك","decription":"name of God"},   
  ];
  Map data ={};
  List lsitdata =[];
  Future<List> getData()async{
    var response = await get
    (Uri.parse("https://api.aladhan.com/v1/asmaAlHusna"));
    print(response);
    var rs = jsonDecode(response.body);
    data.addAll(rs);
    lsitdata = data["data"] ;
    return lsitdata ;
  }
 
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffDDDAD5),
        centerTitle: true,
        title:
         Text('أسماء الله الحسنى', textAlign: TextAlign.center,),
         actions: [
          IconButton(onPressed: (){
          showSearch(context: context, delegate: CustomSearch());
         }, icon: Icon(Icons.search)),
         IconButton(onPressed: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => Athkar()));

         }, icon: Icon(Icons.home))
         ],
         ),
           //alignment: Alignment.center,
      body:
      Container(
        color:Color(0xffDDDAD5),
        padding: EdgeInsets.only(left:20, right: 20,bottom: 20),
        child: ListView(children: [      
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Container(
           height:100,width: 50,child:  Image.asset("images/islamicstyle.png")
          ),
            Container(
           height:100,width: 100,child:  Image.asset("images/logo.png")
          ),Container(
           height:100,width: 50,child:  Image.asset("images/islamicstyle.png")
          ),
          ]
          ),
          const Column(
            children: [
          Text("اللـهم إني أشهدك وأشهد حملة عرشك وملائكتك وجميع خلقك أنك أنت الله " ,textDirection: TextDirection.rtl,),
          Text("أنك أنت الله",textDirection: TextDirection.rtl,style: TextStyle(color: Color(0xFFA9883E)),),
          Text("لا إله إلا أنت وحدك لا شريك لك ",textDirection: TextDirection.rtl),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                 height: 30,
                 width: 100,
                 alignment: Alignment.center,
                 decoration: BoxDecoration(
                  color: Color(0xff5DA2B0),
                  border: Border.all(color: Color(0xff5DA2B0)),
                  borderRadius: BorderRadius.circular(10) ),
                child: Text("أنت  الله  " , style: TextStyle(color: Colors.white),),),             
            ],
          ),
          FutureBuilder<List<dynamic>>(
            future: getData(), 
            builder: (context ,snapshot){
               if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
              if(snapshot.hasData){
            if(snapshot.connectionState == ConnectionState.done){
               if(snapshot.hasError){
                return Text("data");
              }
             return GridView.builder(
              itemCount: snapshot.data!.length,
              physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5), 
             itemBuilder: (context,i){
              return 
              InkWell(
                onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CardName(data:lsitdata[i])));
                },
                child: Container(
                  height: 20,
                  child: Card.outlined(
                    color: Color(0xffE4E9E8),
                    child: 
                  Column(
                    children:[
                  Container(
                  
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text("${snapshot.data![i]["name"]}"),
                    
                  ), 
                  ),
                Icon(
                    color: Color(0xff9B8747),
                  Icons.more_horiz_outlined)
                 ],
                )),
                ),
              );
             });
                   }// Connection
                   return Text("");

              }//if - had data 
              return Text("has Error");  
          }
          ),  
             //--------------------------------------1-------------------------------
             Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                 height: 30,
                 width: 100,
                 alignment: Alignment.center,
                 decoration: BoxDecoration(
                  color: Color(0xff9B8747),
                  border: Border.all(color: Color(0xff9B8747)),
                  borderRadius: BorderRadius.circular(10) ),
                child: Text("أنت  الله  " , style: TextStyle(color: Colors.white),),),             
            ],
          ),
       
             GridView.builder(
              itemCount: names.length,
              physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5), 
             itemBuilder: (context,i){
              return 
              InkWell(
                onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CardName(data:data[i])));
                },
                child: Container(
                  height: 20,
                  child: Card.outlined(
                    color: Color(0xffE4E9E8),
                    child: 
                  Column(
                    children:[
                  Container(
                  
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${names[i]["name"]}",),
                    ),
                  ),
                  )
                               ],
                               ),),
                ),
              );
             }),
          ]
        ),
      ),
    );
  }
}

//***************************************************************************** */
class CustomSearch extends SearchDelegate{
  List names =[] ;
  List? filterList;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query="";
      }, icon:Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
  return  IconButton(onPressed: (){
    close(context, null);
  }, icon: Icon(Icons.arrow_back) );
  }
  @override
  Widget buildResults(BuildContext context) {
    return Text("data");
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    if(query != ""){
      return  ListView.builder(
      itemCount: names.length,
      itemBuilder: (context, i){
     return Card(
      color:  Color(0xffDDDAD5),
      child: 
      Padding(padding: EdgeInsets.all(10),child: 
     Text("${names[i]}", 
     //textAlign: TextAlign.right,
     style:const TextStyle(fontSize: 14,))));
    });
    }else{
      filterList = names.where((element) => element.startsWith(query)).toList();
       return  ListView.builder(
      itemCount: filterList!.length,
      itemBuilder: (context, i){
     return Card(
      color:  Color(0xffDDDAD5),
      child: 
      Padding(padding: const EdgeInsets.all(10),child: 
     Text("${filterList![i]}", 
     //textAlign: TextAlign.right,
     style:const TextStyle(fontSize: 14,))
     
     ));
    });
    }  
  }
}