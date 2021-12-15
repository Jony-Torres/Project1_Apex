prompt --application/pages/page_00021
begin
--   Manifest
--     PAGE: 00021
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
 p_id=>21
,p_user_interface_id=>wwv_flow_api.id(5319554376144027)
,p_name=>unistr('Art\00EDculos')
,p_alias=>unistr('ART\00CDCULOS')
,p_step_title=>unistr('Art\00EDculos')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(5322694370144102)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'JTORRES'
,p_last_upd_yyyymmddhh24miss=>'20211111085410'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7217479328054370)
,p_plug_name=>'Informe 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5233074866143726)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.COD_ARTICULO,',
'       A.COD_REFERENCIA,',
'       A.NRO_LOTE,',
'       A.DES_ARTICULO,',
'       PR.NOMBRES,',
'       R1.DES_REFERENCIA CATEGORIA,',
'       A.PRE_VENTA,',
'       R2.DES_REFERENCIA ESTADO',
'  from ARTICULOS A,',
'       PROVEEDORES P,',
'       PERSONAS PR,',
'       REFERENCIAS R1,',
'       REFERENCIAS R2',
'  where A.COD_PROVEEDOR = P.COD_PROVEEDOR(+)',
'        and P.COD_PERSONA = PR.COD_PERSONA',
'        and A.COD_CATEGORIA = R1.COD_REFERENCIA(+)',
'        and R1.REF_COL_TABLA(+) = ''ARTICULOS.COD_CATEGORIA''',
'        and A.COD_ESTADO = R2.COD_REFERENCIA(+)',
'        and R2.REF_COL_TABLA(+) = ''ARTICULOS.COD_ESTADO''',
'order by A.DES_ARTICULO'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_page_header=>'Informe 1'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(7217841220054371)
,p_name=>'Informe 1'
,p_max_row_count_message=>unistr('El recuento m\00E1ximo de filas de este informe es #MAX_ROW_COUNT# filas. Aplique un filtro para reducir el n\00FAmero de registros de la consulta.')
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:RP:P22_COD_ARTICULO:\#COD_ARTICULO#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JTORRES'
,p_internal_uid=>7217841220054371
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7217975451054392)
,p_db_column_name=>'COD_ARTICULO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>unistr('C\00F3digo')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7218341882054439)
,p_db_column_name=>'COD_REFERENCIA'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Referencia'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7219089260054440)
,p_db_column_name=>'NRO_LOTE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Nro. Lote'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7219476719054441)
,p_db_column_name=>'DES_ARTICULO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7220629427054442)
,p_db_column_name=>'PRE_VENTA'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Precio Venta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6706099752055018)
,p_db_column_name=>'NOMBRES'
,p_display_order=>18
,p_column_identifier=>'M'
,p_column_label=>'Nombres'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6706105430055019)
,p_db_column_name=>'CATEGORIA'
,p_display_order=>28
,p_column_identifier=>'N'
,p_column_label=>unistr('Categor\00EDa')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6706213375055020)
,p_db_column_name=>'ESTADO'
,p_display_order=>38
,p_column_identifier=>'O'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(7226584686058298)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'72266'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'COD_ARTICULO:COD_REFERENCIA:NRO_LOTE:DES_ARTICULO:COD_PRE_VENTA:COD_CTR_STOCK:NOMBRES:CATEGORIA:ESTADO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7224791355054488)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7225984878054502)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(7217479328054370)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:22'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7223622476054485)
,p_name=>unistr('Editar Informe: Cuadro de Di\00E1logo Cerrado')
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(7217479328054370)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7224171239054486)
,p_event_id=>wwv_flow_api.id(7223622476054485)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(7217479328054370)
);
wwv_flow_api.component_end;
end;
/
