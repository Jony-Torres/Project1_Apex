prompt --application/shared_components/files/menu_referencias2_png
begin
--   Manifest
--     APP STATIC FILES: 101
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>2200501847087933
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'CONTROL'
);
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000300000003008060000005702F987000000097048597300000B1300000B1301009A9C1800000183494441546881ED99314BC43014C723C849F3EAD02478B83889BBB80BEA22083A88B3DBB9E8D4A14D3A14';
wwv_flow_api.g_varchar2_table(2) := '9C044727BF8108E272378863B7C3D1D15D37D14FE0F3DC6A28F4B09704DF0FFE14FA28FCDFB5C97BF7C21841FC3973128A6DC5F38DBA24E8AD159627AE0D3622400F25376F92EB478B9E05C65C7B6C6462343207F668D9C3043E67EBA825F8EBDF253CDF';
wwv_flow_api.g_varchar2_table(3) := 'B547CB1E26F83E5B472D993E81725EF0FC587133E84ED97A6709F4590A18BBC23574DD996273D85902DE808BF43EEC04408F13304F78BDF825AE6FF00D7DB8F6D80880EEA3D94BDB2292913E5771B1E9DA23411084C72CB301179139157171545712EB13';
wwv_flow_api.g_varchar2_table(4) := 'B598AFB9F6D80856DA0AEBC00B5E6FEBC2FB95F795188BD528E1D99E3D3A6925FCAEC4C13773D326B0CACE16F03F738ACF679D09F40E25E0FF271415C3A01731F6FC950463DF467FB658BFDF40F0858C2008C22D00E952D06315057A2C1A065BDE8FD755';
wwv_flow_api.g_varchar2_table(5) := 'E8A3C5F09BB9FF3B5E0FFC80C31BB0957E9051BE6F8F7E1FF269BF7721FCD646A8D7608F5959E807DD04D18E2F92F662ECBDAB26260000000049454E44AE426082';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(6720042826735999)
,p_file_name=>'menu_referencias2.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
wwv_flow_api.component_end;
end;
/
