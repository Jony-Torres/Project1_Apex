prompt --application/pages/page_00045
begin
--   Manifest
--     PAGE: 00045
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
 p_id=>45
,p_user_interface_id=>wwv_flow_api.id(5319554376144027)
,p_name=>'Cambio Password'
,p_alias=>'CAMBIO-PASSWORD'
,p_step_title=>'Cambio Password'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(5322694370144102)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JTORRES'
,p_last_upd_yyyymmddhh24miss=>'20211130133342'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23413914082327349)
,p_plug_name=>'Cambio Password'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5234926163143730)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25902469063826809)
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
 p_id=>wwv_flow_api.id(25904526330985004)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(23413914082327349)
,p_button_name=>'Resetear'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Resetear'
,p_button_position=>'REGION_TEMPLATE_COPY'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23414004244327350)
,p_name=>'P45_USUARIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(23413914082327349)
,p_prompt=>'Usuario'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select usuario d, usuario r from funcionarios'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'FROM funcionarios ',
'WHERE usuario = :APP_USER',
'    AND ind_admin = ''S'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(5295913207143921)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25904260348985001)
,p_name=>'P45_USUARIO2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(23413914082327349)
,p_item_default=>'&APP_USER.'
,p_prompt=>'Usuario 2'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'FROM funcionarios ',
'WHERE usuario = :APP_USER',
'    AND ind_admin != ''S'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(5295913207143921)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25904354018985002)
,p_name=>'P45_PASSWORD1'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(23413914082327349)
,p_prompt=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(5296262608143922)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25904481019985003)
,p_name=>'P45_PASSWORD2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(23413914082327349)
,p_prompt=>'Confirmar Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(5296262608143922)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(25904650981985005)
,p_validation_name=>'fn_check_usuario'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   Verrortext varchar2(100);',
'begin',
'   if :P45_USUARIO is null and :P45_USUARIO2 is null THEN',
'      Verrortext := ''No hay usuario seleccionado para procesar el cambio de password'';',
'   end if;',
'   return rtrim(Verrortext);',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_api.id(25904526330985004)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(25904771035985006)
,p_validation_name=>'fn_match_usuario'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'   if :P45_PASSWORD1 = :P45_PASSWORD2 then',
'      return true;',
'   else',
'      return false;',
'   end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Los Passwords no coinciden!!!'
,p_when_button_pressed=>wwv_flow_api.id(25904526330985004)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(25904860879985007)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'pr_act_password'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'if :P45_USUARIO is not null then',
'   update funcionarios set password = custom_hash(:P45_USUARIO, :P45_PASSWORD1) where upper(usuario) = upper(:P45_USUARIO);',
'else',
'   update funcionarios set password = custom_hash(:P45_USUARIO2, :P45_PASSWORD1) where upper(usuario) = upper(:P45_USUARIO2);',
'end if;',
'commit;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.component_end;
end;
/
