prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
--   Manifest
--     MENU: Breadcrumb
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>2200501847087933
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'CONTROL'
);
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(5180996916143430)
,p_name=>'Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5181188188143432)
,p_short_name=>'Inicio'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6312821883259643)
,p_short_name=>'Referencias del sistema'
,p_link=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6404975886058656)
,p_short_name=>'Ayuda'
,p_link=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>3
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6407171520116678)
,p_short_name=>'Stock'
,p_link=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>4
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6408906296162514)
,p_short_name=>unistr('Gesti\00F3n Cobros')
,p_link=>'f?p=&APP_ID.:5:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6410721473207598)
,p_short_name=>unistr('Ventas y Facturaci\00F3n')
,p_link=>'f?p=&APP_ID.:6:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>6
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6412538208244558)
,p_short_name=>unistr('Gesti\00F3n Pagos')
,p_link=>'f?p=&APP_ID.:7:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6414354645286184)
,p_short_name=>'Compras'
,p_link=>'f?p=&APP_ID.:8:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>8
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6418219165405056)
,p_parent_id=>wwv_flow_api.id(6312821883259643)
,p_short_name=>'Mantenimiento'
,p_link=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:::'
,p_page_id=>9
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6419878540435253)
,p_parent_id=>wwv_flow_api.id(6312821883259643)
,p_short_name=>'Reportes'
,p_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_page_id=>10
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6445780229536356)
,p_parent_id=>wwv_flow_api.id(6418219165405056)
,p_short_name=>'Referencias '
,p_link=>'f?p=&APP_ID.:14:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>14
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6446912752536357)
,p_parent_id=>wwv_flow_api.id(6445780229536356)
,p_short_name=>'Editar Referencias'
,p_link=>'f?p=&APP_ID.:15:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>15
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6530070407194759)
,p_parent_id=>wwv_flow_api.id(6418219165405056)
,p_short_name=>'Personas'
,p_link=>'f?p=&APP_ID.:16:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>16
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6531268826194769)
,p_parent_id=>wwv_flow_api.id(6530070407194759)
,p_short_name=>'Editar Personas'
,p_link=>'f?p=&APP_ID.:17:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>17
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6923874449212487)
,p_parent_id=>wwv_flow_api.id(6927625609224700)
,p_short_name=>'Clientes'
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6925099911212490)
,p_parent_id=>wwv_flow_api.id(6923874449212487)
,p_short_name=>'Editar Clientes'
,p_link=>'f?p=&APP_ID.:12:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>12
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6927625609224700)
,p_parent_id=>wwv_flow_api.id(6408906296162514)
,p_short_name=>'Mantenimiento'
,p_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:::'
,p_page_id=>13
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6930612905256660)
,p_parent_id=>wwv_flow_api.id(6408906296162514)
,p_short_name=>'Reportes '
,p_link=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:::'
,p_page_id=>18
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7105685290091905)
,p_parent_id=>wwv_flow_api.id(6407171520116678)
,p_short_name=>'Mantenimiento'
,p_link=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:::'
,p_page_id=>19
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7107257707104716)
,p_parent_id=>wwv_flow_api.id(6407171520116678)
,p_short_name=>'Reportes'
,p_link=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:::'
,p_page_id=>20
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7224572823054487)
,p_parent_id=>wwv_flow_api.id(7105685290091905)
,p_short_name=>unistr('Art\00EDculos')
,p_link=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:::'
,p_page_id=>21
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7225714646054501)
,p_parent_id=>wwv_flow_api.id(7224572823054487)
,p_short_name=>unistr('Editar Art\00EDculos')
,p_link=>'f?p=&APP_ID.:22:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>22
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7517647099058350)
,p_parent_id=>wwv_flow_api.id(6418219165405056)
,p_short_name=>unistr('V\00EDnculos Personas')
,p_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:::'
,p_page_id=>23
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7518894140058364)
,p_parent_id=>wwv_flow_api.id(7517647099058350)
,p_short_name=>unistr('Editar V\00EDnculos')
,p_link=>'f?p=&APP_ID.:24:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>24
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7832139027054605)
,p_parent_id=>wwv_flow_api.id(7105685290091905)
,p_short_name=>unistr('Entrada de Art\00EDculos por ajuste')
,p_link=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:::'
,p_page_id=>25
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7833326652054615)
,p_parent_id=>wwv_flow_api.id(7832139027054605)
,p_short_name=>unistr('Carga Art\00EDculos')
,p_link=>'f?p=&APP_ID.:26:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>26
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8237254421123754)
,p_parent_id=>wwv_flow_api.id(6414354645286184)
,p_short_name=>'Mantenimiento'
,p_link=>'f?p=&APP_ID.:29:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>29
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8238700349132706)
,p_parent_id=>wwv_flow_api.id(6414354645286184)
,p_short_name=>'reportes_compras'
,p_link=>'f?p=&APP_ID.:30:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>30
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8737079962148764)
,p_parent_id=>wwv_flow_api.id(8237254421123754)
,p_short_name=>'Compras'
,p_link=>'f?p=&APP_ID.:27:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>27
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8738206666148766)
,p_parent_id=>wwv_flow_api.id(8737079962148764)
,p_short_name=>'Comprobante Compra'
,p_link=>'f?p=&APP_ID.:28:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>28
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9826262355140717)
,p_parent_id=>wwv_flow_api.id(6418219165405056)
,p_short_name=>'Usuarios'
,p_link=>'f?p=&APP_ID.:31:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>31
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9827449367140727)
,p_parent_id=>wwv_flow_api.id(9826262355140717)
,p_short_name=>'Editar Usuarios'
,p_link=>'f?p=&APP_ID.:32:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>32
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(10129723025383304)
,p_short_name=>'copia 28 Comprobante Compra'
,p_link=>'f?p=&APP_ID.:33:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>33
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(10242533822070312)
,p_parent_id=>wwv_flow_api.id(6410721473207598)
,p_short_name=>'Mantenimiento'
,p_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:::'
,p_page_id=>36
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(20646398684032952)
,p_short_name=>'05112021_28. Comprobante Compra'
,p_link=>'f?p=&APP_ID.:37:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>37
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(22716970115050878)
,p_parent_id=>wwv_flow_api.id(10242533822070312)
,p_short_name=>'Ventas'
,p_link=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:::'
,p_page_id=>41
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(23019104564025575)
,p_parent_id=>wwv_flow_api.id(7105685290091905)
,p_short_name=>unistr('Salida de Art\00EDculos por ajuste')
,p_link=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:::'
,p_page_id=>34
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(23221824268258969)
,p_short_name=>unistr('Existencia Art\00EDculos ')
,p_link=>'f?p=&APP_ID.:39:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>39
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(23407680655276284)
,p_parent_id=>wwv_flow_api.id(7107257707104716)
,p_short_name=>'Informe Existencias'
,p_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:::'
,p_page_id=>40
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(23708012152228821)
,p_parent_id=>wwv_flow_api.id(6927625609224700)
,p_short_name=>'Saldo Clientes'
,p_link=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:::'
,p_page_id=>43
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(24008048784370433)
,p_parent_id=>wwv_flow_api.id(6418219165405056)
,p_short_name=>'Grupo Usuarios '
,p_link=>'f?p=&APP_ID.:47:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>47
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(25902885063826810)
,p_short_name=>'Cambio Password'
,p_link=>'f?p=&APP_ID.:45:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>45
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(26034152478363180)
,p_parent_id=>wwv_flow_api.id(6418219165405056)
,p_short_name=>unistr('Segmentos Aplicaci\00F3n')
,p_link=>'f?p=&APP_ID.:48:&SESSION.::&DEBUG.:::'
,p_page_id=>48
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(26035352096363182)
,p_parent_id=>wwv_flow_api.id(26034152478363180)
,p_short_name=>'Editar Segmentos'
,p_link=>'f?p=&APP_ID.:49:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>49
);
wwv_flow_api.component_end;
end;
/
