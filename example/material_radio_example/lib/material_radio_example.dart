// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_radio/material_radio.dart';
import 'package:angular_components/material_radio/material_radio_group.dart';
import 'package:angular_components/model/selection/selection_model.dart';
import 'package:angular_gallery_section/annotation/gallery_section_config.dart';

@GallerySectionConfig(
  displayName: 'Material Radio',
  docs: const [MaterialRadioComponent, MaterialRadioGroupComponent],
  demos: const [MaterialRadioExample],
  benchmarks: const [
    'material_radio_100_init',
  ],
  showGeneratedDocs: true,
)
@Component(
  selector: 'material-radio-example',
  directives: const [
    NgFor,
    NgFormControl,
    NgModel,
    MaterialIconComponent,
    MaterialRadioComponent,
    MaterialRadioGroupComponent,
  ],
  templateUrl: 'material_radio_example.html',
  styleUrls: const ['material_radio_example.scss.css'],
)
class MaterialRadioExample {
  /// Example without a group
  bool custom = false;
  bool unselected = false;
  bool preselected = true;
  bool impossible = false;
  bool always = true;

  /// Example 1 using group
  List<Option> ex1Options = [
    new Option("fast", false, false),
    new Option("cheap", false, false),
    new Option("good", false, false)
  ];
  final SelectionModel ex1SelectionModel = new SelectionModel.single();
  String get ex1SelectedValue => ex1SelectionModel.selectedValues.isEmpty
      ? 'unknown'
      : ex1SelectionModel.selectedValues.first;

  /// Example 2 using group
  List<Option> ex2Options = [
    new Option("poor", false, false),
    new Option("fair", true, false), // pre-selected
    new Option("good", false, true), // disabled
    new Option("awesome", false, false)
  ];
  Option selected;
  String get ex2SelectedValue => selected.label;

  MaterialRadioExample() {
    selected = ex2Options.firstWhere((o) => o.selected);
  }
}

class Option {
  final String label;
  bool selected;
  bool disabled;

  Option(this.label, this.selected, this.disabled);
}
