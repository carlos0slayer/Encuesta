import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:siegeestappv1/Paginas/Animation/FadeAnimation.dart';
import 'package:siegeestappv1/Paginas/PagesIndex/indexPageResources/checkbox/multiselect_formfield.dart';

// ignore: camel_case_types
class Nuevo_Beneficiario extends StatefulWidget {
  @override
  _Nuevo_BeneficiarioState createState() => _Nuevo_BeneficiarioState();
}

enum PrimerPregunta {
  res1,
  res2,
  res3,
}

enum SegundaPregunta {
  res1,
  res2,
  res3,
}
enum PartidoPolitico {
  partido1,
  partido2,
  partido3,
  partido4,
  partido5,
  ninguno,
}
enum VotarPartidoPolitico {
  partido1,
  partido2,
  partido3,
  partido4,
  partido5,
  ninguno,
}
enum Candidato {
  muybuena,
  buena,
  regular,
  mala,
  muymala,
  nosabe,
}
enum Candidato2 {
  muybuena,
  buena,
  regular,
  mala,
  muymala,
  nosabe,
}
enum Candidato3 {
  muybuena,
  buena,
  regular,
  mala,
  muymala,
  nosabe,
}
enum Candidato4 {
  muybuena,
  buena,
  regular,
  mala,
  muymala,
  nosabe,
}
enum NoSabeNoLeintereza {
  muybuena,
  buena,
  regular,
  mala,
  muymala,
  nosabe,
}
enum Ninguno {
  muybuena,
  buena,
  regular,
  mala,
  muymala,
  nosabe,
}
enum Otro {
  muybuena,
  buena,
  regular,
  mala,
  muymala,
  nosabe,
}

// ignore: camel_case_types
class _Nuevo_BeneficiarioState extends State<Nuevo_Beneficiario> {
  PrimerPregunta _preguntaUno = PrimerPregunta.res1;
  SegundaPregunta _preugntaDos = SegundaPregunta.res1;
  PartidoPolitico _partido = PartidoPolitico.partido1;
  VotarPartidoPolitico _partidoVotar = VotarPartidoPolitico.partido1;
  Candidato _opinion1 = Candidato.muybuena;
  Candidato2 _opinion2 = Candidato2.muybuena;
  Candidato3 _opinion3 = Candidato3.muybuena;
  Candidato4 _opinion4 = Candidato4.muybuena;
  NoSabeNoLeintereza _opinion5 = NoSabeNoLeintereza.muybuena;
  Ninguno _opinion6 = Ninguno.muybuena;
  Otro _opinion7 = Otro.muybuena;

  File _image;
  File _image2;
  File _image3;
  File _image4;
  File pickedImage;
  var curp = '';
  String validacionFinal = '';
  String validacionCurp = '';
  String completarInputs = '';

