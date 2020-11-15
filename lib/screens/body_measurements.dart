import 'package:flutter/material.dart';
import 'package:virtual_fitting_room/screens/enter_measurement_page.dart';

class bodyMeasurements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return bodyMeasurementsStatefulWidget();
  }
}

class bodyMeasurementsStatefulWidget extends StatefulWidget {
  bodyMeasurementsStatefulWidget({Key key}) : super(key: key);

  @override
  bodyMeasurementsStatefulWidgetState createState() => bodyMeasurementsStatefulWidgetState();
}
class bodyMeasurementsStatefulWidgetState extends State<bodyMeasurementsStatefulWidget> {

  final List<String> images=['weight.jpg','height.jpg'];
  final List<String> items=['Body Weight','Body Height'];
  final List<bool> isEntered=List.filled(2, false);
  final List<String> measurements=List.filled(2, null);
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery
        .of(context)
        .size
        .height;
    double _width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Virtual Fitting Room"),
        backgroundColor: Color(0xFF9F140B),
        centerTitle: true,
      ),
      body: ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        child:Card(
          child:ListTile(
            leading: Image.asset('assets/${images[index]}',width: _width*0.2,fit: BoxFit.cover,),
            title: Text('${items[index]}'),

          trailing: isEntered[index]? Icon(Icons.check,color: Colors.green,): Icon(Icons.check,color: Colors.red,),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => enterMeasurements(
                    (isEntered,measurement){
                      setState(()
                          {
                          this.isEntered[index]=isEntered;
                          this.measurements[index]=measurement;
                          });
                    },index
                )
              )
            );
          }
          ),
        )

      );
    })
    );
  }
}
