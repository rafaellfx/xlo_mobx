import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/models/uf.dart';

class Address {
  UF uf;
  City city;
  String zipcode;
  String district;

  Address({this.uf, this.city, this.zipcode, this.district});

  @override
  String toString() {
    return 'Address{uf: $uf, city: $city, zipcode: $zipcode, district: $district}';
  }
}
