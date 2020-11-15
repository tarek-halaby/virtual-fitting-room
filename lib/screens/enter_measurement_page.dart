import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class enterMeasurements extends StatefulWidget {
  var callback;
  int index;
  final List<String> imagesNames = ['weightEx.png', 'heightEx.png'];
  final List<String> items = ['Body Weight', 'Body Height'];
  final List<String> enteritems = ['body weight', 'body height'];

  enterMeasurements(this.callback, this.index);

  @override
  _enterMeasurementsStatefulWidgetState createState() =>
      _enterMeasurementsStatefulWidgetState();
}

class _enterMeasurementsStatefulWidgetState extends State<enterMeasurements> {
  bool _passwordVisible;
  final _formKey = GlobalKey<FormState>();
  final measurementController = TextEditingController();
  bool isEntered=false;
  @override
  void dispose() {
    measurementController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Virtual Fitting Room"),
        backgroundColor: Color(0xFF9F140B),
        centerTitle: true,
      ),
      body: Builder(builder: (BuildContext context) {
        double _height = MediaQuery
            .of(context)
            .size
            .height;
        double _width = MediaQuery
            .of(context)
            .size
            .width;
        return ListView(children: <Widget>[
          SizedBox(height: _height * 0.025),
          Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: _height * 0.03,),
                    Container(
                      child: Center(
                        child: Text('${widget.items[widget.index]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(height: _height * 0.04,),
                    Container(
                      child: Image.asset(
                        "assets/${widget.imagesNames[widget.index]}",
                        width: _width * 0.9,
                        height: _height * 0.3,
                        fit: BoxFit.contain,),
                    ),
                    SizedBox(height: _height * 0.05,),
                    Container(
                      child: Text("please enter your ${widget.enteritems[widget
                          .index]} :"),
                    ),
                    SizedBox(height: _height * 0.02,),
                    Container(
                        child:Form(
                        key: _formKey,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center ,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: _width*0.6,
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                        controller: measurementController,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "* Please enter your ${widget
                                                .enteritems[widget.index]}";
                                          }
                                          return null;
                                        },
                                        decoration: new InputDecoration(
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: 0.2),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: 0.2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: 0.2),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: 0.2),
                                          ),
                                          hintText: '${widget.enteritems[widget.index]}',
                                        ),
                                        autofocus: false,
                                      )
                                      ),
                                      SizedBox(width: _width * 0.05,),

                                      Container(
                                        child:Text("cm")
                                      ),

                                    ]

                                )
                            )),
                              SizedBox(height: _height * 0.05,),
                              Container(
                                  height:_height*0.07,
                                  child: RaisedButton(

                                    onPressed: ()  {

                                      if (_formKey.currentState
                                          .validate()) {
                                        isEntered=true;
                                        widget.callback(isEntered,measurementController.text);
                                        Navigator.pop(context);
                                      }

                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius
                                            .circular(5.0),
                                        side:
                                        BorderSide(color: Color(
                                            0xFF9F140B))),
                                    color: Color(0xFF9F140B),
                                    child: Text(
                                      "Done",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    ),
                                  )),
                            ])

                    ),
        ]);
      }),
    );
  }
}
