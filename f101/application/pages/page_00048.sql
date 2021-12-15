prompt --application/pages/page_00048
begin
--   Manifest
--     PAGE: 00048
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
 p_id=>48
,p_user_interface_id=>wwv_flow_api.id(5319554376144027)
,p_name=>unistr('Segmentos Aplicaci\00F3n')
,p_alias=>unistr('SEGMENTOS-APLICACI\00D3N')
,p_step_title=>unistr('Segmentos Aplicaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(5322694370144102)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'JTORRES'
,p_last_upd_yyyymmddhh24miss=>'20211213131346'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25904926993985008)
,p_plug_name=>unistr('Segmentos de Aplicaci\00F3n ')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(5234926163143730)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case when connect_by_isleaf = 1 then 0 when level = 1 then 1 else -1 end as status,',
unistr('    level, des_segmento as t\00EDtulo, '),
'    NULL as icon, ',
'    cod_segmento as value, ',
'    ''View'' as tooltip,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':49:''||:APP_SESSION||''::NO::P49_COD_SEGMENTO:''||cod_segmento) as link',
'from acc_segmentos',
'start with cod_seg_padre = 0',
'connect by prior cod_segmento = cod_seg_padre',
'order siblings by cod_segmento'))
,p_plug_source_type=>'NATIVE_JSTREE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'S'
,p_attribute_03=>'P48_SELECTED_NODE'
,p_attribute_04=>'DB'
,p_attribute_08=>'a-Icon'
,p_attribute_09=>'icon-tree-folder'
,p_attribute_10=>unistr('T\00CDTULO')
,p_attribute_11=>'LEVEL'
,p_attribute_12=>'ICON'
,p_attribute_15=>'STATUS'
,p_attribute_20=>'VALUE'
,p_attribute_22=>'TOOLTIP'
,p_attribute_23=>'LEVEL'
,p_attribute_24=>'LINK'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26034326231363181)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25905112655985010)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(25904926993985008)
,p_button_name=>'btn_crear'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(5297190948143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:49::'
,p_icon_css_classes=>'fa_chevron-right'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25905248176985011)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(25904926993985008)
,p_button_name=>'btn_refrescar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(5297190948143931)
,p_button_image_alt=>'Refrescar'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa_undo'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25905030170985009)
,p_name=>'P48_SELECTED_NODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(25904926993985008)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.component_end;
end;
/
