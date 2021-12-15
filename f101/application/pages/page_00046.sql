prompt --application/pages/page_00046
begin
--   Manifest
--     PAGE: 00046
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
 p_id=>46
,p_user_interface_id=>wwv_flow_api.id(5319554376144027)
,p_name=>'copia 40. Informe Existencias'
,p_alias=>'COPIA-40-INFORME-EXISTENCIAS'
,p_step_title=>'copia 40. Informe Existencias'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(5322694370144102)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JTORRES'
,p_last_upd_yyyymmddhh24miss=>'20211123144927'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(47330836783783652)
,p_plug_name=>unistr('Par\00E1metros ')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5234926163143730)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//FUNCION QUE LLAMA A LOS REPORTES JASPER',
'const createReportUrl = (reportName, parametros) => {',
'	const params = parametros',
'    ',
'	for(let input of $(''.report-input'')) {',
'		const id = $(input).attr(''id'')',
'        ',
'        const value = $v(id) + ''''',
'		params.push({',
'			name: id.replace(''P&APP_PAGE_ID._'', ''''),',
'			value',
'            ',
'		})',
'       ',
'	}',
'',
'	',
'	const paramsUrl = params.map(({name,value}) => `${name}=${value}`).join(''&'')',
'',
'	const url = `&REPORT_BASE_URL.${reportName}&standAlone=true&j_username=&REPORT_USER.&j_password=&REPORT_PASS.&output=&REPORT_FORMAT.&${paramsUrl}`',
'    ',
'	apex.server.process(''SET_REPORT_URL'', {',
'	  x01: url',
'	}).then(data => ',
'		window.open(data)',
'	).catch(err => ',
'		console.log(err)',
'	)',
'}'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23922565652456357)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(47330836783783652)
,p_button_name=>'BTN_IMPRIMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(5297190948143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Descargar'
,p_button_position=>'BODY'
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(23924665921456362)
,p_branch_name=>'DescargaReport'
,p_branch_action=>'&JASPERURL./st_art_existencias.pdf?P_COD_SUCURSAL=&P46_SUCURSAL.'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23922901234456357)
,p_name=>'P46_SUCURSAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(47330836783783652)
,p_prompt=>'Sucursal'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SUCURSALES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT c.des_sucursal as d,c.cod_sucursal as r',
'FROM sucursales c'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(5295913207143921)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23923607067456361)
,p_name=>'Mostrar Informe '
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23924118181456361)
,p_event_id=>wwv_flow_api.id(23923607067456361)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var params = [];',
'var p_cod_sucursal = document.getElementById().value;',
'param.push({name:''p_cod_sucursal'',value: p_cod_sucursal});',
'createReportUrl(''st_art_existencias'',params);'))
);
wwv_flow_api.component_end;
end;
/
