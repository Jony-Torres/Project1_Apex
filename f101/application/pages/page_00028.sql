prompt --application/pages/page_00028
begin
--   Manifest
--     PAGE: 00028
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
 p_id=>28
,p_user_interface_id=>wwv_flow_api.id(5319554376144027)
,p_name=>'Comprobante Compra'
,p_alias=>'COMPROBANTE-COMPRA'
,p_page_mode=>'MODAL'
,p_step_title=>'Comprobante Compra'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(5322694370144102)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'function recalculaImporte() {',
'    var model = apex.region("detalle_comprobante").widget().interactiveGrid("getCurrentView").model;',
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
'    $s(''P28_GRA_COMPROBANTE'', gravada.toString().replace(''.'','',''));',
'    $s(''P28_IVA_COMPROBANTE'', iva.toString().replace(''.'','',''));',
'    $s(''P28_TOT_COMPROBANTE'',total.toString().replace(''.'','',''));',
'}',
'',
'function comprobarLineas() {',
'	//Accedemos al modelo de la linea del detalle',
'	var model = apex.region("detalle_comprobante").widget().interactiveGrid("getCurrentView").model;',
'	var contar = 0;',
'	//Recorremos las lineas ',
'	model.forEach(function(r,index,id) {',
'        var meta = model.getRecordMetadata(id);',
'        if ((meta.fields != undefined) && (!meta.deleted)) {',
'			contar++;',
'        }',
'    });',
'	if (contar == 0){',
'		alert("Debe ingresar al menos algun registro al detalle, para confirmar la operacion");',
'		apex.event.gCancelFlag = true;',
'	} else{',
'		habilitaControlesBeforeSubmit();',
'	}',
'};',
'',
'function habilitaControlesBeforeSubmit(){',
'	$("#P28_GRA_COMPROBANTE").removeAttr("disabled");',
'	$("#P28_IVA_COMPROBANTE").removeAttr("disabled");',
'	$("#P28_TOT_COMPROBANTE").removeAttr("disabled");',
'}'))
,p_step_template=>wwv_flow_api.id(20701244474036853)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_protection_level=>'C'
,p_last_updated_by=>'JTORRES'
,p_last_upd_yyyymmddhh24miss=>'20211214113747'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8110113124157449)
,p_plug_name=>'Detalle Comprobante'
,p_region_name=>'detalle_comprobante'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5234926163143730)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'COM_DET_COMPRAS'
,p_query_where=>'COD_COMPROBANTE = :P28_COD_COMPROBANTE'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P28_COD_COMPROBANTE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Detalle Comprobante'
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
 p_id=>wwv_flow_api.id(8741307371212313)
,p_name=>'SECUENCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SECUENCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8741496285212314)
,p_name=>'COD_COMPROBANTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COD_COMPROBANTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P28_COD_COMPROBANTE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8741597988212315)
,p_name=>'COD_ARTICULO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COD_ARTICULO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Articulo'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(8118713562216015)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8741676339212316)
,p_name=>'DES_ARTICULO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DES_ARTICULO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8741784689212317)
,p_name=>'CANTIDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANTIDAD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_heading=>'Cantidad'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_is_required=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'1'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8741872282212318)
,p_name=>'PRECIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRECIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_heading=>'Precio'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_is_required=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(8741944531212319)
,p_name=>'DESCUENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCUENTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(8742048337212320)
,p_name=>'IVA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IVA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_heading=>'Iva'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'is-readonly'
,p_is_required=>false
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(8742195180212321)
,p_name=>'GRAVADA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GRAVADA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_heading=>'Gravada'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'is-readonly'
,p_is_required=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(8742263804212322)
,p_name=>'TOTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_heading=>'Total'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'is-readonly'
,p_is_required=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12851397282264507)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12851865023264512)
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
 p_id=>wwv_flow_api.id(12852266291264516)
,p_name=>'APEX$ROW_ACTION'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12852342948264517)
,p_name=>'APEX$ROW_SELECTOR'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(8741200716212312)
,p_internal_uid=>8741200716212312
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
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
 p_id=>wwv_flow_api.id(8755742401333546)
