import 'package:flutter/material.dart';

import 'CustomShapeClipper.dart';

void main()=>runApp(MaterialApp(
  title: 'Flight App',
  debugShowCheckedModeBanner: false,
  home: HomeScreen(),
  theme: theme,
));

Color firstColor = Color(0xFFF47D15);
Color secondColor = Color(0xFFEF772C);


ThemeData theme=new ThemeData(
  primaryColor: Color(0xFFF3791A),
  fontFamily: 'Oxygen'
);


List<String> locations=['Boston(BOS)','New Delhi(DEL)','Kolkata(CCU)'];

const TextStyle dropDownLabelStyle=TextStyle(color: Colors.white,fontSize: 16.0);
const TextStyle dropDownMenuItemStyle=TextStyle(color: Colors.black,fontSize: 16.0);

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HomeScreenTopPart()
        ],
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {

  var selectedLocation=0;
  var isFlightSelected=true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  firstColor,
                  secondColor
                ]
              )
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.location_on,color: Colors.white,),
                      SizedBox(
                        width: 16.0,
                      ),
                      PopupMenuButton(
                        onSelected: (index){
                          setState(() {
                            selectedLocation=index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              locations[selectedLocation],
                              style: dropDownLabelStyle,
                            ),
                            Icon(Icons.arrow_drop_down,color: Colors.white,)
                          ],
                        ),
                        itemBuilder: (BuildContext context)=><PopupMenuItem<int>>[
                          PopupMenuItem(
                            child: Text(locations[0],style: dropDownMenuItemStyle,),
                            value: 0,
                          ),
                          PopupMenuItem(
                            child: Text(locations[1],style: dropDownMenuItemStyle,),
                            value: 1,
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.settings,color: Colors.white,)
                    ],
                  ),
                ),
                SizedBox(height: 50.0,),
                Text(
                  "Where would \nyou like to go ?",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.0,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: TextField(
                      controller: TextEditingController(
                        text: locations[0],
                      ),
                      style: dropDownMenuItemStyle,
                      cursorColor: theme.primaryColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 14.0),
                        border: InputBorder.none,
                        suffixIcon: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          child: Icon(Icons.search,color: Colors.black,),
                        )
                      ),
                    )
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    InkWell(
                        child: ChoiceChip(Icons.flight_takeoff,"Flights",isFlightSelected),
                        onTap: (){
                          setState(() {
                            isFlightSelected=!isFlightSelected;
                          });
                        },
                    ),
                    SizedBox(width: 20.0,),
                    InkWell(child: ChoiceChip(Icons.hotel,"Hotels",!isFlightSelected),onTap: (){
                      setState(() {
                        isFlightSelected=!isFlightSelected;
                      });
                    })
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {

  final IconData iconData;
  final String text;
  final bool isSelected;

  ChoiceChip(
    this.iconData,
    this.text,this.isSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:18.0,vertical: 8.0),
      decoration: widget.isSelected ? BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.all(Radius.circular(20.0))
      ):null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(widget.iconData,color: Colors.white,size: 20.0,),
          SizedBox(width: 8.0,),
          Text(widget.text,style: TextStyle(
            color: Colors.white,
            fontSize: 16.0
          ),)
        ],
      ),
    );
  }
}
