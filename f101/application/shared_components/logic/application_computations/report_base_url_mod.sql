prompt --application/shared_components/logic/application_computations/report_base_url_mod
begin
--   Manifest
--     APPLICATION COMPUTATION: REPORT_BASE_URL_MOD
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
 p_id=>wwv_flow_api.id(26818699164228934)
,p_computation_sequence=>10
,p_computation_item=>'REPORT_BASE_URL_MOD'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT CASE WHEN P.DES_SEGMENTO = ''M_STK_REPORTS'' THEN',
'       ''%2Fstcok&reportUnit=%2Freports%2Fstcok%2F''',
'       END mod_rep_ruta',
'FROM ACC_SEGMENTOS A,',
'     ACC_SEGMENTOS P',
'WHERE A.COD_PAGINA = :app_page_id',
'      AND A.COD_SEG_TIPO = ''PAGE''',
'      AND A.COD_SEG_PADRE = P.COD_SEGMENTO;'))
,p_computation_error_message=>unistr('Error al recuperar m\00F3dulos del sistema para URL de reportes. ')
);
wwv_flow_api.component_end;
end;
/
