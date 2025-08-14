import 'dart:ffi';

import 'package:flutter/material.dart';

enum SexType { MALE, FEMALE }


class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double height = 100;
  double weight = 50;
  double age    = 8;
  SexType type = SexType.MALE;

   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.black,
       
        padding: EdgeInsets.only(top: 50,  right: 20, bottom: 20),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

           Row(
            children: [
               Padding(padding:EdgeInsets.symmetric(horizontal: 10)),
           Text("BMI Calculator",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

            ],
           ),
            
            SizedBox(height: 50,),
            
            Row(
              children: [
                Padding(padding:EdgeInsets.all(10)),
                Expanded(

                   child: InkWell(
                      onTap: () {
                        type = SexType.MALE;
                        setState(() {});
                      },
                  
                  child: 
                Container(
                  height: 50,
                  decoration: decoration(
                      color: type == SexType.MALE ? Colors.blue : null,
                      
                  ),
                
                  child: Center(
                    child: Text("Male",style: TextStyle(color: type == SexType.MALE ? Colors.white :Colors.blue
                    ,fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                )
                ),
                ),
                SizedBox(width: 20,),
                Expanded(
                 
                   child: InkWell(
                      onTap: () {
                        type = SexType.FEMALE;
                        setState(() {});
                      },
                  
                  child: 
                Container(
                  height: 50,
                  decoration: decoration(
                     color: type == SexType.FEMALE ? Colors.blue : null,

                  ),
                
                  child: Center(
                    child: Text("Female",style: TextStyle(color: type == SexType.FEMALE ? Colors.white :Colors.blue,
                    fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                )
                ),           
                 ),
              ],
            ),
          
            SizedBox(height: 30,),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Expanded(
                  child: Column(
                   
                    children: [
                      Container(
                        height: 400,
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                           color: const Color.fromARGB(255, 58, 57, 57),
                           borderRadius: BorderRadius.circular(10)
                        ),
                        
                       child: Column(
                        children: [
                          Text("Height",style: TextStyle(color: Colors.grey,fontSize: 15),),
                           SizedBox(height: 50,),
                          RotatedBox(
                            quarterTurns: 3,
                            child: 
                             Slider(
                            value: height,
                            min: 100,
                            max: 220,
                            activeColor: Colors.blue,
                             onChanged: (value){
                              height=value;
                              setState(() {});
                              

                             },
                            ),
                            ),
                            Spacer(),

                          Text(
                          height.toInt().toString(),
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        Text("CM", style: TextStyle(fontSize: 15, color: Colors.white))
                                        
                        ],
                       )
                       
                      )
                    ],
                  ),
                  ),
                  
                  SizedBox(width: 15,),

                   Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 190,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                           color: const Color.fromARGB(255, 58, 57, 57),
                           borderRadius: BorderRadius.circular(10)
                        
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Text("Weight",style: TextStyle(color: Colors.grey,fontSize: 15),),
                              SizedBox(height: 15,),
                              Text(weight.toInt().toString(),style: TextStyle(fontSize: 40, color: Colors.white),),
                              SizedBox(height: 10,),
                              Row(
                               children: [
                                FloatingActionButton(onPressed:() {
                              
                               weight++;
                                setState(() { });
                              },
                              shape: CircleBorder(),
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.add,color: Colors.white,),
                              ),
                              Spacer(),

                               FloatingActionButton(onPressed:() {
                               
                               if(weight>0){
                                weight--;
                               }
                                setState(() { });
                              },
                              shape: CircleBorder(),
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.remove,color: Colors.white,),
                              ),
    
                               ] 
 

                              )
                              
                            ],
                          ),
                        ),
                       
                      ),

                      SizedBox(height: 20,),

                       Container(
                        height: 190,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                           color: const Color.fromARGB(255, 58, 57, 57),
                           borderRadius: BorderRadius.circular(10)
                        ),
                       child: Center(
                        child: Column(
                          children: [
                            Text("Age",style: TextStyle(color: Colors.grey,fontSize: 15),),
                            SizedBox(height: 15,),
                            Text(age.toInt().toString(),style: TextStyle(fontSize: 40, color: Colors.white),),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                FloatingActionButton(
                                  onPressed: (){
                                    age++;
                                    setState(() { });
                 
                                },
                                shape: CircleBorder(),
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.add,color: Colors.white,),
                                ),
                                Spacer(),

                                FloatingActionButton(
                                  onPressed: (){
                                    if(age>0){
                                      age--;
                                    }
                                    setState(() { });
                 
                                },
                                shape: CircleBorder(),
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.remove,color: Colors.white,),
                                )
                              ],
                            )
                          ],
                        ),
                       )
                      )
                    ],
                  ),
                  ),


              ],
            )

            ,
            SizedBox(height: 35,),
            Row(
              children: [
                
                Expanded(
                  child: InkWell(
              onTap: () {
                var bmi = weight / (height * height) * 10000;
                var result = "";
                switch (bmi) {
                  case < 18.5:
                    result = "Underweight";
                  case >= 18.5 && <= 24.9:
                    result = "Normal weight";
                  case >= 25 && <= 29.9:
                    result = "Overweight";

                  default:
                    result = "Obese";
                }

                showAlertDialog(context, title: result);
                print(bmi.toString());
              },
              child:  Container(
                    margin: EdgeInsets.only(left: 20),
                  height: 50,
                  
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color:Colors.blue,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("Calculate bmi",style: TextStyle(color: Colors.white,fontSize: 20),),
         
                  ),
                ),
                  )
                  
                  )
                  
              ],
            )


                 ]
    )));
   }
}


BoxDecoration decoration({Color? color}){
  return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.circular(12),
    );
}


  void showAlertDialog(BuildContext context, {required String title}) {
    AlertDialog alert = AlertDialog(title: Text(title));
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
