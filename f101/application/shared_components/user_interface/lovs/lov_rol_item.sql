prompt --application/shared_components/user_interface/lovs/lov_rol_item
begin
--   Manifest
--     LOV_ROL_ITEM
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
 p_id=>wwv_flow_api.id(26111048166065770)
,p_lov_name=>'LOV_ROL_ITEM'
,p_lov_query=>'.'||wwv_flow_api.id(26111048166065770)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(26111304318065772)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'INSERTAR'
,p_lov_return_value=>'INSERTAR'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(26111729720065772)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'MODIFICAR'
,p_lov_return_value=>'MODIFICAR'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(26112108567065772)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'ELIMINAR'
,p_lov_return_value=>'ELIMINAR'
);
wwv_flow_api.component_end;
end;
/
