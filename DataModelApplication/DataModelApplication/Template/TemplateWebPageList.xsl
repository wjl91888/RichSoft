<?xml version="1.0" encoding="GB2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="GB2312"/>
<xsl:template match="/">
<![CDATA[
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="]]><xsl:value-of select="/NewDataSet/TableName"/><![CDATA[List.aspx.cs"
    Inherits="Administrator_]]><xsl:value-of select="/NewDataSet/TableName"/><![CDATA[List" %>
<%@ Register TagPrefix="control" TagName="UserLogin" Src="../../Control/UserLoginControl.ascx" %>
]]>
<![CDATA[
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="PageHead" runat="server">
    <title>��Ϣ����</title>
    <link href="../../App_Themes/Administrator/Css/DefaultStyle_1.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="submitForm" runat="server">
        <control:UserLogin ID="ctrlUserLogin" runat="server" Visible="false" />
        <div>
            <table class="table" cellspacing="1" cellpadding="3" style="text-align:center;width:98%;border-width:0px;">
                <tr class="hback">
                    <td class="xingmu">
                          <span class="sd"><strong>��Ϣ����</strong></span>
                    </td>
                </tr>
                <tr>
                    <td class="hback" style="width:48%;height:18px">
                        <div style="text-align:left">
                              <a href="~/Administrator/Default_Main.aspx">��ҳ</a>��
                              <a href="ABMInsuranceOperatorAdd.aspx">�����Ϣ</a>|
                              <asp:LinkButton ID="btnShowAll" runat="server" Text="������Ϣ" OnClick="btnShowAll_Click"></asp:LinkButton>&nbsp;
                        </div>
                    </td>
                </tr>
            </table>
            <asp:GridView ID="gvRecordList" runat="server" AutoGenerateColumns="False" CellSpacing="1"
                CellPadding="5" Width="98%" BorderWidth="0px" HorizontalAlign="Center" CssClass="table"
                OnRowDataBound="gvRecordList_RowDataBound">
                <Columns>
                ]]>
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:if test="IsUse = 'true'">
                    <![CDATA[<asp:TemplateField HeaderText="]]><xsl:value-of select="FieldRemark"/><![CDATA[">
                        <ItemStyle CssClass="hback" HorizontalAlign="Center" />
                        <HeaderStyle CssClass="xingmu" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "]]><xsl:value-of select="FieldName"/><![CDATA[")%>
                        </ItemTemplate>
                    </asp:TemplateField>]]>
  </xsl:if>
</xsl:for-each>  
                <![CDATA[
                    <asp:TemplateField HeaderText="����">
                        <ItemStyle CssClass="hback" HorizontalAlign="Center"  />
                        <HeaderStyle CssClass="xingmu" />
                        <ItemTemplate>
                            <%# "<a href=../../Administrator/]]><xsl:value-of select="/NewDataSet/TableName"/><![CDATA[Edit.aspx?ObjectID=" + DataBinder.Eval(Container.DataItem, "ObjectID") + " >�޸�</a>"%>|
                            <%# "<span style=\"cursor:hand;\" onclick=\"OpenWindow('../../Administrator/]]><xsl:value-of select="/NewDataSet/TableName"/><![CDATA[Detail.aspx?ObjectID=" + DataBinder.Eval(Container.DataItem, "ObjectID") + "',480,600,window);\">��ӡ</span>"%>|
                            <asp:LinkButton ID="btnDel" runat="server" CommandName="DoDel"
                                CommandArgument='<%#Bind("ObjectID")%>' OnClick="btnDel_Click">ɾ��</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <table class="table" cellspacing="1" cellpadding="5" style="text-align:center;width:98%;border-width:0px;">
                <tr>
                    <td class="hback" colspan="7" height="18">
                        <div style="text-align:right;">
                            <asp:Button ID="btnFirstPage" runat="server" Text="��һҳ" OnClick="btnFirstPage_Click" />
                            <asp:Button ID="btnPrePage" runat="server" Text="��һҳ" OnClick="btnPrePage_Click" />
                            <asp:Button ID="btnNextPage" runat="server" Text="��һҳ" OnClick="btnNextPage_Click" />
                            <asp:Button ID="btnLastPage" runat="server" Text="���һҳ" OnClick="btnLastPage_Click" />
                            <asp:DropDownList ID="ddlPageSize" runat="server" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            <asp:Label ID="lblPageInfo" runat="server"></asp:Label>
                        </div>
                    </td>
                </tr>
            </table>
            <table class="table" cellspacing="1" cellpadding="5" style="text-align:center;width:98%;border-width:0px;">
                <tr>
                    <td class="hback" colspan="7" height="18">
                        �����ؼ��֣�
                        <asp:TextBox ID="txtKeyWord" runat="server"></asp:TextBox>
                        <asp:DropDownList ID="ddlKeyWordField" runat="server"></asp:DropDownList>
                        <asp:Button ID="btnSearch" runat="server" Text="����" OnClick="btnSearch_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
]]>
</xsl:template>
</xsl:stylesheet>