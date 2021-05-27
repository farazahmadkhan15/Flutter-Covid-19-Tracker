import 'dart:convert';

import 'package:covid_tracker/Models/world_states_model.dart';
import 'package:covid_tracker/all_countries_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Components/MyReusableRow.dart';

class WorldStates extends StatefulWidget {
  @override
  _WorldStatesState createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates> {



  Future<WorldStatesModel> getWorldStatesApi()async{

    var response = await http.get(Uri.parse('https://corona.lmao.ninja/v2/all'));
    var data = json.decode(response.body);
    print(data) ;
    if (response.statusCode == 200) {
      return WorldStatesModel.fromJson(data);
    } else {
      return WorldStatesModel.fromJson(data) ;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text('Total States',style: TextStyle(fontSize: 20 , color: Colors.white),),
              SizedBox(height: 20,),
              FutureBuilder<WorldStatesModel>(
                future: getWorldStatesApi(),
              builder: (context, snapshot){
                  print(snapshot) ;

                  if(!snapshot.hasData){
                   return Padding(
                     padding: const EdgeInsets.only(left: 10 , right: 10),
                     child: Container(
                       height : 100 ,
                         width: 100,
                         child: Center(child: CircularProgressIndicator())),
                   ) ;
                  }else {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10 , right: 10),
                      child: Card(
                        elevation: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ReusableRow(title: 'Total Cases', value: snapshot.data.cases.toString()),
                            ReusableRow(title: 'todayCases', value: snapshot.data.affectedCountries.toString()),
                            ReusableRow(title: 'deaths', value: snapshot.data.deaths.toString()),
                            ReusableRow(title: 'todayDeaths', value: snapshot.data.recovered.toString()),
                            ReusableRow(title: 'recovered', value: snapshot.data.critical.toString()),
                            ReusableRow(title: 'todayRecovered', value: snapshot.data.critical.toString()),
                            ReusableRow(title: 'active', value: snapshot.data.critical.toString()),
                            ReusableRow(title: 'critical', value: snapshot.data.critical.toString()),
                            ReusableRow(title: 'AffectedCountries', value: snapshot.data.critical.toString())

                          ],
                        ),
                      ),
                    );
                  }

              }),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10 , right: 10),
                child: Material(
                  color: Colors.green[400],
                  child: MaterialButton(
                    minWidth: double.infinity,
                    child: Text('Countries Tracker'),
                    onPressed: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => AllCountiresList()));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


