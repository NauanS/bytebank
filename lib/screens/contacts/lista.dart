import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contacts.dart';
import 'package:bytebank/screens/contacts/formulario.dart';
import 'package:flutter/material.dart';

const _appBarTitle = "Contatos";

class ListaContatos extends StatelessWidget {
  final ContactDao _dao = ContactDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text('Carregando'),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact> _contatos = snapshot.data;
              return ListView.builder(
                itemCount: _contatos.length,
                itemBuilder: (context, index) {
                  final contato = _contatos[index];
                  return ItemContact(contato);
                },
              );
              break;
            default:
              Text('Unknow Error');
              break;
          }
          return Text('Unknow Error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return FormularioContato();
            },
          ));
        },
      ),
    );
  }
}

class ItemContact extends StatelessWidget {
  final Contact _contato;

  ItemContact(this._contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_contato.name),
        subtitle: Text(_contato.accountNumber.toString()),
      ),
    );
  }
}
