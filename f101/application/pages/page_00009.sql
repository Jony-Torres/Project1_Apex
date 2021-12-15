prompt --application/pages/page_00009
begin
--   Manifest
--     PAGE: 00009
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>2200501847087933
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'CONTROL'
);
wwv_flow_api.create_page(
 p_id=>9
,p_user_interface_id=>wwv_flow_api.id(5319554376144027)
,p_name=>'Mantenimiento Referencias'
,p_alias=>unistr('DEFINICI\00D3N')
,p_step_title=>unistr('Definici\00F3n ')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(5322694370144102)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(26007335715097667)
,p_last_updated_by=>'JTORRES'
,p_last_upd_yyyymmddhh24miss=>'20211206091912'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6417800153405048)
,p_plug_name=>unistr('Ruta de Navegaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5244316844143755)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(5180996916143430)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(5298428810143935)
);
wwv_flow_api.component_end;
end;
/
