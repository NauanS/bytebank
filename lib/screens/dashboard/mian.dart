import 'package:bytebank/screens/contacts/lista.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Dashboad";

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset("images/bytebank_logo.png"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Theme.of(context).primaryColor,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListaContatos()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 100,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.group,
                            color: Colors.white,
                            size: 24,
                          ),
                          Text(
                            "Contatos",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListaTransferencias()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 100,
                    width: 150,
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.payments,
                          color: Colors.white,
                          size: 24,
                        ),
                        Text(
                          "Transferências",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
