import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class
HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();
  final birthDateController = TextEditingController();
  final admissionDateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final enabledBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(9),
    ),
    borderSide: BorderSide(color: Colors.black),
  );

  // DateTime _selectedDate = DateTime.now();
  // DateTime? _selectedDate;
  DateTime? admissionDate;
  String? admissionTime;
  String? admissionDateFormat;
  DateTime? birthDate;

  //
  // void _presentDatePicker() {
  //   showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime.utc(1980),
  //     lastDate: DateTime(2024),
  //   )
  //       .then((pickedDate) {
  //     // Check if no date is selected
  //     if (pickedDate == null) {
  //       return;
  //     }
  //     setState(() {
  //       _selectedDate = pickedDate;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text("Student Registration", style: TextStyle(
            fontSize: 20,
          ),),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    const SizedBox(height: 50,),
                     const Align(
                       alignment: Alignment.topLeft,
                         child: Text("Enter Your Name",style: TextStyle(
                           fontSize: 17
                         ),)),
                    const SizedBox(height: 10,),
                    getName(),

                    const SizedBox(height: 25,),

                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text("Enter Your Number",style: TextStyle(
                            fontSize: 17
                        ),)),
                    const SizedBox(height: 10,),
                    getMobileNo(),

                    const SizedBox(height: 50,),

                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text("Admission Date And Time",style: TextStyle(
                            fontSize: 17
                        ),)),
                    const SizedBox(height: 10,),
                    getAdmissionTimeDate(),

                    const SizedBox(height: 50,),

                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text("Date Of Birth",style: TextStyle(
                            fontSize: 17
                        ),)),
                    const SizedBox(height: 10,),
                    getDob(),

                    const SizedBox(height: 50,),

                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text("Address",style: TextStyle(
                            fontSize: 17
                        ),)),
                    const SizedBox(height: 10,),
                    getAddress(),

                    const SizedBox(height: 50,),

                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text("Birth Certificate",style: TextStyle(
                            fontSize: 17
                        ),)),
                    const SizedBox(height: 10,),
                    getBirthCertificate(),

                    const SizedBox(height: 50,),

                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text("Subject",style: TextStyle(
                            fontSize: 17
                        ),)),
                    const SizedBox(height: 10,),
                    getSubject(),

                    const SizedBox(height: 50,),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(
              left: 20, right: 20, top: 10, bottom: 10),
          child: InkWell(
            onTap: (){
              if(_formKey.currentState!.validate()){
                print("save");
                print(birthDate.toString());
                print(admissionDate.toString());
              }
            },
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.blueGrey
              ),
              child: const Center(
                child: Text("Save", style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),),
              ),
            ),
          ),
        ),
      ),
    );
  }

  getName() {
    return TextFormField(
      controller: nameController,
      cursorColor: Colors.black12,
      maxLength: 50,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.characters,
      style: const TextStyle(fontSize: 16, color: Color(0xFF19232d)),
      onChanged: (value){
        // nameController.value = TextEditingValue(
        //         text: value.toUpperCase(),
        // );
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter your name";
        }
        return null;
      },
      obscureText: false,
      decoration: InputDecoration(
        hintText: "Name",
        hintStyle: const TextStyle(fontSize: 17, color: Colors.black54),
        prefix: const SizedBox(width: 10,),
        enabledBorder: enabledBorder,
        border: enabledBorder,
        focusedBorder: enabledBorder,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }

  getMobileNo() {
    return TextFormField(
      controller: numberController,
      cursorColor: Colors.black12,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
           FilteringTextInputFormatter.digitsOnly,
           LengthLimitingTextInputFormatter(10),
      ],
      style: const TextStyle(fontSize: 16, color: Color(0xFF19232d)),
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter your mobile number";
        }
        return null;
      },
      obscureText: false,
      decoration: InputDecoration(
        hintText: "Mobile Number",
        hintStyle: const TextStyle(fontSize: 17, color: Colors.black54),
        prefix: const SizedBox(width: 10,),
        enabledBorder: enabledBorder,
        border: enabledBorder,
        focusedBorder: enabledBorder,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }

  getAdmissionTimeDate() {
    return TextFormField(
      controller: admissionDateController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter your Admission Date And Time";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Admission Date And Time",
        hintStyle: const TextStyle(fontSize: 17, color: Colors.black54),
        prefix: const SizedBox(width: 10,),
        enabledBorder: enabledBorder,
        border: enabledBorder,
        focusedBorder: enabledBorder,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      readOnly: true,
      onTap: () async {
        admissionDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1980),
          lastDate: DateTime.now(),
        );
        if(admissionDate != null ){
          admissionDateFormat = DateFormat('dd-MMM-yyyy').format(admissionDate!);
          setState(() {
            admissionDateController.text = admissionDateFormat!;
          });
          _show();
        }else{
          print("Date is not selected");
        }
      },
    );
  }

  Future<void> _show() async {
    final TimeOfDay? result =
    await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        admissionTime = result.format(context);
        admissionDateController.text = "$admissionDateFormat $admissionTime";
      });
    }
    else{
      print("Please Select Time");
    }
  }

  getDob() {
    return TextFormField(
      controller: birthDateController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter your Birth Date";
        }
        if(birthDate != null ){
          if(birthDate != null && admissionDate != null){
            if(birthDate!.isAfter(admissionDate!)){
              return "Birth Date should be grater then to your Admission Date";
            }
          }
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Birth Date",
        hintStyle: const TextStyle(fontSize: 17, color: Colors.black54),
        prefix: const SizedBox(width: 10,),
        enabledBorder: enabledBorder,
        border: enabledBorder,
        focusedBorder: enabledBorder,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      readOnly: true,  //set it true, so that user will not able to edit text
      onTap: () async {
        birthDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1980),
            lastDate: DateTime.now(),
        );
        if(birthDate != null ){
          String formattedDate = DateFormat('dd-MMM-yyyy').format(birthDate!);
          setState(() {
            birthDateController.text = formattedDate;
          });
          // if(birthDate != null && admissionDate != null){
          //   if(birthDate!.isAfter(admissionDate!)){
          //     print("error");
          //   }
          // }
        }else{
          print("Date is not selected");
        }
      },
    );
  }


  getAddress() {
    return TextFormField(
      controller: addressController,
      cursorColor: Colors.black12,
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 16, color: Color(0xFF19232d)),
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter your address";
        }
        return null;
      },
      obscureText: false,
      decoration: InputDecoration(
        hintText: "Address",
        hintStyle: const TextStyle(fontSize: 17, color: Colors.black54),
        prefix: const SizedBox(width: 10,),
        enabledBorder: enabledBorder,
        border: enabledBorder,
        focusedBorder: enabledBorder,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }


  getBirthCertificate() {
    return Text("Birth Certificates");
  }

  getSubject() {
    return Text("Subject");
  }
}