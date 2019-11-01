class Address {
  int address_id;
  String cep;
  String street;
  String neighborhood;
  String city;
  String state;
  int number;
  String complement;
  String reference_point;

  Address({
    this.address_id,
    this.cep,
    this.street,
    this.neighborhood,
    this.city,
    this.state,
    this.number,
    this.complement,
    this.reference_point,
  });

  Address.fromJson(Map<String, dynamic> json) {
    address_id = json['address_id'];
    cep = json['cep'];
    street = json['street'];
    neighborhood = json['neighborhood'];
    city = json['city'];
    state = json['state'];
    number = json['number'];
    complement = json['complement'];
    reference_point = json['reference_point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.address_id;
    data['cep'] = this.cep;
    data['street'] = this.street;
    data['neighborhood'] = this.neighborhood;
    data['city'] = this.city;
    data['state'] = this.state;
    data['number'] = this.number;
    data['complement'] = this.complement;
    data['reference_point'] = this.reference_point;
    return data;
  }
}
