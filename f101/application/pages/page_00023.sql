prompt --application/pages/page_00023
begin
--   Manifest
--     PAGE: 00023
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
 p_id=>23
,p_user_interface_id=>wwv_flow_api.id(5319554376144027)
,p_name=>unistr('V\00EDnculos Personas')
,p_alias=>unistr('V\00CDNCULOS-PERSONAS')
,p_step_title=>unistr('V\00EDnculos Personas')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(5322694370144102)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'JTORRES'
,p_last_upd_yyyymmddhh24miss=>'20210902194656'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7513323308058242)
,p_plug_name=>'Informe 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5233074866143726)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select V.COD_VINCULO,',
'       P.NOMBRES,',
'       R.DES_REFERENCIA TIP_VINCULO,',
'       V.FECHA_DESDE,',
'       V.FECHA_HASTA',
'  from VIN_PERSONAS V,',
'       PERSONAS P,',
'       REFERENCIAS R',
'  where V.COD_PERSONA = P.COD_PERSONA',
'        and V.TIP_VINCULO = R.COD_REFERENCIA(+)',
'        and R.REF_COL_TABLA(+) = ''VIN_PERSONAS.TIP_VINCULO'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_page_header=>'Informe 1'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(7513701787058242)
,p_name=>'Informe 1'
,p_max_row_count_message=>unistr('El recuento m\00E1ximo de filas de este informe es #MAX_ROW_COUNT# filas. Aplique un filtro para reducir el n\00FAmero de registros de la consulta.')
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:RP:P24_COD_VINCULO:\#COD_VINCULO#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JTORRES'
,p_internal_uid=>7513701787058242
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7513865077058256)
,p_db_column_name=>'COD_VINCULO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>unistr('C\00F3digo')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6706323662055021)
,p_db_column_name=>'NOMBRES'
,p_display_order=>11
,p_column_identifier=>'F'
,p_column_label=>'Nombres'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6706494517055022)
,p_db_column_name=>'TIP_VINCULO'
,p_display_order=>21
,p_column_identifier=>'G'
,p_column_label=>'Tipo Vinculo '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7515095805058301)
,p_db_column_name=>'FECHA_DESDE'
,p_display_order=>31
,p_column_identifier=>'D'
,p_column_label=>'Fecha Desde'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7515497974058302)
,p_db_column_name=>'FECHA_HASTA'
,p_display_order=>41
,p_column_identifier=>'E'
,p_column_label=>'Fecha Hasta'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(7519608524059295)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'75197'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'COD_VINCULO:NOMBRES:TIP_VINCULO:FECHA_DESDE:FECHA_HASTA:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7517899525058353)
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
 p_id=>wwv_flow_api.id(7519046841058364)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(7513323308058242)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:24'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7516797075058339)
,p_name=>unistr('Editar Informe: Cuadro de Di\00E1logo Cerrado')
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(7513323308058242)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7517208213058344)
,p_event_id=>wwv_flow_api.id(7516797075058339)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(7513323308058242)
);
wwv_flow_api.component_end;
end;
/
