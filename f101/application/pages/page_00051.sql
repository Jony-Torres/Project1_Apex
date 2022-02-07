prompt --application/pages/page_00051
begin
--   Manifest
--     PAGE: 00051
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
 p_id=>51
,p_user_interface_id=>wwv_flow_api.id(5319554376144027)
,p_name=>'Copia Comprobante Venta 24012022'
,p_alias=>'COPIA-COMPROBANTE-VENTA-24012022'
,p_page_mode=>'MODAL'
,p_step_title=>'Copia Comprobante Venta 24012022'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(5322694370144102)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'function recalculaImporte() {',
'    var model = apex.region("det").widget().interactiveGrid("getCurrentView").model;',
'    var gra_det = model.getFieldKey("GRAVADA");',
'    var iva_det = model.getFieldKey("IVA");',
'    var tot_det = model.getFieldKey("TOTAL");',
'    var gravada = 0;',
'    var iva = 0;',
'    var total = 0;',
'    model.forEach(function(r,index,id) {',
'        var meta = model.getRecordMetadata(id);',
'        if ((meta.fields != undefined) && (!meta.deleted)) {',
'           total = total + parseFloat(r[tot_det].replace('','',''.''));',
'           gravada = gravada + parseFloat(r[gra_det].replace('','',''.''));',
'           iva = iva + parseFloat(r[iva_det].replace('','',''.''));',
'           //console.log(''Gravada: '' + gravada + '' Iva: '' + iva+'' Total:'' + total);',
'        }',
'    });',
'    $s(''P42_GRA_COMPROBANTE'', gravada.toString().replace(''.'','',''));',
'    $s(''P42_IVA_COMPROBANTE'', iva.toString().replace(''.'','',''));',
'    $s(''P42_TOT_COMPROBANTE'',total.toString().replace(''.'','',''));',
'}',
'',
'function comprobarLineas() {',
'	//Accedemos al modelo de la linea del detalle',
'	var model = apex.region("det").widget().interactiveGrid("getCurrentView").model;',
'	var contar = 0;',
'    var articulo = 0;',
'    var dup_arti = 0;',
'	//Recorremos las lineas ',
'	model.forEach(function(r,index,id) {',
'        var meta = model.getRecordMetadata(id);',
'        if ((meta.fields != undefined) && (!meta.deleted)) {',
'            if (articulo == 0) {',
'                articulo = model.getFieldKey("COD_ARTICULO");',
'            }',
'			contar++;',
'            if ((contar > 1) && (articulo == model.getFieldKey("COD_ARTICULO"))){',
'                dup_arti = 1;',
'            }',
'        }',
'    });',
'    if (contar == 0){',
'		alert("Debe ingresar al menos algun registro al detalle, para confirmar la operacion");',
'		apex.event.gCancelFlag = true;',
'    } else if(dup_arti == 1){',
'        alert("Existen Articulos duplicados en el detalle,Verifique!!!");',
'		apex.event.gCancelFlag = true;',
'    } else{',
'		habilitaControlesBeforeSubmit();',
'	}',
'};',
'',
'function habilitaControlesBeforeSubmit(){',
'	$("#P42_GRA_COMPROBANTE").removeAttr("disabled");',
'	$("#P42_IVA_COMPROBANTE").removeAttr("disabled");',
'	$("#P42_TOT_COMPROBANTE").removeAttr("disabled");',
'};',
'',
'function fn_cal_collection(p_id_articulo,p_cantidad,p_precio,p_seq_coll) {',
'    console.log(''Cant: '' + p_cantidad + '' Precio: '' + p_precio + '' Seq: '' + p_seq_coll);',
'    apex.server.process(''pr_cal_imp_coleccajax'',                             ',
'                        {x01: p_id_articulo,',
'                         x02: p_cantidad,',
'                         x03: p_precio,',
'                         x04: p_seq_coll',
'                        },  ',
'        {',
'            success: function (pData) {             ',
'                console.log(pData.Respuesta);',
'                ',
'            },                     ',
'        }',
'    );',
'}',
'',
'function getVal(item){',
'    //console.log(item);',
'    if(document.getElementById(item).value!= ""){',
'        //console.log(item);',
'        //return parseFloat(document.getElementById(item).value.replace(".", ""));',
'        return document.getElementById(item).value;',
'    }else {',
'        //console.log(item);',
'        return 0;',
'    }',
'}',
''))
,p_step_template=>wwv_flow_api.id(20701244474036853)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_protection_level=>'C'
,p_last_updated_by=>'JTORRES'
,p_last_upd_yyyymmddhh24miss=>'20220124143428'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(54541239702084214)
,p_plug_name=>'detalle_comprobante'
,p_region_name=>'det'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5207526032143638)
,p_plug_display_sequence=>20
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
'        n005 TOTAL',
'FROM apex_collections ',
'WHERE collection_name = ''TMP_COM_DET_VENTAS'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50459995450190748)
,p_name=>'SEQ_ID_AUX'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_static_id=>'SEQ_ID_AUX'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54541439537084216)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_static_id=>'SEQ_ID'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54541554449084217)
,p_name=>'COD_ARTICULO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COD_ARTICULO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Articulo'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(23226822219468505)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_static_id=>'COD_ARTICULO'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54541664986084218)
,p_name=>'CANTIDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANTIDAD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_heading=>'Cantidad'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_is_required=>false
,p_max_length=>4000
,p_filter_is_required=>false
,p_static_id=>'CANTIDAD'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54541777832084219)
,p_name=>'PRECIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRECIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_heading=>'Precio'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_is_required=>false
,p_max_length=>4000
,p_filter_is_required=>false
,p_static_id=>'PRECIO'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54541883563084220)
,p_name=>'IVA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IVA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_heading=>'Iva'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'is-readonly'
,p_is_required=>false
,p_max_length=>4000
,p_filter_is_required=>false
,p_static_id=>'IVA'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54541987701084221)
,p_name=>'GRAVADA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GRAVADA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_heading=>'Gravada'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'is-readonly'
,p_is_required=>false
,p_max_length=>4000
,p_filter_is_required=>false
,p_static_id=>'GRAVADA'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54542036386084222)
,p_name=>'TOTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_heading=>'Total'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'is-readonly'
,p_is_required=>false
,p_filter_is_required=>false
,p_static_id=>'TOTAL'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54542205456084223)
,p_name=>'APEX$ROW_ACTION'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54542300153084224)
,p_name=>'APEX$ROW_SELECTOR'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54543107005084232)
,p_name=>'REC'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Agregar'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton js-actionButton" data-action="selection-add-row">',
'<span class="fa fa-plus-square-o"></span>',
'</button>'))
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54543153097084233)
,p_name=>'DEL'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Remover'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton js-actionButton" data-action="row-delete">',
'<span class="fa fa-remove"></span>',
'</button>'))
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(54541325805084215)
,p_internal_uid=>54541325805084215
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
,p_show_toolbar=>true
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'    config.defaultGridViewOptions = {',
'        footer : false',
'    }',
'    ',
'    config.initActions = function(actions){',
'        var rowDelete = actions.lookup("row-delete"),',
'            originalDeleteAction = rowDelete.action;',
'        ',
'        rowDelete.action = function(_, el){',
'            originalDeleteAction(_, el);',
'            recalculaImporte();',
'        };',
'        //',
'        var rowRevert = actions.lookup("row-revert"),',
'            originalRevertAction = rowRevert.action;',
'        rowRevert.action = function(_, el){',
'            originalRevertAction(_, el);',
'            recalculaImporte();',
'        };',
'        //',
'        var rowRefresh = actions.lookup("row-refresh");',
'           // originalRefreshAction = rowRefresh.action;',
'        ',
'        rowRefresh.action = function(_, el){',
'            originalRevertAction(_, el);',
'            recalculaImporte();',
'        };',
'        ',
'    };',
'    return config;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(54585183563345392)
,p_interactive_grid_id=>wwv_flow_api.id(54541325805084215)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(54585296174345393)
,p_report_id=>wwv_flow_api.id(54585183563345392)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(27408105014031916)
,p_view_id=>wwv_flow_api.id(54585296174345393)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(54542300153084224)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54585806917345399)
,p_view_id=>wwv_flow_api.id(54585296174345393)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(54541439537084216)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54586302561345404)
,p_view_id=>wwv_flow_api.id(54585296174345393)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(54541554449084217)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54586787236345407)
,p_view_id=>wwv_flow_api.id(54585296174345393)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(54541664986084218)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>30
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54587259727345409)
,p_view_id=>wwv_flow_api.id(54585296174345393)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(54541777832084219)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54587760131345412)
,p_view_id=>wwv_flow_api.id(54585296174345393)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(54541883563084220)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54588290511345414)
,p_view_id=>wwv_flow_api.id(54585296174345393)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(54541987701084221)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54588736993345419)
,p_view_id=>wwv_flow_api.id(54585296174345393)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(54542036386084222)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54593041433360441)
,p_view_id=>wwv_flow_api.id(54585296174345393)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(54542205456084223)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54731715753225871)
,p_view_id=>wwv_flow_api.id(54585296174345393)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(54543107005084232)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>25
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54732231713225874)
,p_view_id=>wwv_flow_api.id(54585296174345393)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(54543153097084233)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>25
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54804252615256718)
,p_view_id=>wwv_flow_api.id(54585296174345393)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(50459995450190748)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(58835201661235852)
,p_plug_name=>'Comprobante Venta'
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
 p_id=>wwv_flow_api.id(58848747727235906)
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
 p_id=>wwv_flow_api.id(58867506027299525)
