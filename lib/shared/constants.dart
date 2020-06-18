import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2.0),
  ),
);


class CustomListTile extends StatelessWidget{
  final IconData icon;
  final String text;
  final Function onTap;
  CustomListTile({this.icon, this.text, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
          child: Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade400))
            ),
            child: InkWell(
              splashColor: Colors.lightBlueAccent,
        onTap: onTap,
        child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    SizedBox(width: 15,),
                    Text(text, style: TextStyle(
                      fontSize: 16,
                    ),),
                  ],
                ),
                Icon(Icons.arrow_right),
              ],
            ),
        ),
      ),
          ),
    );
  }
  
}


class RoundedButton extends StatelessWidget {
  final Color colour;
  final String title;
  final Function onPressed;

  const RoundedButton({this.colour, this.title,@required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color:colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white, //if colour of button and tet are white ??
            ),
          ),
        ),
      ),
    );
  }
}
