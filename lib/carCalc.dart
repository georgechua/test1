import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'dart:math';


class CarLoanCalc extends StatefulWidget {
  @override
  _CarLoanCalcState createState() => _CarLoanCalcState();
}

class _CarLoanCalcState extends State<CarLoanCalc> {
  double nRate = 0.0,nPrice = 0.0, nPrincipal = 0.0, nDownPayment =0.0, nTerm = 0.0,nMonthly = 0.0,nInterest = 0.0, 
  nInterestBreakdown = 0.0,
  nPrincipalBreakdown =0.0,
  nTotal_payment = 0.0;// variables

  final TextEditingController iRate = new TextEditingController();
  final TextEditingController iDownPayment = new TextEditingController();
  final TextEditingController iPrice = new TextEditingController();
  final TextEditingController iTerm = new TextEditingController();

  void calcLoan() {
    setState(() {
      
     
      nPrice  = double.parse(iPrice.text); // total loan amount
      nDownPayment = double.parse(iDownPayment.text);
      nTerm       = double.parse(iTerm.text);
      nRate       = (double.parse(iRate.text)/100.0)*nTerm;   //total

      
      nPrincipal = nPrice - nDownPayment;
      
      nInterest = nRate*nPrincipal;
      nTotal_payment = nInterest + nPrincipal;
      nMonthly = (nTotal_payment)/(nTerm*12.0);
   
    });
 
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        elevation: 1.0,
        title: new Text('Car Loan Calculator',style: new TextStyle(fontFamily: 'Nunito',fontWeight: FontWeight.bold,color: Colors.grey[850]),),
      ),
      body: new Container(
          padding: const EdgeInsets.fromLTRB(20.0,10.0,20.0,0.0),
          child: new ListView(
            children: <Widget>[
                new TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "Car Price",
                    labelStyle: new TextStyle(fontFamily: 'Nunito',fontWeight: FontWeight.bold,color: Colors.grey[850])
                 ),
                  controller: iPrice
              ),
              new Padding(padding: EdgeInsets.only(bottom: 5.0),),
                new TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "Downpayment Amount",
                    labelStyle: new TextStyle(fontFamily: 'Nunito',fontWeight: FontWeight.bold,color: Colors.grey[850])
                  ),
                  controller: iDownPayment,
              ),
              new Padding(padding: EdgeInsets.only(bottom: 5.0),),
                new TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "Interest Rate (%)",
                    labelStyle: new TextStyle(fontFamily: 'Nunito',fontWeight: FontWeight.bold,color: Colors.grey[850])
                  ),
                  controller: iRate,
              ),
              new Padding(padding: EdgeInsets.only(bottom: 5.0),),
                new TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "Loan Terms (years)",
                    labelStyle: new TextStyle(fontFamily: 'Nunito',fontWeight: FontWeight.bold,color: Colors.grey[850])
                  ),
                  controller: iTerm,
              ),
              new Padding(padding: EdgeInsets.only(bottom: 20.0),),
              new FloatingActionButton(
              elevation: 5.0,
              backgroundColor: Colors.orange[800],
              child: Icon(Icons.arrow_forward,size: 30.0,),
              onPressed: calcLoan
              ),
              
              new Padding(padding: EdgeInsets.only(bottom: 20.0),),
               new Row(children: <Widget>[
                  new Text('Monthly Repayment: RM',style: new TextStyle(fontFamily:'Nunito',fontSize:18.0,color:Colors.blue[800]),), 
                  new Text(Decimal.parse('$nMonthly').toStringAsFixed(2),style: new TextStyle(fontFamily:'Nunito',fontSize:18.0,color:Colors.blue[800]),)
              ],
              ),
              new Padding(padding: EdgeInsets.only(bottom: 10.0),),
               new Row(children: <Widget>[
                  new Text('Total Amount Paid: RM',style: new TextStyle(fontFamily:'Nunito',fontSize:18.0,color: Colors.green[800]),), 
                  new Text(Decimal.parse('$nTotal_payment').toStringAsFixed(0),style: new TextStyle(fontFamily:'Nunito',fontSize:18.0,color: Colors.green[800]),)
              ],
              ),
              new Padding(padding: EdgeInsets.only(bottom: 10.0),),
               new Row(children: <Widget>[
                  new Text('Loan Amount: RM',style: new TextStyle(fontFamily:'Nunito',fontSize:18.0,color: Colors.red[800]),), 
                  new Text(Decimal.parse('$nPrincipal').toStringAsFixed(2),style: new TextStyle(fontFamily:'Nunito',fontSize:18.0,color: Colors.red[800]),)
              ],
              ),
              new Padding(padding: EdgeInsets.only(bottom: 10.0),),
               new Row(children: <Widget>[
                  new Text('Interest: RM',style: new TextStyle(fontFamily:'Nunito',fontSize:18.0,color: Colors.red[800]),), 
                  new Text(Decimal.parse('$nInterest').toStringAsFixed(2),style: new TextStyle(fontFamily:'Nunito',fontSize:18.0,color: Colors.red[800]),)
              ],
              ),
            ],
          ), 
        ),
    );
  }
}