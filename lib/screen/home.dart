import 'package:flutter/material.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:tab/screen/button.dart';
import 'package:tab/screen/customscrol.dart';
import 'package:tab/screen/dropdown.dart';
import 'package:tab/screen/hold.dart';
import 'package:tab/screen/textfieldwidget.dart';
import 'package:tab/screen/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // A list to keep track of tables
  final List<int> _tableList = [];

  // Method to add a new table
  // ignore: unused_element
  void _addTable() {
    setState(() {
      _tableList.add(_tableList.length); // Add new table
    });
  }

  // Method to remove a table
  // ignore: unused_element
  void _deleteTable(int index) {
    setState(() {
      _tableList.removeAt(index); // Remove the selected table
    });
  }

  final form = FormGroup({
    'hold': FormControl<String>(validators: []),
    'date': FormControl<DateTime>(
      validators: [],
    ),
    'time': FormControl<DateTime>(
      validators: [],
    ),
    'daytext': FormControl<String>(validators: []),
    'seven': FormControl<String>(validators: []),
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validation'),
      ),
      body: ReactiveForm(
        formGroup: form,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: SingleChildScrollView(
            reverse: false,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Icon(Icons.close)],
                ),
                const Row(
                  children: [
                    Text(
                      'Add Shift Labor',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Job Name'),
                          const SizedBox(height: 10),
                          DropDownWidget(
                            items: const [
                              '111459 -Nord Pollex',
                              'Item 2',
                              'Item 3'
                            ],
                            onChanged: (value) {
                              // print('Selected: $value');
                            },
                            suffixIcon: const Icon(Icons.arrow_drop_down),
                            initialValue: '111459 -Nord Pollex',
                            borderRadius: 4.0,
                            borderColor: Colors.grey,
                            hintText: '111459 -Nord Pollex',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('# of Hold'),
                          const SizedBox(height: 10),
                          HoldTextWidget(
                            formControlName: 'hold',
                            hintText: 'Enter text here',
                            keyboardType: TextInputType.text,
                            validator: (control) => 'This field is required',
                            onFieldSubmitted: (value) {
                              // ignore: avoid_print
                              print('Submitted: $value');
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Cargo'),
                          const SizedBox(height: 10),
                          DropDownWidget(
                            hintText: 'Barite',
                            items: const ['Barite', 'Item 2', 'Item 3'],
                            onChanged: (value) {
                              // print('Selected: $value');
                            },
                            suffixIcon: const Icon(Icons.arrow_drop_down),
                            initialValue: 'Barite',
                            borderRadius: 4.0,
                            borderColor: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 237, 237),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Expanded(
                              flex: 2,
                              child: Text(
                                'Supervisor',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'Date',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'Shift',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'Crano',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'Start Time',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'Expected\nDuration', // Fixed typo
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign:
                                    TextAlign.center, // Center text if needed
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: GestureDetector(
                                onTap: () {
                                  _addTable();
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                      itemCount: _tableList.length,
                      shrinkWrap: false,
                      // scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 0,
                          surfaceTintColor: Colors.transparent,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 241, 236, 236),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          flex: 2,
                                          child: CustomDropdown(
                                            items: const [
                                              'Marsman Bellok',
                                              'Item 2',
                                              'Item 3'
                                            ],
                                            onChanged: (value) {
                                              print('Selected: $value');
                                            },
                                            suffixIcon: const Icon(
                                                Icons.arrow_drop_down),
                                            initialValue: 'Marsman Bellok',
                                            hintText: 'Marsman Bellok',
                                            borderColorTop:
                                                const Color.fromARGB(
                                                    255, 214, 212, 212),
                                            borderColorBottom:
                                                const Color.fromARGB(
                                                    255, 214, 212, 212),
                                            borderColorLeft:
                                                const Color.fromARGB(
                                                    255, 214, 212, 212),
                                            borderColorRight:
                                                const Color.fromARGB(
                                                    255, 214, 212, 212),
                                            borderWidthTop: 1.0,
                                            borderWidthBottom: 1.0,
                                            borderWidthLeft: 1.0,
                                            borderWidthRight: 1.0,
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                border: Border(
                                              top: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 214, 212, 212),
                                              ),
                                              bottom: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 214, 212, 212),
                                              ),
                                            )),
                                            child: ReactiveDateTimePicker(
                                              formControlName: 'date',
                                              decoration: const InputDecoration(
                                                hintText: '11/24/23',
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                  width: 1,
                                                  color: const Color.fromARGB(
                                                      255, 214, 212, 212),
                                                )),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 16),
                                                suffixIcon: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 15, 0),
                                                  child: Icon(
                                                      Icons.calendar_today),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: CustomDropdown(
                                            items: const [
                                              'Day',
                                              'Day 2',
                                              'Day 3',
                                              'Day 4'
                                            ],
                                            onChanged: (value) {
                                              print('Selected: $value');
                                            },
                                            suffixIcon: const Icon(
                                                Icons.arrow_drop_down),
                                            initialValue: 'Day',
                                            hintText: 'Day',
                                            borderColorBottom:
                                                const Color.fromARGB(
                                                    255, 214, 212, 212),
                                            borderColorTop:
                                                const Color.fromARGB(
                                                    255, 214, 212, 212),
                                            borderColorLeft:
                                                const Color.fromARGB(
                                                    255, 214, 212, 212),
                                            borderColorRight:
                                                const Color.fromARGB(
                                                    255, 214, 212, 212),
                                            borderWidthTop: 1.0,
                                            borderWidthLeft: 1.0,
                                            borderWidthRight: 1.0,
                                            borderWidthBottom: 1.0,
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: CustomDropdown(
                                            items: const [
                                              'Miss Tara',
                                              'Miss Miss Dina',
                                              'Miss'
                                            ],
                                            onChanged: (value) {
                                              print('Selected: $value');
                                            },
                                            suffixIcon: const Icon(
                                                Icons.arrow_drop_down),
                                            initialValue: 'Miss Tara',
                                            hintText: 'Miss Tara',
                                            borderColorBottom:
                                                const Color.fromARGB(
                                                    255, 214, 212, 212),
                                            borderColorTop:
                                                const Color.fromARGB(
                                                    255, 214, 212, 212),
                                            borderColorRight:
                                                const Color.fromARGB(
                                                    255, 214, 212, 212),
                                            borderWidthTop: 1.0,
                                            borderWidthRight: 1.0,
                                            borderWidthBottom: 1.0,
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                border: Border(
                                              top: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 214, 212, 212),
                                              ),
                                              right: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 214, 212, 212),
                                              ),
                                              bottom: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 214, 212, 212),
                                              ),
                                            )),
                                            child: ReactiveDateTimePicker(
                                              formControlName: 'time',
                                              type: ReactiveDatePickerFieldType
                                                  .time,
                                              decoration: const InputDecoration(
                                                hintText: '4:30',
                                                border: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 16,
                                                        horizontal: 16),
                                                suffixIcon: Icon(
                                                    Icons.watch_later_outlined),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                            height: 50,
                                            decoration: const BoxDecoration(
                                                border: Border(
                                              top: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 214, 212, 212),
                                              ),
                                              right: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 214, 212, 212),
                                              ),
                                              bottom: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 214, 212, 212),
                                              ),
                                            )),
                                            child: const Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  30, 0, 20, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 12),
                                                    child: Text(
                                                      '5',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Hrs',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, bottom: 0, left: 20),
                                            child: GestureDetector(
                                              onTap: () {
                                                _deleteTable(index);
                                              },
                                              child: const Center(
                                                child: Icon(
                                                  Icons.delete,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          flex: 4,
                                          child: CustomDropdown(
                                            items: const [
                                              'Example',
                                              'Example 2',
                                              'Example 3'
                                            ],
                                            onChanged: (value) {
                                              print('Selected: $value');
                                            },
                                            suffixIcon: const Icon(
                                                Icons.arrow_drop_down),
                                            initialValue: 'Example',
                                            hintText: 'Example',
                                            borderColorBottom:
                                                const Color.fromARGB(
                                                    255, 214, 212, 212),
                                            borderColorLeft:
                                                const Color.fromARGB(
                                                    255, 214, 212, 212),
                                            borderColorRight:
                                                const Color.fromARGB(
                                                    255, 214, 212, 212),
                                            borderWidthBottom: 1.0,
                                            borderWidthLeft: 1.0,
                                            borderWidthRight: 1.0,
                                          ),
                                        ),
                                        Flexible(
                                          flex: 4,
                                          child: WidgetForm(
                                            formControlName: 'daytext',
                                            hintText: '345364',
                                            keyboardType: TextInputType.text,
                                            validator: (control) =>
                                                'This field is required',
                                            onFieldSubmitted: (value) {
                                              print('Submitted: $value');
                                            },
                                            borderColorBottom:
                                                const Color.fromARGB(
                                                    255, 214, 212, 212),
                                            borderColorRight:
                                                const Color.fromARGB(
                                                    255, 214, 212, 212),
                                            borderWidthBottom: 1.0,
                                            borderWidthRight: 1.0,
                                          ),
                                        ),
                                        Flexible(
                                          flex: 4,
                                          child: WidgetForm(
                                            formControlName: 'seven',
                                            hintText: '7',
                                            keyboardType: TextInputType.text,
                                            // validator: (control) => 'This field is required',
                                            onFieldSubmitted: (value) {
                                              print('Submitted: $value');
                                            },

                                            borderColorBottom:
                                                const Color.fromARGB(
                                                    255, 214, 212, 212),
                                            borderColorRight:
                                                const Color.fromARGB(
                                                    255, 214, 212, 212),

                                            borderWidthBottom: 1.0,
                                            borderWidthRight: 1.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 44),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              buttonColor: const Color.fromARGB(255, 210, 208, 208),
              textColor: Colors.black,
              title: 'Cancel',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CustomScrollViewExample()));
              },
              borderColor: Colors.grey,
            ),
            const SizedBox(
              width: 20,
            ),
            CustomButton(
              buttonColor: Colors.blue,
              textColor: Colors.white,
              title: 'Save',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
