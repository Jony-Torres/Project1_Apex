prompt --application/shared_components/files/menu_stock2_png
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
wwv_flow_api.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000300000003008060000005702F987000000097048597300000B1300000B1301009A9C1800000361494441546881ED584B88D440108DFF4977C6838A08A2E041FCB157F18308220A8AE0D52F228207591405';
wwv_flow_api.g_varchar2_table(2) := '570F222AA27810440F8A225EFCB0E0415926DD33E228C21E74FD5CBCF83B882BA22EAB7BF08BB6D5D5BD71C64D32C3A4B2F1908222A9CCE4BDAAEAEEEAEA384E2EB9E492CB7F254A1416299F2F0FD5B237276BFF624555789B925C45AAE05F548F33266B';
wwv_flow_api.g_varchar2_table(3) := '3F63257204043F8A41948B33B3F6B12551D25B6C02602BB3F6A525515D6C8A9D4A3BB2F6A56551920D28C14E66ED47CB02D97F026BE1466043558AAC58E4EA2D51DD8E9B3000761DF4698D3D105BB5E87577B200043F81A5F4A033D206F002A6D4DDD4B3';
wwv_flow_api.g_varchar2_table(4) := '5F66DB30009F6D4A3802EE7604BAE54EB50109B0EF27026D86D767AB4D0574172404826C2090B7146DC94EC3087C22F1328E57F05DC85B294E4C0624C7CD303B32DB8A7699EF44BBEA4D22F1348A57B033A0FDC9813A9D51E0F077BD2BA35D66ABCCDC2C';
wwv_flow_api.g_varchar2_table(5) := '2C4C0C1EC74B39552113CF60EA5CC37B682BEC886C26018FE4E42F81F332155809F401DE579DD170FF03F4080978185FA73316F07F42A20ED1009A85DB5F633F07FB2A0978189F5F9C45524203C0C18A20C64FB07609EC1E12F0303EAA121A004A778D09';
wwv_flow_api.g_varchar2_table(6) := 'C09D8FB660A760143E938087F15195D00050F73F9811BECE12B4DB6D7E3209C1BF7C54253400AC3A0570F61764FD00DA922F3319E26D6424B57C69ECF600F81A802FE1BD7246A892379794A08E0BFBAD2BD4A05500BD470A1AC6435D420360C1CF43107D';
wwv_flow_api.g_varchar2_table(7) := '104447AA2AF931D2121A0420D91608E2F7B09C0104FFAA84379B34805C7221146CE824DB8F1DA369ECE0CAF6E9E74DBD0F3BAC2D0AEF61CE7F037D08BBFCDAB4FD36E4D88DB23B76B1DD84EB717B55586A1B04A12A85E9F0DFB778CE16FC823D733FB278';
wwv_flow_api.g_varchar2_table(8) := 'A975B87F1DD0993764EBEB9FF38DF69CD011FBBEE052B709B51B211E9A043F8BBB7DCA0725EDC02B9DF1D0DF24F721C0DEA86F3B36FBA19F4AF47F20B00F7A54D20DA0E67839E4379F9523EA7A3BFEAE3F229BA9B62202BB5B8F509AFE3B76E1868F0036';
wwv_flow_api.g_varchar2_table(9) := '61EC4DC311107CCF9077CD087CD48B3BE500A0DA182736D43D1F5C0392ED8D7D5F4F33BD067C3E2F78663E1C9C1B9E35604A68D54E8F2EAC42E6AA9DBFDDB00A89C23408BE17DB05C92FDA2AF4D826E570AACED705818D17B4BD7A4DE8333264BEE97D00';
wwv_flow_api.g_varchar2_table(10) := '8EA69871C1DED97DA0479FFAD2F63B975C72C98546FE007FEFC9502BBC07D20000000049454E44AE426082';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(6720625011736001)
,p_file_name=>'menu_stock2.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
wwv_flow_api.component_end;
end;
/