,p_interactive_grid_id=>wwv_flow_api.id(8741200716212312)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(8755809412333549)
,p_report_id=>wwv_flow_api.id(8755742401333546)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8756219560333557)
,p_view_id=>wwv_flow_api.id(8755809412333549)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(8741307371212313)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8756727990333559)
,p_view_id=>wwv_flow_api.id(8755809412333549)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(8741496285212314)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8757246751333561)
,p_view_id=>wwv_flow_api.id(8755809412333549)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(8741597988212315)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>330
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8757763560333562)
,p_view_id=>wwv_flow_api.id(8755809412333549)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(8741676339212316)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8758235404333564)
,p_view_id=>wwv_flow_api.id(8755809412333549)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(8741784689212317)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>45
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8758789134333566)
,p_view_id=>wwv_flow_api.id(8755809412333549)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(8741872282212318)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8759226719333567)
,p_view_id=>wwv_flow_api.id(8755809412333549)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(8741944531212319)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8759735801333569)
,p_view_id=>wwv_flow_api.id(8755809412333549)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(8742048337212320)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8760207683333571)
,p_view_id=>wwv_flow_api.id(8755809412333549)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(8742195180212321)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8760729518333572)
,p_view_id=>wwv_flow_api.id(8755809412333549)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(8742263804212322)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20592472208537594)
,p_view_id=>wwv_flow_api.id(8755809412333549)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(12851397282264507)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>10
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20659334351503834)
,p_view_id=>wwv_flow_api.id(8755809412333549)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(12851865023264512)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>65
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(20678739456646583)
,p_view_id=>wwv_flow_api.id(8755809412333549)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(12852266291264516)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8708857507148638)
,p_plug_name=>'Comprobante Compra'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5207526032143638)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'COM_CAB_COMPRAS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8722403573148692)
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
 p_id=>wwv_flow_api.id(8737864606148766)
,p_plug_name=>unistr('Ruta de Navegaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5244316844143755)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(5180996916143430)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(5298428810143935)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8741161873212311)
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
 p_id=>wwv_flow_api.id(8722859979148692)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(8722403573148692)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8724422396148715)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(8722403573148692)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_image_alt=>'Suprimir'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P28_COD_COMPROBANTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8724888463148716)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(8722403573148692)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P28_COD_COMPROBANTE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8725289703148716)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(8722403573148692)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P28_COD_COMPROBANTE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8709218579148642)
,p_name=>'P28_COD_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(8708857507148638)
,p_item_source_plug_id=>wwv_flow_api.id(8708857507148638)
,p_source=>'COD_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8709550004148659)
,p_name=>'P28_COD_TIP_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(8708857507148638)
,p_item_source_plug_id=>wwv_flow_api.id(8708857507148638)
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
 p_id=>wwv_flow_api.id(8709948496148672)
,p_name=>'P28_SER_TIMBRADO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(8708857507148638)
,p_item_source_plug_id=>wwv_flow_api.id(8708857507148638)
,p_prompt=>'Serie'
,p_source=>'SER_TIMBRADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>10
,p_cMaxlength=>100
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
 p_id=>wwv_flow_api.id(8710302250148673)
,p_name=>'P28_NRO_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(8708857507148638)
,p_item_source_plug_id=>wwv_flow_api.id(8708857507148638)
,p_prompt=>'Nro. Comprobante'
,p_source=>'NRO_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(5296262608143922)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8710791749148674)
,p_name=>'P28_NRO_TIMBRADO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(8708857507148638)
,p_item_source_plug_id=>wwv_flow_api.id(8708857507148638)
,p_prompt=>'Nro. Timbrado'
,p_source=>'NRO_TIMBRADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>100
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(5296262608143922)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8711141564148676)
,p_name=>'P28_FEC_VEN_TIMBRADO'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(8708857507148638)
,p_item_source_plug_id=>wwv_flow_api.id(8708857507148638)
,p_prompt=>'Fecha Timbrado'
,p_source=>'FEC_VEN_TIMBRADO'
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
 p_id=>wwv_flow_api.id(8711540254148676)
,p_name=>'P28_FEC_COMPROBANTE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(8708857507148638)
,p_item_source_plug_id=>wwv_flow_api.id(8708857507148638)
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
 p_id=>wwv_flow_api.id(8711958640148677)
,p_name=>'P28_COD_USUARIO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(8708857507148638)
,p_item_source_plug_id=>wwv_flow_api.id(8708857507148638)
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
 p_id=>wwv_flow_api.id(8712364609148677)
,p_name=>'P28_COD_SUCURSAL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(8708857507148638)
,p_item_source_plug_id=>wwv_flow_api.id(8708857507148638)
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
,p_field_template=>wwv_flow_api.id(5296262608143922)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8712772339148677)
,p_name=>'P28_COD_DEPOSITO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(8708857507148638)
,p_item_source_plug_id=>wwv_flow_api.id(8708857507148638)
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
 p_id=>wwv_flow_api.id(8713180506148678)
