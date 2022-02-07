prompt --application/pages/page_00043
begin
--   Manifest
--     PAGE: 00043
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
 p_id=>43
,p_user_interface_id=>wwv_flow_api.id(5319554376144027)
,p_name=>'Saldo Clientes'
,p_alias=>'SALDO-CLIENTES'
,p_step_title=>'Saldo Clientes'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JTORRES'
,p_last_upd_yyyymmddhh24miss=>'20220105092430'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23707652335228820)
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
 p_id=>wwv_flow_api.id(23708279515228822)
,p_plug_name=>'Saldo Clientes'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5233074866143726)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT --COD_SALDO,',
'       --COD_EMPRESA,',
'       --COD_SUCURSAL,',
'       SC.COD_REF_COMPROBANTE,',
'       P.NOMBRES||'' ''||P.APELLIDOS CLIENTE,',
'       SC.FEC_VENCIMIENTO,',
'       SC.NRO_CUOTA,',
'       SC.TOT_CUOTA,',
'       SC.SALDO',
'FROM SAL_CLIENTES SC,',
'     EMPRESAS E,',
'     SUCURSALES S,',
'     CLIENTES C,',
'     PERSONAS P',
'WHERE SC.COD_EMPRESA = E.COD_EMPRESA',
'      AND SC.COD_SUCURSAL = S.COD_SUCURSAL',
'      AND SC.COD_CLIENTE = C.COD_CLIENTE',
'      AND C.COD_PERSONA = P.COD_PERSONA',
'ORDER BY 1,3'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_page_header=>'Saldo Clientes'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(23708314871228822)
,p_name=>'Saldo Clientes'
,p_max_row_count_message=>unistr('El recuento m\00E1ximo de filas de este informe es #MAX_ROW_COUNT# filas. Aplique un filtro para reducir el n\00FAmero de registros de la consulta.')
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JTORRES'
,p_internal_uid=>23708314871228822
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23709914659228831)
,p_db_column_name=>'COD_REF_COMPROBANTE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Comprobante'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23409532724327305)
,p_db_column_name=>'CLIENTE'
,p_display_order=>14
,p_column_identifier=>'J'
,p_column_label=>'Cliente'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23711104251228831)
,p_db_column_name=>'NRO_CUOTA'
,p_display_order=>24
,p_column_identifier=>'G'
,p_column_label=>'Nro. Cuota'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23710713933228831)
,p_db_column_name=>'FEC_VENCIMIENTO'
,p_display_order=>34
,p_column_identifier=>'F'
,p_column_label=>'Vencimiento'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23711531487228831)
,p_db_column_name=>'TOT_CUOTA'
,p_display_order=>44
,p_column_identifier=>'H'
,p_column_label=>'Total Cuota '
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23711995282228831)
,p_db_column_name=>'SALDO'
,p_display_order=>54
,p_column_identifier=>'I'
,p_column_label=>'Saldo'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(23714326386266737)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'237144'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'COD_REF_COMPROBANTE:CLIENTE:NRO_CUOTA:FEC_VENCIMIENTO:TOT_CUOTA:SALDO:'
);
wwv_flow_api.component_end;
end;
/