,p_plug_name=>'Totales'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5207526032143638)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(27422629288031948)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(58848747727235906)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(27423027339031949)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(58848747727235906)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_image_alt=>'Suprimir'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P51_COD_COMPROBANTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(27423438656031949)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(58848747727235906)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P51_COD_COMPROBANTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(27423854213031949)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(58848747727235906)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P51_COD_COMPROBANTE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27414788751031941)
,p_name=>'P51_COD_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(58835201661235852)
,p_item_source_plug_id=>wwv_flow_api.id(58835201661235852)
,p_source=>'COD_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27415123039031943)
,p_name=>'P51_COD_TIP_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(58835201661235852)
,p_item_source_plug_id=>wwv_flow_api.id(58835201661235852)
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
 p_id=>wwv_flow_api.id(27415572317031944)
,p_name=>'P51_SER_COMPROBANTE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(58835201661235852)
,p_item_source_plug_id=>wwv_flow_api.id(58835201661235852)
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
 p_id=>wwv_flow_api.id(27415918622031945)
,p_name=>'P51_NRO_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(58835201661235852)
,p_item_source_plug_id=>wwv_flow_api.id(58835201661235852)
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
 p_id=>wwv_flow_api.id(27416326012031945)
,p_name=>'P51_FEC_COMPROBANTE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(58835201661235852)
,p_item_source_plug_id=>wwv_flow_api.id(58835201661235852)
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
 p_id=>wwv_flow_api.id(27416736116031945)
