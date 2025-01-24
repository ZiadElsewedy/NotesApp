import 'package:flutter/material.dart';


class NoteWidegt extends StatelessWidget {
  const NoteWidegt({super.key, this.Title, this.Subtitle, this.date});
final String? Title;
final String? Subtitle;
final String? date;
  @override
  Widget build(BuildContext context) {
    
    return  Container(
      
      decoration: BoxDecoration(
        color: const Color(0xFFFFEAA9),
        borderRadius: BorderRadius.circular(16),
      
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(Title!,style: TextStyle(fontSize: 28  , color: Colors.black ),),
            subtitle: Text(Subtitle!,style: TextStyle(fontSize: 20 , color: Colors.black.withOpacity(0.4)  ),),
            trailing: IconButton(onPressed: (){} , icon: Icon(Icons.delete , color: Colors.black,))
            ),
          
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(date! , style: TextStyle(color: Colors.black54 , fontWeight:  FontWeight.bold , fontSize: 15),),
          ) ,
        ],
        
      ) ,
    );
  }
}