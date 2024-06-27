import 'package:flutter/material.dart';
import '../constants/colors.dart';



class PageNotFound extends StatelessWidget{
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const  Text("Whooooops!!", 
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: secondColor
                                      ),),
          Image.asset("assets/images/ErrorPage.png"),
      
         

           Container(
                
                                height: 70,
                                width: 260,
                                margin: const EdgeInsets.all(10),
                              child: ElevatedButton(  
                       
                                    
                                    // c: kGreen,  
                                    // shape: RoundedRectangleBorder(
                                    //   borderRadius:BorderRadius.circular(20 ),
                                    //   side: BorderSide(color: Colors.grey.shade300),),
                                      child:
                                    
                                          const Text("Go Home", 
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                      ),),
 
                                    onPressed: () {
                                  
                                        Navigator.pushNamed(context, "/");
                                    },  
                                  ),
                            ),
        ],
      ),),
    );
  }

}