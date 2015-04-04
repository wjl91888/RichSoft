<?xml version="1.0" encoding="GB2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="GB2312"/>
<xsl:template match="/">
<![CDATA[
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="]]><xsl:value-of select="/NewDataSet/TableName"/><![CDATA[Search.aspx.cs"
    Inherits="Administrator_]]><xsl:value-of select="/NewDataSet/TableName"/><![CDATA[Search" %>
<%@ Register TagPrefix="control" TagName="UserLogin" Src="../../Control/UserLoginControl.ascx" %>
]]>
<![CDATA[
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="PageHead" runat="server">
    <title>��Ϣ�߼���ѯ</title>
    <link href="../../App_Themes/Administrator/Css/DefaultStyle_1.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .txt{border-top:0px;border-left:0px; border-right:0px; border-bottom:1px black solid; }
        .notxt{border-top:0px;border-left:0px; border-right:0px; border-bottom:0px; }
        .printtable{border-top:1px black solid;border-left:1px black solid;
        border-right:0px black solid;border-bottom:0px black solid;}
        .print{border-right:1px black solid;border-bottom:1px black solid;
        border-top:0px black solid;border-left:0px black solid;background-color:white; }
    </style>
    <script language="JavaScript" src="../../App_Themes/Administrator/JavaScript/PublicJS.js" type="text/JavaScript"></script>
</head>
<body>
    <form id="submitForm" runat="server">
        <control:UserLogin ID="ctrlUserLogin" runat="server" Visible="false" />
        <div id="searchCase" runat="server">
            <table class="table" cellspacing="1" cellpadding="5" style="width:778px;text-align:center;border-width:0px;">
                <tr class="xingmu">
                    <td class="xingmu" colspan="2">
                        �����ѯ����<br />
                        <span style="color: Silver;">1.��������Ϊ���й�ϵ��<br />
                            2.��������ĸ�ѡ���ʾ���ֶ��Ƿ��ڲ�ѯ�������ʾ��ѡ��Ϊ�����ʾ���ֶΡ�<br />
                            3.����������ֱ�Ӵ�ӡ�������ʾ�����Ҫ�������<br />
                            4.����Ҫ�Զ����ӡ��С�����ڴ�ӡ�������������Excel�ļ��������ݴ��ڱ����ٴ�ӡ�� </span>
                    </td>
                </tr>
            </table>
            <table class="table" cellspacing="1" cellpadding="5" style="width:778px;text-align:center;border-width:0px;">
]]>
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:if test="IsUse = 'true'">
                 <![CDATA[<tr>
                    <td class="hback">
                        <div style="text-align: right;">
                          ]]><xsl:value-of select="FieldRemark"/><![CDATA[<asp:CheckBox ID="chkShow]]><xsl:value-of select="FieldName"/><![CDATA[" runat="server" Checked="true" />
                        </div>
                    </td>
                    <td class="hback">
                        <asp:]]><xsl:value-of select="ControlTypeName"/><![CDATA[ ID="]]><xsl:value-of select="ControlTypePrefix"/><xsl:value-of select="FieldName"/><![CDATA[" runat="server" Width="100px" CssClass="txt"></asp:]]><xsl:value-of select="ControlTypeName"/><![CDATA[>
                    </td>
                </tr>]]>
  </xsl:if>