  Future pickImage() async {
    // ignore: deprecated_member_use
    File awaitImage = await ImagePicker.pickImage(source: ImageSource.camera);
    if (awaitImage != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: awaitImage.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9,
          ],
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Recorte la oto al tamaño del INE',
              toolbarColor: Color.fromRGBO(24, 122, 123, 3),
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
          ));
      this.setState(() {
        pickedImage = cropped;
        cropped = awaitImage;
      });
    }
    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(pickedImage);
    TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    VisionText visionText = await textRecognizer.processImage(visionImage);

    String curpIne = r'([A-Z]+[0-9]+[A-Z]{6})';
    RegExp regEx = RegExp(curpIne);
    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        if (regEx.hasMatch(line.text)) {
          curpIne = line.text;
          setState(() {
            curp = curpIne;
            _obtenercurp.text = curp.substring(5, 23);
            validacionCurp = _obtenercurp.text;
          });
        }
      }
    }

    textRecognizer.close();

    void curpValidada(curp) {
      var re =
          r'/^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0\d|1[0-2])(?:[0-2]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$/';
      var validado = curp.match(re);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nombre.dispose();
    _apellidoPaterno.dispose();
    _apellidoMaterno.dispose();
    _obtenercurp.dispose();
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
  TextEditingController _obtenercurp = new TextEditingController();
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
        backgroundColor: Color.fromRGBO(24, 122, 123, 3),
        title: Text('Nueva Encuesta'),
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
                  _labelDatos(),
                  Divider(),
                  _labelCurp(),
                  _capturarCurp(),
                  Divider(),
                  _labelBerificacionCurp(),
                  _curpInput(),
                  _leerCurp(),
                  Divider(),
                  _celularInput(),
                  Divider(),
                  _cpInput(),
                  Divider(),
                  _calleInput(),
                  Divider(),
                  _numeroextInput(),
                  Divider(),
                  _numerointInput(),
                  Divider(),
                  _referecniasInput(),
                  Divider(),
                  _labelEncuesta(),
                  Divider(),
                  _labelPregunta1(),
                  _pregunta1(),
                  Divider(),
                  _labelPregunta2(),
                  _pregunta2(),
                  Divider(),
                  _labelPregunta3(),
                  _pregunta3(),
                  Divider(),
                  _labelPregunta4(),
                  _pregunta4(),
                  Divider(),
                  _labelPregunta5(),
                  _pregunta5(),
                  Divider(),
                  _labelPregunta6(),
                  _labelCandidato(),
                  _pregunta6(),
                  Divider(),
                  _labelCandidato2(),
                  _pregunta7(),
                  Divider(),
                  _labelCandidato3(),
                  _pregunta8(),
                  Divider(),
                  _labelCandidato4(),
                  _pregunta9(),
                  Divider(),
                  _labelCandidato5(),
                  _pregunta10(),
                  Divider(),
                  _labelCandidato6(),
                  _pregunta11(),
                  Divider(),
                  _labelCandidato7(),
                  _pregunta12(),
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

  Widget _labelDatos() {
    return Container(
      child: Text(
        "Datos del Encuestado",
        style: TextStyle(
            color: Color.fromRGBO(24, 122, 123, 3),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      width: 300.0,
      height: 35.0,
    );
  }

  Widget _labelCurp() {
    return Container(
      child: curp == ''
          ? Text(
              "Porfavor Capture el INE del Encuestado",
              style: TextStyle(
                  color: Color.fromRGBO(24, 122, 123, 3),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          : Text(
              "INE capturada",
              style: TextStyle(
                  color: Color.fromRGBO(24, 122, 123, 3),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
      width: 300.0,
      height: 35.0,
    );
  }

  Widget _capturarCurp() {
    return Container(
      child: GestureDetector(
        onTap: pickImage,
        child: Container(
          padding: EdgeInsets.all(5),
          color: Color.fromRGBO(24, 122, 123, 3),
          child: pickedImage == null
              ? Icon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                  size: 80,
                )
              : Image.file(
                  pickedImage,
                  width: 180,
                ),
        ),
      ),
    );
  }

  Widget _labelBerificacionCurp() {
    return Container(
      child: curp == ''
          ? Text(
              "Esperando CURP...",
              style: TextStyle(
                  color: Color.fromRGBO(24, 122, 123, 3),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          : Text(
              "Verifique que la CURP se alla escaneado correctamente o modifiquela",
              style: TextStyle(
                  color: Color.fromRGBO(24, 122, 123, 3),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
      width: 300.0,
      height: 55.0,
    );
  }

  Widget _curpInput() {
    return Container(
      child: TextFormField(
        autofocus: false,
        //initialValue: curp.substring(5, 23),
        controller: _obtenercurp,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(0, 24, 58, 1), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(24, 122, 123, 3), width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          hintText: 'CURP del Beneficiario',
          labelText: 'CURP',
          labelStyle: TextStyle(color: Color.fromRGBO(24, 122, 123, 3)),
          suffixIcon: Icon(
            FontAwesomeIcons.idCard,
            color: Color.fromRGBO(24, 122, 123, 3),
          ),
        ),
        validator: (value) {
          if (value.length < 3) {
            return 'Porfavor Ingrese la CURP';
          } else {
            return null;
          }
        },
      ),
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
            borderSide:
                BorderSide(color: Color.fromRGBO(24, 122, 123, 3), width: 2.0),
            borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Numero de Celular del Beneficiario',
        labelText: 'Numero de Celular',
        labelStyle: TextStyle(color: Color.fromRGBO(24, 122, 123, 3)),
        suffixIcon: Icon(
          Icons.phone,
          color: Color.fromRGBO(24, 122, 123, 3),
        ),
      ),
      validator: (value) {
        if (value.length < 3) {
          return 'Porfavor Ingrese el Numero de Celular';
        } else {
          return null;
        }
      },
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
            borderSide:
                BorderSide(color: Color.fromRGBO(24, 122, 123, 3), width: 2.0),
            borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Codigo Postal del Beneficiario',
        labelText: 'Codigo Postal',
        labelStyle: TextStyle(color: Color.fromRGBO(24, 122, 123, 3)),
        suffixIcon: Icon(
          Icons.code,
          color: Color.fromRGBO(24, 122, 123, 3),
        ),
      ),
      validator: (value) {
        if (value.length < 3) {
          return 'Porfavor Ingrese el Codigo Postal';
        } else {
          return null;
        }
      },
    );
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
            borderSide:
                BorderSide(color: Color.fromRGBO(24, 122, 123, 3), width: 2.0),
            borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Calle del Beneficiario',
        labelText: 'Calle',
        labelStyle: TextStyle(color: Color.fromRGBO(24, 122, 123, 3)),
        suffixIcon: Icon(
          Icons.streetview,
          color: Color.fromRGBO(24, 122, 123, 3),
        ),
      ),
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
            borderSide:
                BorderSide(color: Color.fromRGBO(24, 122, 123, 3), width: 2.0),
            borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Numero Exterior del Beneficiario',
        labelText: 'Numero Exterior',
        labelStyle: TextStyle(color: Color.fromRGBO(24, 122, 123, 3)),
        suffixIcon: Icon(
          Icons.format_list_numbered_rtl,
          color: Color.fromRGBO(24, 122, 123, 3),
        ),
      ),
      validator: (value) {
        if (value.length < 1) {
          return 'Porfavor Ingrese el Numero Exterior';
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
            borderSide:
                BorderSide(color: Color.fromRGBO(24, 122, 123, 3), width: 2.0),
            borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Numero Interior del Beneficiario',
        labelText: 'Numero Interior',
        labelStyle: TextStyle(color: Color.fromRGBO(24, 122, 123, 3)),
        suffixIcon: Icon(
          Icons.format_list_numbered_rtl,
          color: Color.fromRGBO(24, 122, 123, 3),
        ),
      ),
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
            borderSide:
                BorderSide(color: Color.fromRGBO(24, 122, 123, 3), width: 2.0),
            borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Referencias del domicilio',
        labelText: 'Referencias',
        labelStyle: TextStyle(color: Color.fromRGBO(24, 122, 123, 3)),
        suffixIcon: Icon(
          Icons.announcement,
          color: Color.fromRGBO(24, 122, 123, 3),
        ),
      ),
      validator: (value) {
        if (value.length < 3) {
          return 'Porfavor Ingrese una referencia';
        } else {
          return null;
        }
      },
    );
  }

  Widget _labelEncuesta() {
    return Container(
      child: Text(
        "Encuesta",
        style: TextStyle(
            color: Color.fromRGBO(24, 122, 123, 3),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      width: 300.0,
      height: 35.0,
    );
  }

  Widget _labelPregunta1() {
    return Container(
      child: Text(
        "1.- ¿Cómo considera usted que fueron las medidas y acciones que tomó su Gobernador con respecto a la Pandemia COVID- 19?",
        style: TextStyle(
            color: Color.fromRGBO(24, 122, 123, 3),
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      width: 300.0,
    );
  }

  Widget _pregunta1() {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Adecuadas y a tiempo'),
          leading: Radio(
            value: PrimerPregunta.res1,
            groupValue: _preguntaUno,
            onChanged: (PrimerPregunta value) {
              setState(() {
                _preguntaUno = value;
                print(_preguntaUno);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Inadecuadas y fuera de tiempo'),
          leading: Radio(
            value: PrimerPregunta.res2,
            groupValue: _preguntaUno,
            onChanged: (PrimerPregunta value) {
              setState(() {
                _preguntaUno = value;
                print(_preguntaUno);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('No sabe/desconoce'),
          leading: Radio(
            value: PrimerPregunta.res3,
            groupValue: _preguntaUno,
            onChanged: (PrimerPregunta value) {
              setState(() {
                _preguntaUno = value;
                print(_preguntaUno);
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _labelPregunta2() {
    return Container(
      child: Text(
        "2.- ¿Hasta el momento ¿Usted aprueba o desaprueba el trabajo realizado por la actual administración del Gobierno del estado de Michoacán?",
        style: TextStyle(
            color: Color.fromRGBO(24, 122, 123, 3),
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      width: 300.0,
    );
  }

  Widget _pregunta2() {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Lo aprueba'),
          leading: Radio(
            value: SegundaPregunta.res1,
            groupValue: _preugntaDos,
            onChanged: (SegundaPregunta value) {
              setState(() {
                _preugntaDos = value;
                print(_preugntaDos);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Lo desaprueba'),
          leading: Radio(
            value: SegundaPregunta.res2,
            groupValue: _preugntaDos,
            onChanged: (SegundaPregunta value) {
              setState(() {
                _preugntaDos = value;
                print(_preugntaDos);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('No sabe/desconoce'),
          leading: Radio(
            value: SegundaPregunta.res3,
            groupValue: _preugntaDos,
            onChanged: (SegundaPregunta value) {
              setState(() {
                _preugntaDos = value;
                print(value);
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _labelPregunta3() {
    return Container(
      child: Text(
        "3.- Respecto al trabajo de la actual administración, de los siguientes servicios ¿Cuál ha mejorado?",
        style: TextStyle(
            color: Color.fromRGBO(24, 122, 123, 3),
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      width: 300.0,
    );
  }

  Widget _pregunta3() {
    return Container(
      padding: EdgeInsets.all(16),
      child: MultiSelectFormField(
        autovalidate: false,
        titleText: '',
        dataSource: [
          {
            "display": "Seguridad",
            "value": "Seguridad",
          },
          {
            "display": "Obras Públicas",
            "value": "Obras Públicas",
          },
          {
            "display": "Reforestación y rescate de áreas verdes",
            "value": "Reforestación y rescate de áreas verdes",
          },
          {
            "display": "Mantenimiento de carreteras",
            "value": "Mantenimiento de carreteras",
          },
          {
            "display": "Ninguno",
            "value": "Ninguno",
          },
        ],
        textField: 'display',
        valueField: 'value',
        okButtonLabel: 'OK',
        cancelButtonLabel: 'CANCEL',
        // required: true,
        hintText: 'Seleccione Respuesta',
        initialValue: _myActivities,
        onSaved: (value) {
          if (value == null) return;
          setState(() {
            _myActivities = value;
            _discapacidad = _myActivities;
            print(_discapacidad);
          });
        },
      ),
    );
  }

  Widget _labelPregunta4() {
    return Container(
      child: Text(
        "4.- ¿Con cuál partido político te identificas?",
        style: TextStyle(
            color: Color.fromRGBO(24, 122, 123, 3),
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      width: 300.0,
    );
  }

  Widget _pregunta4() {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('MORENA'),
          leading: Radio(
            value: PartidoPolitico.partido1,
            groupValue: _partido,
            onChanged: (PartidoPolitico value) {
              setState(() {
                _partido = value;
                print(_partido);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('PAN'),
          leading: Radio(
            value: PartidoPolitico.partido2,
            groupValue: _partido,
            onChanged: (PartidoPolitico value) {
              setState(() {
                _partido = value;
                print(_partido);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('PRI'),
          leading: Radio(
            value: PartidoPolitico.partido3,
            groupValue: _partido,
            onChanged: (PartidoPolitico value) {
              setState(() {
                _partido = value;
                print(_partido);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('PMC'),
          leading: Radio(
            value: PartidoPolitico.partido4,
            groupValue: _partido,
            onChanged: (PartidoPolitico value) {
              setState(() {
                _partido = value;
                print(_partido);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('PRD'),
          leading: Radio(
            value: PartidoPolitico.partido5,
            groupValue: _partido,
            onChanged: (PartidoPolitico value) {
              setState(() {
                _partido = value;
                print(_partido);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Ninguno'),
          leading: Radio(
            value: PartidoPolitico.ninguno,
            groupValue: _partido,
            onChanged: (PartidoPolitico value) {
              setState(() {
                _partido = value;
                print(_partido);
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _labelPregunta5() {
    return Container(
      child: Text(
        "9.- Si hoy fueran las elecciones para Gobernador del Estado de Michoacán. ¿Por cuál partido político votaría usted?",
        style: TextStyle(
            color: Color.fromRGBO(24, 122, 123, 3),
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      width: 300.0,
    );
  }

  Widget _pregunta5() {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('MORENA'),
          leading: Radio(
            value: VotarPartidoPolitico.partido1,
            groupValue: _partidoVotar,
            onChanged: (VotarPartidoPolitico value) {
              setState(() {
                _partidoVotar = value;
                print(_partidoVotar);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('PAN'),
          leading: Radio(
            value: VotarPartidoPolitico.partido2,
            groupValue: _partidoVotar,
            onChanged: (VotarPartidoPolitico value) {
              setState(() {
                _partidoVotar = value;
                print(_partidoVotar);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('PRI'),
          leading: Radio(
            value: VotarPartidoPolitico.partido3,
            groupValue: _partidoVotar,
            onChanged: (VotarPartidoPolitico value) {
              setState(() {
                _partidoVotar = value;
                print(_partidoVotar);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('PMC'),
          leading: Radio(
            value: VotarPartidoPolitico.partido4,
            groupValue: _partidoVotar,
            onChanged: (VotarPartidoPolitico value) {
              setState(() {
                _partidoVotar = value;
                print(_partidoVotar);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('PRD'),
          leading: Radio(
            value: VotarPartidoPolitico.partido5,
            groupValue: _partidoVotar,
            onChanged: (VotarPartidoPolitico value) {
              setState(() {
                _partidoVotar = value;
                print(_partidoVotar);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Ninguno'),
          leading: Radio(
            value: VotarPartidoPolitico.ninguno,
            groupValue: _partidoVotar,
            onChanged: (VotarPartidoPolitico value) {
              setState(() {
                _partidoVotar = value;
                print(_partidoVotar);
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _labelPregunta6() {
    return Container(
      child: Text(
        "10.- De estos personajes políticos que le acabo de mencionar ¿Qué opinión tiene?",
        style: TextStyle(
            color: Color.fromRGBO(24, 122, 123, 3),
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      width: 300.0,
    );
  }

  Widget _labelCandidato() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text(
        "Candidato 1.-",
        style: TextStyle(
            color: Color.fromRGBO(24, 122, 123, 3),
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      width: 300.0,
    );
  }

  Widget _pregunta6() {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Muy Buena'),
          leading: Radio(
            value: Candidato.muybuena,
            groupValue: _opinion1,
            onChanged: (Candidato value) {
              setState(() {
                _opinion1 = value;
                print(_opinion1);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Buena'),
          leading: Radio(
            value: Candidato.buena,
            groupValue: _opinion1,
            onChanged: (Candidato value) {
              setState(() {
                _opinion1 = value;
                print(_opinion1);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Regular'),
          leading: Radio(
            value: Candidato.regular,
            groupValue: _opinion1,
            onChanged: (Candidato value) {
              setState(() {
                _opinion1 = value;
                print(_opinion1);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Mala'),
          leading: Radio(
            value: Candidato.mala,
            groupValue: _opinion1,
            onChanged: (Candidato value) {
              setState(() {
                _opinion1 = value;
                print(_opinion1);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Muy Mala'),
          leading: Radio(
            value: Candidato.muymala,
            groupValue: _opinion1,
            onChanged: (Candidato value) {
              setState(() {
                _opinion1 = value;
                print(_opinion1);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('No Sabe'),
          leading: Radio(
            value: Candidato.nosabe,
            groupValue: _opinion1,
            onChanged: (Candidato value) {
              setState(() {
                _opinion1 = value;
                print(_opinion1);
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _labelCandidato2() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text(
        "Candidato 2.-",
        style: TextStyle(
            color: Color.fromRGBO(24, 122, 123, 3),
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      width: 300.0,
    );
  }

  Widget _pregunta7() {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Muy Buena'),
          leading: Radio(
            value: Candidato2.muybuena,
            groupValue: _opinion2,
            onChanged: (Candidato2 value) {
              setState(() {
                _opinion2 = value;
                print(_opinion2);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Buena'),
          leading: Radio(
            value: Candidato2.buena,
            groupValue: _opinion2,
            onChanged: (Candidato2 value) {
              setState(() {
                _opinion2 = value;
                print(_opinion2);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Regular'),
          leading: Radio(
            value: Candidato2.regular,
            groupValue: _opinion2,
            onChanged: (Candidato2 value) {
              setState(() {
                _opinion2 = value;
                print(_opinion2);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Mala'),
          leading: Radio(
            value: Candidato2.mala,
            groupValue: _opinion2,
            onChanged: (Candidato2 value) {
              setState(() {
                _opinion2 = value;
                print(_opinion2);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Muy Mala'),
          leading: Radio(
            value: Candidato2.muymala,
            groupValue: _opinion2,
            onChanged: (Candidato2 value) {
              setState(() {
                _opinion2 = value;
                print(_opinion2);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('No Sabe'),
          leading: Radio(
            value: Candidato2.nosabe,
            groupValue: _opinion2,
            onChanged: (Candidato2 value) {
              setState(() {
                _opinion2 = value;
                print(_opinion2);
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _labelCandidato3() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text(
        "Candidato 3.-",
        style: TextStyle(
            color: Color.fromRGBO(24, 122, 123, 3),
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      width: 300.0,
    );
  }

  Widget _pregunta8() {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Muy Buena'),
          leading: Radio(
            value: Candidato3.muybuena,
            groupValue: _opinion3,
            onChanged: (Candidato3 value) {
              setState(() {
                _opinion3 = value;
                print(_opinion3);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Buena'),
          leading: Radio(
            value: Candidato3.buena,
            groupValue: _opinion3,
            onChanged: (Candidato3 value) {
              setState(() {
                _opinion3 = value;
                print(_opinion3);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Regular'),
          leading: Radio(
            value: Candidato3.regular,
            groupValue: _opinion3,
            onChanged: (Candidato3 value) {
              setState(() {
                _opinion3 = value;
                print(_opinion3);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Mala'),
          leading: Radio(
            value: Candidato3.mala,
            groupValue: _opinion3,
            onChanged: (Candidato3 value) {
              setState(() {
                _opinion3 = value;
                print(_opinion3);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Muy Mala'),
          leading: Radio(
            value: Candidato3.muymala,
            groupValue: _opinion3,
            onChanged: (Candidato3 value) {
              setState(() {
                _opinion3 = value;
                print(_opinion3);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('No Sabe'),
          leading: Radio(
            value: Candidato3.nosabe,
            groupValue: _opinion3,
            onChanged: (Candidato3 value) {
              setState(() {
                _opinion3 = value;
                print(_opinion3);
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _labelCandidato4() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text(
        "Candidato 4.-",
        style: TextStyle(
            color: Color.fromRGBO(24, 122, 123, 3),
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      width: 300.0,
    );
  }

  Widget _pregunta9() {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Muy Buena'),
          leading: Radio(
            value: Candidato4.muybuena,
            groupValue: _opinion4,
            onChanged: (Candidato4 value) {
              setState(() {
                _opinion4 = value;
                print(_opinion4);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Buena'),
          leading: Radio(
            value: Candidato4.buena,
            groupValue: _opinion4,
            onChanged: (Candidato4 value) {
              setState(() {
                _opinion4 = value;
                print(_opinion4);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Regular'),
          leading: Radio(
            value: Candidato4.regular,
            groupValue: _opinion4,
            onChanged: (Candidato4 value) {
              setState(() {
                _opinion4 = value;
                print(_opinion4);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Mala'),
          leading: Radio(
            value: Candidato4.mala,
            groupValue: _opinion4,
            onChanged: (Candidato4 value) {
              setState(() {
                _opinion4 = value;
                print(_opinion4);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Muy Mala'),
          leading: Radio(
            value: Candidato4.muymala,
            groupValue: _opinion4,
            onChanged: (Candidato4 value) {
              setState(() {
                _opinion4 = value;
                print(_opinion4);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('No Sabe'),
          leading: Radio(
            value: Candidato4.nosabe,
            groupValue: _opinion4,
            onChanged: (Candidato4 value) {
              setState(() {
                _opinion4 = value;
                print(_opinion4);
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _labelCandidato5() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text(
        "No sabe / no le interesa.-",
        style: TextStyle(
            color: Color.fromRGBO(24, 122, 123, 3),
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      width: 300.0,
    );
  }

  Widget _pregunta10() {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Muy Buena'),
          leading: Radio(
            value: NoSabeNoLeintereza.muybuena,
            groupValue: _opinion5,
            onChanged: (NoSabeNoLeintereza value) {
              setState(() {
                _opinion5 = value;
                print(_opinion5);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Buena'),
          leading: Radio(
            value: NoSabeNoLeintereza.buena,
            groupValue: _opinion5,
            onChanged: (NoSabeNoLeintereza value) {
              setState(() {
                _opinion5 = value;
                print(_opinion5);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Regular'),
          leading: Radio(
            value: NoSabeNoLeintereza.regular,
            groupValue: _opinion5,
            onChanged: (NoSabeNoLeintereza value) {
              setState(() {
                _opinion5 = value;
                print(_opinion5);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Mala'),
          leading: Radio(
            value: NoSabeNoLeintereza.mala,
            groupValue: _opinion5,
            onChanged: (NoSabeNoLeintereza value) {
              setState(() {
                _opinion5 = value;
                print(_opinion5);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Muy Mala'),
          leading: Radio(
            value: NoSabeNoLeintereza.muymala,
            groupValue: _opinion5,
            onChanged: (NoSabeNoLeintereza value) {
              setState(() {
                _opinion5 = value;
                print(_opinion5);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('No Sabe'),
          leading: Radio(
            value: NoSabeNoLeintereza.nosabe,
            groupValue: _opinion5,
            onChanged: (NoSabeNoLeintereza value) {
              setState(() {
                _opinion5 = value;
                print(_opinion5);
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _labelCandidato6() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text(
        "Ninguno",
        style: TextStyle(
            color: Color.fromRGBO(24, 122, 123, 3),
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      width: 300.0,
    );
  }

  Widget _pregunta11() {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Muy Buena'),
          leading: Radio(
            value: Ninguno.muybuena,
            groupValue: _opinion6,
            onChanged: (Ninguno value) {
              setState(() {
                _opinion6 = value;
                print(_opinion6);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Buena'),
          leading: Radio(
            value: Ninguno.buena,
            groupValue: _opinion6,
            onChanged: (Ninguno value) {
              setState(() {
                _opinion6 = value;
                print(_opinion6);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Regular'),
          leading: Radio(
            value: Ninguno.regular,
            groupValue: _opinion6,
            onChanged: (Ninguno value) {
              setState(() {
                _opinion6 = value;
                print(_opinion6);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Mala'),
          leading: Radio(
            value: Ninguno.mala,
            groupValue: _opinion6,
            onChanged: (Ninguno value) {
              setState(() {
                _opinion6 = value;
                print(_opinion6);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Muy Mala'),
          leading: Radio(
            value: Ninguno.muymala,
            groupValue: _opinion6,
            onChanged: (Ninguno value) {
              setState(() {
                _opinion6 = value;
                print(_opinion6);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('No Sabe'),
          leading: Radio(
            value: Ninguno.nosabe,
            groupValue: _opinion6,
            onChanged: (Ninguno value) {
              setState(() {
                _opinion6 = value;
                print(_opinion6);
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _labelCandidato7() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text(
        "Otro",
        style: TextStyle(
            color: Color.fromRGBO(24, 122, 123, 3),
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      width: 300.0,
    );
  }

  Widget _pregunta12() {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Muy Buena'),
          leading: Radio(
            value: Otro.muybuena,
            groupValue: _opinion7,
            onChanged: (Otro value) {
              setState(() {
                _opinion7 = value;
                print(_opinion7);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Buena'),
          leading: Radio(
            value: Otro.buena,
            groupValue: _opinion7,
            onChanged: (Otro value) {
              setState(() {
                _opinion7 = value;
                print(_opinion7);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Regular'),
          leading: Radio(
            value: Otro.regular,
            groupValue: _opinion7,
            onChanged: (Otro value) {
              setState(() {
                _opinion7 = value;
                print(_opinion7);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Mala'),
          leading: Radio(
            value: Otro.mala,
            groupValue: _opinion7,
            onChanged: (Otro value) {
              setState(() {
                _opinion7 = value;
                print(_opinion7);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Muy Mala'),
          leading: Radio(
            value: Otro.muymala,
            groupValue: _opinion7,
            onChanged: (Otro value) {
              setState(() {
                _opinion7 = value;
                print(_opinion7);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('No Sabe'),
          leading: Radio(
            value: Otro.nosabe,
            groupValue: _opinion7,
            onChanged: (Otro value) {
              setState(() {
                _opinion7 = value;
                print(_opinion7);
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _labelSubmit() {
    return Container(
      alignment: Alignment.center,
      child: completarInputs == 'false'
          ? Text(
              'Porfavor completa los campos marcados',
              style: TextStyle(
                color: Colors.red,
              ),
            )
          : Text(
              "",
              style: TextStyle(
                  color: Color.fromRGBO(24, 122, 123, 3),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
      width: 300.0,
      height: 35.0,
    );
  }

  Widget _labelFotos() {
    return Container(
      width: 500.0,
      height: 60.0,
      child: Column(
        children: <Widget>[
          Icon(Icons.camera_alt, color: Color.fromRGBO(24, 122, 123, 3)),
          Text(
            'Fotografias de Evidencia',
            style: TextStyle(
                color: Color.fromRGBO(24, 122, 123, 3),
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
                  color: Color.fromRGBO(24, 122, 123, 3),
                  child: _image == null
                      ? Icon(
                          FontAwesomeIcons.plus,
                          color: Colors.white,
                        )
                      : Image.file(_image),
                ),
              ),
              GestureDetector(
                onTap: _getImage2,
                child: Container(
                  color: Color.fromRGBO(24, 122, 123, 3),
                  child: _image2 == null
                      ? Icon(
                          FontAwesomeIcons.plus,
                          color: Colors.white,
                        )
                      : Image.file(_image2),
                ),
              ),
              GestureDetector(
                onTap: _getImage3,
                child: Container(
                  color: Color.fromRGBO(24, 122, 123, 3),
                  child: _image3 == null
                      ? Icon(
                          FontAwesomeIcons.plus,
                          color: Colors.white,
                        )
                      : Image.file(_image3),
                ),
              ),
              GestureDetector(
                onTap: _getImage4,
                child: Container(
                  color: Color.fromRGBO(24, 122, 123, 3),
                  child: _image4 == null
                      ? Icon(
                          FontAwesomeIcons.plus,
                          color: Colors.white,
                        )
                      : Image.file(_image4),
                ),
              ),
            ],
          ),
        ],
      ),
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
        labelStyle: TextStyle(color: Color.fromRGBO(24, 122, 123, 3)),
        suffixIcon: Icon(
          Icons.remove_red_eye,
          color: Color.fromRGBO(24, 122, 123, 3),
        ),
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
            Color.fromRGBO(24, 122, 123, 3),
            Color.fromRGBO(24, 122, 123, .8),
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

  bool validarCurp(String value) {
    Pattern pattern =
        r'([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0\d|1[0-2])(?:[0-2]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)';
    RegExp regex = new RegExp(pattern);

    return (!regex.hasMatch(value)) ? false : true;
  }

  void _submit() {
    if (!formKey.currentState.validate()) {
      setState(() {
        completarInputs = 'false';
        if (validarCurp(_obtenercurp.text) == true) {
          validacionFinal = "true";
          //print("Tu Curp ${_obtenercurp.text} Es Valida");
        } else {
          //print("Tu Curp ${_obtenercurp.text} No es Valida");
          validacionFinal = "false";
        }
        print(_numeroExterior);
      });
    } else {
      setState(() {
        completarInputs = '';
        if (validarCurp(_obtenercurp.text) == true) {
          validacionFinal = "true";
          //print("Tu Curp ${_obtenercurp.text} Es Valida");
        } else {
          //print("Tu Curp ${_obtenercurp.text} No es Valida");
          validacionFinal = "false";
        }
        print(_numeroExterior);
      });
    }
  }

  Widget _leerCurp() {
    return ListTile(
        title: validacionFinal == 'true'
            ? Text(
                "Curp: ${_obtenercurp.text}  es Valida",
                style: TextStyle(color: Colors.green),
              )
            : validacionFinal == 'false'
                ? Text(
                    "Curp: ${_obtenercurp.text} no es Valida",
                    style: TextStyle(color: Colors.red),
                  )
                : Text(''));
  }
}
