import 'package:flight/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
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
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: CustomAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            HomeScreenTopPart(),
            HomeScreenBottomPart()
          ],
        ),
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
            height: 380.0,
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
                  height: 20.0,
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

List<CityCard> cityList=[
  CityCard("assets/images/lasvegas.jpg","Las Vegas","Feb 2019","45","4299","2258"),
  CityCard("assets/images/athens.jpg","Athens","Apr 2019","50","9999","4158"),
  CityCard("assets/images/sydney.jpeg","Sydney","Dec 2018","48","6999","3258"),
];


class HomeScreenBottomPart extends StatefulWidget {
  @override
  _HomeScreenBottomPartState createState() => _HomeScreenBottomPartState();
}

class _HomeScreenBottomPartState extends State<HomeScreenBottomPart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width: 16.0,),
              Text("Recently Viewed",style: dropDownMenuItemStyle,),
              Spacer(),
              Text("VIEW ALL",style: TextStyle(fontSize: 14.0,color: theme.primaryColor),)
            ],
          ),
        ),
        Container(
          height: 250.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children:cityList
          ),
        )
      ],
    );
  }
}



class CityCard extends StatefulWidget {

  final String imagePath,cityName,monthYear,discount,oldPrice,newPrice;

  CityCard(this.imagePath,this.cityName,this.monthYear,this.discount,this.oldPrice,this.newPrice);

  @override
  _CityCardState createState() => _CityCardState();
}

class _CityCardState extends State<CityCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 210.0,
                  width: 160.0,
                  child: Image.asset(widget.imagePath,fit: BoxFit.cover,),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  width: 160.0,
                  height: 60.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          Colors.black12
                        ]
                      )
                    ),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  right: 10.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.cityName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),),
                          Text(widget.monthYear,style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 14.0))
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.0,vertical: 2.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                          child: Text(
                            widget.discount+"%",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black
                            ),
                          )
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                width: 5.0,
              ),
              Text(
                "\$"+widget.newPrice,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
                )
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "\$"+widget.oldPrice,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize:18.0
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