,p_name=>'P28_COD_PROVEEDOR'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(8708857507148638)
,p_item_source_plug_id=>wwv_flow_api.id(8708857507148638)
,p_prompt=>'Proveedor'
,p_source=>'COD_PROVEEDOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_PROVEEDORES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT pr.nombres||'' ''||pr.apellidos as d,p.cod_proveedor as r',
'FROM proveedores p,',
'     personas pr',
'WHERE p.cod_persona = pr.cod_persona',
'ORDER BY p.cod_proveedor'))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_api.id(8713584150148678)
,p_name=>'P28_CAN_CUOTA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(8708857507148638)
,p_item_source_plug_id=>wwv_flow_api.id(8708857507148638)
,p_source=>'CAN_CUOTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8713924851148678)
,p_name=>'P28_COD_MONEDA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(8708857507148638)
,p_item_source_plug_id=>wwv_flow_api.id(8708857507148638)
,p_source=>'COD_MONEDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8714394606148679)
,p_name=>'P28_TIP_CAMBIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(8708857507148638)
,p_item_source_plug_id=>wwv_flow_api.id(8708857507148638)
,p_source=>'TIP_CAMBIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8714720643148679)
,p_name=>'P28_COD_ESTADO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(8708857507148638)
,p_item_source_plug_id=>wwv_flow_api.id(8708857507148638)
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
 p_id=>wwv_flow_api.id(8715139674148679)
