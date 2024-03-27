import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {

  final TextEditingController _userNameController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Home Screen'),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 10, 8, 0),
              child: TextFormField(
                controller: _userNameController,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Enter votre pseudo ...',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),

                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            //   child: FlutterFlowDropDown<String>(
            //     controller: _model.dropDownValueController ??=
            //         FormFieldController<String>(
            //           _model.dropDownValue ??= 'Niveau 1',
            //         ),
            //     options: ['Niveau 1', 'Niveau 2', 'Niveau 3'],
            //     onChanged: (val) =>
            //         {},
            //     width: 300,
            //     height: 56,
            //     textStyle: FlutterFlowTheme.of(context).bodyMedium,
            //     hintText: 'Please select...',
            //     icon: Icon(
            //       Icons.keyboard_arrow_down_rounded,
            //       color: FlutterFlowTheme.of(context).secondaryText,
            //       size: 24,
            //     ),
            //     fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            //     elevation: 2,
            //     borderColor: FlutterFlowTheme.of(context).alternate,
            //     borderWidth: 2,
            //     borderRadius: 8,
            //     margin: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
            //     hidesUnderline: true,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 20, 8, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Entre ? et ? ',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 20,
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Text(
                      '? tentatives',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Commencer à jouer !',
                    options: FFButtonOptions(
                      height: 80,
                      padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                      FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                      ),
                      elevation: 3,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Align(
                alignment: const AlignmentDirectional(0, -1),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Régles du jeu',
                  options: FFButtonOptions(
                    height: 38,
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle:
                    FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                    ),
                    elevation: 3,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ], // children
        ),
      ),
    );
  }
}
