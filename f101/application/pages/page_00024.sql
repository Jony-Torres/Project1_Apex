prompt --application/pages/page_00024
begin
--   Manifest
--     PAGE: 00024
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
 p_id=>24
,p_user_interface_id=>wwv_flow_api.id(5319554376144027)
,p_name=>unistr('Editar V\00EDnculos')
,p_alias=>unistr('EDITAR-V\00CDNCULOS')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Editar V\00EDnculos')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(5322694370144102)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(20701244474036853)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'JTORRES'
,p_last_upd_yyyymmddhh24miss=>'20211214105913'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7505020163058091)
,p_plug_name=>unistr('Editar V\00EDnculos')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5207526032143638)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'VIN_PERSONAS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7508883190058171)
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
 p_id=>wwv_flow_api.id(7518472655058363)
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
 p_id=>wwv_flow_api.id(7509284168058172)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(7508883190058171)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7510701303058224)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(7508883190058171)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_image_alt=>'Suprimir'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P24_COD_VINCULO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7511173192058224)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(7508883190058171)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P24_COD_VINCULO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7511538064058225)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(7508883190058171)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P24_COD_VINCULO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7505490199058107)
,p_name=>'P24_COD_VINCULO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7505020163058091)
,p_item_source_plug_id=>wwv_flow_api.id(7505020163058091)
,p_source=>'COD_VINCULO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7505761286058144)
,p_name=>'P24_COD_PERSONA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(7505020163058091)
,p_item_source_plug_id=>wwv_flow_api.id(7505020163058091)
,p_prompt=>'Cod Persona'
,p_source=>'COD_PERSONA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_PERSONAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT p.nombres||'' ''||p.apellidos as d,p.cod_persona as r',
'FROM personas p',
'order by p.cod_persona'))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(5295913207143921)
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
 p_id=>wwv_flow_api.id(7506182275058166)
,p_name=>'P24_TIP_VINCULO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(7505020163058091)
,p_item_source_plug_id=>wwv_flow_api.id(7505020163058091)
,p_prompt=>'Tip Vinculo'
,p_source=>'TIP_VINCULO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TIP_VIN_PERSONAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT r.des_referencia as d,r.cod_referencia as r',
'FROM referencias r',
'WHERE r.ref_col_tabla = ''VIN_PERSONAS.TIP_VINCULO''',
'ORDER BY r.cod_referencia'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(5295913207143921)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7506568043058167)
,p_name=>'P24_FECHA_DESDE'
,p_source_data_type=>'DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(7505020163058091)
,p_item_source_plug_id=>wwv_flow_api.id(7505020163058091)
,p_prompt=>'Fecha Desde'
,p_source=>'FECHA_DESDE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(5295913207143921)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7506969632058168)
,p_name=>'P24_FECHA_HASTA'
,p_source_data_type=>'DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(7505020163058091)
,p_item_source_plug_id=>wwv_flow_api.id(7505020163058091)
,p_prompt=>'Fecha Hasta'
,p_source=>'FECHA_HASTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(5295913207143921)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7509325994058172)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(7509284168058172)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7510166683058213)
,p_event_id=>wwv_flow_api.id(7509325994058172)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7512361466058238)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(7505020163058091)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>unistr('Procesar pantalla Editar V\00EDnculos')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7512722977058239)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>unistr('Cerrar Recuadro de Di\00E1logo')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7511993632058227)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(7505020163058091)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>unistr('Inicializar pantalla Editar V\00EDnculos')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.component_end;
end;
/
