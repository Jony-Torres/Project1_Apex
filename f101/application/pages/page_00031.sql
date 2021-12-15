prompt --application/pages/page_00031
begin
--   Manifest
--     PAGE: 00031
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
 p_id=>31
,p_user_interface_id=>wwv_flow_api.id(5319554376144027)
,p_name=>'Usuarios'
,p_alias=>'USUARIOS'
,p_step_title=>'Usuarios'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(5322694370144102)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(26007335715097667)
,p_protection_level=>'C'
,p_last_updated_by=>'JTORRES'
,p_last_upd_yyyymmddhh24miss=>'20211206091515'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9821129868140637)
,p_plug_name=>'Informe 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5233074866143726)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select F.COD_FUNCIONARIO,',
'       P.NOMBRES NOMBRE_USUARIO,',
'       F.USUARIO,',
'       E.DES_EMPRESA EMPRESA,',
'       S.DES_SUCURSAL SUCURSAL,',
'       D.DES_DEPOSITO DEPOSITO,',
'       R.DES_REFERENCIA ESTADO',
'  from FUNCIONARIOS F,',
'       PERSONAS P,',
'       EMPRESAS E,',
'       SUCURSALES S,',
'       DEPOSITOS D,',
'       REFERENCIAS R',
' where F.COD_PERSONA = P.COD_PERSONA(+)',
'       and F.COD_EMPRESA = E.COD_EMPRESA(+)',
'       and F.COD_SUCURSAL = S.COD_SUCURSAL(+)',
'       and F.COD_DEPOSITO = D.COD_DEPOSITO(+)',
'       and F.COD_ESTADO   = R.COD_REFERENCIA(+)',
'       and R.REF_COL_TABLA(+) = ''FUNCIONARIOS.COD_ESTADO'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_page_header=>'Informe 1'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(9821547334140638)
,p_name=>'Informe 1'
,p_max_row_count_message=>unistr('El recuento m\00E1ximo de filas de este informe es #MAX_ROW_COUNT# filas. Aplique un filtro para reducir el n\00FAmero de registros de la consulta.')
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP:P32_COD_FUNCIONARIO:\#COD_FUNCIONARIO#\'
,p_detail_link_text=>'<span aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JTORRES'
,p_internal_uid=>9821547334140638
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9821607151140644)
,p_db_column_name=>'COD_FUNCIONARIO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Cod Funcionario'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9822406483140682)
,p_db_column_name=>'USUARIO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8744475728212344)
,p_db_column_name=>'NOMBRE_USUARIO'
,p_display_order=>13
,p_column_identifier=>'H'
,p_column_label=>'Nombre Usuario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8744580242212345)
,p_db_column_name=>'EMPRESA'
,p_display_order=>23
,p_column_identifier=>'I'
,p_column_label=>'Empresa'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8744658201212346)
,p_db_column_name=>'SUCURSAL'
,p_display_order=>33
,p_column_identifier=>'J'
,p_column_label=>'Sucursal'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8744708943212347)
,p_db_column_name=>'DEPOSITO'
,p_display_order=>43
,p_column_identifier=>'K'
,p_column_label=>'Deposito'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8744845618212348)
,p_db_column_name=>'ESTADO'
,p_display_order=>53
,p_column_identifier=>'L'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(9828229989143465)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'98283'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'COD_FUNCIONARIO:USUARIO:COD_COD_COD_COD_NOMBRE_USUARIO:EMPRESA:SUCURSAL:DEPOSITO:ESTADO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9826486513140718)
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
 p_id=>wwv_flow_api.id(9827610285140731)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9821129868140637)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:32'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9825386898140714)
,p_name=>unistr('Editar Informe: Cuadro de Di\00E1logo Cerrado')
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(9821129868140637)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9825889675140715)
,p_event_id=>wwv_flow_api.id(9825386898140714)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(9821129868140637)
);
wwv_flow_api.component_end;
end;
/
