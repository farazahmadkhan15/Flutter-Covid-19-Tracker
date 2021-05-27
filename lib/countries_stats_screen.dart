import 'dart:convert';

import 'package:covid_tracker/Components/MyReusableRow.dart';
import 'package:covid_tracker/Models/ContriesStatesModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class CountriesStatsScreen extends StatefulWidget {

  final String name ;
  CountriesStatsScreen({@required this.name}) ;
  @override
  _CountriesStatsScreenState createState() => _CountriesStatsScreenState();
}

class _CountriesStatsScreenState extends State<CountriesStatsScreen> {

  List<CountiresStateModel> countriesStates ;
  Future<CountiresStateModel> getCountriesList()async{

    var response = await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries/'+widget.name));
    var data = json.decode(response.body);
    print(data) ;
    if (response.statusCode == 200) {
      return CountiresStateModel.fromJson(data);
    } else {
      return CountiresStateModel.fromJson(data) ;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text('Total States',style: TextStyle(fontSize: 20 , color: Colors.white),),
              SizedBox(height: 20,),
              FutureBuilder<CountiresStateModel>(
                  future: getCountriesList(),
                  builder: (context, snapshot){
                    print(snapshot) ;

                    if(!snapshot.hasData){
                      return CircularProgressIndicator() ;
                    }else {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10 , right: 10),
                        child: Card(
                          elevation: 2,
                          child: Column(
                            children: [
                              ReusableRow(title: 'Total Cases', value: snapshot.data.cases.toString()),
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
              
            ],
          ),
        ),
      ),
    );
  }
}