,p_name=>'P28_COD_MOT_ENTRADA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(8708857507148638)
,p_item_source_plug_id=>wwv_flow_api.id(8708857507148638)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   SELECT r.cod_referencia as r',
'    FROM referencias r',
'    WHERE r.ref_col_tabla = ''ART_EXISTENCIAS.COD_TRANSACCION''',
'          AND r.abreviatura = ''ENTCOMPRA''',
'          AND rownum = 1;'))
,p_item_default_type=>'SQL_QUERY'
,p_source=>'COD_MOT_ENTRADA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8715511218148687)
,p_name=>'P28_IVA_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(8741161873212311)
,p_item_source_plug_id=>wwv_flow_api.id(8708857507148638)
,p_prompt=>'I.V.A'
,p_source=>'IVA_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'disabled = "disabled" style="font-size:30px;text-align:right;font-weight:bold;"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(5295913207143921)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8715934408148688)
,p_name=>'P28_GRA_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(8741161873212311)
,p_item_source_plug_id=>wwv_flow_api.id(8708857507148638)
,p_prompt=>'Gravada'
,p_source=>'GRA_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'disabled = "disabled" style="font-size:30px;text-align:right;font-weight:bold;"'
,p_colspan=>3
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(5295913207143921)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8716327306148688)
,p_name=>'P28_TOT_COMPROBANTE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(8741161873212311)
,p_item_source_plug_id=>wwv_flow_api.id(8708857507148638)
,p_prompt=>'Total'
,p_source=>'TOT_COMPROBANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_SI_TRTS_AUTONUMERIC'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'disabled = "disabled" style="font-size:30px;text-align:right;font-weight:bold;"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(5295913207143921)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8745079608212350)
,p_name=>'P28_COD_EMPRESA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(8708857507148638)
,p_item_source_plug_id=>wwv_flow_api.id(8708857507148638)
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
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(12853276019264526)
,p_tabular_form_region_id=>wwv_flow_api.id(8110113124157449)
,p_validation_name=>'cant_mayor_cero'
,p_validation_sequence=>10
,p_validation=>'CANTIDAD'
,p_validation_type=>'ITEM_NOT_ZERO'
,p_error_message=>'#COLUMN_HEADER# debe ser mayor a cero.'
,p_associated_column=>'CANTIDAD'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(12853330525264527)
,p_tabular_form_region_id=>wwv_flow_api.id(8110113124157449)
,p_validation_name=>'pre_mayor_cero'
,p_validation_sequence=>20
,p_validation=>'PRECIO'
,p_validation_type=>'ITEM_NOT_ZERO'
,p_error_message=>'#COLUMN_HEADER# debe ser mayor a cero.'
,p_associated_column=>'PRECIO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(12855085545264544)
,p_tabular_form_region_id=>wwv_flow_api.id(8110113124157449)
,p_validation_name=>'tot_mayor_cero'
,p_validation_sequence=>30
,p_validation=>'TOTAL'
,p_validation_type=>'ITEM_NOT_ZERO'
,p_error_message=>'#COLUMN_HEADER# debe ser mayor a cero.'
,p_associated_column=>'TOTAL'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(12855142106264545)
,p_tabular_form_region_id=>wwv_flow_api.id(8110113124157449)
,p_validation_name=>'gra_mayor_cero'
,p_validation_sequence=>40
,p_validation=>'GRAVADA'
,p_validation_type=>'ITEM_NOT_ZERO'
,p_error_message=>'#COLUMN_HEADER# debe tener un valor.'
,p_associated_column=>'GRAVADA'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8722969264148692)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8722859979148692)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8723747528148706)
,p_event_id=>wwv_flow_api.id(8722969264148692)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8743415834212334)
,p_name=>'beforeSubmit'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8743566495212335)
,p_event_id=>wwv_flow_api.id(8743415834212334)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'comprobarLineas();'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22448605168798007)
,p_name=>'ad_calcula_montos'
,p_event_sequence=>50
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(8110113124157449)
,p_triggering_element=>'CANTIDAD,PRECIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22448764741798008)
,p_event_id=>wwv_flow_api.id(22448605168798007)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    :gravada  := ROUND((REPLACE(NVL(:precio,0),''.'') * REPLACE(NVL(:cantidad,1),''.'')) / 1.1);',
'    :iva      := ROUND((REPLACE(NVL(:precio,0),''.'') * REPLACE(NVL(:cantidad,1),''.'')) / 11);',
'    :total    := REPLACE(NVL(:iva,0),''.'') + REPLACE(NVL(:gravada,0),''.'');',
'EXCEPTION',
'WHEN OTHERS THEN',
'    :gravada  := 0;',
'    :iva      := 0;',
'    :total    := 0;',
'END;'))
,p_attribute_02=>'CANTIDAD,PRECIO'
,p_attribute_03=>'GRAVADA,IVA,TOTAL'
,p_attribute_04=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22449387156798014)
,p_event_id=>wwv_flow_api.id(22448605168798007)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'recalculaImporte();'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22448831255798009)
,p_name=>'ad_art_precio'
,p_event_sequence=>60
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(8110113124157449)
,p_triggering_element=>'COD_ARTICULO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22448950400798010)
,p_event_id=>wwv_flow_api.id(22448831255798009)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'PRECIO'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(a.pre_venta,0) precio',
'FROM articulos a',
'WHERE a.cod_articulo = :COD_ARTICULO;'))
,p_attribute_07=>'COD_ARTICULO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8742688622212326)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'pr_elimina_detalle'
,p_process_sql_clob=>'delete from com_det_compras where COD_COMPROBANTE = :P28_COD_COMPROBANTE;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(8724422396148715)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8726055201148721)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(8708857507148638)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Procesar pantalla Comprobante Compra'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12852477123264518)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(8110113124157449)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Detalle Comprobante: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
' CASE :APEX$ROW_STATUS',
' WHEN ''C'' THEN',
'     INSERT INTO com_det_compras(COD_COMPROBANTE,',
'                                 COD_ARTICULO,',
'                                 CANTIDAD,',
'                                 PRECIO,',
'                                 IVA,',
'                                 GRAVADA,',
'                                 TOTAL)',
'     VALUES(:P28_COD_COMPROBANTE,',
'            :COD_ARTICULO,',
'            :CANTIDAD,',
'            REPLACE(NVL(:PRECIO,0),''.''),',
'            REPLACE(NVL(:IVA,0),''.''),',
'            REPLACE(NVL(:GRAVADA,0),''.''),',
'            REPLACE(NVL(:TOTAL,0),''.''));',
' WHEN ''U'' THEN',
'     UPDATE com_det_compras',
'     SET COD_ARTICULO = :COD_ARTICULO,',
'         CANTIDAD = :CANTIDAD,',
'         PRECIO = REPLACE(NVL(:PRECIO,0),''.''),',
'         IVA = REPLACE(NVL(:IVA,0),''.''),',
'         GRAVADA = REPLACE(NVL(:GRAVADA,0),''.''),',
'         TOTAL = REPLACE(NVL(:TOTAL,0),''.'')',
'     WHERE SECUENCIA = :SECUENCIA;',
'  WHEN ''D'' THEN',
'      DELETE FROM com_det_compras WHERE SECUENCIA = :SECUENCIA;',
'  END CASE;',
'END;'))
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8726436505148726)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>unistr('Cerrar Recuadro de Di\00E1logo')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8725697158148716)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(8708857507148638)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Inicializar pantalla Comprobante Compra'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.component_end;
end;
/
