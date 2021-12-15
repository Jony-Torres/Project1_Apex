prompt --application/pages/page_00011
begin
--   Manifest
--     PAGE: 00011
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
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(5319554376144027)
,p_name=>'Clientes'
,p_alias=>'CLIENTES'
,p_step_title=>'Clientes'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(5322694370144102)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'JTORRES'
,p_last_upd_yyyymmddhh24miss=>'20210902201641'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6917498795212413)
,p_plug_name=>'Informe 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5233074866143726)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select C.COD_CLIENTE,',
'       P.NOMBRES,',
'       PC.NOMBRES COBRADOR,',
'       RE.DES_REFERENCIA ESTADO,',
'       C.COMENTARIO',
'  from CLIENTES C,',
'       PERSONAS P,',
'       PERSONAS PC,',
'       REFERENCIAS R,',
'       REFERENCIAS RE,',
'       VIN_PERSONAS V',
'  where C.COD_PERSONA = P.COD_PERSONA',
'        and V.COD_PERSONA = PC.COD_PERSONA(+)',
'        and C.COD_COBRADOR = V.COD_VINCULO(+)',
'        and V.tip_vinculo = R.cod_referencia(+) ',
'        and R.ref_col_tabla(+) = ''VIN_PERSONAS.TIP_VINCULO''',
'        and R.des_referencia like ''%COB%''',
'        and C.COD_ESTADO = RE.cod_referencia(+) ',
'        and RE.ref_col_tabla(+) = ''CLIENTES.COD_ESTADO''',
'order by C.cod_cliente'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_page_header=>'Informe 1'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(6917823888212413)
,p_name=>'Informe 1'
,p_max_row_count_message=>unistr('El recuento m\00E1ximo de filas de este informe es #MAX_ROW_COUNT# filas. Aplique un filtro para reducir el n\00FAmero de registros de la consulta.')
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP:P12_COD_CLIENTE:\#COD_CLIENTE#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JTORRES'
,p_internal_uid=>6917823888212413
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6917925044212422)
,p_db_column_name=>'COD_CLIENTE'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>unistr('C\00F3digo')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6705728965055015)
,p_db_column_name=>'NOMBRES'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Nombres'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6705823072055016)
,p_db_column_name=>'COBRADOR'
,p_display_order=>21
,p_column_identifier=>'L'
,p_column_label=>'Cobrador'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6705939813055017)
,p_db_column_name=>'ESTADO'
,p_display_order=>31
,p_column_identifier=>'M'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6921548862212452)
,p_db_column_name=>'COMENTARIO'
,p_display_order=>41
,p_column_identifier=>'J'
,p_column_label=>'Comentario'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(6925662484213720)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'69257'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'COD_CLIENTE:NOMBRES:COBRADOR:ESTADO:COMENTARIO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6924013827212488)
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
 p_id=>wwv_flow_api.id(6925239853212490)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6917498795212413)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:12'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6922984178212486)
,p_name=>unistr('Editar Informe: Cuadro de Di\00E1logo Cerrado')
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(6917498795212413)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6923440336212487)
,p_event_id=>wwv_flow_api.id(6922984178212486)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(6917498795212413)
);
wwv_flow_api.component_end;
end;
/
