prompt --application/create_application
begin
--   Manifest
--     FLOW: 101
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>2200501847087933
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'CONTROL'
);
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'CONTROL')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Project1')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'PROJECT1')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'25C32271708A7755A8B04F899529B29E7235415F2EC87D2A7A79763E87FF5626'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'19.2'
,p_flow_language=>'es'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DS'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>unistr('Aplicaci\00F3n creada desde el asistente de creaci\00F3n de aplicaciones 2021.08.03.')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(25913282858915970)
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'Project1'
,p_app_builder_icon_name=>'app-icon.svg'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>unistr('Versi\00F3n 1.0')
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>unistr('Esta aplicaci\00F3n no est\00E1 disponible en este momento.')
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'Project1'
,p_substitution_string_02=>'JASPERURL'
,p_substitution_value_02=>'http://192.168.56.10:8081/jasperserver/rest_v2/reports/reports'
,p_last_updated_by=>'JTORRES'
,p_last_upd_yyyymmddhh24miss=>'20220205101328'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>29
,p_ui_type_name => null
);
wwv_flow_api.component_end;
end;
/
