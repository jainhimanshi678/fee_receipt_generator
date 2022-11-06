import 'dart:typed_data';
import 'package:number_to_words/number_to_words.dart';
import 'package:pdf/widgets.dart' as p;
import '../constants/StringConstant.dart';
import '../models/Invoice.dart';

Future<Uint8List> makePdf(Invoice invoice) async {
  final pdf = p.Document();
  pdf.addPage(p.Page(build: (context) {
    return p.Column(
      children: [
        p.Align(
          alignment: p.Alignment.center,
          child: p.Column(
            children: [
              p.Text(collegeName, textAlign: p.TextAlign.center),
              p.Text(collegeAddress, textAlign: p.TextAlign.center),
            ],
          ),
        ),
        p.Container(
          margin: const p.EdgeInsets.fromLTRB(0, 20, 0, 2),
          child: p.Row(
            children: [
              p.Expanded(
                child: p.Text("Roll no: ${invoice.rollNo}"),
                flex: 1,
              ),
              p.Expanded(
                child: p.Align(
                    alignment: p.Alignment.topRight, child: p.Text("Date: ${invoice.date}")),
                flex: 1,
              )
            ],
          ),
        ),
        p.Container(
          margin: const p.EdgeInsets.fromLTRB(0, 2, 0, 2),
          child: p.Row(
            children: [
              p.Expanded(
                child: p.Text("Name: ${invoice.student}"),
                flex: 1,
              ),
            ],
          ),
        ),
        p.Container(
          margin: const p.EdgeInsets.fromLTRB(0, 2, 0, 2),
          child: p.Row(
            children: [
              p.Expanded(
                child: p.Text("Semester: ${invoice.sem}"),
                flex: 1,
              ),
              p.Expanded(
                child: p.Align(
                    alignment: p.Alignment.topRight,
                    child: p.Text("Branch: ${invoice.branch}")),
                flex: 1,
              )
            ],
          ),
        ),
        p.Container(
          margin: const p.EdgeInsets.fromLTRB(0, 2, 0, 2),
          child: p.Row(
            children: [
              p.Expanded(
                child: p.Text("Academic Year: ${invoice.year}"),
                flex: 1,
              ),
            ],
          ),
        ),
        p.Table(
          border: p.TableBorder.all(),
          children: [
            // The first row just contains a phrase 'INVOICE FOR PAYMENT'
            p.TableRow(
              children: [
                p.Padding(
                  child: p.Text(
                    'Particulars',
                    style: p.Theme.of(context).header4,
                    textAlign: p.TextAlign.center,
                  ),
                  padding: const p.EdgeInsets.all(10),
                ),
              ],
            ),
            ...invoice.items.map(
              (e) => p.TableRow(
                children: [
                  p.Align(
                    alignment: p.Alignment.topLeft,
                    child: p.Expanded(
                      child: p.Text(e.description),
                      flex: 2,
                    ),
                  ),
                  p.Align(
                      alignment: p.Alignment.topLeft,
                      child: p.Expanded(
                        child: p.Text("${e.cost}"),
                        flex: 1,
                      ))
                ],
              ),
            ),
            // Show the total
            p.TableRow(
              children: [
                p.Align(
                  alignment: p.Alignment.topLeft,
                  child: p.Text('TOTAL', textAlign: p.TextAlign.right),
                ),
                p.Align(
                  alignment: p.Alignment.topLeft,
                  child: p.Text(invoice.totalCost().toStringAsFixed(2)),
                )
              ],
            )
          ],
        ),
        p.Padding(
          child: p.Align(
            alignment: p.Alignment.topLeft,
            child: p.Text(
              "Amt. in words(Rs.) ${NumberToWord().convert('en-in', invoice.totalCost().toInt()).toUpperCase()}",
            ),
          ),
          padding: const p.EdgeInsets.all(20),
        ),
      ],
    );
  }));
  pdf.document.outline.color?.green.floorToDouble();
  return pdf.save();
}
