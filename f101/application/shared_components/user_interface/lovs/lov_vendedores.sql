prompt --application/shared_components/user_interface/lovs/lov_vendedores
begin
--   Manifest
--     LOV_VENDEDORES
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
 p_id=>wwv_flow_api.id(7528842756279382)
,p_lov_name=>'LOV_VENDEDORES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT p.nombres as d,v.cod_vinculo as r',
'FROM vin_personas v,',
'     personas p,',
'     referencias r',
'WHERE v.cod_persona = p.cod_persona(+)',
'      AND v.tip_vinculo = cod_referencia(+) ',
'      AND r.ref_col_tabla(+) = ''VIN_PERSONAS.TIP_VINCULO''',
'      AND r.des_referencia like ''%VEND%''',
'ORDER BY v.cod_vinculo'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
);
wwv_flow_api.component_end;
end;
/
