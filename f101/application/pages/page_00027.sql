prompt --application/pages/page_00027
begin
--   Manifest
--     PAGE: 00027
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
 p_id=>27
,p_user_interface_id=>wwv_flow_api.id(5319554376144027)
,p_name=>'Compras'
,p_alias=>'COMPRAS1'
,p_step_title=>'Compras'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(5322694370144102)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'JTORRES'
,p_last_upd_yyyymmddhh24miss=>'20211115124136'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8727042811148728)
,p_plug_name=>'Informe 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5233074866143726)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CM.COD_COMPROBANTE,',
'       RC.DES_REFERENCIA TIPO_COMPROBANTE,',
'       CM.NRO_COMPROBANTE,',
'       CM.FEC_COMPROBANTE,',
'       S.DES_SUCURSAL,',
'       D.DES_DEPOSITO,',
'       RE.DES_REFERENCIA ESTADO,',
'       PE.NOMBRES||'' ''||PE.APELLIDOS PROVEEDOR,',
'       CM.GRA_COMPROBANTE GRAVADA,',
'       CM.IVA_COMPROBANTE IVA,',
'       CM.TOT_COMPROBANTE TOTAL',
'  from COM_CAB_COMPRAS CM,',
'       SUCURSALES S,',
'       DEPOSITOS D,',
'       REFERENCIAS RC,',
'       REFERENCIAS RE,',
'       REFERENCIAS RT,',
'       PROVEEDORES P,',
'       PERSONAS PE',
'  where CM.COD_SUCURSAL = S.COD_SUCURSAL(+)',
'        AND CM.COD_DEPOSITO = D.COD_DEPOSITO(+)',
'        AND CM.COD_TIP_COMPROBANTE = RC.COD_REFERENCIA(+)',
'        AND RC.REF_COL_TABLA(+) = ''REFERENCIAS.COD_TIP_COMPROBANTE''',
'        AND CM.COD_ESTADO = RE.COD_REFERENCIA(+)',
'        AND RE.REF_COL_TABLA(+) = ''COMPROBANTES.ESTADO''',
'        AND CM.COD_MOT_ENTRADA = RT.COD_REFERENCIA(+)',
'        AND RT.REF_COL_TABLA(+) = ''ART_EXISTENCIAS.COD_TRANSACCION''',
'        AND RT.ABREVIATURA = ''ENTCOMPRA''',
'        AND CM.COD_PROVEEDOR = P.COD_PROVEEDOR(+)',
'        AND P.COD_PERSONA = PE.COD_PERSONA(+)'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_page_header=>'Informe 1'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(8727410069148729)
,p_name=>'Informe 1'
,p_max_row_count_message=>unistr('El recuento m\00E1ximo de filas de este informe es #MAX_ROW_COUNT# filas. Aplique un filtro para reducir el n\00FAmero de registros de la consulta.')
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:RP:P28_COD_COMPROBANTE:\#COD_COMPROBANTE#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JTORRES'
,p_internal_uid=>8727410069148729
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8727561742148742)
,p_db_column_name=>'COD_COMPROBANTE'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>unistr('C\00F3digo ')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8728773212148745)
,p_db_column_name=>'NRO_COMPROBANTE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Nro. Comprobante'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8729993836148747)
,p_db_column_name=>'FEC_COMPROBANTE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Fecha Comprobante'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8742769853212327)
,p_db_column_name=>'TIPO_COMPROBANTE'
,p_display_order=>17
,p_column_identifier=>'T'
,p_column_label=>'Tipo Comprobante'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8742824192212328)
,p_db_column_name=>'DES_SUCURSAL'
,p_display_order=>27
,p_column_identifier=>'U'
,p_column_label=>'Sucursal'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8742994273212329)
,p_db_column_name=>'DES_DEPOSITO'
,p_display_order=>37
,p_column_identifier=>'V'
,p_column_label=>'Deposito'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8743005693212330)
,p_db_column_name=>'ESTADO'
,p_display_order=>47
,p_column_identifier=>'W'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22449570260798016)
,p_db_column_name=>'PROVEEDOR'
,p_display_order=>57
,p_column_identifier=>'X'
,p_column_label=>'Proveedor'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22449611011798017)
,p_db_column_name=>'GRAVADA'
,p_display_order=>67
,p_column_identifier=>'Y'
,p_column_label=>'Gravada'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22449767964798018)
,p_db_column_name=>'IVA'
,p_display_order=>77
,p_column_identifier=>'Z'
,p_column_label=>'Iva'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22449876479798019)
,p_db_column_name=>'TOTAL'
,p_display_order=>87
,p_column_identifier=>'AA'
,p_column_label=>'Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(8738856254149309)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'87389'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'COD_COMPROBANTE:NRO_COMPROBANTE:FEC_COMPROBANTE:COD_COD_MOT_ENTRADA:TIPO_COMPROBANTE:DES_SUCURSAL:DES_DEPOSITO:ESTADO:PROVEEDOR:GRAVADA:IVA:TOTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8737289015148765)
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
 p_id=>wwv_flow_api.id(8738408535148766)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(8727042811148728)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:28'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8736125762148762)
,p_name=>unistr('Editar Informe: Cuadro de Di\00E1logo Cerrado')
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(8727042811148728)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8736604029148763)
,p_event_id=>wwv_flow_api.id(8736125762148762)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(8727042811148728)
);
wwv_flow_api.component_end;
end;
/
