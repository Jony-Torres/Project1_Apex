prompt --application/shared_components/files/menu_referencias_png
begin
--   Manifest
--     APP STATIC FILES: 101
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>2200501847087933
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'CONTROL'
);
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000300000003008060000005702F987000000097048597300000B1300000B1301009A9C1800000086494441546881EDD8B10D802010405156105CC4C6DA04B4B4B434118CEEE0800EE132EA0A844438F35F72';
wwv_flow_api.g_varchar2_table(2) := '25C52FC805940200E08FF4105A634357C2D4D637F1017DB84C1FEE42E6248080AF03DE43BB76FE2862EC32470700405E955BA67A58B712C6383F4607885F640410901820FE1203405E46FA9352FC22238080D400E99FBB000048F000C9A5D2DE48CE5393';
wwv_flow_api.g_varchar2_table(3) := '0000000049454E44AE426082';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(6719703060735998)
,p_file_name=>'menu_referencias.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
wwv_flow_api.component_end;
end;
/