</xsl:for-each>  
<![CDATA[
                <tr>
                    <td class="hback" colspan="2" style="text-align: center; width: 100%; height: 40px;vertical-align: middle;">
                        <asp:Button ID="btnSearch" Text="ȷ�ϲ�����Ϣ" runat="server" OnClick="btnSearch_Click" />
                        <input type="reset" value="������д" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="searchResult" runat="server">
            <table class="table" cellspacing="1" cellpadding="5" style="width:778px;text-align:center;border-width:0px;">
                <tr class="hback">
                    <td class="xingmu">
                        <span class="sd"><strong>��Ϣ��ѯ���</strong></span>
                    </td>
                </tr>
                <tr>
                    <td class="hback">
                        <div style="text-align:left">
                            <asp:LinkButton ID="btnShowCurrentCase" runat="server" Text="�鿴��ǰ��������" OnClick="btnShowCurrentCase_Click"></asp:LinkButton>|
                            <asp:LinkButton ID="btnShowNewCase" runat="server" Text="�趨�²�������" OnClick="btnShowNewCase_Click"></asp:LinkButton>|
                            <asp:LinkButton ID="btnShowPrint" runat="server" Text="��ӡ��ѯ���" OnClick="btnShowPrint_Click"></asp:LinkButton>
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
                        <ItemStyle CssClass="hback" HorizontalAlign="Center" />
                        <HeaderStyle CssClass="xingmu" />
                        <ItemTemplate>
                            <%# "<a href=../../Administrator/" + strTableName + "Edit.aspx?ObjectID=" + DataBinder.Eval(Container.DataItem, "ObjectID") + " >�޸�</a>"%>|
                            <%# "<span style=\"cursor:hand;\" onclick=\"OpenWindow('../../Administrator/" + strTableName + "Detail.aspx?ObjectID=" + DataBinder.Eval(Container.DataItem, "ObjectID") + "',480,600,window);\">��ӡ</span>"%>|
                            <asp:LinkButton ID="btnDel" runat="server" CommandName="DoDel" CommandArgument='<%#Bind("ObjectID")%>' OnClick="btnDel_Click">ɾ��</asp:LinkButton>
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
        </div>
        <div id="searchPrint" runat="server">
            <table id="operate" class="table" cellspacing="1" cellpadding="3" style="text-align:center;width:98%;border-width:0px;">
                <tr class="hback">
                    <td class="xingmu">
                        <span class="sd"><strong>Ϣ��ѯ�����ӡ</strong></span>
                    </td>
                </tr>
                <tr>
                    <td class="hback">
                        <div align="left">
                            <asp:LinkButton ID="LinkButton1" runat="server" Text="�鿴��ǰ��������" OnClick="btnShowCurrentCase_Click"></asp:LinkButton>|
                            <asp:LinkButton ID="LinkButton2" runat="server" Text="�趨�²�������" OnClick="btnShowNewCase_Click"></asp:LinkButton>|
                            <asp:LinkButton ID="btnSearchResult" runat="server" Text="�鿴���ҽ��" OnClick="btnSearchResult_Click"></asp:LinkButton>|
                            <asp:LinkButton ID="btnExportToExcelFile" runat="server" Text="����Excel�ĵ�" OnClick="btnExportToExcelFile_Click"></asp:LinkButton>|
                            <input type="button" value="ֱ�Ӵ�ӡ" onclick="operate.style.display = 'none'; window.print();operate.style.display = 'block';" />|
                            ���ñ����
                            <input type="text" value="535" onpropertychange="gvResultPrint.style.width=this.value;" size="5" />����
                        </div>
                    </td>
                </tr>
            </table>
            <table cellspacing="0" cellpadding="3" style="width:535px;text-align:center;border-width:0px">
                <tr>
                    <td align="left">
                        <asp:Label ID="lblStatistic" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:GridView ID="gvResultPrint" runat="server" AutoGenerateColumns="False" CellSpacing="0"
                CellPadding="3" Width="535" HorizontalAlign="Center" CssClass="printtable">
                <Columns>
]]>
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:if test="IsUse = 'true'">
                    <![CDATA[<asp:TemplateField HeaderText="]]><xsl:value-of select="FieldRemark"/><![CDATA[">
                        <ItemStyle CssClass="print" HorizontalAlign="Center" />
                        <HeaderStyle CssClass="print" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "]]><xsl:value-of select="FieldName"/><![CDATA[")%>
                        </ItemTemplate>
                    </asp:TemplateField>]]>
  </xsl:if>
</xsl:for-each>  
<![CDATA[
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
]]>
</xsl:template>
</xsl:stylesheet>