<%@ Page Title="" Language="VB" MasterPageFile="~/MiMasterPage.master" AutoEventWireup="false" CodeFile="ConTerremotos.aspx.vb" Inherits="ConTerremotos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style7 {
            width: 215px;
        }
        .auto-style8 {
            width: 91px;
        }
        .auto-style9 {
            width: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style7">Pais:</td>
            <td class="auto-style8">
                <asp:DropDownList ID="cboPais" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="tx_nom" DataValueField="co_pai" AppendDataBoundItems="True">
                    <asp:ListItem>Todos</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TerremotoConnectionString %>" SelectCommand="SELECT [co_pai], [tx_nom] FROM [tbm_paises]"></asp:SqlDataSource>
            </td>
            <td class="auto-style9">
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtFecDes" ErrorMessage="Debe Ingresar una fecha mayor a 31/12/1949" MaximumValue="01/01/3000" MinimumValue="01/01/1950" Type="Date"></asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFecDes" ErrorMessage="Debe ingresar una fecha"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Button ID="btnCon" runat="server" Text="Consultar" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFecHas" ErrorMessage="Debe ingresar una fecha"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtFecHas" ErrorMessage="Debe Ingresar una fecha mayor a 31/12/1949" MaximumValue="01/01/3000" MinimumValue="01/01/1950"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Fecha:</td>
            <td class="auto-style8">Desde:</td>
            <td class="auto-style9">
                <asp:TextBox ID="txtFecDes" runat="server" TextMode="Date"></asp:TextBox>
            </td>
            <td>Hasta:</td>
            <td>
                <asp:TextBox ID="txtFecHas" runat="server" TextMode="Date"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Tsunami</td>
            <td class="auto-style8">
                <asp:RadioButton ID="rbtTodos" runat="server" GroupName="grpTsunami" Text="Todos" />
            </td>
            <td class="auto-style9">
                <asp:RadioButton ID="rbtSi" runat="server" GroupName="grpTsunami" Text="Si" />
            </td>
            <td>
                <asp:RadioButton ID="rbtNo" runat="server" Text="No" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="co_ter" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:BoundField DataField="tx_nom" HeaderText="tx_nom" SortExpression="tx_nom" />
                        <asp:BoundField DataField="co_ter" HeaderText="co_ter" ReadOnly="True" SortExpression="co_ter" />
                        <asp:BoundField DataField="fe_ter" HeaderText="fe_ter" SortExpression="fe_ter" />
                        <asp:BoundField DataField="nd_mag" HeaderText="nd_mag" SortExpression="nd_mag" />
                        <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" />
                        <asp:BoundField DataField="st_tsu" HeaderText="st_tsu" SortExpression="st_tsu" />
                        <asp:BoundField DataField="ne_numMue" HeaderText="ne_numMue" SortExpression="ne_numMue" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TerremotoConnectionString %>" SelectCommand="SELECT tbm_paises.tx_nom, tbm_terremotos.co_ter, tbm_terremotos.fe_ter, tbm_terremotos.nd_mag, tbm_terremotos.co_pai AS Expr1, tbm_terremotos.st_tsu, tbm_terremotos.ne_numMue,tbm_terremotos.co_pai FROM tbm_paises INNER JOIN tbm_terremotos ON tbm_paises.co_pai = tbm_terremotos.co_pai">
                    <FilterParameters>
                        <asp:ControlParameter ControlID="cboPais" Name="co_pai" PropertyName="SelectedValue" />
                    </FilterParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Estadisticas:</td>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">Terremoto de mayor magnitud:</td>
            <td class="auto-style8">
                <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource3">
                    <EditItemTemplate>
                        tx_nom:
                        <asp:TextBox ID="tx_nomTextBox" runat="server" Text='<%# Bind("tx_nom") %>' />
                        <br />
                        nd_mag:
                        <asp:TextBox ID="nd_magTextBox" runat="server" Text='<%# Bind("nd_mag") %>' />
                        <br />
                        Expr1:
                        <asp:TextBox ID="Expr1TextBox" runat="server" Text='<%# Bind("Expr1") %>' />
                        <br />
                        co_pai:
                        <asp:TextBox ID="co_paiTextBox" runat="server" Text='<%# Bind("co_pai") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        tx_nom:
                        <asp:TextBox ID="tx_nomTextBox" runat="server" Text='<%# Bind("tx_nom") %>' />
                        <br />
                        nd_mag:
                        <asp:TextBox ID="nd_magTextBox" runat="server" Text='<%# Bind("nd_mag") %>' />
                        <br />
                        Expr1:
                        <asp:TextBox ID="Expr1TextBox" runat="server" Text='<%# Bind("Expr1") %>' />
                        <br />
                        co_pai:
                        <asp:TextBox ID="co_paiTextBox" runat="server" Text='<%# Bind("co_pai") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        tx_nom:
                        <asp:Label ID="tx_nomLabel" runat="server" Text='<%# Bind("tx_nom") %>' />
                        <br />
                        nd_mag:
                        <asp:Label ID="nd_magLabel" runat="server" Text='<%# Bind("nd_mag") %>' />
                        <br />
                        Expr1:
                        <asp:Label ID="Expr1Label" runat="server" Text='<%# Bind("Expr1") %>' />
                        <br />
                        co_pai:
                        <asp:Label ID="co_paiLabel" runat="server" Text='<%# Bind("co_pai") %>' />
                        <br />

                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TerremotoConnectionString %>" SelectCommand="SELECT TOP (1) tbm_paises.tx_nom, tbm_terremotos.nd_mag, tbm_paises.tx_nom AS Expr1, tbm_terremotos.co_pai FROM tbm_paises INNER JOIN tbm_terremotos ON tbm_paises.co_pai = tbm_terremotos.co_pai ORDER BY tbm_terremotos.nd_mag DESC"></asp:SqlDataSource>
            </td>
            <td class="auto-style9">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">Terremoto que dejó más muertos:</td>
            <td class="auto-style8">
                <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource4">
                    <EditItemTemplate>
                        tx_nom:
                        <asp:TextBox ID="tx_nomTextBox" runat="server" Text='<%# Bind("tx_nom") %>' />
                        <br />
                        Expr1:
                        <asp:TextBox ID="Expr1TextBox" runat="server" Text='<%# Bind("Expr1") %>' />
                        <br />
                        co_pai:
                        <asp:TextBox ID="co_paiTextBox" runat="server" Text='<%# Bind("co_pai") %>' />
                        <br />
                        ne_numMue:
                        <asp:TextBox ID="ne_numMueTextBox" runat="server" Text='<%# Bind("ne_numMue") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        tx_nom:
                        <asp:TextBox ID="tx_nomTextBox" runat="server" Text='<%# Bind("tx_nom") %>' />
                        <br />
                        Expr1:
                        <asp:TextBox ID="Expr1TextBox" runat="server" Text='<%# Bind("Expr1") %>' />
                        <br />
                        co_pai:
                        <asp:TextBox ID="co_paiTextBox" runat="server" Text='<%# Bind("co_pai") %>' />
                        <br />
                        ne_numMue:
                        <asp:TextBox ID="ne_numMueTextBox" runat="server" Text='<%# Bind("ne_numMue") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        tx_nom:
                        <asp:Label ID="tx_nomLabel" runat="server" Text='<%# Bind("tx_nom") %>' />
                        <br />
                        Expr1:
                        <asp:Label ID="Expr1Label" runat="server" Text='<%# Bind("Expr1") %>' />
                        <br />
                        co_pai:
                        <asp:Label ID="co_paiLabel" runat="server" Text='<%# Bind("co_pai") %>' />
                        <br />
                        ne_numMue:
                        <asp:Label ID="ne_numMueLabel" runat="server" Text='<%# Bind("ne_numMue") %>' />
                        <br />

                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:TerremotoConnectionString %>" SelectCommand="SELECT TOP (1) tbm_paises.tx_nom, tbm_paises.tx_nom AS Expr1, tbm_terremotos.co_pai, tbm_terremotos.ne_numMue FROM tbm_paises INNER JOIN tbm_terremotos ON tbm_paises.co_pai = tbm_terremotos.co_pai ORDER BY tbm_terremotos.ne_numMue DESC"></asp:SqlDataSource>
            </td>
            <td class="auto-style9">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">País con mas terremotos:</td>
            <td class="auto-style8">
                <asp:FormView ID="FormView3" runat="server" DataSourceID="SqlDataSource5">
                    <EditItemTemplate>
                        CantTerre:
                        <asp:TextBox ID="CantTerreTextBox" runat="server" Text='<%# Bind("CantTerre") %>' />
                        <br />
                        co_pai:
                        <asp:TextBox ID="co_paiTextBox" runat="server" Text='<%# Bind("co_pai") %>' />
                        <br />
                        tx_nom:
                        <asp:TextBox ID="tx_nomTextBox" runat="server" Text='<%# Bind("tx_nom") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        CantTerre:
                        <asp:TextBox ID="CantTerreTextBox" runat="server" Text='<%# Bind("CantTerre") %>' />
                        <br />
                        co_pai:
                        <asp:TextBox ID="co_paiTextBox" runat="server" Text='<%# Bind("co_pai") %>' />
                        <br />
                        tx_nom:
                        <asp:TextBox ID="tx_nomTextBox" runat="server" Text='<%# Bind("tx_nom") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        CantTerre:
                        <asp:Label ID="CantTerreLabel" runat="server" Text='<%# Bind("CantTerre") %>' />
                        <br />
                        co_pai:
                        <asp:Label ID="co_paiLabel" runat="server" Text='<%# Bind("co_pai") %>' />
                        <br />
                        tx_nom:
                        <asp:Label ID="tx_nomLabel" runat="server" Text='<%# Bind("tx_nom") %>' />
                        <br />

                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:TerremotoConnectionString %>" SelectCommand="SELECT TOP (1) COUNT(tbm_paises.tx_nom) AS CantTerre, tbm_terremotos.co_pai, tbm_paises.tx_nom FROM tbm_paises INNER JOIN tbm_terremotos ON tbm_paises.co_pai = tbm_terremotos.co_pai GROUP BY tbm_terremotos.co_pai, tbm_paises.tx_nom ORDER BY CantTerre DESC"></asp:SqlDataSource>
            </td>
            <td class="auto-style9">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

