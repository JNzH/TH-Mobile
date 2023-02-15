class Bill {
  String _patientName = "";
  String _patientAddress = "";
  String _hospitalName = "";

  String get patientName => _patientName;

  set patientName(String value) {
    _patientName = value;
  }

  DateTime _dateOfService = DateTime(2000);
  double _billAmount = 0;

  String get patientAddress => _patientAddress;

  set patientAddress(String value) {
    _patientAddress = value;
  }

  String get hospitalName => _hospitalName;

  set hospitalName(String value) {
    _hospitalName = value;
  }

  DateTime get dateOfService => _dateOfService;

  set dateOfService(DateTime value) {
    _dateOfService = value;
  }

  double get billAmount => _billAmount;

  set billAmount(double value) {
    _billAmount = value;
  }

  Bill(String name, DateTime date, [String address = "", String hospital = "", double amount = 0]) {
    _patientName = name;
    _patientAddress = address;
    _hospitalName = hospital;
    _dateOfService = date;
    _billAmount = amount;
  }
}