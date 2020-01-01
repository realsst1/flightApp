import 'package:flight/CustomShapeClipper.dart';
import 'package:flight/main.dart';
import 'package:flutter/material.dart';

final Color discountBackgroundColor=Color(0xFFFFE08D);
final Color flightBorderColor=Color(0xFFE6E6E6);
final Color chipBackgroundColor=Color(0xFFF6F6F6);

Color firstColor = Color(0xFFF47D15);
Color secondColor = Color(0xFFEF772C);


class InheritedFlightListing extends InheritedWidget{

  final String fromLocation,toLocation;

  InheritedFlightListing({this.fromLocation,this.toLocation,Widget child}):super(child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static InheritedFlightListing of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<InheritedFlightListing>();
  }

}



class FlightListingScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Search Results"),
        centerTitle: true,
        leading: InkWell(
            child: Icon(Icons.arrow_back),
            onTap: (){
              Navigator.pop(context);
            },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            FlightListTopPart(),
            SizedBox(height: 20.0,),
            FlightListingBottomPart()
          ],
        ),
      ),
    );
  }
}


class FlightListTopPart extends StatefulWidget {


  @override
  _FlightListTopPartState createState() => _FlightListTopPartState();
}

class _FlightListTopPartState extends State<FlightListTopPart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:0.0),
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      firstColor,
                      secondColor
                    ]
                )
              ),
              height: 160.0,
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                elevation: 10.0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal:16.0,vertical: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              InheritedFlightListing.of(context).fromLocation,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            Text(
                              InheritedFlightListing.of(context).toLocation,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Expanded(flex:1,child: Icon(Icons.import_export,color: Colors.black,size: 32.0,))
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


class FlightListingBottomPart extends StatefulWidget {
  @override
  _FlightListingBottomPartState createState() => _FlightListingBottomPartState();
}

class _FlightListingBottomPartState extends State<FlightListingBottomPart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0,),
            child: Text(
              "Best Deals",
              style: dropDownMenuItemStyle,
            ),
          ),
          SizedBox(height: 10.0,),
          ListView(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),

            ],
          )
        ],
      ),
    );
  }
}

class FlightCard extends StatefulWidget {
  @override
  _FlightCardState createState() => _FlightCardState();
}

class _FlightCardState extends State<FlightCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: flightBorderColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "\$ 8888",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(width: 4.0,),
                      Text(
                        "\$ 8888",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: <Widget>[
                      FlightDetailChip(Icons.calendar_today,"Dec 2019"),
                      FlightDetailChip(Icons.flight_takeoff,"IndiGo"),
                      FlightDetailChip(Icons.star,"4.4")
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 10.0,
            right: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
              child: Text(
                "55%",
                style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              decoration: BoxDecoration(
                color: discountBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
            ),
          )
        ],
      ),
    );
  }
}


class FlightDetailChip extends StatefulWidget {

  final IconData iconData;
  final String label;

  FlightDetailChip(this.iconData,this.label);



  @override
  _FlightDetailChipState createState() => _FlightDetailChipState();
}

class _FlightDetailChipState extends State<FlightDetailChip> {
  @override
  Widget build(BuildContext context) {
    return RawChip(
        label: Text(
          widget.label
        ),
      labelStyle: TextStyle(
        color: Colors.black,
        fontSize: 14.0,
      ),
      backgroundColor: chipBackgroundColor,
      avatar: Icon(widget.iconData,size: 14.0,),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),

    );
  }
}


