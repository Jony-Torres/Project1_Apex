prompt --application/pages/page_00047
begin
--   Manifest
--     PAGE: 00047
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
 p_id=>47
,p_user_interface_id=>wwv_flow_api.id(5319554376144027)
,p_name=>'Grupo Usuarios '
,p_alias=>'GRUPO-USUARIOS'
,p_step_title=>'Grupo Usuarios '
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(5322694370144102)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function',
'pageItemName(selectedNode)',
'{',
'$s(''P47_SELECT_NODE'',',
'selectedNode);',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JTORRES'
,p_last_upd_yyyymmddhh24miss=>'20211213092549'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23411595320327325)
,p_plug_name=>unistr('Par\00E1metros ')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5234926163143730)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23412799697327337)
,p_plug_name=>'Privilegios de grupos'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5234926163143730)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P47_NEW_EXIST'
,p_plug_display_when_cond2=>'EXISTE'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23412817705327338)
,p_plug_name=>'Grupo &P47_GRUP_TIT1.'
,p_parent_plug_id=>wwv_flow_api.id(23412799697327337)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(5234926163143730)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case when connect_by_isleaf = 1 then 0 when level = 1 then 1 else -1 end as status,',
'       level,',
'       a.des_segmento as titulo,',
'       NULL  as icon,',
'       a.cod_segmento as value,',
'       ''View Right'' as tooltip, ',
'       ''javascript:pageItemName(''||apex_escape.js_literal(a.cod_segmento)||'')'' As link',
'from acc_segmentos a',
'start with a.cod_seg_padre = 0',
'connect by prior a.cod_segmento = a.cod_seg_padre',
'order siblings by a.cod_segmento'))
,p_plug_source_type=>'NATIVE_JSTREE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'S'
,p_attribute_03=>'P47_SELECT_NODE'
,p_attribute_04=>'DB'
,p_attribute_08=>'a-Icon'
,p_attribute_09=>'icon-tree-folder'
,p_attribute_10=>'TITULO'
,p_attribute_11=>'LEVEL'
,p_attribute_12=>'ICON'
,p_attribute_15=>'STATUS'
,p_attribute_20=>'VALUE'
,p_attribute_22=>'TOOLTIP'
,p_attribute_23=>'LEVEL'
,p_attribute_24=>'LINK'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(23413041130327340)
,p_name=>'Segmento Seleccionado '
,p_parent_plug_id=>wwv_flow_api.id(23412799697327337)
,p_template=>wwv_flow_api.id(5234926163143730)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT s.des_segmento,g.per_acceso',
'FROM acc_segmentos s, acc_det_grupos g',
'WHERE s.cod_segmento = :P47_SELECT_NODE ',
'      AND s.cod_segmento = g.cod_segmento ',
'      AND g.cod_grupo = :P47_GRUPOID1'))
,p_display_when_condition=>'P47_NEW_EXIST'
,p_display_when_cond2=>'EXISTE'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P47_SELECT_NODE'
,p_query_row_template=>wwv_flow_api.id(5263840191143832)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23413153175327341)
,p_query_column_id=>1
,p_column_alias=>'DES_SEGMENTO'
,p_column_display_sequence=>1
,p_column_heading=>'Des Segmento'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23413244008327342)
,p_query_column_id=>2
,p_column_alias=>'PER_ACCESO'
,p_column_display_sequence=>2
,p_column_heading=>'Per Acceso'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24007608463370433)
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
 p_id=>wwv_flow_api.id(23412155955327331)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(23411595320327325)
