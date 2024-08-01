import 'package:flutter/material.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:tab/screen/textfieldwidget.dart';
import 'package:tab/screen/textwidget.dart';

class DynamicFormArrayExample extends StatefulWidget {
  const DynamicFormArrayExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DynamicFormArrayExampleState createState() =>
      _DynamicFormArrayExampleState();
}

class _DynamicFormArrayExampleState extends State<DynamicFormArrayExample> {
  final FormGroup form = FormGroup({
    'entries': FormArray([
      FormGroup({
        'dropdownField': FormControl<String>(),
        'date': FormControl<DateTime>(),
        'dday': FormControl<String>(),
        'dmiss': FormControl<String>(),
        'dexample': FormControl<String>(),
        'time': FormControl<DateTime>(),
        'daytext': FormControl<String>(),
        'seven': FormControl<String>(),
      }),
    ]),
  });

  FormArray get entries => form.control('entries') as FormArray;

  void _addEntry() {
    entries.add(
      FormGroup({
        'dropdownField': FormControl<String>(),
        'date': FormControl<DateTime>(),
        'dday': FormControl<String>(),
        'dmiss': FormControl<String>(),
        'dexample': FormControl<String>(),
        'time': FormControl<DateTime>(),
        'daytext': FormControl<String>(),
        'seven': FormControl<String>(),
      }),
    );
    setState(() {});
  }

  void _deleteEntry(int index) {
    entries.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic FormArray Example'),
        actions: [
          IconButton(
              onPressed: () {
                _addEntry();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ReactiveForm(
        formGroup: form,
        child: Column(
          children: [
            Expanded(
              child: ReactiveFormArray(
                formArrayName: 'entries',
                builder: (context, formArray, child) {
                  return ListView.builder(
                    itemCount: formArray.controls.length,
                    itemBuilder: (context, index) {
                      final formGroup =
                          formArray.control(index.toString()) as FormGroup;

                      return Card(
                        elevation: 0,
                        surfaceTintColor: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 241, 236, 236),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: ReactiveCustomDropdown(
                                        items: const [
                                          'Marsman Bellok',
                                          'Item 2',
                                          'Item 3'
                                        ],
                                        suffixIcon:
                                            const Icon(Icons.arrow_drop_down),
                                        initialValue: 'Marsman Bellok',
                                        hintText: 'Marsman Bellok',
                                        borderColorTop: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderColorBottom: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderColorLeft: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderColorRight: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderWidthTop: 1.0,
                                        borderWidthBottom: 1.0,
                                        borderWidthLeft: 1.0,
                                        borderWidthRight: 1.0,
                                        formControl:
                                            formGroup.control('dropdownField')
                                                as FormControl<String>,
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
                                          ),
                                        ),
                                        child: ReactiveDateTimePicker(
                                          formControl: formGroup.control('date')
                                              as FormControl<DateTime>,
                                          decoration: const InputDecoration(
                                            hintText: '11/24/23',
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 214, 212, 212),
                                              ),
                                            ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 16),
                                            suffixIcon: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 15, 0),
                                              child: Icon(Icons.calendar_today),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: ReactiveCustomDropdown(
                                        items: const [
                                          'Day',
                                          'Day 2',
                                          'Day 3',
                                          'Day 4'
                                        ],
                                        // onChanged: (value) {
                                        //   print('Selected: $value');
                                        // },
                                        suffixIcon:
                                            const Icon(Icons.arrow_drop_down),
                                        initialValue: 'Day',
                                        hintText: 'Day',
                                        borderColorBottom: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderColorTop: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderColorLeft: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderColorRight: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderWidthBottom: 1.0,
                                        borderWidthTop: 1.0,
                                        borderWidthLeft: 1.0,
                                        borderWidthRight: 1.0,
                                        formControl: formGroup.control('dday')
                                            as FormControl<String>,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: ReactiveCustomDropdown(
                                        items: const [
                                          'Miss Tare',
                                          'Miss Dina',
                                          'Miss B',
                                        ],
                                        // onChanged: (value) {
                                        //   print('Selected: $value');
                                        // },
                                        suffixIcon:
                                            const Icon(Icons.arrow_drop_down),
                                        initialValue: 'Miss Tare',
                                        hintText: 'Miss Tare',
                                        borderColorBottom: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderColorTop: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderColorLeft: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderColorRight: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderWidthBottom: 1.0,
                                        borderWidthTop: 1.0,
                                        borderWidthLeft: 1.0,
                                        borderWidthRight: 1.0,
                                        formControl: formGroup.control('dmiss')
                                            as FormControl<String>,
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
                                          ),
                                        ),
                                        child: ReactiveDateTimePicker(
                                          formControl: formGroup.control('time')
                                              as FormControl<DateTime>,
                                          decoration: const InputDecoration(
                                            hintText: '10:33 PM',
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 214, 212, 212),
                                              ),
                                            ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 16),
                                            suffixIcon: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 15, 0),
                                              child: Icon(Icons.access_time),
                                            ),
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
                                          left: BorderSide(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 214, 212, 212),
                                          ),
                                        )),
                                        child: const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(30, 0, 20, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
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
                                            _deleteEntry(index);
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
                                      flex: 1,
                                      child: ReactiveCustomDropdown(
                                        items: const [
                                          'Example 1',
                                          'Example 2',
                                          'Example 3'
                                        ],
                                        suffixIcon:
                                            const Icon(Icons.arrow_drop_down),
                                        initialValue: 'Example 1',
                                        hintText: 'Example 1',
                                        borderColorBottom: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderColorLeft: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderColorRight: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderWidthBottom: 1.0,
                                        borderWidthLeft: 1.0,
                                        borderWidthRight: 1.0,
                                        formControl:
                                            formGroup.control('dexample')
                                                as FormControl<String>,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: TextWidgetForm(
                                        formControl:
                                            formGroup.control('daytext')
                                                as FormControl<String>,
                                        hintText: '345364',
                                        keyboardType: TextInputType.text,
                                        borderColorBottom: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderColorLeft: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderColorRight: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderWidthBottom: 1.0,
                                        borderWidthLeft: 1.0,
                                        borderWidthRight: 1.0,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: TextWidgetForm(
                                        formControl: formGroup.control('seven')
                                            as FormControl<String>,
                                        hintText: '7',
                                        keyboardType: TextInputType.text,
                                        borderColorBottom: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderColorLeft: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderColorRight: const Color.fromARGB(
                                            255, 214, 212, 212),
                                        borderWidthBottom: 1.0,
                                        borderWidthLeft: 1.0,
                                        borderWidthRight: 1.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 44),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _addEntry,
                  child: const Text('Add Entry'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    if (form.valid) {
                      print('Form Value: ${form.value}');
                    } else {
                      form.markAllAsTouched();
                      print('Form is not valid');
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
