prompt --application/shared_components/logic/application_items/report_base_url_rest
begin
--   Manifest
--     APPLICATION ITEM: REPORT_BASE_URL_REST
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>2200501847087933
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'CONTROL'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(23910274595601465)
,p_name=>'REPORT_BASE_URL_REST'
,p_protection_level=>'I'
);
wwv_flow_api.component_end;
end;
/
