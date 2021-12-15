prompt --application/shared_components/logic/application_computations/report_base_url
begin
--   Manifest
--     APPLICATION COMPUTATION: REPORT_BASE_URL
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>2200501847087933
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'CONTROL'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(23911822179739965)
,p_computation_sequence=>10
,p_computation_item=>'REPORT_BASE_URL'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT VALOR FROM APEX_PARAMETROS',
'WHERE CLAVE = ''REPORT_BASE_URL''',
'AND APP_ID = :APP_ID'))
);
wwv_flow_api.component_end;
end;
/
