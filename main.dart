import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





void main() => runApp(MaterialApp(
  home: MyApp(),
));


class MyApp extends StatefulWidget {

  MyApp({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  String userInput;

  List <String> moreWords = ["Django","Pineapple","Python","Servers","Flutter","swift", "kotlin", "objectivec", "variable", "java", "mobile","Shopify"];
  List <String> words  = ["swift", "kotlin",];//"objectivec", "variable", "java", "mobile"];
  List <String> gottenWords = [];




  void dynamictext() {
    setState(() {
      if (!gottenWords.contains(userInput) && words.contains(userInput)) {
        gottenWords.add(userInput);
        positiveDialog(BuildContext, context);
      }  if (gottenWords.contains(userInput.toLowerCase()) && words.length == gottenWords.length) {
        congratDialog(BuildContext, context);
      }

       if (!words.contains(userInput) || !gottenWords.contains(userInput)){
        negativeDialog(BuildContext, context);
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[100],
        body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.transparent, Colors.pink[500]],begin: Alignment.topLeft,end: Alignment.bottomRight,)
                ),

                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      onChanged: (text){
                        userInput = text;
                      },
                      maxLength: 10,
                      decoration: InputDecoration(contentPadding: EdgeInsets.all(5.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                        suffixIcon: FlatButton(padding: EdgeInsets.all(3.0),color: Colors.tealAccent, child: Icon(Icons.search),
                          onPressed: dynamictext,),
                        prefixText: "        ",
                        fillColor: Colors.purple[600],
                        filled: true,
                        hintText: "Search Word",
                        hintStyle: TextStyle(fontSize: 15, color: Colors.grey[400], ),


                      ),),
                  ),
                ),
              ),
              Container(margin: EdgeInsets.only(top: 160.0),
                child: ListView.builder(padding: EdgeInsets.all(12.0),
                      itemCount: moreWords.length,
                      itemBuilder: (context, index){
                        final moreWord = moreWords[index];
                        return Dismissible(
                          background: Container(
                             color: Colors.pink,
                          ),
                          onDismissed: (direction){
                            setState(() {
                              moreWords.removeAt(index);
                            });
                          },
                            key:Key(moreWord),
                            child: Card(color: Colors.purple[100],
                            child: Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: Center(child: Text("$moreWord",style: TextStyle(fontSize: 20.0,), )),
                            ),
                          ),
                        );},
                  ),
              ),

            ]
        ),
      );

  }
  positiveDialog(BuildContext,context){
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(30.0),left: Radius.circular(30.0))),
            backgroundColor: Colors.blueAccent[100] ,
            title: Text("YOU ARE AWESOME", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,),),
            content: Text("You found  \"$userInput\" \nKeep going \nNever Give Up", style: TextStyle(fontSize:18.0,fontStyle: FontStyle.italic),),
            actions: <Widget>[
              FlatButton(
                  onPressed:() =>Navigator.of(context).pop(),
                  child: Text("Okay"),color: Colors.blue[500],)
            ],
          );
        }
    );
  }
  negativeDialog(BuildContext,context){
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(30.0),left: Radius.circular(30.0))),
            backgroundColor: Colors.redAccent[100] ,
            title: Text("KEEP TRYING", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,),),
            content: Text("You found nothing\nKeep guessing \nNever Give Up", style: TextStyle(fontSize:18.0,fontStyle: FontStyle.italic),),
            actions: <Widget>[
              FlatButton(
                  onPressed:() =>Navigator.of(context).pop(),
                  child: Text("Okay"))
            ],
          );
        }
    );
  }
  congratDialog(BuildContext,context){
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(30.0),left: Radius.circular(30.0))),

            title: Text("HURRAY, YOU WON", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,),),
            content: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.blueGrey, Colors.green],begin: Alignment.bottomRight, end: Alignment.topLeft)),
                child: Text("CONGRTULATION", style: TextStyle(fontSize:18.0,fontStyle: FontStyle.italic),)),
            actions: <Widget>[
              FlatButton(
                  onPressed:() =>Navigator.of(context).pop(),
                  child: Text("Okay"))
            ],
          );
        }
    );
  }
}
