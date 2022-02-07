prompt --application/pages/page_00042
begin
--   Manifest
--     PAGE: 00042
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>2200501847087933
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'CONTROL'
);
wwv_flow_api.create_page(
 p_id=>42
,p_user_interface_id=>wwv_flow_api.id(5319554376144027)
,p_name=>'Comprobante Venta'
,p_alias=>'COMPROBANTE-VENTA1'
,p_page_mode=>'MODAL'
,p_step_title=>'Comprobante Venta'
,p_allow_duplicate_submissions=>'N'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(5322694370144102)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function comprobarLineas() {',
'//Accedemos al modelo de la linea del detalle',
'    var model = apex.region("det").widget().interactiveGrid("getCurrentView").model;',
'    var contar = 0;',
'    var articulo = 0;',
'    var dup_arti = 0;',
'    //Recorremos las lineas ',
'    model.forEach(function(r,index,id) {',
'    var meta = model.getRecordMetadata(id);',
'    if ((meta.fields != undefined) && (!meta.deleted)) {',
'        if (articulo == 0) {',
'            articulo = model.getFieldKey("COD_ARTICULO");',
'        }',
'        contar++;',
'        if ((contar > 1) && (articulo == model.getFieldKey("COD_ARTICULO"))){',
'            dup_arti = 1;',
'        }',
'    }',
'    });',
'    if (contar == 0){',
'        alert("Debe ingresar al menos algun registro al detalle, para confirmar la operacion");',
'        apex.event.gCancelFlag = true;',
'    } else if(dup_arti == 1){',
'        alert("Existen Articulos duplicados en el detalle,Verifique!!!");',
'        apex.event.gCancelFlag = true;',
'    } else{',
'        habilitaControlesBeforeSubmit();',
'    }',
'};',
'',
'function fn_del_rec_collection(p_secuencia) {',
'	console.log(p_secuencia);',
'    apex.server.process(''pr_del_rec_coleccajax'',                             ',
'                        {x01: p_secuencia',
'                        },  ',
'        {',
'            success: function (pData) {             ',
'                if (pData.success == true) {',
'                    fn_act_reg_detalle();',
'                    fn_cal_tot_collection();',
'                }',
'            },                     ',
'        }',
'    );',
'};',
'',
'function habilitaControlesBeforeSubmit(){',
'	$("#P42_GRA_COMPROBANTE").removeAttr("disabled");',
'	$("#P42_IVA_COMPROBANTE").removeAttr("disabled");',
'	$("#P42_TOT_COMPROBANTE").removeAttr("disabled");',
'};',
'',
'function fn_add_act_collection() {',
'    var v_articulo = apex.item( "P42_COD_ARTICULO" ).getValue();',
'    var v_cantidad = apex.item( "P42_CANTIDAD" ).getValue();',
'    var v_precio = apex.item( "P42_PRECIO" ).getValue();',
'    //console.log(''Articulo: '' + v_articulo + '' Cantidad: '' + v_cantidad + '' Precio: '' + v_precio);',
'    apex.server.process(''pr_add_act_coleccajax'',                             ',
'                        {x01: v_articulo,',
'                         x02: v_cantidad,',
'                         x03: v_precio',
'                        },  ',
'        {',
'            success: function (pData) {             ',
'                //console.log(''Total Iva: '' + pData.xtotal_iva + '' Total Gravada: '' + pData.xtotal_gravada + '' Total: '' + pData.xtotal);',
'                if (pData.success == true) {',
'                    fn_act_reg_detalle();',
'                    fn_lim_col_articulos();',
'                }',
'            },                     ',
'        }',
'    );',
'};',
'',
'function fn_cal_tot_collection() {',
'    //console.log(''Proc total'');',
'    apex.server.process(''pr_cal_tot_coleccajax'',',
'                        { },',
'        {',
'            success: function (pData) {             ',
'                //console.log(''Total Iva: '' + pData.xtotal_iva + '' Total Gravada: '' + pData.xtotal_gravada + '' Total: '' + pData.xtotal);',
'                if (pData.success == true) {',
'                    apex.item( "P42_IVA_COMPROBANTE" ).setValue(pData.xtotal_iva);',
'                    apex.item( "P42_GRA_COMPROBANTE" ).setValue(pData.xtotal_gravada);',
'                    apex.item( "P42_TOT_COMPROBANTE" ).setValue(pData.xtotal);',
'                }',
'            },                     ',
'        }',
'    );',
'};',
'',
'function fn_lim_col_articulos(){',
'	apex.item( "P42_COD_ARTICULO" ).setValue(null);',
'    apex.item( "P42_CANTIDAD" ).setValue(null);',
'    apex.item( "P42_PRECIO" ).setValue(null);',
'    apex.item( "P42_COD_ARTICULO" ).setFocus();',
'};',
'function fn_nav_articulo(){',
'    console.log(''Prueba'');',
'    apex.item( "P42_COD_ARTICULO" ).setFocus();',
'};',
'function fn_act_reg_detalle(){',
'	var region = apex.region( "det" );',
'    region.refresh();',
'};'))
,p_step_template=>wwv_flow_api.id(20701244474036853)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_protection_level=>'C'
,p_last_updated_by=>'JTORRES'
,p_last_upd_yyyymmddhh24miss=>'20220205101328'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23052000792158838)
,p_plug_name=>unistr('Art\00EDculo ')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5234926163143730)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27133225802052303)
,p_plug_name=>'detalle_comprobante'
,p_region_name=>'det'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5207526032143638)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  SEQ_ID,',
'        c001 COD_ARTICULO,',
'        n001 CANTIDAD,',
'        n002 PRECIO,',
'        n003 IVA,',
'        n004 GRAVADA,',
'        n005 TOTAL,',
'        '''' AS DEL',
'FROM apex_collections ',
'WHERE collection_name = ''TMP_COM_DET_VENTAS'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'detalle_comprobante'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(27459904972648123)
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_show_detail_link=>'N'
,p_owner=>'JTORRES'
,p_internal_uid=>27459904972648123
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(27460075051648124)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(27460116336648125)
,p_db_column_name=>'COD_ARTICULO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Cod Articulo'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(23226822219468505)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(27460216435648126)
,p_db_column_name=>'CANTIDAD'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Cantidad'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(27460336804648127)
,p_db_column_name=>'PRECIO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Precio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(27460419975648128)
,p_db_column_name=>'IVA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Iva'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(27460572060648129)
,p_db_column_name=>'GRAVADA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Gravada'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(27460636181648130)
,p_db_column_name=>'TOTAL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(27460737045648131)
,p_db_column_name=>'DEL'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Suprimir'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#" onclick="fn_del_rec_collection(#SEQ_ID#)"> ',
'    <img src="#APP_IMAGES#del2.png	" />',
'</a>'))
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(27569225644528677)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'275693'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SEQ_ID:COD_ARTICULO:CANTIDAD:PRECIO:IVA:GRAVADA:TOTAL:DEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(31427187761203941)
,p_plug_name=>'Datos Comprobantes'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5207526032143638)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'COM_CAB_VENTAS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(31440733827203995)
,p_plug_name=>'Botones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5208560658143639)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(31459492127267614)
,p_plug_name=>'Totales'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5207526032143638)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(27458283624648106)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(23052000792158838)
,p_button_name=>'btn_agr_detalle'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_image_alt=>'Agregar Articulo'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(27458667412648110)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(23052000792158838)
,p_button_name=>'btn_limpiar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_image_alt=>'Nuevo Articulo'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(22718921756055304)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(31440733827203995)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(22719363777055305)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(31440733827203995)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_image_alt=>'Suprimir'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P42_COD_COMPROBANTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(22719708557055305)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(31440733827203995)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P42_COD_COMPROBANTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(22720141755055305)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(31440733827203995)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P42_COD_COMPROBANTE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22450856476798029)
,p_name=>'P42_SER_COMPROBANTE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_source_plug_id=>wwv_flow_api.id(31427187761203941)
,p_prompt=>'Ser Comprobante'
,p_source=>'SER_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_tag_attributes=>'pattern="[0-9]{1}[0-9]{2}[0-9]{3}" data-valid-message="El formato de serie no es valido Ej:001001"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(5296262608143922)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22450908199798030)
,p_name=>'P42_COD_CLIENTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_source_plug_id=>wwv_flow_api.id(31427187761203941)
,p_prompt=>'Cliente'
,p_source=>'COD_CLIENTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_CLIENTES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT pr.nombres||'' ''||pr.apellidos as d,c.cod_cliente as r',
'FROM clientes c,',
'     personas pr',
'WHERE c.cod_persona = pr.cod_persona',
'ORDER BY c.cod_cliente'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(5296262608143922)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22451065396798031)
,p_name=>'P42_COD_COBRADOR'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_source_plug_id=>wwv_flow_api.id(31427187761203941)
,p_prompt=>'Cobrador'
,p_source=>'COD_COBRADOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_COBRADORES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT p.nombres||'' ''||p.apellidos as d,v.cod_vinculo as r',
'FROM vin_personas v,',
'     personas p,',
'     referencias r',
'WHERE v.cod_persona = p.cod_persona(+)',
'      AND v.tip_vinculo = cod_referencia(+) ',
'      AND r.ref_col_tabla(+) = ''VIN_PERSONAS.TIP_VINCULO''',
'      AND r.des_referencia like ''%COB%''',
'ORDER BY v.cod_vinculo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(5296262608143922)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22451166863798032)
,p_name=>'P42_COD_VENDEDOR'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_source_plug_id=>wwv_flow_api.id(31427187761203941)
,p_prompt=>'Vendedor'
,p_source=>'COD_VENDEDOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_VENDEDORES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT p.nombres as d,v.cod_vinculo as r',
'FROM vin_personas v,',
'     personas p,',
'     referencias r',
'WHERE v.cod_persona = p.cod_persona(+)',
'      AND v.tip_vinculo = cod_referencia(+) ',
'      AND r.ref_col_tabla(+) = ''VIN_PERSONAS.TIP_VINCULO''',
'      AND r.des_referencia like ''%VEND%''',
'ORDER BY v.cod_vinculo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(5296262608143922)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22451276202798033)
,p_name=>'P42_COD_CON_VENTA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_source_plug_id=>wwv_flow_api.id(31427187761203941)
,p_prompt=>'Cod Con Venta'
,p_source=>'COD_CON_VENTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_CON_VENTAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT r.des_referencia as d,r.cod_referencia as r',
'FROM referencias r',
'WHERE r.ref_col_tabla = ''COM_CAB_VENTAS.COD_CON_VENTA''',
'ORDER BY r.cod_referencia'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(5296262608143922)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22451367919798034)
,p_name=>'P42_COD_MOT_SALIDA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_source_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT r.cod_referencia as r',
'    FROM referencias r',
'    WHERE r.ref_col_tabla = ''ART_EXISTENCIAS.COD_TRANSACCION''',
'          AND r.abreviatura = ''SALVENTA''',
'          AND rownum = 1;'))
,p_item_default_type=>'SQL_QUERY'
,p_source=>'COD_MOT_SALIDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22720804455055305)
,p_name=>'P42_COD_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_source_plug_id=>wwv_flow_api.id(31427187761203941)
,p_source=>'COD_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22721247323055307)
,p_name=>'P42_COD_TIP_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_source_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   SELECT r.cod_referencia as r',
'    FROM referencias r',
'    WHERE r.ref_col_tabla = ''REFERENCIAS.COD_TIP_COMPROBANTE''',
'          AND r.abreviatura = ''FCR''',
'          AND rownum = 1;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Tipo Comprobante'
,p_source=>'COD_TIP_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TIP_COMPROBANTES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT r.des_referencia as d,r.cod_referencia as r',
'FROM referencias r',
'WHERE r.ref_col_tabla = ''REFERENCIAS.COD_TIP_COMPROBANTE''',
'ORDER BY r.cod_referencia'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(5296262608143922)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22722039857055308)
,p_name=>'P42_NRO_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_source_plug_id=>wwv_flow_api.id(31427187761203941)
,p_prompt=>'Nro. Comprobante'
,p_source=>'NRO_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(5296262608143922)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22723299746055309)
,p_name=>'P42_FEC_COMPROBANTE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_source_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Comprobante'
,p_source=>'FEC_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(5296262608143922)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22723632845055309)
,p_name=>'P42_COD_SUCURSAL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_source_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT f.cod_sucursal as r',
'    FROM funcionarios f,',
'         referencias r',
'    WHERE f.usuario = :APP_USER ',
'        AND f.cod_estado = r.cod_referencia(+)',
'        AND r.ref_col_tabla(+) = ''FUNCIONARIOS.COD_ESTADO''',
'        AND r.abreviatura(+) = ''A''',
'        AND rownum = 1;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Sucursal'
,p_source=>'COD_SUCURSAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SUCURSALES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT c.des_sucursal as d,c.cod_sucursal as r',
'FROM sucursales c'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(5296262608143922)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22724089591055309)
,p_name=>'P42_COD_DEPOSITO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_source_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT f.cod_deposito as r',
'    FROM funcionarios f,',
'         referencias r',
'    WHERE f.usuario = :APP_USER ',
'        AND f.cod_estado = r.cod_referencia(+)',
'        AND r.ref_col_tabla(+) = ''FUNCIONARIOS.COD_ESTADO''',
'        AND r.abreviatura(+) = ''A''',
'        AND rownum = 1; '))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Deposito'
,p_source=>'COD_DEPOSITO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DEPOSITOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT c.des_deposito as d,c.cod_deposito as r',
'FROM depositos c'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(5296262608143922)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22724826408055310)
,p_name=>'P42_COD_MONEDA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_source_plug_id=>wwv_flow_api.id(31427187761203941)
,p_source=>'COD_MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22725203976055310)
,p_name=>'P42_COD_ESTADO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_source_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT r.cod_referencia as r',
'FROM referencias r',
'WHERE r.ref_col_tabla = ''COMPROBANTES.ESTADO''',
'      AND r.abreviatura = ''REC''',
'      AND rownum = 1;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Estado'
,p_source=>'COD_ESTADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_EST_COMPROBANTES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT r.des_referencia as d,r.cod_referencia as r',
'FROM referencias r',
'WHERE r.ref_col_tabla = ''COMPROBANTES.ESTADO''',
'ORDER BY r.cod_referencia'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(5296262608143922)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22725639163055310)
,p_name=>'P42_COD_USUARIO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_source_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'v_user VARCHAR2(50);',
'BEGIN',
'    v_user := :APP_USER;',
'    RETURN v_user;',
'END;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_source=>'COD_USUARIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22726410092055311)
,p_name=>'P42_TIP_CAMBIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_source_plug_id=>wwv_flow_api.id(31427187761203941)
,p_source=>'TIP_CAMBIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22727215896055311)
,p_name=>'P42_COD_EMPRESA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_source_plug_id=>wwv_flow_api.id(31427187761203941)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT f.cod_empresa as r',
'    FROM funcionarios f,',
'         referencias r',
'    WHERE f.usuario = :APP_USER ',
'        AND f.cod_estado = r.cod_referencia(+)',
'        AND r.ref_col_tabla(+) = ''FUNCIONARIOS.COD_ESTADO''',
'        AND r.abreviatura(+) = ''A''',
'        AND rownum = 1; '))
,p_item_default_type=>'SQL_QUERY'
,p_source=>'COD_EMPRESA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22737747415055322)
,p_name=>'P42_GRA_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(31459492127267614)
,p_item_source_plug_id=>wwv_flow_api.id(31427187761203941)
,p_prompt=>'Gravada'
,p_source=>'GRA_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'disabled = "disabled" style="font-size:30px;text-align:right;font-weight:bold;"'
,p_colspan=>3
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(5296262608143922)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22738133844055322)
,p_name=>'P42_IVA_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(31459492127267614)
,p_item_source_plug_id=>wwv_flow_api.id(31427187761203941)
,p_prompt=>'I.V.A'
,p_source=>'IVA_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'disabled = "disabled" style="font-size:30px;text-align:right;font-weight:bold;"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(5296262608143922)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22738502660055322)
,p_name=>'P42_TOT_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(31459492127267614)
,p_item_source_plug_id=>wwv_flow_api.id(31427187761203941)
,p_prompt=>'Total'
,p_source=>'TOT_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'disabled = "disabled" style="font-size:30px;text-align:right;font-weight:bold;"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(5296262608143922)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23052189024158839)
,p_name=>'P42_COD_ARTICULO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(23052000792158838)
,p_prompt=>unistr('Art\00EDculo')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_ART_EXISTENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT a.des_articulo as d,a.cod_articulo as r',
'FROM vw_art_existencias a',
'WHERE NVL(a.cantidad,0) > 0'))
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(5295913207143921)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23052205282158840)
,p_name=>'P42_CANTIDAD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(23052000792158838)
,p_prompt=>'Cantidad'
,p_display_as=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(5295913207143921)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>2200501847087933
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'CONTROL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23052358244158841)
,p_name=>'P42_PRECIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(23052000792158838)
,p_prompt=>'Precio'
,p_display_as=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(5295913207143921)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22745909093055326)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(22718921756055304)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22746498235055326)
,p_event_id=>wwv_flow_api.id(22745909093055326)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22746852215055327)
,p_name=>'beforeSubmit'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22747380415055327)
,p_event_id=>wwv_flow_api.id(22746852215055327)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'comprobarLineas();'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22451486650798035)
,p_name=>'ad_dat_cliente'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_COD_CLIENTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22451556681798036)
,p_event_id=>wwv_flow_api.id(22451486650798035)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    SELECT c.cod_cobrador,c.cod_vendedor,c.cod_con_venta',
'    INTO :P42_COD_COBRADOR,:P42_COD_VENDEDOR,:P42_COD_CON_VENTA',
'    FROM clientes c',
'    WHERE c.cod_cliente = :P42_COD_CLIENTE;',
'EXCEPTION',
'WHEN NO_DATA_FOUND THEN',
'    :P42_COD_COBRADOR := NULL;',
'    :P42_COD_VENDEDOR := NULL;',
'    :P42_COD_CON_VENTA := NULL;',
'END;'))
,p_attribute_02=>'P42_COD_CLIENTE'
,p_attribute_03=>'P42_COD_COBRADOR,P42_COD_VENDEDOR,P42_COD_CON_VENTA'
,p_attribute_04=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23052695173158844)
,p_name=>'ad_cal_import'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_CANTIDAD,P42_PRECIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23052795643158845)
,p_event_id=>wwv_flow_api.id(23052695173158844)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fn_add_act_collection();'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27460945873648133)
,p_event_id=>wwv_flow_api.id(23052695173158844)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fn_cal_tot_collection();'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27457725769648101)
,p_name=>'nex_item_precio'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_CANTIDAD'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === 13'
,p_bind_type=>'bind'
,p_bind_event_type=>'keypress'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27457859835648102)
,p_event_id=>wwv_flow_api.id(27457725769648101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P42_PRECIO'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27458793469648111)
,p_name=>'new_articulo'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(27458667412648110)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27458997061648113)
,p_event_id=>wwv_flow_api.id(27458793469648111)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fn_lim_col_articulos();'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27459396759648117)
,p_name=>'nex_item_cantidad'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P42_COD_ARTICULO'
,p_bind_type=>'bind'
,p_bind_event_type=>'select'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27459464010648118)
,p_event_id=>wwv_flow_api.id(27459396759648117)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fn_nav_articulo();'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27461725924648141)
,p_name=>'ad_add_record'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(27458283624648106)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27461910203648143)
,p_event_id=>wwv_flow_api.id(27461725924648141)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fn_add_act_collection();'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27462033342648144)
,p_event_id=>wwv_flow_api.id(27461725924648141)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fn_cal_tot_collection();'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22745571852055326)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'pr_elimina_detalle'
,p_process_sql_clob=>'delete from com_det_ventas where COD_COMPROBANTE = :P42_COD_COMPROBANTE;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(22719363777055305)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22728000353055311)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(31427187761203941)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Procesar pantalla Comprobante Compra'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22745208931055326)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>unistr('Cerrar Recuadro de Di\00E1logo')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(27458514477648109)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(27133225802052303)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('detalle_comprobante: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22727668061055311)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(31427187761203941)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Inicializar pantalla Comprobante Compra'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(25906191983985020)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'pr_crea_coleccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  -- Call the procedure',
'  pck_general_apex.pr_crear_colecciones(''TMP_COM_DET_VENTAS'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(25906432583985023)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'pr_add_act_coleccajax'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_seq           VARCHAR2(10);',
'    v_cod_articulo  VARCHAR2(10);',
'    v_exi_articulo  VARCHAR2(1);',
'    v_cantidad      NUMBER(10);',
'    v_precio        NUMBER(10);',
'    v_iva           NUMBER(10);',
'    v_gravada       NUMBER(10);',
'    v_imp_total     NUMBER(10);',
'    v_respuesta     BOOLEAN;',
'BEGIN',
'    v_cod_articulo := apex_application.g_x01;',
'    v_cantidad     := apex_application.g_x02;',
'    v_precio       := apex_application.g_x03;',
'    v_respuesta     := FALSE;',
'    BEGIN',
'        SELECT ''S'',SEQ_ID',
'        INTO  v_exi_articulo,v_seq ',
'        FROM APEX_collections',
'        WHERE collection_name = ''TMP_COM_DET_VENTAS''',
'              AND c001 = v_cod_articulo',
'              --AND ROWNUM = 1',
'              ;',
'    EXCEPTION',
'        WHEN NO_DATA_FOUND THEN',
'            v_exi_articulo := ''N'';',
'            v_seq          := NULL;',
'    END;',
'    ',
'    v_iva     := ROUND((NVL(v_precio,0) * NVL(v_cantidad,0) / 1.1));',
'    v_gravada := ROUND(((NVL(v_precio,0) * NVL(v_cantidad,1)) / 11));',
'    v_imp_total   := ROUND(ROUND((NVL(v_precio,0) * NVL(v_cantidad,0) / 1.1)) + ROUND(((NVL(v_precio,0) * NVL(v_cantidad,1)) / 11)));',
'    ',
'    IF v_exi_articulo = ''N'' AND v_cod_articulo IS NOT NULL AND NVL(v_imp_total,0) > 0 THEN',
'        BEGIN',
'            APEX_COLLECTION.ADD_MEMBER(p_collection_name => ''TMP_COM_DET_VENTAS'',',
'                                       p_c001 => v_cod_articulo,',
'                                       p_n001 => v_cantidad,',
'                                       p_n002 => v_precio,',
'                                       p_n003 => v_iva,',
'                                       p_n004 => v_gravada,',
'                                       p_n005 => v_imp_total',
'                                      );',
'        END;',
'        v_respuesta := TRUE;',
'    ELSIF v_exi_articulo = ''S'' AND v_cod_articulo IS NOT NULL AND NVL(v_imp_total,0) > 0 THEN',
'        BEGIN',
'            APEX_COLLECTION.UPDATE_MEMBER(p_collection_name => ''TMP_COM_DET_VENTAS'',',
'                                          p_seq  => v_seq,',
'                                          p_c001 => v_cod_articulo,',
'                                          p_n001 => v_cantidad,',
'                                          p_n002 => v_precio,',
'                                          p_n003 => v_iva,',
'                                          p_n004 => v_gravada,',
'                                          p_n005 => v_imp_total',
'                                         );',
'        END;',
'        v_respuesta := TRUE;',
'    END IF;',
'    apex_json.open_object;',
'    apex_json.write(''success'', v_respuesta);',
'    apex_json.close_object;',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        apex_json.open_object;',
'        apex_json.write(''success'', false);',
'        apex_json.write(''message'', sqlerrm);',
'        apex_json.close_object; ',
'END;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(27460802692648132)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'pr_cal_tot_coleccajax'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_total_iva     NUMBER(10);',
'    v_total_gravada NUMBER(10);',
'    v_total         NUMBER(10);',
'BEGIN',
'    v_total_iva     := 0;',
'    v_total_gravada := 0;',
'    v_total         := 0;',
'    BEGIN',
'        SELECT SUM(nvl(n003,0)),SUM(nvl(n004,0)),SUM(nvl(n005,0))',
'        INTO  v_total_iva,v_total_gravada,v_total ',
'        FROM APEX_collections',
'        WHERE collection_name = ''TMP_COM_DET_VENTAS''',
'              AND c001 IS NOT NULL;',
'    EXCEPTION',
'        WHEN NO_DATA_FOUND THEN',
'            v_total_iva := 0;',
'            v_total_gravada := 0;',
'            v_total := 0;',
'    END;',
'    apex_json.open_object;',
'    apex_json.write(''success'', true);',
'    apex_json.write(''xtotal_iva'',v_total_iva);',
'    apex_json.write(''xtotal_gravada'',v_total_gravada);',
'    apex_json.write(''xtotal'',v_total);',
'    apex_json.close_object;',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        apex_json.open_object;',
'        apex_json.write(''success'', false);',
'        apex_json.write(''message'', sqlerrm);',
'        apex_json.close_object; ',
'END;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(27461034267648134)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'pr_del_rec_coleccajax'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_seq           NUMBER(10);',
'    v_exi_articulo  VARCHAR2(1);',
'    v_respuesta     BOOLEAN;',
'BEGIN',
'    v_seq := apex_application.g_x01;',
'    v_respuesta     := FALSE;',
'    BEGIN',
'        SELECT ''S''',
'        INTO  v_exi_articulo ',
'        FROM APEX_collections',
'        WHERE collection_name = ''TMP_COM_DET_VENTAS''',
'              AND seq_id = v_seq',
'              --AND ROWNUM = 1',
'              ;',
'    EXCEPTION',
'        WHEN NO_DATA_FOUND THEN',
'            v_exi_articulo := ''N'';',
'    END;',
'    ',
'    IF v_exi_articulo = ''S'' THEN',
'        BEGIN',
'            APEX_COLLECTION.DELETE_MEMBER(p_collection_name => ''TMP_COM_DET_VENTAS'',',
'                                          p_seq  => v_seq',
'                                         );',
'        END;',
'        v_respuesta := TRUE;',
'    END IF;',
'    apex_json.open_object;',
'    apex_json.write(''success'', v_respuesta);',
'    apex_json.close_object;',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        apex_json.open_object;',
'        apex_json.write(''success'', false);',
'        apex_json.write(''message'', sqlerrm);',
'        apex_json.close_object; ',
'END;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.component_end;
end;
/
