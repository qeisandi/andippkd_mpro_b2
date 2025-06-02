import 'package:flutter/material.dart';

class CheckBoxA extends StatefulWidget {
  const CheckBoxA({super.key});

  @override
  State<CheckBoxA> createState() => _CheckBoxAState();
}

class _CheckBoxAState extends State<CheckBoxA> {
  bool _valueCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(children: [Padding(padding: EdgeInsets.all(20))]),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[300],
                  ),
                  // color: Colors.grey[300],
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet est vel magna blandit pretium. Aenean non elit volutpat, tempus turpis ut, sollicitudin ipsum. Cras convallis congue sem eget suscipit. Nam in arcu ornare, maximus lorem quis, sagittis massa. Donec a maximus urna. Fusce sit amet erat tincidunt, facilisis nunc vitae, consequat purus. Nunc gravida odio ante, eu blandit ex mollis ac. Donec in est a felis consectetur gravida.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Row(
                          children: [
                            Expanded(child: Divider()),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 8),
                            //   child: Text("ATAU"),
                            // ),
                            Expanded(child: Divider()),
                          ],
                        ),
                        Text(
                          'Integer et scelerisque mi. Quisque rhoncus dui sit amet nulla convallis vestibulum. Donec mollis rutrum risus non convallis. Quisque gravida commodo ultrices. Vivamus tincidunt ex vitae dictum finibus. Maecenas gravida sapien quis urna porta dapibus. Fusce semper ut diam sed eleifend. Sed sed est ut urna dictum molestie vitae at sapien. Nulla placerat bibendum sodales. Nunc ac fermentum est. Suspendisse congue, nisi sed ornare scelerisque, turpis nibh pretium tellus, at aliquet ante augue sed leo. Cras in arcu odio. Vestibulum scelerisque in tellus nec maximus. Nullam feugiat congue lobortis. Aliquam tristique lectus orci, eu interdum tortor porta interdum. Nunc id pulvinar nunc, at tempor magna.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Row(
                          children: [
                            Expanded(child: Divider()),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 8),
                            //   child: Text("ATAU"),
                            // ),
                            Expanded(child: Divider()),
                          ],
                        ),
                        CheckboxListTile(
                          title: Text(
                            'Saya menyetujui semua persyaratan yang berlaku',
                            style: TextStyle(
                              // fontFamily: 'Gilroy',
                              fontSize: 16,
                            ),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          // fillColor: WidgetStateProperty.all(AppColor.army1),
                          activeColor: Colors.green,
                          checkColor: Colors.white,
                          shape: BeveledRectangleBorder(),
                          side: BorderSide(color: Colors.grey),
                          value: _valueCheck,
                          onChanged: (value) {
                            setState(() {
                              print("Checkbox value changed: $value");
                              _valueCheck = value!;
                            });
                          },
                        ),
                        // SizedBox(height: 20),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                            ),
                            ElevatedButton(
                              onPressed: _valueCheck ? () {} : null,
                              child: Text(
                                _valueCheck
                                    ? "Lanjutkan pendaftaran diperbolehkan"
                                    : "Anda belum bisa melanjutkan",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            // Text(
                            //   _valueCheck
                            //       ? "Lanjutkan pendaftaran diperbolehkan"
                            //       : "Anda belum bisa melanjutkan",
                            //   style: TextStyle(fontSize: 15),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
