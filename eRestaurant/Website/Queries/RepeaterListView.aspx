<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RepeaterListView.aspx.cs" Inherits="Queries_RepeaterListView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Nested Repeater</h1>
    <asp:ObjectDataSource ID="MenuCategoryFoodItemsODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="MenuCategoryFoodItems_GetDTO" TypeName="eRestaurantSystem.BLL.ItemsController"></asp:ObjectDataSource>
    <!-- The outer repeater is for each row in the overall DataSet -->
    <asp:Repeater ID="MenuCategoryList" runat="server" DataSourceID="MenuCategoryFoodItemsODS">
        <ItemTemplate>
            <h3><%# Eval("MenuCategoryDescription") %></h3>
            <!-- The inner repeater will handle List<T> that is on each row of the overall DataSet -->
            <asp:Repeater ID="FoodItemsList" runat="server" DataSource='<%# Eval("FoodItems") %>'>
                <ItemTemplate>
                    <%# Eval("ItemID") %>&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("FoodDescription") %>' />&nbsp;&nbsp;
                    <%# ((decimal)Eval("CurrentPrice")).ToString("C") %>&nbsp;&nbsp;
                    <span class="badge"><%# Eval("TimesServed") %>&nbsp;Servings</span>
                    <br />
                </ItemTemplate>
            </asp:Repeater>
        </ItemTemplate>
    </asp:Repeater>

    <h1>Repeater with ListView</h1>
    <asp:Repeater ID="ListViewRepeater" runat="server" DataSourceID="MenuCategoryFoodItemsODS">
        <ItemTemplate>
            <h3><%# Eval("MenuCategoryDescription") %></h3>
            <asp:ListView ID="ListView1" runat="server" DataSource='<%# Eval("FoodItems") %>'>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                                    <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                        <th runat="server">ID</th>
                                        <th runat="server">Item</th>
                                        <th runat="server">$Price</th>
                                        <th runat="server">Servings</th>
                                    </tr>
                                    <tr runat="server" id="itemPlaceholder"></tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr style="background-color: #E0FFFF; color: #333333;">
                        <td>
                            <%# Eval("ItemID") %>&nbsp;&nbsp;</td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("FoodDescription") %>' />&nbsp;&nbsp;</td>
                        <td>
                            <%# ((decimal)Eval("CurrentPrice")).ToString("C") %>&nbsp;&nbsp;</td>
                        <td>
                            <span class="badge"><%# Eval("TimesServed") %>&nbsp;Servings</span></td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFFFFF; color: #284775;">
                        <td>
                            <%# Eval("ItemID") %>&nbsp;&nbsp;</td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("FoodDescription") %>' />&nbsp;&nbsp;</td>
                        <td>
                            <%# ((decimal)Eval("CurrentPrice")).ToString("C") %>&nbsp;&nbsp;</td>
                        <td>
                            <span class="badge"><%# Eval("TimesServed") %>&nbsp;Servings</span></td>
                    </tr>
                </AlternatingItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
            </asp:ListView>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>

