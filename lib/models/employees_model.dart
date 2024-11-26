class Employee {
  late String id;
  String? name;
  String? job;
  DateTime? admissionDate;
  String? phone;
  String? image;

  Employee({
    this.id = '',
    this.name,
    this.job,
    this.admissionDate,
    this.phone,
    this.image,
  });

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    job = json['job'];
    //Formatacao de data
    admissionDate = json['admission_date'] != null
        ? DateTime.tryParse(json['admission_date'])
        : null;
    phone = formatPhone(json['phone']);
    image = json['image'];
  }
//Formatacao de telefone
  String formatPhone(String phone) {
    if (phone.length == 13) {
      return '+55 (${phone.substring(2, 4)}) ${phone.substring(4, 5)} ${phone.substring(5, 9)}-${phone.substring(9)}';
    } else {
      return phone;
    }
  }
}