,p_name=>'P51_COD_SUCURSAL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(58835201661235852)
,p_item_source_plug_id=>wwv_flow_api.id(58835201661235852)
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
 p_id=>wwv_flow_api.id(27417122858031945)
,p_name=>'P51_COD_DEPOSITO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(58835201661235852)
,p_item_source_plug_id=>wwv_flow_api.id(58835201661235852)
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
 p_id=>wwv_flow_api.id(27417520533031945)
,p_name=>'P51_COD_MONEDA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(58835201661235852)
,p_item_source_plug_id=>wwv_flow_api.id(58835201661235852)
,p_source=>'COD_MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27417927656031946)
,p_name=>'P51_COD_CLIENTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(58835201661235852)
,p_item_source_plug_id=>wwv_flow_api.id(58835201661235852)
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
 p_id=>wwv_flow_api.id(27418344604031946)
,p_name=>'P51_COD_COBRADOR'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(58835201661235852)
,p_item_source_plug_id=>wwv_flow_api.id(58835201661235852)
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
 p_id=>wwv_flow_api.id(27418762908031946)
,p_name=>'P51_COD_VENDEDOR'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(58835201661235852)
,p_item_source_plug_id=>wwv_flow_api.id(58835201661235852)
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
 p_id=>wwv_flow_api.id(27419104066031946)
