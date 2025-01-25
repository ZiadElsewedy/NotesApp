import 'package:flutter/material.dart';
import 'package:notesapp/customs/CustomTextField.dart';
import 'package:notesapp/customs/customButton.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: AddNoteForm(),
    );
  }
}







class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey(); 
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title,Content;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey ,
        autovalidateMode: autovalidateMode ,
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Center(child: Text('Create Note' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 22),)),
            const SizedBox(
              height: 30,
            ),
            Custom_Text_Field(hintText: 'Add title', Text: 'Title', icon: Icons.text_format,color: const Color.fromARGB(255, 193, 193, 193), MaxLines: 1,
            OnSaved: (Value){
               title = Value;
            },),
            const SizedBox(height: 25,),
            Custom_Text_Field(hintText: 'Content', Text: 'Add content', icon: Icons.content_paste_go_sharp,color: const Color.fromARGB(255, 193, 193, 193), MaxLines: 6,
            OnSaved: (Value){
              Content = Value;
            }),
            const SizedBox(height: 20,),
            CustomButton(Textname: "Add" , onTap: (){
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else{
                autovalidateMode = AutovalidateMode.always;              }
            }) 
        
          ],
        ),
      ),
    );
  }
}