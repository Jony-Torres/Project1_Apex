prompt --application/shared_components/user_interface/lovs/lov_ciudades
begin
--   Manifest
--     LOV_CIUDADES
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
 p_id=>wwv_flow_api.id(6611454941260402)
,p_lov_name=>'LOV_CIUDADES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT c.des_ciudad as d,c.cod_ciudad as r',
'FROM ciudades c',
'WHERE c.cod_provincia = :P17_COD_PROVINCIA',
'order by c.cod_ciudad'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
);
wwv_flow_api.component_end;
end;
/
