prompt --application/pages/page_00041
begin
--   Manifest
--     PAGE: 00041
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
 p_id=>41
,p_user_interface_id=>wwv_flow_api.id(5319554376144027)
,p_name=>'Ventas'
,p_alias=>'VENTAS1'
,p_step_title=>'Ventas'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(5322694370144102)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'JTORRES'
,p_last_upd_yyyymmddhh24miss=>'20211115124416'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(31437139201199586)
,p_plug_name=>'Informe 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5233074866143726)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CV.COD_COMPROBANTE,',
'       RC.DES_REFERENCIA TIPO_COMPROBANTE,',
'       CV.NRO_COMPROBANTE,',
'       CV.FEC_COMPROBANTE,',
'       S.DES_SUCURSAL,',
'       D.DES_DEPOSITO,',
'       RE.DES_REFERENCIA ESTADO,',
'       PE.NOMBRES||'' ''||PE.APELLIDOS PROVEEDOR,',
'       CV.GRA_COMPROBANTE GRAVADA,',
'       CV.IVA_COMPROBANTE IVA,',
'       CV.TOT_COMPROBANTE TOTAL',
'  from COM_CAB_VENTAS CV,',
'       SUCURSALES S,',
'       DEPOSITOS D,',
'       REFERENCIAS RC,',
'       REFERENCIAS RE,',
'       REFERENCIAS RT,',
'       CLIENTES C,',
'       PERSONAS PE',
'  where CV.COD_SUCURSAL = S.COD_SUCURSAL(+)',
'        AND CV.COD_DEPOSITO = D.COD_DEPOSITO(+)',
'        AND CV.COD_TIP_COMPROBANTE = RC.COD_REFERENCIA(+)',
'        AND RC.REF_COL_TABLA(+) = ''REFERENCIAS.COD_TIP_COMPROBANTE''',
'        AND CV.COD_ESTADO = RE.COD_REFERENCIA(+)',
'        AND RE.REF_COL_TABLA(+) = ''COMPROBANTES.ESTADO''',
'        AND CV.COD_MOT_SALIDA = RT.COD_REFERENCIA(+)',
'        AND RT.REF_COL_TABLA(+) = ''ART_EXISTENCIAS.COD_TRANSACCION''',
'        AND RT.ABREVIATURA = ''SALVENTA''',
'        AND CV.COD_CLIENTE = C.COD_CLIENTE(+)',
'        AND C.COD_PERSONA = PE.COD_PERSONA(+)'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_page_header=>'Informe 1'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(31437506459199587)
,p_name=>'Informe 1'
,p_max_row_count_message=>unistr('El recuento m\00E1ximo de filas de este informe es #MAX_ROW_COUNT# filas. Aplique un filtro para reducir el n\00FAmero de registros de la consulta.')
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:42:&SESSION.::&DEBUG.:RP,:P42_COD_COMPROBANTE:\#COD_COMPROBANTE#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JTORRES'
,p_internal_uid=>31437506459199587
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22711310905050871)
,p_db_column_name=>'COD_COMPROBANTE'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>unistr('C\00F3digo ')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22711787343050872)
,p_db_column_name=>'NRO_COMPROBANTE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Nro. Comprobante'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22712127444050872)
,p_db_column_name=>'FEC_COMPROBANTE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Fecha Comprobante'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22712534828050872)
,p_db_column_name=>'TIPO_COMPROBANTE'
,p_display_order=>17
,p_column_identifier=>'T'
,p_column_label=>'Tipo Comprobante'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22712905433050872)
,p_db_column_name=>'DES_SUCURSAL'
,p_display_order=>27
,p_column_identifier=>'U'
,p_column_label=>'Sucursal'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22713311286050872)
,p_db_column_name=>'DES_DEPOSITO'
,p_display_order=>37
,p_column_identifier=>'V'
,p_column_label=>'Deposito'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22713748926050872)
,p_db_column_name=>'ESTADO'
,p_display_order=>47
,p_column_identifier=>'W'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22714101579050873)
,p_db_column_name=>'PROVEEDOR'
,p_display_order=>57
,p_column_identifier=>'X'
,p_column_label=>'Proveedor'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22714522648050873)
,p_db_column_name=>'GRAVADA'
,p_display_order=>67
,p_column_identifier=>'Y'
,p_column_label=>'Gravada'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22714917006050873)
,p_db_column_name=>'IVA'
,p_display_order=>77
,p_column_identifier=>'Z'
,p_column_label=>'Iva'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22715337608050873)
,p_db_column_name=>'TOTAL'
,p_display_order=>87
,p_column_identifier=>'AA'
,p_column_label=>'Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(31448952644200167)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'227157'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'COD_COMPROBANTE:NRO_COMPROBANTE:FEC_COMPROBANTE:COD_COD_MOT_ENTRADA:TIPO_COMPROBANTE:DES_SUCURSAL:DES_DEPOSITO:ESTADO:PROVEEDOR:GRAVADA:IVA:TOTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(31447385405199623)
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
 p_id=>wwv_flow_api.id(22716163334050875)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(31437139201199586)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:42:&SESSION.::&DEBUG.:42::'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22717113495050879)
,p_name=>unistr('Editar Informe: Cuadro de Di\00E1logo Cerrado')
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(31437139201199586)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22717664350050880)
,p_event_id=>wwv_flow_api.id(22717113495050879)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(31437139201199586)
);
wwv_flow_api.component_end;
end;
/
