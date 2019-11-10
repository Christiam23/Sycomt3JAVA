A<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String sidebar = "";

    if (rol.equalsIgnoreCase("Bodega-Jefe")) {
        sidebar = "<!-- Inicio sub menu de home -->\n"
                + "            <li class=\"sub-menu\">\n"
                + "                <a id=\"linkHome\" class=\"sub-menu-a active\" href=\"Dashboard.jsp\">\n"
                + "                    <i class=\"fa fa-home\"></i>\n"
                + "                    <span id=\"idInicio\">Inicio</span>\n"
                + "                </a>\n"
                + "\n"
                + "            </li>\n"
                + "            <!-- Fin sub menu de home -->   \n"
                + "            <!-- Inicio sub menu de Despachos -->\n"
                + "            <li class=\"sub-menu\">\n"
                + "                <a id=\"linkDespachosOpen\" class=\"sub-menu-a\" href=\"javascript:;\">\n"
                + "                    <i class=\"fa fa-outdent\"></i>\n"
                + "                    <span>Despachos</span>\n"
                + "                </a>\n"
                + "                <ul class=\"sub text-center\">\n"
                + "                    <li><a id=\"linkDespachos\"class=\"sub-a \" href=\"#\">Gestión de Despachos</a></li>\n"
                + "                </ul>\n"
                + "            </li>\n"
                + "            <!-- Fin sub menu de Despachos -->\n"
                + "            <!-- Inicio sub menu de Inventario -->\n"
                + "            <li class=\"sub-menu\">\n"
                + "                <a id=\"linkInventarioOpen\"class=\"sub-menu-a \" href=\"javascript:;\">\n"
                + "                    <i class=\"fa fa-list-ul\"></i>\n"
                + "                    <span>Inventario</span>\n"
                + "                </a>\n"
                + "                <ul class=\"sub text-center\">\n"
                + "                    <li><a id=\"linkInventario\"class=\"sub-a \" href=\"#\">Gestión de Inventario</a></li>\n"
                + "                </ul>\n"
                + "            </li>\n"
                + "            <!-- Fin sub menu de Inventario -->\n"
                + "            <!-- Inicio sub menu de orden de compra -->\n"
                + "            <li class=\"sub-menu\">\n"
                + "                <a id=\"linkComprasOpen\"class=\"sub-menu-a\" href=\"javascript:;\">\n"
                + "                    <i class=\"fa fa-cart-plus\"></i>\n"
                + "                    <span>Compras</span>\n"
                + "                </a>\n"
                + "                <ul class=\"sub text-center\">\n"
                + "                    <li><a id=\"linkCompras\"class=\"sub-a\" href=\"#\">Gestión Compras</a></li>\n"
                + "                    \n"
                + "                </ul>\n"
                + "            </li>\n"
                + "            <!-- Fin sub menu de orden de compra -->\n"
                + "            <!-- Inicio sub menu de orden de compra -->\n"
                + "            <li class=\"sub-menu\">\n"
                + "                <a id=\"linkEntregasOpen\"class=\"sub-menu-a\" href=\"javascript:;\">\n"
                + "                    <i class=\"fas fa-paper-plane\"></i>\n"
                + "                    <span>Entregas</span>\n"
                + "                </a>\n"
                + "                <ul class=\"sub text-center\">\n"
                + "                    <li><a id=\"linkEntregasAsignadas\"class=\"sub-a\" href=\"#\">Asignadas</a></li>\n"
                + "                    <li><a id=\"linkEntregasPendientes\"class=\"sub-a\" href=\"#\">Pendientes</a></li>\n"
                + "                </ul>\n"
                + "            </li>\n"
                + "            <!-- Fin sub menu de orden de compra -->\n"
                + "            <!-- Inicio sub menu de Menajeros -->\n"
                + "            <li class=\"sub-menu\">\n"
                + "                <a id=\"linkMensajerosOpen\"class=\"sub-menu-a\" href=\"javascript:;\">\n"
                + "                    <i class=\"fa fa-users\"></i>\n"
                + "                    <span>Mensajeros</span>\n"
                + "                </a>\n"
                + "                <ul class=\"sub text-center\">\n"
                + "                    <li><a id=\"linkMensajeros\"class=\"sub-a\" href=\"#\">Gestión de Mensajeros</a></li>\n"
                + "                </ul>\n"
                + "            </li>\n"
                + "            <!-- Fin sub menu de Mensajeros -->";
    } else if (rol.equalsIgnoreCase("Administrador")) {

        sidebar = " <!-- Inicio sub menu de home -->\n"
                + "            <li class=\"sub-menu\">\n"
                + "                <a class=\"sub-menu-a active\" href=\"Dashboard.jsp\">\n"
                + "                    <i class=\"fa fa-home\"></i>\n"
                + "                    <span id=\"idInicio\">Inicio</span>\n"
                + "                </a>\n"
                + "\n"
                + "            </li>\n"
                + "            <!-- Fin sub menu de home -->\n"
                + "            <!-- Inicio sub menu de proveedores -->\n"
                + "            <li class=\"sub-menu\">\n"
                + "                <a id=\"linkProveedoresOpenA\" class=\"sub-menu-a\" href=\"javascript:;\">\n"
                + "                    <i class=\"fa fa-desktop\"></i>\n"
                + "                    <span id=\"suppliers\">Proveedores</span>\n"
                + "                </a>\n"
                + "                <ul class=\"sub text-center\">\n"
                + "                    <li><a id=\"linkProveedoresA\" class=\"sub-a\" href=\"#\">Gestión Proveedores</a></li>\n"
                + "                </ul>\n"
                + "            </li>\n"
                + "            <!-- Fin sub menu de proveedores -->\n"
                + "            <!-- Inicio sub menu de ventas -->\n"
                + "            <li class=\"sub-menu\">\n"
                + "                <a id=\"linkVentasOpenA\"class=\"sub-menu-a \" href=\"javascript:;\">\n"
                + "                    <i class=\"fa fa-shopping-cart\"></i>\n"
                + "                    <span id=\"sales\" >Ventas</span>\n"
                + "                </a>\n"
                + "                <ul class=\"sub text-center\">\n"
                + "                    <li><a id=\"linkVentasA\" class=\"sub-a \" href=\"#\">Gestión de Ventas</a></li>\n"
                + "                </ul>\n"
                + "            </li>\n"
                + "            <!-- Fin sub menu de ventas -->\n"
                + "            <!-- Inicio sub menu de orden de compra -->\n"
                + "            <li class=\"sub-menu\">\n"
                + "                <a id=\"linkComprasOpenA\"class=\"sub-menu-a\" href=\"javascript:;\">\n"
                + "                    <i class=\"fa fa-cart-plus\"></i>\n"
                + "                    <span id=\"titlePurchaseOrders\">Compras</span>\n"
                + "                </a>\n"
                + "                <ul class=\"sub text-center\">\n"
                + "                    <li><a id=\"linkComprasA\" class=\"sub-a\" href=\"#\">Gestión de Compras</a></li>\n"
                + "                </ul>\n"
                + "            </li>\n"
                + "            <!-- Fin sub menu de orden de compra -->\n"
                + "            <!-- Inicio sub menu de inventario -->\n"
                + "            <li class=\"sub-menu\">\n"
                + "                <a id=\"linkInventarioOpenA\"class=\"sub-menu-a\" href=\"javascript:;\">\n"
                + "                    <i class=\"fa fa-list\"></i>\n"
                + "                    <span id=\"inventory\">Inventario</span>\n"
                + "                </a>\n"
                + "                <ul class=\"sub text-center\">\n"
                + "                    <li><a id=\"linkInventarioA\" class=\"sub-a\" href=\"#\">Gestión de Inventario</a></li>\n"
                + "                </ul>\n"
                + "            </li>\n"
                + "            <!-- Fin sub menu de inventario -->\n"
                + "            <!-- Inicio sub menu de inventario -->\n"
                + "            <li class=\"sub-menu\">\n"
                + "                <a id=\"linkEmpleadosOpenA\"class=\"sub-menu-a\" href=\"javascript:;\">\n"
                + "                    <i class=\"fa fa-users\"></i>\n"
                + "                    <span id=\"employees\">Empleados</span>\n"
                + "                </a>\n"
                + "                <ul class=\"sub text-center\">\n"
                + "                    <li><a id=\"linkEmpleadosA\" class=\"sub-a\" href=\"#\">Gestión de Empleados</a></li>\n"
                + "                </ul>\n"
                + "            </li>\n"
                + "            <!-- Fin sub menu de inventario -->"
                + "            <!-- Inicio sub menu de reportes -->\n"
                + "            <li class=\"sub-menu\">\n"
                + "                <a id=\"linkReportesOpenA\"class=\"sub-menu-a\" href=\"javascript:;\">\n"
                + "                    <i class=\"fas fa-chart-bar\"></i>\n"
                + "                    <span id=\"reports\">Reportes</span>\n"
                + "                </a>\n"
                + "                <ul class=\"sub text-center\">\n"
                + "                    <li><a id=\"linkReportesA\" class=\"sub-a\" href=\"#\">Gestión de Reportes</a></li>\n"
                + "                </ul>\n"
                + "            </li>\n"
                + "            <!-- Fin sub menu de inventario -->"
                + "            <!-- Inicio sub menu de correos masivos -->\n"
                + "            <li class=\"sub-menu\">\n"
                + "                <a id=\"linkCorreosOpenA\"class=\"sub-menu-a\" href=\"javascript:;\">\n"
                + "                    <i class=\"fas fa-envelope\"></i>\n"
                + "                    <span id=\"emails\">Correos</span>\n"
                + "                </a>\n"
                + "                <ul class=\"sub text-center\">\n"
                + "                    <li><a id=\"linkCorreosA\" class=\"sub-a\" href=\"#\">Gestión de Correos</a></li>\n"
                + "                </ul>\n"
                + "            </li>\n"
                + "            <!-- Fin sub menu de inventario -->";
    } else if (rol.equalsIgnoreCase("Mensajero")) {
        sidebar = "  <!-- Inicio sub menu de home -->\n"
                + "                        <li class=\"sub-menu\">\n"
                + "                            <a class=\"sub-menu-a active\" href=\"Dashboard.jsp\">\n"
                + "                                <i class=\"fa fa-home\"></i>\n"
                + "                                <span id=\"idInicio\">Inicio</span>\n"
                + "                            </a>\n"
                + "\n"
                + "                        </li>\n"
                + "                        <!-- Fin sub menu de home -->\n"
                + "                        <!-- Inicio sub menu de entregas  -->\n"
                + "                        <li class=\"sub-menu\">\n"
                + "                            <a id='linkEntregasOpen'class=\"sub-menu-a\" href=\"javascript:;\">\n"
                + "                                <i class=\"fa fa-send\"></i>\n"
                + "                                <span id=\"suppliers\">Entregas</span>\n"
                + "                            </a>\n"
                + "                            <ul class=\"sub text-center\">\n"
                + "                                <li><a id=\"linkEntregasPendientesM\" class=\"sub-a \" href=\"#\"><i class=\"fa fa-truck\"></i> Pendientes</a></li>\n"
                + "                                <li><a id=\"linkEntregasRealizadasM\" class=\"sub-a \" href=\"#\"><i class=\"fa fa-check-square\"></i> Realizadas</a></li>\n"
                + "                            </ul>\n"
                + "                        </li>\n"
                + "                        <!-- Fin sub menu de entregas  -->";
    }
    else if (rol.equalsIgnoreCase("Cliente")) {
        sidebar = "  <!-- Inicio sub menu de home -->\n"
                + "                        <li class=\"sub-menu\">\n"
                + "                            <a class=\"sub-menu-a active\" href=\"Dashboard.jsp\">\n"
                + "                                <i class=\"fa fa-home\"></i>\n"
                + "                                <span id=\"idInicio\">Inicio</span>\n"
                + "                            </a>\n"
                + "\n"
                + "                        </li>\n"
                + "                        <!-- Fin sub menu de home -->\n"
                + "                        <!-- Inicio sub menu de pqrs  -->\n"
                + "                        <li class=\"sub-menu\">\n"
                + "                            <a id='linkPqrsCOpen'class=\"sub-menu-a\" href=\"javascript:;\">\n"
                + "                                <i class=\"fa fa-info-circle\"></i>\n"
                + "                                <span id=\"pqrsSpan\">PQRS's</span>\n"
                + "                            </a>\n"
                + "                            <ul class=\"sub text-center\">\n"
                + "                                <li><a id=\"linkPqrsC\" class=\"sub-a \" href=\"#\"><i class=\"\"></i> Gestión PQR's</a></li>\n"
                + "                            </ul>\n"
                + "                        </li>\n"
                + "                        <!-- Fin sub menu de pqr's  -->"
                + "                        <!-- Inicio sub menu de compras  -->\n"
                + "                        <li class=\"sub-menu\">\n"
                + "                            <a id='linkComprasCOpen'class=\"sub-menu-a\" href=\"javascript:;\">\n"
                + "                                <i class=\"fa fa-cart-plus\"></i>\n"
                + "                                <span id=\"shopSpan\">Compras</span>\n"
                + "                            </a>\n"
                + "                            <ul class=\"sub text-center\">\n"
                + "                                <li><a id=\"linkCOmprasC\" class=\"sub-a \" href=\"#\"><i class=\"\"></i> Gestión Compras</a></li>\n"
                + "                            </ul>\n"
                + "                        </li>\n"
                + "                        <!-- Fin sub menu de compras  -->";
    }


%>

<sidebar>
    <div id="sidebar" class="nav-collapse menumio">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion" style="margin-bottom: 200px;">
            <p class="centered"><a class=""href="#" ><img src="<%= request.getContextPath()%>/SI/img/usuario.png" class="img-circle" width="80"></a></p>
            <h5 id="idAdmin" class="centered nombreUsuario"><%= usuario%></h5>
            <%= sidebar%>
        </ul>
        <!-- sidebar menu end-->
    </div>
</sidebar>
