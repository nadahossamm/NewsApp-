import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildTaskItem(article)=> Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        child: Image(image: NetworkImage('${article['urlToImage']}'),
          height:120,
          width: 120,
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        child: Container(
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Text('${article['title']}',style: TextStyle(
                  fontSize: 20
              ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),),
              Text('${article['publishedAt']}',style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54
              ),
              ),

            ],
          ),
        ),
      )
    ],
  ),
);