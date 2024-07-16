import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sens2/apps/apliplast/controllers/print_ticket_controller.dart';
import 'package:sens2/apps/apliplast/views/impresion/widget/current_date_widget.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';


import 'package:sens2/core/components/inputs/dropdown_text.dart';
import 'package:sens2/core/components/inputs/input_text.dart';
import 'package:sens2/core/components/buttons/button.dart';

class PrintTicket extends StatelessWidget {
  PrintTicketController printicketController = Get.find<PrintTicketController>();

  final List<String> operators = ['Operador 1', 'Operador 2', 'Operador 3']; // Lista de operadores

  Widget _buildDatePicker(BuildContext context) {
    return TextField(
      readOnly: true,
      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        hintText: 'Fecha',
        suffixIcon: Icon(Icons.calendar_today),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(167, 88, 97, 121)),
        ),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2024),
        );
        if (pickedDate != null) {}
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 38, 83),
        title: Text(
          'Formulario de impresión',
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back(); // Utilizando Get para navegar hacia atrás
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Opción 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Opción 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: 360,
                decoration: BoxDecoration(
                  color: Color.fromARGB(22, 79, 92, 150),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'N° 10',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 11, 19, 68),
                      ),
                    ),


                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      padding: EdgeInsets.only(top: 20, bottom: 30, left: 20,right: 20),
                      width: double.infinity,
                      color: Colors.grey.shade400.withOpacity(0.2),
                      child: Column(
                        children: [
                          CurrentDateWidget(),
                          DropdownText(items: ['Turno', 'Item 2', 'Item 3']),
                          SizedBox(height: 8),
                          TypeAheadFormField(
                            textFieldConfiguration: TextFieldConfiguration(
                              controller: printicketController.operatorController.value,
                              decoration: InputDecoration(
                                labelText: 'Orden de Producción ',
                                labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 75, 159, 214)), // Cambiar el color del label
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromARGB(255, 75, 159, 214)), // Cambiar el color del borde cuando está habilitado
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromARGB(255, 11, 19, 68)), // Cambiar el color del borde cuando está enfocado
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red), // Cambiar el color del borde cuando hay un error
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red), // Cambiar el color del borde cuando está enfocado y hay un error
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              style: TextStyle(color: Colors.black), // Cambiar el color del texto
                            ),
                            suggestionsCallback: (pattern) {
                              return operators.where((operator) =>
                                  operator.toLowerCase().contains(pattern.toLowerCase())).toList();
                            },
                            itemBuilder: (context, suggestion) {
                              return ListTile(
                                title: Text(suggestion),
                              );
                            },
                            onSuggestionSelected: (suggestion) {
                              printicketController.operatorController.value.text = suggestion;
                            },
                            transitionBuilder: (context, suggestionsBox, controller) {
                              return suggestionsBox;
                            },
                            validator: (value) {
                              if ((value ?? '').isEmpty) {
                                return 'Por favor seleccione un Orden';
                              }
                              return null;
                            },
                            onSaved: (value) => print('Orden seleccionado: $value'),
                          ),

                          SizedBox(height: 8),



                        ],
                      ),
                    ),
                    TypeAheadFormField(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: printicketController.operatorController.value,
                        decoration: InputDecoration(
                          labelText: 'Operador',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 75, 159, 214)), // Cambiar el color del label
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 75, 159, 214)), // Cambiar el color del borde cuando está habilitado
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 11, 19, 68)), // Cambiar el color del borde cuando está enfocado
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red), // Cambiar el color del borde cuando hay un error
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red), // Cambiar el color del borde cuando está enfocado y hay un error
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        style: TextStyle(color: Colors.black), // Cambiar el color del texto
                      ),
                      suggestionsCallback: (pattern) {
                        return operators.where((operator) =>
                            operator.toLowerCase().contains(pattern.toLowerCase())).toList();
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text(suggestion),
                        );
                      },
                      onSuggestionSelected: (suggestion) {
                        printicketController.operatorController.value.text = suggestion;
                      },
                      transitionBuilder: (context, suggestionsBox, controller) {
                        return suggestionsBox;
                      },
                      validator: (value) {
                        if ((value ?? '').isEmpty) {
                          return 'Por favor seleccione un operador';
                        }
                        return null;
                      },
                      onSaved: (value) => print('Operador seleccionado: $value'),
                    ),
                    SizedBox(height: 17),
                 Column(

                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: [
                            Container(

                              child: Text(
                                'Maquina',
                                style: TextStyle(color: Colors.black),
                              ),

                            ),
                            Container(

                              child: Text(
                                'Maquina 1',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(

                              child: Text(
                                'Espesor',
                                style: TextStyle(color: Colors.black),
                              ),

                            ),
                            Container(

                              child: Text(
                                'espesor 1',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: [
                            Container(

                              child: Text(
                                'Espesor',
                                style: TextStyle(color: Colors.black),
                              ),

                            ),
                            Container(

                              child: Text(
                                'espesor 1',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(

                              child: Text(
                                'Espesor',
                                style: TextStyle(color: Colors.black),
                              ),

                            ),
                            Container(

                              child: Text(
                                'espesor 1',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),


                    SizedBox(height: 8),

                    Text(
                      'Medida: Medida 1',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 11, 19, 68),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Espesor: Espesor 1',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 11, 19, 68),
                      ),
                    ),

                    SizedBox(height: 8),
                    Text(
                      'Color: Color 1',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 11, 19, 68),
                      ),
                    ),

                    SizedBox(height: 8),
                    Text(
                      'Densidad: Densidad 1',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 11, 19, 68),
                      ),
                    ),

                    SizedBox(height: 8),
                    Text(
                      'Cliente: Cliente 1',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 11, 19, 68),
                      ),
                    ),

                    SizedBox(height: 8),
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 30),
                      width: double.infinity,
                      color: Colors.grey.withOpacity(0.2),
                      child: Column(
                        children: [
                          SizedBox(height: 16),

                          Text(
                            'Bobina:',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 11, 19, 68),
                            ),
                          ),

                          SizedBox(height: 8),
                          Text(
                            'Peso neto 10kg',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 11, 19, 68),
                            ),
                          ),
                          SizedBox(height: 8),

                          Container(
                            width: 200,
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Capturar',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 14, 12, 87),
                                ),
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                ),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Peso Bruto 10kg',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 11, 19, 68),
                            ),
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 200,
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextButton(
                        onPressed: () {
                          printicketController.send();
                        },
                        child: Text(
                          'Guardar',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 14, 12, 87),
                          ),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}