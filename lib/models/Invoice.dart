import 'LineItem.dart';

class Invoice {
  String student;
  String rollNo;
  String branch;
  String year;
  String sem;
  String address;
  List<LineItem> items;
  String date;
  Invoice(this.student, this.rollNo, this.branch, this.year, this.sem, this.address, this.items, this.date);
  double totalCost() {
    return items.fold(0, (previousValue, element) => previousValue + element.cost);
  }
}