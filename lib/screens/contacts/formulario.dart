import 'package:bytebank/components/editor.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contacts.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Novo Contato";
const _rotuloCampoNome = "Nome";
const _dicaCampoNome = "Nome Sobrenome";
const _rotuloCampoNumeroConta = "Número da conta";
const _dicaCampoNumeroConta = "0000";
const _textoBotaoConfirmar = "Salvar";

class FormularioContato extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioContatoState();
  }
}

class FormularioContatoState extends State<FormularioContato> {
  final TextEditingController _contoladorCampoNome = TextEditingController();
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _contoladorCampoNome,
              rotulo: _rotuloCampoNome,
              dica: _dicaCampoNome,
              keyType: TextInputType.text,
            ),
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: _rotuloCampoNumeroConta,
              dica: _dicaCampoNumeroConta,
              icone: Icons.monetization_on,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: Text(_textoBotaoConfirmar),
                  onPressed: () => _criandoContatos(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _criandoContatos(BuildContext context) {
    final String name = _contoladorCampoNome.text;
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    if (numeroConta != null && name != null) {
      final newContact = Contact(0, name, numeroConta);
      _dao.save(newContact).then((id) => Navigator.pop(context, newContact));
    }
  }
}