,p_name=>'P51_COD_CON_VENTA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(58835201661235852)
,p_item_source_plug_id=>wwv_flow_api.id(58835201661235852)
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
 p_id=>wwv_flow_api.id(27419513746031946)
,p_name=>'P51_COD_ESTADO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(58835201661235852)
,p_item_source_plug_id=>wwv_flow_api.id(58835201661235852)
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
 p_id=>wwv_flow_api.id(27419981398031947)
,p_name=>'P51_COD_USUARIO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(58835201661235852)
,p_item_source_plug_id=>wwv_flow_api.id(58835201661235852)
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
 p_id=>wwv_flow_api.id(27420395067031947)
,p_name=>'P51_TIP_CAMBIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(58835201661235852)
,p_item_source_plug_id=>wwv_flow_api.id(58835201661235852)
,p_source=>'TIP_CAMBIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27420783843031947)
,p_name=>'P51_COD_EMPRESA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(58835201661235852)
,p_item_source_plug_id=>wwv_flow_api.id(58835201661235852)
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
 p_id=>wwv_flow_api.id(27421130478031947)
,p_name=>'P51_COD_MOT_SALIDA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(58835201661235852)
,p_item_source_plug_id=>wwv_flow_api.id(58835201661235852)
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
 p_id=>wwv_flow_api.id(27424544128031950)
,p_name=>'P51_GRA_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(58867506027299525)
,p_item_source_plug_id=>wwv_flow_api.id(58835201661235852)
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
 p_id=>wwv_flow_api.id(27424902049031950)
,p_name=>'P51_IVA_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(58867506027299525)
,p_item_source_plug_id=>wwv_flow_api.id(58835201661235852)
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
 p_id=>wwv_flow_api.id(27425345842031951)
