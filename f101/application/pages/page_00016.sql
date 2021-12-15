prompt --application/pages/page_00016
begin
--   Manifest
--     PAGE: 00016
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
 p_id=>16
,p_user_interface_id=>wwv_flow_api.id(5319554376144027)
,p_name=>'Personas'
,p_alias=>'PERSONAS'
,p_step_title=>'Personas'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(5322694370144102)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(26007335715097667)
,p_protection_level=>'C'
,p_last_updated_by=>'JTORRES'
,p_last_upd_yyyymmddhh24miss=>'20211206095921'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6523640479194699)
,p_plug_name=>'Informe 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5233074866143726)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select P.COD_PERSONA,',
'       P.NOMBRES,',
'       P.APELLIDOS,',
'       P.NUM_DOCUMENTO,',
'       PV.DES_PROVINCIA,',
'       C.DES_CIUDAD,',
'       D.DES_DISTRITO,',
'       P.DIR_PRINCIPAL,',
'       P.TEL_PRINCIPAL,',
'       P.CEL_PRINCIPAL',
'  from PERSONAS P,',
'       PROVINCIAS PV,',
'       CIUDADES C,',
'       DISTRITOS D',
'  where P.COD_PROVINCIA = PV.COD_PROVINCIA(+)',
'        AND P.COD_CIUDAD = C.COD_CIUDAD(+)',
'        AND P.COD_DISTRITO = D.COD_DISTRITO(+)',
'  order by P.NOMBRES'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_page_header=>'Informe 1'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(6524042057194699)
,p_name=>'Informe 1'
,p_max_row_count_message=>unistr('El recuento m\00E1ximo de filas de este informe es #MAX_ROW_COUNT# filas. Aplique un filtro para reducir el n\00FAmero de registros de la consulta.')
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP:P17_COD_PERSONA:\#COD_PERSONA#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JTORRES'
,p_internal_uid=>6524042057194699
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6524161056194704)
,p_db_column_name=>'COD_PERSONA'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>unistr('C\00F3digo')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6524528998194713)
,p_db_column_name=>'NOMBRES'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Nombres'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6524992570194714)
,p_db_column_name=>'APELLIDOS'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Apellidos'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6525394210194714)
,p_db_column_name=>'NUM_DOCUMENTO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Nro. Documento'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6526932843194716)
,p_db_column_name=>'DIR_PRINCIPAL'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>unistr('Direcci\00F3n Principal')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6527394895194716)
,p_db_column_name=>'TEL_PRINCIPAL'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>unistr('Tel\00E9fono Principal')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6527792228194717)
,p_db_column_name=>'CEL_PRINCIPAL'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Celular Principal'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6705456199055012)
,p_db_column_name=>'DES_PROVINCIA'
,p_display_order=>20
,p_column_identifier=>'S'
,p_column_label=>'Provincia'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6705563209055013)
,p_db_column_name=>'DES_CIUDAD'
,p_display_order=>30
,p_column_identifier=>'T'
,p_column_label=>'Ciudad'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6705618623055014)
,p_db_column_name=>'DES_DISTRITO'
,p_display_order=>40
,p_column_identifier=>'U'
,p_column_label=>'Distrito'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(6532505517208053)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'65326'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'COD_PERSONA:NOMBRES:APELLIDOS:NUM_DOCUMENTO:DIR_PRINCIPAL:TEL_PRINCIPAL:CEL_PRINCIPAL:DES_PROVINCIA:DES_CIUDAD:DES_DISTRITO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6530299886194759)
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
 p_id=>wwv_flow_api.id(6531492450194770)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6523640479194699)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:17'
,p_security_scheme=>wwv_flow_api.id(26008322145204358)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6529195817194757)
,p_name=>unistr('Editar Informe: Cuadro de Di\00E1logo Cerrado')
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(6523640479194699)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6529676737194757)
,p_event_id=>wwv_flow_api.id(6529195817194757)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(6523640479194699)
);
wwv_flow_api.component_end;
end;
/
