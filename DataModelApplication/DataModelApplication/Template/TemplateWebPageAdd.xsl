<?xml version="1.0" encoding="GB2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="GB2312"/>
<xsl:template match="/">
<![CDATA[
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="]]><xsl:value-of select="/NewDataSet/TableName"/><![CDATA[Add.aspx.cs"
    Inherits="Administrator_]]><xsl:value-of select="/NewDataSet/TableName"/><![CDATA[Add" %>
<%@ Register TagPrefix="control" TagName="UserLogin" Src="../../Control/UserLoginControl.ascx" %>
]]>
<![CDATA[
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="PageHead" runat="server">
    <title>信息添加</title>
    <link href="../../App_Themes/Administrator/Css/DefaultStyle_1.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="submitForm" runat="server">
        <control:UserLogin ID="ctrlUserLogin" runat="server" Visible="false" />
        <div>
            <table class="table" cellspacing="1" cellpadding="3" style="text-align:center;width:98%;border-width:0px;">
                <tr class="hback">
                    <td class="xingmu">
                          <span class="sd"><strong>信息管理</strong></span>
                    </td>
                </tr>
                <tr>
                    <td class="hback" style="width:48%;height:18px">
                        <div style="text-align:left">
                              <a href="~/Administrator/Default_Main.aspx">首页</a>┆
                        </div>
                    </td>
                </tr>
            </table>
            <table class="table" cellspacing="1" cellpadding="3" style="text-align:center;width:98%;border-width:0px;">
                <tr class="xingmu">
                    <td class="xingmu" colspan="2">
                      添加
                    </td>
                </tr>
]]>
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:if test="IsUse = 'true'">
    <xsl:choose>
      <xsl:when test="IsNull = 'true'">
        <![CDATA[
        <tr>
          <td class="hback CaptionClass">
            <div style="text-align:right;">
              ]]>
              <xsl:value-of select="FieldRemark"/>
              <![CDATA[
            </div>
          </td>
          <td class="hback ContentClass">
            <asp:]]><xsl:value-of select="ControlTypeName"/><![CDATA[ ID="]]><xsl:value-of select="ControlTypePrefix"/><xsl:value-of select="FieldName"/><![CDATA[" runat="server"></asp:]]><xsl:value-of select="ControlTypeName"/><![CDATA[>
          </td>
        </tr>
        ]]>        
      </xsl:when>
      <xsl:otherwise>
        <![CDATA[<tr>
          <td class="hback CaptionClass">
            <div style="text-align:right;">
              ]]>
              <xsl:value-of select="FieldRemark"/>
              <![CDATA[
            </div>
          </td>
          <td class="hback ContentClass">
            <asp:]]><xsl:value-of select="ControlTypeName"/><![CDATA[ ID="]]><xsl:value-of select="ControlTypePrefix"/><xsl:value-of select="FieldName"/><![CDATA[" runat="server"></asp:]]><xsl:value-of select="ControlTypeName"/><![CDATA[>
            <span style="color: Red;">*</span>
          </td>
        </tr>
        ]]>
      </xsl:otherwise>
    </xsl:choose>               
  </xsl:if>
</xsl:for-each>  
<![CDATA[
                <tr>
                    <td class="hback" colspan="2">
                        <div style="text-align: center; width: 100%">
                            <asp:Button ID="btnAdd" Text="确认添加信息" runat="server" OnClick="btnAdd_Click" />
                            <input type="reset" value="重新填写" />
                        </div>
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