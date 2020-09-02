import 'dart:io';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:siegeestappv1/Paginas/Animation/FadeAnimation.dart';
import 'package:siegeestappv1/Paginas/PagesIndex/indexPageResources/checkbox/multiselect_formfield.dart';
import 'package:siegeestappv1/Paginas/PagesIndex/indexPageResources/listas.dart';

// ignore: camel_case_types
class Nuevo_Beneficiario extends StatefulWidget {
  @override
  _Nuevo_BeneficiarioState createState() => _Nuevo_BeneficiarioState();
}

// ignore: camel_case_types
class _Nuevo_BeneficiarioState extends State<Nuevo_Beneficiario> {
  File _image;
  File _image2;
  File _image3;
  File _image4;

  @override
  void dispose() {
    // TODO: implement dispose
    _nombre.dispose();
    _apellidoPaterno.dispose();
    _apellidoMaterno.dispose();
    _curp.dispose();
    _inputFechaNacimiento.dispose();
    _calle.dispose();
    _numeroExterior.dispose();
    _numeroInterior.dispose();
    _codigoPostal.dispose();
    _noAparece.dispose();
    _referencias.dispose();
    _otroBeneficio.dispose();
    _cantidad.dispose();
    _observaciones.dispose();
    super.dispose();
  }

  Future _getImage() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Recorte al tamaño del INE por el frente',
              toolbarColor: Color.fromRGBO(178, 1, 19, 1),
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
          ));

      this.setState(() {
        _image = cropped;
      });
    } else {
      this.setState(() {});
    }
  }

  Future _getImage2() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Recorte al tamaño del INE por el Reverso',
              toolbarColor: Color.fromRGBO(178, 1, 19, 1),
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
          ));

      this.setState(() {
        _image2 = cropped;
      });
    } else {
      this.setState(() {});
    }
  }

  Future _getImage3() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Recorte al paquete de ayuda',
              toolbarColor: Color.fromRGBO(178, 1, 19, 1),
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
          ));

      this.setState(() {
        _image3 = cropped;
      });
    } else {
      this.setState(() {});
    }
  }

  Future _getImage4() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
              toolbarTitle:
                  'Recorte al tamaño de la entrega del paquete al beneficiario',
              toolbarColor: Color.fromRGBO(178, 1, 19, 1),
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
          ));

      this.setState(() {
        _image4 = cropped;
      });
    } else {
      this.setState(() {});
    }
  }

  List _myActivities;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivities = [];
  }

//================================Controladores=========================================
  TextEditingController _municipioTextFieldControoler =
      new TextEditingController();
  TextEditingController _localidadesTextFieldControoler =
      new TextEditingController();
  final formkey = GlobalKey<FormState>();
  TextEditingController _nombre = new TextEditingController();
  TextEditingController _apellidoPaterno = new TextEditingController();
  TextEditingController _apellidoMaterno = new TextEditingController();
  TextEditingController _curp = new TextEditingController();
  TextEditingController _numeroCel = new TextEditingController();
  TextEditingController _calle = new TextEditingController();
  TextEditingController _numeroExterior = new TextEditingController();
  TextEditingController _numeroInterior = new TextEditingController();
  TextEditingController _codigoPostal = new TextEditingController();
  TextEditingController _noAparece = new TextEditingController();
  TextEditingController _referencias = new TextEditingController();
  TextEditingController _otroBeneficio = new TextEditingController();
  TextEditingController _cantidad = new TextEditingController();
  TextEditingController _observaciones = new TextEditingController();
  String _generoBeneficiairo;
  String _beneficiarioIndigena;
  String _tipodebeneficiarioTEDC;
  String _tipodebeneficioTEDC;
  List _discapacidad;
