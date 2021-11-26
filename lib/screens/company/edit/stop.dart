import 'package:buscabus/models/stop.dart';
import 'package:buscabus/widgets/default_appBar.dart';
import 'package:buscabus/widgets/default_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class EditStopScreen extends StatefulWidget {
  final Function callback;
  final dynamic stop;

  const EditStopScreen({
    @required this.callback,
    @required this.stop,
  });

  @override
  _CreateBusScreenState createState() => _CreateBusScreenState();
}

class _CreateBusScreenState extends State<EditStopScreen> {
  Stop _stop = Stop();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: DefaultAppBar(
        title: Text('Novo ponto'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,              
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Descrição',
                      labelText: 'Descrição'
                    ),
                    onChanged: (value) {
                      _stop.description = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe uma Descrição';
                      }
                      return null;
                    },
                    initialValue: widget.stop['description'].toString(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Coordenadas',
                      labelText: 'Coordenadas'
                    ),
                    onChanged: (value) {
                      _stop.location = GeoPoint(double.parse(value.split(',').first.toString().trim()), double.parse(value.split(',').last.toString().trim()));
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe as Coordenadas';
                      }
                      return null;
                    },
                    initialValue: '${widget.stop['location'].latitude.toString()}, ${widget.stop['location'].longitude.toString()}',
                  ),
                ),                
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Observer(builder: (_) {
        return ElevatedButton(
          child: Text('Salvar'),
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              Navigator.pop(context);
              widget.callback();

              DefaultToast(
                message: 'Ponto alterado :)',
                toastType: DefaultToastType.success,
              ).show(context);
            } else {
              DefaultToast(
                message: 'Ops, algo deu errado :(',
                toastType: DefaultToastType.danger,
              ).show(context);
            }
          },
        );
      }),
    );
  }
}