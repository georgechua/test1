import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'dart:math';


class LoanCalc extends StatefulWidget {
  @override
  _LoanCalcState createState() => _LoanCalcState();
}

class _LoanCalcState extends State<LoanCalc> {
  double nRate = 0.0, nPrincipal = 0.0, nTerm = 0.0,nMonthly = 0.0,nInterest = 0.0, 
  nInterestBreakdown = 0.0,
  nPrincipalBreakdown =0.0,
  nTotal_payment = 0.0;// variables

  final TextEditingController iRate = new TextEditingController();
  final TextEditingController iPrincipal = new TextEditingController();
  final TextEditingController iTerm = new TextEditingController();

  void calcLoan() {
    setState(() {
      
      nRate       = (double.parse(iRate.text)/100)/12; //interest per month
      nPrincipal  = double.parse(iPrincipal.text); // total loan amount
      nTerm       = double.parse(iTerm.text)*12; //term loans convert to month

      nTotal_payment = ( (nRate*nPrincipal*nTerm) / (1-(pow((1+nRate),-nTerm))));
      nMonthly = nTotal_payment/nTerm;
      nInterest = nTotal_payment - nPrincipal;
      nInterestBreakdown = (nInterest/nTotal_payment)*100;
      nPrincipalBreakdown = 100.0 - nInterestBreakdown;

      
    });
 
  }
  
  void reset(){
    setState(() {
          iRate.text = "";
          iPrincipal.text = "";
          iTerm.text = "";
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        elevation: 1.0,
        title: new Text('Home Loan Calculator',style: new TextStyle(fontFamily: 'Nunito',fontWeight: FontWeight.bold,color: Colors.grey[850]),),
      ),
      body: new Container(
          padding: const EdgeInsets.fromLTRB(20.0,10.0,20.0,0.0),
          child: new ListView(
            children: <Widget>[
                new TextFormField(

                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "Principal (Total Loan Amount)",
                    labelStyle: new TextStyle(fontFamily: 'Nunito',fontWeight: FontWeight.bold,color: Colors.grey[850])
                 ),
                  controller: iPrincipal
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
                  new Text('Total Payment Amount: RM',style: new TextStyle(fontFamily:'Nunito',fontSize:18.0,color: Colors.red[900]),),
                  new Text(Decimal.parse('$nTotal_payment').toStringAsFixed(2),style: new TextStyle(fontFamily:'Nunito',fontSize:18.0,color: Colors.red[900]),),
              ],
              ),
              new Padding(padding: EdgeInsets.only(bottom: 10.0),),
               new Row(children: <Widget>[
                  new Text('Monthly Repayment: RM',style: new TextStyle(fontFamily:'Nunito',fontSize:18.0,color:Colors.blue[800]),), 
                  new Text(Decimal.parse('$nMonthly').toStringAsFixed(2),style: new TextStyle(fontFamily:'Nunito',fontSize:18.0,color:Colors.blue[800]),)
              ],
              ),
              new Padding(padding: EdgeInsets.only(bottom: 10.0),),
               new Row(children: <Widget>[
                  new Text('Principal: RM',style: new TextStyle(fontFamily:'Nunito',fontSize:18.0,color: Colors.green[800]),), 
                  new Text(Decimal.parse('$nPrincipal').toStringAsFixed(0),style: new TextStyle(fontFamily:'Nunito',fontSize:18.0,color: Colors.green[800]),)
              ],
              ),
              new Padding(padding: EdgeInsets.only(bottom: 10.0),),
               new Row(children: <Widget>[
                  new Text('Interest: RM',style: new TextStyle(fontFamily:'Nunito',fontSize:18.0,color: Colors.green[800]),), 
                  new Text(Decimal.parse('$nInterest').toStringAsFixed(2),style: new TextStyle(fontFamily:'Nunito',fontSize:18.0,color: Colors.green[800]),)
              ],
              ),
              new Padding(padding: EdgeInsets.only(bottom: 10.0),),
               new Row(children: <Widget>[
                  new Text('Principal Percentage: ',style: new TextStyle(fontFamily:'Nunito',fontSize:18.0,color: Colors.grey[850]),), 
                  new Text(Decimal.parse('$nPrincipalBreakdown').toStringAsFixed(2),style: new TextStyle(fontFamily:'Nunito',fontSize:18.0,color: Colors.grey[850]),),
                  new Text('%',style: new TextStyle(fontFamily:'Nunito',fontSize:18.0),),
              ],
              ),
              new Padding(padding: EdgeInsets.only(bottom: 10.0),),
               new Row(children: <Widget>[
                  new Text('Interest Percentage: ',style: new TextStyle(fontFamily:'Nunito',fontSize:18.0,color: Colors.grey[850]),), 
                  new Text(Decimal.parse('$nInterestBreakdown').toStringAsFixed(2),style: new TextStyle(fontFamily:'Nunito',fontSize:18.0,color: Colors.grey[850]),),
                  new Text('%',style: new TextStyle(fontFamily:'Nunito',fontSize:18.0),),
              ],
              ),
              
            ],
        
      ),
  
      ),
    );
  }
}