,p_button_name=>'permitir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_image_alt=>'Crear Grupo-Permitir todos'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P47_NEW_EXIST'
,p_button_condition2=>'NUEVO'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23412227449327332)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(23411595320327325)
,p_button_name=>'deshabilitar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_image_alt=>'Crear Grupo- Deshabilitar todos'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P47_NEW_EXIST'
,p_button_condition2=>'NUEVO'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23412417718327334)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(23411595320327325)
,p_button_name=>'eliminar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P47_NEW_EXIST'
,p_button_condition2=>'EXISTE'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23413575434327345)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(23413041130327340)
,p_button_name=>'PERMITIR_REVOCAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5297063796143931)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Permitir /Revocar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23411613386327326)
,p_name=>'P47_NEW_EXIST'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(23411595320327325)
,p_item_default=>'EXISTE'
,p_prompt=>unistr('Acci\00F3n ')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Nuevo;NUEVO,Existe;EXISTE'
,p_field_template=>wwv_flow_api.id(5296041996143921)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'2'
,p_attribute_02=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23411744099327327)
,p_name=>'P47_GRUPOID1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(23411595320327325)
,p_prompt=>'Grupo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT a.des_grupo d, a.cod_grupo r',
'FROM acc_grupos a',
'ORDER BY a.cod_grupo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'P47_NEW_EXIST'
,p_display_when2=>'EXISTE'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(5295913207143921)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23411845592327328)
,p_name=>'P47_GRUP_TIT1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(23411595320327325)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT a.des_grupo ',
'FROM acc_grupos a',
'WHERE a.cod_grupo = :P47_GRUPOID1'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23411995793327329)
,p_name=>'P47_GRUPOID2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(23411595320327325)
,p_use_cache_before_default=>'NO'
,p_item_default=>'1'
,p_prompt=>'<b>Grupo Id: </b>'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT MAX(cod_grupo)+1',
'FROM acc_grupos'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P47_NEW_EXIST'
,p_display_when2=>'NUEVO'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(5295913207143921)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23412027849327330)
,p_name=>'P47_GRUP_TIT2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(23411595320327325)
,p_prompt=>'<b>Titulo: </b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P47_NEW_EXIST'
,p_display_when2=>'NUEVO'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(5295913207143921)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23412920769327339)
,p_name=>'P47_SELECT_NODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(23412817705327338)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23413390971327343)
,p_name=>'ad_pag_refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P47_SELECT_NODE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23413475270327344)
,p_event_id=>wwv_flow_api.id(23413390971327343)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(23413041130327340)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23412306366327333)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'pr_crea_grupo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'VsegmentoID number := 0;',
'VsegmentoPadre Number;',
'VsegmentoTipo varchar2(4);',
'VpaginaID number := 0;',
'VitemRole varchar2(10);',
'Vallow varchar2(1);',
'VmasterRow number := 0;',
'',
'cursor segmentos_cur is',
'select * ',
'from acc_segmentos',
'order by cod_segmento;',
'segmentos_rec segmentos_cur%ROWTYPE;',
'',
'BEGIN',
'   if :request=''permitir'' then',
'      Vallow := ''Y'';',
'   else',
'      Vallow := ''N'';',
'   end if;',
'   for segmentos_rec in segmentos_cur loop',
'      VsegmentoID := segmentos_rec.cod_segmento;',
'      VsegmentoPadre := segmentos_rec.cod_seg_padre;',
'      VsegmentoTipo := segmentos_rec.cod_seg_tipo;',
'      VpaginaID := segmentos_rec.cod_pagina;',
'      VitemRole := segmentos_rec.rol_item;',
'      if VmasterRow = 0 then',
'         insert into acc_grupos values (:P47_GRUPOID2,:P47_GRUP_TIT2);',
'         commit;',
'         VmasterRow := 1;',
'      end if;  ',
'      insert into acc_det_grupos values (:P47_GRUPOID2,VsegmentoID,VsegmentoPadre,VsegmentoTipo,VpaginaID,VitemRole,Vallow);',
'      commit;',
'   end loop;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'permitir,deshabilitar'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'El grupo se creo correctamente!!!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23412527924327335)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'pr_elimina_grupo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE FROM acc_det_grupos WHERE',
'cod_grupo = :P47_GRUPOID1;',
'DELETE FROM acc_grupos WHERE',
'cod_grupo = :P47_GRUPOID1;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(23412417718327334)
,p_process_when=>'P47_GRUPOID1'
,p_process_when_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_process_success_message=>'El grupo ha sido creado correctamente!!!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23413691802327346)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'pr_act_nod_permisos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   VrecordExist number := 0;',
'   Vallow varchar2(1);',
'   Vsegmentotipo varchar2(4);',
'   Vpaginaid number;',
'   Vitemrole varchar2(10);',
'begin',
'   select count(*) into VrecordExist from acc_det_grupos where cod_grupo = :P47_GRUPOID1 and cod_segmento = :P47_SELECT_NODE;',
'   if VrecordExist = 1 then',
'      select d.per_acceso into Vallow from acc_det_grupos d where d.cod_grupo = :P47_GRUPOID1 and d.cod_segmento = :P47_SELECT_NODE;',
'      if Vallow=''Y'' then',
'         Vallow := ''N'';',
'      else',
'         Vallow := ''Y'';',
'      end if;',
'      update acc_det_grupos set per_acceso = Vallow where cod_grupo = :P47_GRUPOID1 and cod_segmento = :P47_SELECT_NODE;',
'      commit;',
'   else',
'      select s.cod_seg_tipo,s.cod_pagina,s.rol_item into Vsegmentotipo,Vpaginaid,Vitemrole from acc_segmentos s where cod_segmento = :P47_SELECT_NODE;',
'      insert into acc_det_grupos values (:P47_GRUPOID1,:P47_SELECT_NODE,null,Vsegmentotipo,VpaginaID,Vitemrole,''N'');',
'      commit;',
'   end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(23413575434327345)
);
wwv_flow_api.component_end;
end;
/
