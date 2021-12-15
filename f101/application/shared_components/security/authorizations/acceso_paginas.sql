prompt --application/shared_components/security/authorizations/acceso_paginas
begin
--   Manifest
--     SECURITY SCHEME: ACCESO PAGINAS
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
 p_id=>wwv_flow_api.id(26007335715097667)
,p_name=>'ACCESO PAGINAS'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   Vadmin varchar2(1);',
'   Vallow varchar2(1);',
'begin',
'   select ind_admin into Vadmin from funcionarios where upper(usuario) = upper(:APP_USER);',
'   if Vadmin = ''N'' then',
'      select per_acceso into Vallow from acc_det_grupos ',
'      where cod_pagina = :APP_PAGE_ID and cod_seg_tipo = ''PAGE'' and cod_grupo = (select cod_grupo from funcionarios where upper(usuario) = upper(:APP_USER));',
'      if Vallow=''Y'' then',
'         return true;',
'      else',
'         return false;',
'      end if;',
'   else',
'      return true;',
'   end if;',
'exception',
'   when NO_DATA_FOUND then return false;',
'end;'))
,p_error_message=>unistr('Usted no est\00E1 autorizado a ver esta p\00E1gina! <br/> Haga click <a href="f?p=&APP_ID.:1:&SESSION.">aqui</a> para continuar')
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.component_end;
end;
/
