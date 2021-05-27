class CountriesListModel {
  int updated;
  String country;
  CountryInfo countryInfo;


  CountriesListModel(
      {this.updated,
        this.country,
        this.countryInfo,
       });

  CountriesListModel.fromJson(Map<String, dynamic> json) {
    updated = json['updated'];
    country = json['country'];
    countryInfo = json['countryInfo'] != null
        ? new CountryInfo.fromJson(json['countryInfo'])
        : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updated'] = this.updated;
    data['country'] = this.country;
    if (this.countryInfo != null) {
      data['countryInfo'] = this.countryInfo.toJson();
    }

    return data;
  }
}

class CountryInfo {
  int iId;
  String iso2;
  String iso3;
  String flag;

  CountryInfo({this.iId, this.iso2, this.iso3,  this.flag});

  CountryInfo.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];

    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.iId;
    data['iso2'] = this.iso2;
    data['iso3'] = this.iso3;
    data['flag'] = this.iso3;
    return data;
  }
}

