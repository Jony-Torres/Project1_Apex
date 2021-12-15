prompt --application/shared_components/security/authorizations/derechos_de_administración
begin
--   Manifest
--     SECURITY SCHEME: Derechos de administración
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
 p_id=>wwv_flow_api.id(5322009474144093)
,p_name=>unistr('Derechos de administraci\00F3n')
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return true;'
,p_error_message=>'Privilegios insuficientes. El usuario no es administrador.'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.component_end;
end;
/
