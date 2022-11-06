import 'package:fee_receipt_generator/models/Invoice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/LineItem.dart';
import 'PdfPreviewPage.dart';

class InvoicesPage extends StatelessWidget {
  late String student = "";
  late String rollNo = "";
  late String branch = "";
  late String year = "";
  late String sem = "";
  late String address = "";
  late String date=DateTime.now().toString();
  late List<LineItem> items = [LineItem("Admission Fee", 1000)];
  Invoice invoice =
  Invoice("", "", "", "", "", "", [LineItem("Admission Fee", 1000)], "");

  InvoicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Receipt Generator"),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         /* Invoice invoice =
              Invoice(student, rollNo, branch, year, sem, address, items, date);*/
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PdfPreviewPage(invoice: invoice),
            ),
          );
          // rootBundle.
        },
        child: const Icon(Icons.picture_as_pdf),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'What do people call you?',
                labelText: 'Name *',
              ),
              onSaved: (String? value) {
                invoice.student = value!;
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },
              onChanged: (String? value) {
                invoice.student = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Address',
                labelText: 'Address *',
              ),
              onSaved: (String? value) {
                invoice.address = value!;
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },
              onChanged: (String? value) {
                invoice.address = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Course Name',
                labelText: 'Course Name',
              ),
              onSaved: (String? value) {
                invoice.student = value!;
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },
              onChanged: (String? value) {
                invoice.student = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Roll no.',
                labelText: 'Roll no.',
              ),
              onSaved: (String? value) {
                invoice.rollNo = value!;
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },
              onChanged: (String? value) {
                invoice.rollNo = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Branch',
                labelText: 'Branch ',
              ),
              onSaved: (String? value) {
                invoice.branch = value!;
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },
              onChanged: (String? value) {
                invoice.branch = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Year',
                labelText: 'Year *',
              ),
              onSaved: (String? value) {
                invoice.year = value!;
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },
              onChanged: (String? value) {
                invoice.year = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Semester',
                labelText: 'Semester',
              ),
              onSaved: (String? value) {
                invoice.sem = value!;
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },
              onChanged: (String? value) {
                invoice.sem = value!;
              },
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime newDateTime) {
                  invoice.date = newDateTime.toString();
                },
              ),
            ),
            const ElevatedButton(onPressed: null, child: Text("Add Particulars"),)
          ],
        ),
      ),
    );
  }
}
