prompt --application/shared_components/logic/application_processes/set_report_url_descargar
begin
--   Manifest
--     APPLICATION PROCESS: SET_REPORT_URL_DESCARGAR
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>2200501847087933
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'CONTROL'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(23911461840707700)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_REPORT_URL_DESCARGAR'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' l_url varchar2(4000);',
'begin',
' apex_collection.create_or_truncate_collection(''REPORT_URL_DESCARGA'');',
' apex_collection.add_member(',
' p_collection_name => ''REPORT_URL_DESCARGA'',',
' p_c001 => apex_application.g_x01,',
' p_c002 => apex_application.g_x02,',
' p_c003 => apex_application.g_x03',
'',
' );',
'',
' l_url := apex_page.get_url(',
' p_page => 10,',
' p_clear_cache => 10',
' );',
' htp.p(apex_json.stringify(l_url));',
'',
'end;'))
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_api.component_end;
end;
/
