import 'package:flutter/material.dart';
import 'package:pantau_pasien/const/color.dart';

class HeaderDetailPatient extends StatelessWidget {
  final String name;
  HeaderDetailPatient({this.name});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 290.0,
      color: primaryColor,
      child: SafeArea(
              child: Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                 child: Container(
                    // color: Colors.pink[100],
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 50.0),
                        alignment: Alignment.topCenter,
                        child: GestureDetector(onTap:(){
                          Navigator.pop(context);
                        },child: Icon(Icons.arrow_back,color: Colors.white,size: 30.0,))
                      )
                    )
                  )
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.only(top: 30.0),
                    // color: Colors.pink[200],
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            maxRadius: 70.0,
                            backgroundImage: NetworkImage(
                                'https://ichef.bbci.co.uk/news/660/cpsprodpb/12A9B/production/_111434467_gettyimages-1143489763.jpg')
                                ),
                                SizedBox(height: 24.0,),
                                Text("asas",style: TextStyle(color: Colors.white,fontSize: 18.0),)
                        ],
                      ),
                    )
                  )
                ),
               Flexible(
                  flex: 2,
                 child: Container(
                    // color: Colors.pink[100],
                    // child: Center(child: Icon(Icons.arrow_back))
                  )
                ),
              ],
            ),
      ),
        
      
    
    );
  }
}
