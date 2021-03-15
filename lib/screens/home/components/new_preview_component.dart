import 'package:flutter/material.dart';

class NewPreviewComponent extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final String description;

  NewPreviewComponent({
    Key key,
    @required this.image,
    @required this.title,
    @required this.date,
    @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.indigo.withAlpha(40),
        onTap: () {},
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.network(image, width: 40, height: 40),
                  Container(
                    margin: EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                        Container(
                          margin: EdgeInsets.only(top: 1.0),
                          child: Text(date, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text(description,  style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
