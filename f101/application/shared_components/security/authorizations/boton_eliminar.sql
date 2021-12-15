prompt --application/shared_components/security/authorizations/boton_eliminar
begin
--   Manifest
--     SECURITY SCHEME: BOTON ELIMINAR
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>2200501847087933
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'CONTROL'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(26008839362217534)
,p_name=>'BOTON ELIMINAR'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   Vadmin varchar2(1);',
'   Vallow varchar2(1);',
'begin',
'   select ind_admin into Vadmin from funcionarios where upper(usuario) = upper(:APP_USER);',
'   if Vadmin = ''N'' then',
'      select per_acceso into Vallow from acc_det_grupos ',
'      where cod_pagina = :APP_PAGE_ID and rol_item = ''ELIMINAR'' and cod_grupo = (select cod_grupo from funcionarios where upper(usuario) = upper(:APP_USER));',
'      if Vallow = ''Y'' then',
'         return true;',
'      else',
'         return false;',
'      end if;',
'   else ',
'      return true;',
'   end if;',
'exception',
'   when NO_DATA_FOUND then return false;',
'end;'))
,p_error_message=>unistr('El esquema de autorizaci\00F3n del bot\00F3n crea fue violado!')
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.component_end;
end;
/
