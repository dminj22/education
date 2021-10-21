import 'package:education/Style/variables.dart';
import 'package:flutter/material.dart';

class EDTextField extends StatelessWidget {




  const EDTextField({Key? key, this.controller, this.keyboardType, this.prefixIcon, this.label, this.obscureText}) : super(key: key);
  final controller;
  final keyboardType;
  final prefixIcon;
  final label;
  final obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: SizedBox(
        height: 40,
        child: TextField(
          obscureText: obscureText == null ? false : true,
          enableInteractiveSelection: false,
          controller: controller,
          keyboardType: keyboardType,
          style: TextStyle(fontSize: 18),

          decoration: InputDecoration(
            label: label,
            labelStyle: lightFont,
            prefixIcon: prefixIcon,
            contentPadding: EdgeInsets.only(left: 10),
            border: OutlineInputBorder()
          ),
        ),
      ),
    );
  }
}

class EDButton extends StatelessWidget {
  const EDButton({Key? key, this.onPressed, this.child}) : super(key: key);
  final onPressed;
  final child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: child);
  }
}

class EDTextButton extends StatelessWidget {
  final onPressed;

  final child;

  const EDTextButton({Key? key, this.onPressed, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: child,
    );
  }
}

class EDDrawerListTile extends StatelessWidget {
  final leading;

  final title;

  final trailing;

  final onTap;

  const EDDrawerListTile({Key? key, this.leading, this.title, this.trailing, this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: onTap,
      leading: leading,
      title: Text(title, style: boldFont,),
      trailing: trailing,
    );
  }
}
