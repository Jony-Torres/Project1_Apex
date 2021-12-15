prompt --application/pages/page_00100
begin
--   Manifest
--     PAGE: 00100
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
 p_id=>100
,p_user_interface_id=>wwv_flow_api.id(5319554376144027)
,p_name=>'Informe'
,p_alias=>'INFORME'
,p_step_title=>'Informe'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JTORRES'
,p_last_upd_yyyymmddhh24miss=>'20211123133421'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23409730696327307)
,p_plug_name=>'Informe '
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5234926163143730)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<iframe src="&P100_URL." style="width: 100%; height: 92vh"></iframe>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23409811823327308)
,p_name=>'P100_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(23409730696327307)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(23409928375327309)
,p_computation_sequence=>10
,p_computation_item=>'P100_URL'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  c001',
'from    apex_collections',
'where   collection_name = ''REPORT_URL''',
'and     rownum = 1'))
);
wwv_flow_api.component_end;
end;
/
