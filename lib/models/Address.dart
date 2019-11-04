class Address {
  int addressId;
  int cep;
  String street;
  String neighborhood;
  String city;
  String state;
  int number;
  String complement;
  String referencePoint;

  Address({
    this.addressId,
    this.cep,
    this.street,
    this.neighborhood,
    this.city,
    this.state,
    this.number,
    this.complement,
    this.referencePoint,
  });

  Address.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    cep = json['cep'];
    street = json['street'];
    neighborhood = json['neighborhood'];
    city = json['city'];
    state = json['state'];
    number = json['number'];
    complement = json['complement'];
    referencePoint = json['reference_point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['cep'] = this.cep;
    data['street'] = this.street;
    data['neighborhood'] = this.neighborhood;
    data['city'] = this.city;
    data['state'] = this.state;
    data['number'] = this.number;
    data['complement'] = this.complement;
    data['reference_point'] = this.referencePoint;
    return data;
  }
}
