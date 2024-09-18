import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  final String imageUrl;
  final String overview;
  final String logoUrl;
  final String month;
  final String day;
  const ComingSoon({
    super.key,
     required this.imageUrl,
     required this.overview,
     required this.logoUrl,
     required this.month,
     required this.day
     });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                width: 10), 
                Text(month,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
               ),
               Text(day,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  letterSpacing: 5,
                ),
               ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(child: Column(
            children: [
            Image.network(imageUrl),
            Row(
              children: [
                SizedBox(
                  width: size.width *0.5,
                  height: size.height*0.2,
                  child: Image.network(
                    imageUrl,
                    alignment:Alignment.centerLeft
                    ),
                ),
                Column(
                  children: [
                    
                  ],
                ),
              ], 
            )
            ],
          ),
          )
        ],
      ),
    );
  }
}