//================================Controladores=========================================

  String _fecha = '';
  String _opcionSeleccionada = 'Masculino';
  String _opcionSeleccionadaIndigena = 'NO';
  String _opcionSeleccionadaTipoBeneficiario = 'Desempleado';
  String _opcionSeleccionadaTipoBeneficio = 'Alimenticio';
  List<String> _sexoBeneficiario = ['Masculino', 'Femenino'];
  List<String> _indigenaBeneficiario = ['NO', 'SI'];
  List<String> _tipoDeBeneficiario = [
    'Adulto Mayor',
    'Desempleado',
    'Mujer Embarazada',
    'Niño',
    'Persona con discapacidad',
    'Salud',
    'Otro'
  ];
  List<String> _tipoDeBeneficio = ['Alimenticio', 'Otro'];
  TextEditingController _inputFechaNacimiento = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(105, 176, 178, 3),
        title: Text('Registrar Beneficiario'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: FadeAnimation(
              2,
              Column(
                children: <Widget>[
                  _nombreInput(),
                  Divider(),
                  _apellidoPaternoInput(),
                  Divider(),
                  _apellidoMaternoInput(),
                  Divider(),
                  _celularInput(),
                  Divider(),
                  _curpInput(),
                  Divider(),
                  _fechaDeNacimientoInput(context),
                  Divider(),
                  _labelGenero(),
                  _sexoInput(),
                  Divider(),
                  _discapaciadadCkecbox(),
                  Divider(),
                  _labelIndigena(),
                  _indigenaInput(),
                  Divider(),
                  _municipioInput(context),
                  Divider(),
                  _localidadesInput(context),
                  Divider(),
                  _noapareceInput(),
                  Divider(),
                  _referecniasInput(),
                  Divider(),
                  _cpInput(),
                  Divider(),
                  _calleInput(),
                  Divider(),
                  _numeroextInput(),
                  Divider(),
                  _numerointInput(),
                  Divider(),
                  _labelBeneficiario(),
                  _tipoBeneficiarioInput(),
                  Divider(),
                  _labelBeneficio(),
                  _tipoBeneficioInput(),
                  Divider(),
                  _otroBeneficioInput(),
                  Divider(),
                  _cantidadInput(),
                  Divider(),
                  _labelFotos(),
                  _camaraInput(),
                  Divider(),
                  _observacionesInput(),
                  Divider(),
                  _labelSubmit(),
                  _submitInput(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _nombreInput() {
    return TextFormField(
      autofocus: false,
      controller: _nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromRGBO(0, 24, 58, 1), width: 2.0),
            borderRadius: BorderRadius.circular(20.0)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromRGBO(109, 182, 184, 13), width: 2.0),
            borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Nombre del Beneficiario',
        labelText: 'Nombre',
        labelStyle: TextStyle(color: Color.fromRGBO(109, 182, 184, 13)),
        suffixIcon: Icon(
          Icons.accessibility,
          color: Color.fromRGBO(109, 182, 184, 13),
        ),
        icon: Icon(
          Icons.account_circle,
          color: Color.fromRGBO(109, 182, 184, 13),
        ),
      ),
      validator: (value) {
        if (value.length < 3) {
          return 'Porfavor Ingrese el Nombre';
        } else {
          return null;
        }
      },
    );
  }

  Widget _apellidoPaternoInput() {
    return TextFormField(
      autofocus: false,
      controller: _apellidoPaterno,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(0, 24, 58, 1), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(109, 182, 184, 13), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Apellido Paterno de Beneficiario',
          labelText: 'Apellido Paterno',
          labelStyle: TextStyle(color: Color.fromRGBO(109, 182, 184, 13)),
          suffixIcon: Icon(
            Icons.description,
            color: Color.fromRGBO(109, 182, 184, 13),
          ),
          icon: Icon(
            Icons.account_circle,
            color: Color.fromRGBO(109, 182, 184, 13),
          )),
      validator: (value) {
        if (value.length < 3) {
          return 'Porfavor Ingrese el Apellido';
        } else {
          return null;
        }
      },
    );
  }

  Widget _apellidoMaternoInput() {
    return TextFormField(
      autofocus: false,
      controller: _apellidoMaterno,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(0, 24, 58, 1), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(109, 182, 184, 13), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Apellido Materno de Beneficiario',
          labelText: 'Apellido Materno',
          labelStyle: TextStyle(color: Color.fromRGBO(109, 182, 184, 13)),
          suffixIcon: Icon(
            Icons.description,
            color: Color.fromRGBO(109, 182, 184, 13),
          ),
          icon: Icon(
            Icons.account_circle,
            color: Color.fromRGBO(109, 182, 184, 13),
          )),
      validator: (value) {
        if (value.length < 3) {
          return 'Porfavor Ingrese el Apellido';
        } else {
          return null;
        }
      },
    );
  }

  Widget _curpInput() {
    return TextFormField(
      autofocus: false,
      controller: _curp,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(0, 24, 58, 1), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(109, 182, 184, 13), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'CURP del Beneficiario',
          labelText: 'CURP',
          labelStyle: TextStyle(color: Color.fromRGBO(109, 182, 184, 13)),
          suffixIcon: Icon(
            Icons.spellcheck,
            color: Color.fromRGBO(109, 182, 184, 13),
          ),
          icon: Icon(
            Icons.assignment,
            color: Color.fromRGBO(109, 182, 184, 13),
          )),
      validator: (value) {
        if (value.length < 3) {
          return 'Porfavor Ingrese la CURP';
        } else {
          return null;
        }
      },
    );
  }

  Widget _fechaDeNacimientoInput(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: false,
      controller: _inputFechaNacimiento,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(0, 24, 58, 1), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(109, 182, 184, 13), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha de Nacimiento del Beneficiario',
          labelText: 'Fecha de Nacimiento',
          labelStyle: TextStyle(color: Color.fromRGBO(109, 182, 184, 13)),
          suffixIcon: Icon(
            Icons.cake,
            color: Color.fromRGBO(109, 182, 184, 13),
          ),
          icon: Icon(
            Icons.calendar_today,
            color: Color.fromRGBO(109, 182, 184, 13),
          )),
      validator: (value) {
        if (value.length < 3) {
          return 'Porfavor seleccione la fecha de nacimiento';
        } else {
          return null;
        }
      },
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1930),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'),
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark(),
            child: child,
          );
        });
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFechaNacimiento.text = _fecha;
      });
    }
  }

  Widget _sexoInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          Icons.wc,
          color: Color.fromRGBO(109, 182, 184, 13),
        ),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                value: _opcionSeleccionada,
                iconSize: 30.0,
                icon: (null),
                style: TextStyle(
                    color: Color.fromRGBO(109, 182, 184, 13),
                    fontWeight: FontWeight.bold),
                hint: Text("Selecciona un Genero"),
                onChanged: (opt) {
                  setState(() {
                    _opcionSeleccionada = opt;
                    _generoBeneficiairo = _opcionSeleccionada;
                  });
                },
                items: getOpciones(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpciones() {
    List<DropdownMenuItem<String>> lista = new List();
    _sexoBeneficiario.forEach((sexo) {
      lista.add(DropdownMenuItem(
        child: Text(sexo),
        value: sexo,
      ));
    });
    return lista;
  }

  Widget _municipioInput(BuildContext context) {
    return AutoCompleteTextField(
      controller: _municipioTextFieldControoler,
      clearOnSubmit: false,
      suggestions: listasml().minicipioList,
      style: TextStyle(color: Colors.black, fontSize: 16.0),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(0, 24, 58, 1), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(109, 182, 184, 13), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Municipio del Beneficiario',
          labelText: 'Municipio',
          labelStyle: TextStyle(color: Color.fromRGBO(109, 182, 184, 13)),
          suffixIcon: Icon(
            Icons.map,
            color: Color.fromRGBO(109, 182, 184, 13),
          ),
          icon: Icon(
            Icons.account_circle,
            color: Color.fromRGBO(109, 182, 184, 13),
          )),
      itemFilter: (item, query) {
        return item.toLowerCase().startsWith(query.toLowerCase());
      },
      itemSorter: (a, b) {
        return a.compareTo(b);
      },
      itemSubmitted: (item) {
        _municipioTextFieldControoler.text = item;
      },
      itemBuilder: (context, item) {
        return Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text(
                item,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        );
      },
      key: null,
    );
  }

  Widget _localidadesInput(BuildContext context) {
    return AutoCompleteTextField(
      controller: _localidadesTextFieldControoler,
      clearOnSubmit: false,
      suggestions: listasml().localidadesList,
      style: TextStyle(color: Colors.black, fontSize: 16.0),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(0, 24, 58, 1), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(109, 182, 184, 13), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Localidad del Beneficiario',
          labelText: 'Colonia o Localidad',
          labelStyle: TextStyle(color: Color.fromRGBO(109, 182, 184, 13)),
          suffixIcon: Icon(
            Icons.map,
            color: Color.fromRGBO(109, 182, 184, 13),
          ),
          icon: Icon(
            Icons.account_circle,
            color: Color.fromRGBO(109, 182, 184, 13),
          )),
      itemFilter: (item, query) {
        return item.toLowerCase().startsWith(query.toLowerCase());
      },
      itemSorter: (a, b) {
        return a.compareTo(b);
      },
      itemSubmitted: (item) {
        _localidadesTextFieldControoler.text = item;
      },
      itemBuilder: (context, item) {
        return Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text(
                item,
                overflow: TextOverflow.fade,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        );
      },
      key: null,
    );
  }

  Widget _discapaciadadCkecbox() {
    return Container(
      padding: EdgeInsets.all(16),
      child: MultiSelectFormField(
        autovalidate: false,
        titleText: 'Discapacidades',
        dataSource: [
          {
            "display": "Motriz",
            "value": "Motriz",
          },
          {
            "display": "Auditiva",
            "value": "Auditiva",
          },
          {
            "display": "Sindrome de Down",
            "value": "Sindrome de Down",
          },
          {
            "display": "Psicosocial",
            "value": "Psicosocial",
          },
          {
            "display": "Lenguaje",
            "value": "Lenguaje",
          },
        ],
        textField: 'display',
        valueField: 'value',
        okButtonLabel: 'OK',
        cancelButtonLabel: 'CANCEL',
        // required: true,
        hintText: '¿Tiene alguna discapacidad?',
        initialValue: _myActivities,
        onSaved: (value) {
          if (value == null) return;
          setState(() {
            _myActivities = value;
            _discapacidad = _myActivities;
          });
        },
      ),
    );
  }

  Widget _indigenaInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          Icons.supervised_user_circle,
          color: Color.fromRGBO(109, 182, 184, 13),
        ),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                value: _opcionSeleccionadaIndigena,
                iconSize: 30.0,
                icon: (null),
                style: TextStyle(
                  color: Color.fromRGBO(109, 182, 184, 13),
                ),
                hint: Text("Selecciona una Opcion"),
                onChanged: (opt) {
                  setState(() {
                    _opcionSeleccionadaIndigena = opt;
                    _beneficiarioIndigena = _opcionSeleccionadaIndigena;
                  });
                },
                items: getOpcionesIndigena(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesIndigena() {
    List<DropdownMenuItem<String>> lista = new List();
    _indigenaBeneficiario.forEach((sexo) {
      lista.add(DropdownMenuItem(
        child: Text(sexo),
        value: sexo,
      ));
    });
    return lista;
  }

  Widget _calleInput() {
    return TextFormField(
      autofocus: false,
      controller: _calle,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(0, 24, 58, 1), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(109, 182, 184, 13), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Calle del Beneficiario',
          labelText: 'Calle',
          labelStyle: TextStyle(color: Color.fromRGBO(109, 182, 184, 13)),
          errorStyle:
              TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
          suffixIcon: Icon(
            Icons.streetview,
            color: Color.fromRGBO(109, 182, 184, 13),
          ),
          icon: Icon(
            Icons.account_circle,
            color: Color.fromRGBO(109, 182, 184, 13),
          )),
      validator: (value) {
        if (value.length < 3) {
          return 'Porfavor Ingrese la calle';
        } else {
          return null;
        }
      },
    );
  }

  Widget _numeroextInput() {
    return TextFormField(
      controller: _numeroExterior,
      autofocus: false,
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(0, 24, 58, 1), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(109, 182, 184, 13), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Numero Exterior del Beneficiario',
          labelText: 'Numero Exterior',
          labelStyle: TextStyle(color: Color.fromRGBO(109, 182, 184, 13)),
          errorStyle:
              TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
          suffixIcon: Icon(
            Icons.format_list_numbered_rtl,
            color: Color.fromRGBO(109, 182, 184, 13),
          ),
          icon: Icon(
            Icons.account_circle,
            color: Color.fromRGBO(109, 182, 184, 13),
          )),
      validator: (value) {
        if (value.length < 3) {
          return 'Porfavor Ingrese el Numero Exterior';
        } else {
          return null;
        }
      },
    );
  }

  Widget _celularInput() {
    return TextFormField(
      controller: _numeroCel,
      autofocus: false,
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(0, 24, 58, 1), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(109, 182, 184, 13), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Numero de Celular del Beneficiario',
          labelText: 'Numero de Celular',
          labelStyle: TextStyle(color: Color.fromRGBO(109, 182, 184, 13)),
          errorStyle:
              TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
          suffixIcon: Icon(
            Icons.phone,
            color: Color.fromRGBO(109, 182, 184, 13),
          ),
          icon: Icon(
            Icons.account_circle,
            color: Color.fromRGBO(109, 182, 184, 13),
          )),
      validator: (value) {
        if (value.length < 3) {
          return 'Porfavor Ingrese el Numero de Celular';
        } else {
          return null;
        }
      },
    );
  }

  Widget _numerointInput() {
    return TextFormField(
      autofocus: false,
      controller: _numeroInterior,
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(0, 24, 58, 1), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(109, 182, 184, 13), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Numero Interior del Beneficiario',
          labelText: 'Numero Interior',
          labelStyle: TextStyle(color: Color.fromRGBO(109, 182, 184, 13)),
          suffixIcon: Icon(
            Icons.format_list_numbered_rtl,
            color: Color.fromRGBO(109, 182, 184, 13),
          ),
          icon: Icon(
            Icons.account_circle,
            color: Color.fromRGBO(109, 182, 184, 13),
          )),
    );
  }

  Widget _cpInput() {
    return TextFormField(
      autofocus: false,
      controller: _codigoPostal,
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(0, 24, 58, 1), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(109, 182, 184, 13), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Codigo Postal del Beneficiario',
          labelText: 'Codigo Postal',
          labelStyle: TextStyle(color: Color.fromRGBO(109, 182, 184, 13)),
          suffixIcon: Icon(
            Icons.code,
            color: Color.fromRGBO(109, 182, 184, 13),
          ),
          icon: Icon(
            Icons.account_circle,
            color: Color.fromRGBO(109, 182, 184, 13),
          )),
      validator: (value) {
        if (value.length < 3) {
          return 'Porfavor Ingrese el Codigo Postal';
        } else {
          return null;
        }
      },
    );
  }

  Widget _noapareceInput() {
    return TextFormField(
      autofocus: false,
      controller: _noAparece,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(0, 24, 58, 1), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(109, 182, 184, 13), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Si no aparece la localidad pon el nombre',
          labelText: 'Nombre si no aparece localidad o colonia',
          labelStyle: TextStyle(
            color: Color.fromRGBO(109, 182, 184, 13),
          ),
          suffixIcon: Icon(
            Icons.map,
            color: Color.fromRGBO(109, 182, 184, 13),
          ),
          icon: Icon(
            Icons.account_circle,
            color: Color.fromRGBO(109, 182, 184, 13),
          )),
    );
  }

  Widget _referecniasInput() {
    return TextFormField(
      autofocus: false,
      controller: _referencias,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(0, 24, 58, 1), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(109, 182, 184, 13), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Referencias del domicilio',
          labelText: 'Referencias',
          labelStyle: TextStyle(color: Color.fromRGBO(109, 182, 184, 13)),
          errorStyle:
              TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
          suffixIcon: Icon(
            Icons.announcement,
            color: Color.fromRGBO(109, 182, 184, 13),
          ),
          icon: Icon(
            Icons.account_circle,
            color: Color.fromRGBO(109, 182, 184, 13),
          )),
      validator: (value) {
        if (value.length < 3) {
          return 'Porfavor Ingrese una referencia';
        } else {
          return null;
        }
      },
    );
  }

  Widget _tipoBeneficiarioInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          Icons.supervised_user_circle,
          color: Color.fromRGBO(109, 182, 184, 13),
        ),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                value: _opcionSeleccionadaTipoBeneficiario,
                iconSize: 30.0,
                icon: (null),
                style: TextStyle(
                  color: Color.fromRGBO(109, 182, 184, 13),
                ),
                hint: Text("Selecciona un tipo"),
                onChanged: (opt) {
                  setState(() {
                    _opcionSeleccionadaTipoBeneficiario = opt;
                    _tipodebeneficiarioTEDC =
                        _opcionSeleccionadaTipoBeneficiario;
                  });
                },
                items: getOpcionesTipoBeneficiario(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesTipoBeneficiario() {
    List<DropdownMenuItem<String>> lista = new List();
    _tipoDeBeneficiario.forEach((tipobeneficiario) {
      lista.add(DropdownMenuItem(
        child: Text(tipobeneficiario),
        value: tipobeneficiario,
      ));
    });
    return lista;
  }

  Widget _tipoBeneficioInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          Icons.supervised_user_circle,
          color: Color.fromRGBO(109, 182, 184, 13),
        ),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                value: _opcionSeleccionadaTipoBeneficio,
                iconSize: 30,
                icon: (null),
                style: TextStyle(
                  color: Color.fromRGBO(109, 182, 184, 13),
                ),
                hint: Text("Seleccione un Beneficio"),
                onChanged: (opt) {
                  setState(() {
                    _opcionSeleccionadaTipoBeneficio = opt;
                    _tipodebeneficioTEDC = _opcionSeleccionadaTipoBeneficio;
                  });
                },
                items: getOpcionesTipoBeneficio(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesTipoBeneficio() {
    List<DropdownMenuItem<String>> lista = new List();
    _tipoDeBeneficio.forEach((tipobeneficio) {
      lista.add(DropdownMenuItem(
        child: Text(tipobeneficio),
        value: tipobeneficio,
      ));
    });
    return lista;
  }

  Widget _labelBeneficiario() {
    return Container(
      child: Text(
        "Tipo de Beneficiario",
        style: TextStyle(
            color: Color.fromRGBO(109, 182, 184, 13),
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      width: 300.0,
      height: 35.0,
    );
  }

  Widget _labelIndigena() {
    return Container(
      child: Text(
        "¿El beneficiairo es Indigena?",
        style: TextStyle(
            color: Color.fromRGBO(109, 182, 184, 13),
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      width: 300.0,
      height: 35.0,
    );
  }

  Widget _labelBeneficio() {
    return Container(
      child: Text(
        "Tipo de Beneficio",
        style: TextStyle(
            color: Color.fromRGBO(109, 182, 184, 13),
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      width: 300.0,
      height: 35.0,
    );
  }

  Widget _labelGenero() {
    return Container(
      child: Text(
        "¿Genero del Beneficiario?",
        style: TextStyle(
            color: Color.fromRGBO(109, 182, 184, 13),
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      width: 300.0,
      height: 35.0,
    );
  }

  Widget _labelSubmit() {
    return Container(
      child: Text(
        "¡Porfavor revise sus datos antes de registrar!",
        style: TextStyle(
            color: Color.fromRGBO(109, 182, 184, 13),
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      width: 300.0,
      height: 35.0,
    );
  }

  Widget _otroBeneficioInput() {
    return TextFormField(
      autofocus: false,
      controller: _otroBeneficio,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(0, 24, 58, 1), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(109, 182, 184, 13), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Otro tipo de Beneficio',
          labelText: 'Otro tipo de Beneficio',
          labelStyle: TextStyle(color: Color.fromRGBO(109, 182, 184, 13)),
          suffixIcon: Icon(
            Icons.help_outline,
            color: Color.fromRGBO(109, 182, 184, 13),
          ),
          icon: Icon(
            Icons.account_circle,
            color: Color.fromRGBO(109, 182, 184, 13),
          )),
    );
  }

  Widget _cantidadInput() {
    return TextFormField(
      autofocus: false,
      controller: _cantidad,
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(0, 24, 58, 1), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(109, 182, 184, 13), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Cantidad del Beneficio',
          labelText: 'Cantidad',
          labelStyle: TextStyle(color: Color.fromRGBO(109, 182, 184, 13)),
          suffixIcon: Icon(
            Icons.format_list_numbered_rtl,
            color: Color.fromRGBO(109, 182, 184, 13),
          ),
          icon: Icon(
            Icons.account_circle,
            color: Color.fromRGBO(109, 182, 184, 13),
          )),
      validator: (value) {
        if (value.length < 3) {
          return 'Porfavor Ingrese la cantidad';
        } else {
          return null;
        }
      },
    );
  }

  Widget _observacionesInput() {
    return TextFormField(
      autofocus: false,
      controller: _observaciones,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(0, 24, 58, 1), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(109, 182, 184, 13), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Observaciones del Beneficiario',
          labelText: 'Observaciones',
          labelStyle: TextStyle(color: Color.fromRGBO(109, 182, 184, 13)),
          suffixIcon: Icon(
            Icons.remove_red_eye,
            color: Color.fromRGBO(109, 182, 184, 13),
          ),
          icon: Icon(
            Icons.account_circle,
            color: Color.fromRGBO(109, 182, 184, 13),
          )),
    );
  }

  Widget _labelFotos() {
    return Container(
      width: 500.0,
      height: 60.0,
      child: Column(
        children: <Widget>[
          Icon(Icons.camera_alt, color: Color.fromRGBO(109, 182, 184, 13)),
          Text(
            'Fotografias de Evidencia',
            style: TextStyle(
                color: Color.fromRGBO(109, 182, 184, 13),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _camaraInput() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: 350,
            child: Text(
              '1: Foto del frente del INE',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 350,
            child: Text(
              '2: Foto del reverso del INE',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 350,
            child: Text(
              '3: Foto del paquete',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 350,
            child: Text(
              '4: Foto entregando paquete al beneficiario',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          GridView.count(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(20.0),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: <Widget>[
              GestureDetector(
                onTap: _getImage,
                child: Container(
                  color: Colors.black12,
                  child: _image == null
                      ? Icon(FontAwesomeIcons.plus)
                      : Image.file(_image),
                ),
              ),
              GestureDetector(
                onTap: _getImage2,
                child: Container(
                  color: Colors.black12,
                  child: _image2 == null
                      ? Icon(FontAwesomeIcons.plus)
                      : Image.file(_image2),
                ),
              ),
              GestureDetector(
                onTap: _getImage3,
                child: Container(
                  color: Colors.black12,
                  child: _image3 == null
                      ? Icon(FontAwesomeIcons.plus)
                      : Image.file(_image3),
                ),
              ),
              GestureDetector(
                onTap: _getImage4,
                child: Container(
                  color: Colors.black12,
                  child: _image4 == null
                      ? Icon(FontAwesomeIcons.plus)
                      : Image.file(_image4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _submitInput() {
    return Container(
      height: 50,
      width: 500,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(91, 151, 153, 1),
            Color.fromRGBO(109, 182, 184, 13),
          ])),
      child: FlatButton(
        child: Text(
          "Registrar",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: _submit,
      ),
    );
  }

  void _submit() {
    if (!formKey.currentState.validate()) {
    } else {
      print(_nombre);
      print(_municipioTextFieldControoler);
      print(_discapacidad);
    }
  }
}