,p_name=>'P51_TOT_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(58867506027299525)
,p_item_source_plug_id=>wwv_flow_api.id(58835201661235852)
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
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27436194648031968)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(27422629288031948)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27436664225031969)
,p_event_id=>wwv_flow_api.id(27436194648031968)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27437062090031969)
,p_name=>'beforeSubmit'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27437539646031970)
,p_event_id=>wwv_flow_api.id(27437062090031969)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'comprobarLineas();'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27435255569031968)
,p_name=>'ad_dat_cliente'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P51_COD_CLIENTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27435785638031968)
,p_event_id=>wwv_flow_api.id(27435255569031968)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    SELECT c.cod_cobrador,c.cod_vendedor,c.cod_con_venta',
'    INTO :P51_COD_COBRADOR,:P51_COD_VENDEDOR,:P51_COD_CON_VENTA',
'    FROM clientes c',
'    WHERE c.cod_cliente = :P51_COD_CLIENTE;',
'EXCEPTION',
'WHEN NO_DATA_FOUND THEN',
'    :P51_COD_COBRADOR := NULL;',
'    :P51_COD_VENDEDOR := NULL;',
'    :P51_COD_CON_VENTA := NULL;',
'END;'))
,p_attribute_02=>'P51_COD_CLIENTE'
,p_attribute_03=>'P51_COD_COBRADOR,P51_COD_VENDEDOR,P51_COD_CON_VENTA'
,p_attribute_04=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27433378811031966)
,p_name=>'ad_cal_importe'
,p_event_sequence=>80
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(54541239702084214)
,p_triggering_element=>'CANTIDAD,PRECIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27434329279031967)
,p_event_id=>wwv_flow_api.id(27433378811031966)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fn_cal_collection(getVal("COD_ARTICULO"),getVal("CANTIDAD"),getVal("PRECIO"),getVal("SEQ_ID_AUX"));'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27434862813031968)
,p_event_id=>wwv_flow_api.id(27433378811031966)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    SELECT  NVL(n003,0) IVA,',
'            NVL(n004,0) GRAVADA,',
'            NVL(n005,0) TOTAL,',
'            SEQ_ID',
'    INTO    :IVA,',
'            :GRAVADA,',
'            :TOTAL,',
'            :SEQ_ID_AUX',
'    FROM apex_collections ',
'    WHERE collection_name = ''TMP_COM_DET_VENTAS''',
'          AND c001 = :COD_ARTICULO',
'          ;',
'EXCEPTION',
'    WHEN NO_DATA_FOUND THEN',
'        :IVA        := 0;',
'        :GRAVADA    := 0;',
'        :TOTAL      := 0;',
'        :SEQ_ID_AUX := NULL;',
'END;'))
,p_attribute_02=>'COD_ARTICULO'
,p_attribute_03=>'IVA,GRAVADA,TOTAL,SEQ_ID_AUX'
,p_attribute_04=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27433875563031966)
,p_event_id=>wwv_flow_api.id(27433378811031966)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recalculaImporte();'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(27432180375031964)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'pr_elimina_detalle'
,p_process_sql_clob=>'delete from com_det_ventas where COD_COMPROBANTE = :P51_COD_COMPROBANTE;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(27423027339031949)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(27421957615031947)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(58835201661235852)
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
 p_id=>wwv_flow_api.id(27431792608031964)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>unistr('Cerrar Recuadro de Di\00E1logo')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(27414007115031939)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(54541239702084214)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('detalle_comprobante: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(27421543448031947)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(58835201661235852)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Inicializar pantalla Comprobante Compra'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(27432560156031964)
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
 p_id=>wwv_flow_api.id(27432992424031965)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'pr_cal_imp_coleccajax'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_seq          varchar2(10);',
'    v_cod_articulo varchar2(10);',
'    v_exi_articulo varchar2(1);',
'    v_cantidad     NUMBER(10);',
'    v_precio       NUMBER(10);',
'    v_iva          NUMBER(10);',
'    v_gravada      NUMBER(10);',
'    v_total        NUMBER(10);',
'BEGIN',
'    v_cod_articulo := apex_application.g_x01;',
'    v_cantidad     := REPLACE(SUBSTR(apex_application.g_x02,1,INSTR(apex_application.g_x02,''.'',1)-1),'','');',
'    v_precio       := REPLACE(SUBSTR(apex_application.g_x03,1,INSTR(apex_application.g_x03,''.'',1)-1),'','');',
'    v_seq          := apex_application.g_x04;',
'    ',
'    BEGIN',
'        SELECT ''S'' ',
'        INTO  v_exi_articulo ',
'        FROM APEX_collections',
'        WHERE collection_name = ''TMP_COM_DET_VENTAS''',
'              AND c001 = v_cod_articulo',
'              --AND ROWNUM = 1',
'              ;',
'    EXCEPTION',
'        WHEN NO_DATA_FOUND THEN',
'            v_exi_articulo := ''N'';',
'    END;',
'    ',
'    v_iva     := ROUND((NVL(v_precio,0) * NVL(v_cantidad,0) / 1.1));',
'    v_gravada := ROUND(((NVL(v_precio,0) * NVL(v_cantidad,1)) / 11));',
'    v_total   := ROUND(ROUND((NVL(v_precio,0) * NVL(v_cantidad,0) / 1.1)) + ROUND(((NVL(v_precio,0) * NVL(v_cantidad,1)) / 11)));',
'    ',
'    IF v_exi_articulo = ''N'' THEN',
'        BEGIN',
'            APEX_COLLECTION.ADD_MEMBER(p_collection_name => ''TMP_COM_DET_VENTAS'',',
'                                       p_c001 => v_cod_articulo,',
'                                       p_n001 => v_cantidad,',
'                                       p_n002 => v_precio,',
'                                       p_n003 => v_iva,',
'                                       p_n004 => v_gravada,',
'                                       p_n005 => v_total',
'                                      );',
'        END;',
'    ELSE',
'        BEGIN',
'            APEX_COLLECTION.UPDATE_MEMBER(p_collection_name => ''TMP_COM_DET_VENTAS'',',
'                                          p_seq  => v_seq,',
'                                          p_c001 => v_cod_articulo,',
'                                          p_n001 => v_cantidad,',
'                                          p_n002 => v_precio,',
'                                          p_n003 => v_iva,',
'                                          p_n004 => v_gravada,',
'                                          p_n005 => v_total',
'                                         );',
'        END;',
'    END IF;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''success'', true);',
'    apex_json.write(''Respuesta'', ''Exitoso'');',
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
