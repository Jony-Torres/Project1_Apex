prompt --application/pages/page_00040
begin
--   Manifest
--     PAGE: 00040
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
 p_id=>40
,p_user_interface_id=>wwv_flow_api.id(5319554376144027)
,p_name=>'Informe Existencias'
,p_alias=>'INFORME-EXISTENCIAS'
,p_step_title=>'Informe Existencias'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(5322694370144102)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JTORRES'
,p_last_upd_yyyymmddhh24miss=>'20211130112227'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23407214824276283)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23409192490327301)
,p_plug_name=>unistr('Par\00E1metros ')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5234926163143730)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<script  type="text/javascript">',
' const pagina = ''P&APP_PAGE_ID._'';',
' //let errores = []',
' ',
'const solo_numeros = () => {',
'$(''.solo_numeros'').on(''keypress'', function (p_evento) {',
'		if (p_evento.keyCode >= 48 && p_evento.keyCode <= 57 && p_evento.keyCode) {',
'			return true;',
'		}',
'		return false;',
'	});',
'}',
'',
'',
'const solo_numeros_punto = () => {',
'',
'$(''.solo_numeros_punto'').on(''keypress'', function (p_evento) {',
'        const cantidad = p_evento.target.value.split(''.'').length - 1',
'		if ((p_evento.keyCode >= 48 && p_evento.keyCode <= 57) || (p_evento.keyCode == 46 && cantidad == 0))  {',
'			return true;',
'		}',
'		return false;',
'	});',
'       ',
'}',
'',
'const solo_numeros_coma = () => {',
'',
'$(''.solo_numeros_coma'').on(''keypress'', function (p_evento) {',
'        const cantidad = p_evento.target.value.split('','').length - 1',
'		if ((p_evento.keyCode >= 48 && p_evento.keyCode <= 57) || (p_evento.keyCode == 44 && cantidad == 0))  {',
'			return true;',
'		}',
'		return false;',
'	});',
'       ',
'}',
'',
'const renderBreakColumns = () => {',
'  const headers = $(''.a-IRR-header--group'')',
'  ',
'  for(let header of headers) {',
'      const html = $(header).html()',
'      if(html) {',
'          $(header).html( html.split('','').map(item => `<span class="corte-control">${item}</span>`).join(''<br/>'') )',
'      }',
'  }',
'}',
'',
'const traslatePopupLov = () => {',
'    $(''.t-PopupLOV-actions [type="button"]'').attr(''value'',''Buscar'')',
'}',
'',
'const colourTotal = () =>{',
'    $(''.a-IRR-aggregate'').css(''background-color'', ''darkgrey'')',
'}',
'',
'const formatMiles = (item) =>{',
'let separador = document.getElementById(item);',
'    separador.addEventListener(''input'', (e) => {',
'        var entrada = e.target.value.split('',''),',
'          parteEntera = entrada[0].replace(/\./g, ''''),',
'          parteDecimal = entrada[1],',
'          salida = parteEntera.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");',
'',
'        e.target.value = salida + (parteDecimal !== undefined ? '','' + parteDecimal : '''');',
'    }, false);',
'}',
'',
'const formatMilesShow = (item) => {',
'    let separador = document.getElementById(item),',
'        valor     = separador.value,',
'        entrada = valor.split('',''),',
'        parteEntera = entrada[0].replace(/\./g, ''''),',
'        parteDecimal = entrada[1],',
'        salida = parteEntera.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");',
'        ',
'    $s(separador, salida + (parteDecimal !== undefined ? '','' + parteDecimal : ''''), '''', true);',
'}',
'',
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
'}',
'',
'const createReadOnlyField = (',
'    affectedElements ',
') => {',
'  $.each(affectedElements, (i, element) =>  {',
'    $(element).attr(''readonly'', ''readonly'')',
'  })',
'}',
'//Salto de linea',
'document.onkeydown = evt => {',
'  evt = evt || window.event;',
'  if (evt.keyCode === 13 && evt.target.type !== ''submit'' && ''&APP_PAGE_ID.'' != 9999',
'  && evt.target.type !== ''textarea'' ',
'  ) {',
'    evt.preventDefault();',
'    return $.tabNext();',
'  }',
'}',
'</script>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23409397434327303)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(23409192490327301)
,p_button_name=>'BTN_IMPRIMIR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(5297190948143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Descargar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23409289174327302)
,p_name=>'P40_SUCURSAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(23409192490327301)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23410959686327319)
,p_name=>'P40_IMPRIMIR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(23409192490327301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23412672009327336)
,p_name=>'P40_EMPRESA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(23409192490327301)
,p_prompt=>'Empresa'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_EMPRESAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT c.des_empresa as d,c.cod_empresa as r',
'FROM empresas c'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(5295913207143921)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23410712728327317)
,p_name=>'Mostrar Informe '
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_cond=>'P40_IMPRIMIR'
,p_display_when_cond2=>'PDF'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23410875208327318)
,p_event_id=>wwv_flow_api.id(23410712728327317)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var params = [];',
'var p_cod_sucursal = document.getElementById("P40_SUCURSAL").value;',
'var p_cod_empresa = document.getElementById("P40_EMPRESA").value;',
'params.push({name:''P_COD_SUCURSAL'',value: p_cod_sucursal});',
'params.push({name:''P_COD_EMPRESA'',value: p_cod_empresa});',
'createReportUrl(''st_art_existencias'',params);',
''))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23411164062327321)
,p_event_id=>wwv_flow_api.id(23410712728327317)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P40_IMPRIMIR := NULL;'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23411236629327322)
,p_name=>'Imprimir'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(23409397434327303)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23411312201327323)
,p_event_id=>wwv_flow_api.id(23411236629327322)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23411449175327324)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ASIGNAR VARIABLE'
,p_process_sql_clob=>':P40_IMPRIMIR := ''PDF'';'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.component_end;
end;
/
