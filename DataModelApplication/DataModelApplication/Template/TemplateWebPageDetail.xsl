<?xml version="1.0" encoding="GB2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="GB2312"/>
<xsl:template match="/">
<![CDATA[
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="]]><xsl:value-of select="/NewDataSet/TableName"/><![CDATA[Detail.aspx.cs"
    Inherits="Administrator_]]><xsl:value-of select="/NewDataSet/TableName"/><![CDATA[Detail" %>
<%@ Register TagPrefix="control" TagName="UserLogin" Src="../../Control/UserLoginControl.ascx" %>
]]>
<![CDATA[
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="PageHead" runat="server">
    <title><asp:literal id="title" runat="server"></title>
    <link href="../../App_Themes/Administrator/Css/DefaultStyle_1.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .txt{border-top:0px;border-left:0px; border-right:0px; border-bottom:1px black solid; }
        .notxt{border-top:0px;border-left:0px; border-right:0px; border-bottom:0px; }
        .printtable{border-top:1px black solid;border-left:1px black solid;
        border-right:0px black solid;border-bottom:0px black solid;}
        .print{border-right:1px black solid;border-bottom:1px black solid;
        border-top:0px black solid;border-left:0px black solid;background-color:white; }
        input {background-color:white; }
    </style>
</head>
<body>
    <form id="submitForm" runat="server">
        <control:UserLogin ID="ctrlUserLogin" runat="server" Visible="false" />
        <input type="hidden" id="txtObjectID" runat="server" />
        <div id="operate">
            <table cellspacing="0" cellpadding="3" style="width:550px;text-align:center;border-width:0px;">
                <tr>
                    <td style="text-align: center; width: 100%; height: 40px; vertical-align: middle;">
                        <input type="button" value="直接打印" onclick="operate.style.display = 'none'; window.print();operate.style.display = 'block';" />
                        <input type="button" value="关闭窗口" onclick="window.close();" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="printContent">
            <table class="printtable" cellspacing="0" cellpadding="3"  style="width:550px;text-align:center;border-width:0px;"
]]>
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:if test="IsUse = 'true'">
        <![CDATA[
        <tr>
          <td class="print">
            <div style="text-align:right;">
              ]]>
              <xsl:value-of select="FieldRemark"/>
              <![CDATA[
            </div>
          </td>
          <td class="print">
            <asp:Label ID="lbl]]><xsl:value-of select="FieldName"/><![CDATA[" runat="server"></asp:Label>
          </td>
        </tr>
        ]]>        
  </xsl:if>
</xsl:for-each>
<![CDATA[
            </table>
        </div>
    </form>
</body>
</html>
]]>
</xsl:template>
</xsl:stylesheet>