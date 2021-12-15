prompt --application/shared_components/security/authentications/autenticación_de_application_express
begin
--   Manifest
--     AUTHENTICATION: Autenticación de Application Express
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>2200501847087933
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'CONTROL'
);
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(5180628268143429)
,p_name=>unistr('Autenticaci\00F3n de Application Express')
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
wwv_flow_api.component_end;
end;
/
