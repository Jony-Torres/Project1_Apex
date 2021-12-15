prompt --application/shared_components/files/menu_compra2_png
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
wwv_flow_api.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000300000003008060000005702F987000000097048597300000B1300000B1301009A9C180000041F494441546881DD595B884D5118FE5DC720264AC6DD24727B7019229EC82D84924B8C434829C4C3608892';
wwv_flow_api.g_varchar2_table(2) := '78704FB92511B9E4014F230F83480AF33024F7079490FB0CE3FE7FAD753AEBFC67ED7DCE5E67EF73E2ABAF73F9D7FAD7F7AFBDD6FAD75A9BE83FC02AE6AD0CB9254F1A7DB193F92743BECC93465F040900EC991F99DE483784D0EB66004BF223D31D3328';
wwv_flow_api.g_varchar2_table(3) := '3980D3F995131CED98BF2911C06B668310FC1633E7334F319785E0CF17F729F929F477F0D1883988B991D4D0343BE56A282A7DB09F9203589E61BDEECCC5CC33CC0FE4BD30FC60B60E577232668906CF79942B648E666E25D5CB4156B729D1C957E3D56C';
wwv_flow_api.g_varchar2_table(4) := '0CBDD948DB1A3257302B997501459BDC176500C003D160A9617B9C85F0389F461DC001D160B9613B184200608F2803982D1AAB346C728EB872699401C87950CB2CD036992B5C793ECA008047A2C19186ED6E08017C62368D328043A2C10D866D4F16C2BF';
wwv_flow_api.g_varchar2_table(5) := '33AB98AB992D2DEDE2BF49A4E661352556C0C098231ABE6CD8A60614FD440B9A4EA9492C9EB5B1505CD2019A754BC9119D84A37A66736D2B62FEF4115CABC5946B71122594C8DAEFD304BFD63500E0897036DAB0C9EC8BB2BB7599826437D4821259FB5E';
wwv_flow_api.g_varchar2_table(6) := '1AC19255D904705838DB6CD8D6304F30CB98ED453D392CEA038A964FDE36573242997076C3A76CB12E8F61F12E0BC1368E770DA0B370849D642BC33E8AB997F93064C1923B5C03009E0967130DDBD18885C759934D004784B3ED862D96A30090F98B5D03';
wwv_flow_api.g_varchar2_table(7) := '9022AB0D9B1C625172AE6B00DD0C276F490D9B86863D8CEDB5177F316F3237317BBB06005490DA0BD9D23A121286158EA2F2FCEBC217A4966FDC90B4CD46B4173E1B8D7DB3D807901A66990AC6C90EDBF595CCBE51086E637C6F466A9B106F1C49A6D0B0';
wwv_flow_api.g_varchar2_table(8) := '77D59FF8EF928F68AC2ADB9863447D1BF0147AB98A9FCCFC48EA71EED2DFA5186C8BB13B5DA0035AA8EB76A044B06F982749DD0D754CD3A6CCE2C83D175CC5BB6C0130F1E6691FD348ED26CD496F4317E622E659B26FEEB0430D7C15338CEC3D9E8E1030';
wwv_flow_api.g_varchar2_table(9) := '388D6F792593C9C41F173400E08A43005E376FFD485D2E5F647E0DE813C334701E186E71849EC21287DE184BEAD466EB3DF3F819633E77E8085CED600F842715E8E8890984477BD5E2B4C252BEDC52EE9AF63184D4F13013C13F743DF8EB1344B044CCA3';
wwv_flow_api.g_varchar2_table(10) := '812FCCC696F258353E79D4C1C42CF0B1BF621E2375D46C251D871DC07D9F3A353E010067F46F1C43316937927AD2615CDDA720E621064B5991A53C7ACE6BB98D0780F9349392936264E846EA91DAF6FA38429AC308DF8F59CA1DD73E4A7221D80B48DFBF';
wwv_flow_api.g_varchar2_table(11) := '2855DC1DE67AE63AE66D8B1D75B29A846102EF06822E7F5EEF13720EBC8490974C9910496A6C1EF4A66028255E15D986922DC9E1135BEC0979D06B0582C0CB8881A4AEDC9168CCCC8BEFD7495D438E20F556D3F90A242A3411BFCD0D5E9DB0395F40E512';
wwv_flow_api.g_varchar2_table(12) := 'D8E0C5DFEC5FCFB3967F0B7F018D914615145838310000000049454E44AE426082';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(6718266277735992)
,p_file_name=>'menu_compra2.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
wwv_flow_api.component_end;
end;
/