prompt --application/shared_components/user_interface/lovs/lov_tip_segmentos
begin
--   Manifest
--     LOV_TIP_SEGMENTOS
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>2200501847087933
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'CONTROL'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(26109220875061367)
,p_lov_name=>'LOV_TIP_SEGMENTOS'
,p_lov_query=>'.'||wwv_flow_api.id(26109220875061367)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(26109555590061376)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'APP'
,p_lov_return_value=>'APP'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(26109915498061377)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'ITEM'
,p_lov_return_value=>'ITEM'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(26110351782061377)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'MENU'
,p_lov_return_value=>'MENU'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(26110758537061377)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'PAGE'
,p_lov_return_value=>'PAGE'
);
wwv_flow_api.component_end;
end;
/
