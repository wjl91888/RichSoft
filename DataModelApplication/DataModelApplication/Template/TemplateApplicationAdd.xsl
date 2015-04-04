<?xml version="1.0" encoding="GB2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="GB2312"/>
<xsl:template match="/">
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Hosting;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Rocky.Common;
using Rocky.Common.LM;
using <xsl:value-of select="/NewDataSet/NameSpace"/>;

public partial class Administrator_<xsl:value-of select="/NewDataSet/TableName"/>Add : System.Web.UI.Page
{
  #region 当前页面常量定义
  private const string CURRENT_PATH = "";
  private const string CURRENT_PAGE = "";
  private const string REDIRECT_PAGE = "";
  private const string CURRENT_PAGE_ACCESS_PURVIEW_ID = "";
  private const string DEFAULT_SORT = "false";
  private const string DEFAULT_SORT_FIELD = "";
  private const string DEFAULT_PAGE_SIZE = "15";
  private const string DEFAULT_CURRENT_PAGE = "1";
  #endregion
  #region 当前页面变量定义
  private Hashtable htInputParameter;
  private Hashtable htOutputParameter;
  private DataSet dsRecordInfo;
  private string strMessageInfo = string.Empty;
  private string[] strMessageParam = { string.Empty, string.Empty, string.Empty, string.Empty };
  #endregion

  protected void Page_Load(object sender, EventArgs e)
  {
      try
      {
          if (IsPostBack == false)
          {
              Session[ConstantsManager.SESSION_CURRENT_PAGE] = CURRENT_PATH + "/" + CURRENT_PAGE;
              Session[ConstantsManager.SESSION_CURRENT_PURVIEW] = CURRENT_PAGE_ACCESS_PURVIEW_ID;
              InitialPage();
          }
      }
      catch (Exception)
      {
          throw;
      }
  }

  private void InitialPage()
  {
      try
      {
      }
      catch (Exception)
      {
          throw;
      }
  }

  private void AddRecordInfo()
  {
      try
      {
          htInputParameter = new Hashtable();
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:if test="IsUse = 'true'">
          htInputParameter.Add("<xsl:value-of select="FieldName"/>", <xsl:value-of select="ControlTypePrefix"/><xsl:value-of select="FieldName"/>.<xsl:value-of select="ControlTypeValueSuffix"/>);
  </xsl:if>
</xsl:for-each>
          if (ValidateAddInputParameter() == true)
          {
              <xsl:value-of select="/NewDataSet/TableName"/>Library instance<xsl:value-of select="/NewDataSet/TableName"/>Library = new <xsl:value-of select="/NewDataSet/TableName"/>Library();
              instance<xsl:value-of select="/NewDataSet/TableName"/>Library.InsertRecordInfo(htInputParameter);
              //对成功消息进行处理
              strMessageParam[0] = "";
              strMessageParam[1] = "添加";
              strMessageInfo = MessageManager.GetMessageInfo(MessageManager.HINT_MSGID_0015, strMessageParam, strMessageInfo);
              Session[ConstantsManager.SESSION_ERR_MESSAGE_INFO] = strMessageInfo;
              Session[ConstantsManager.SESSION_REDIRECT_PAGE] = CURRENT_PATH + "/" + REDIRECT_PAGE;
              //记录日志开始
              string strLogTypeID = "A02";
              strMessageParam[0] = (string)Session[ConstantsManager.SESSION_USER_LOGIN_NAME];
              strMessageParam[1] = "";
              strMessageParam[2] = "";
              strMessageParam[3] = "添加";
              string strLogContent = MessageManager.GetMessageInfo(MessageManager.LOG_MSGID_0003, strMessageParam);
              LogLibrary.LogWrite(strLogTypeID, strLogContent, (string)htInputParameter["ObjectID"], null, null);
              //记录日志结束
              //成功后页面跳转
              Response.Redirect(ConstantsManager.WEBSITE_VIRTUAL_ROOT_DIR + "/ErrorPage/CommonErrorPage.aspx");
              Response.End();
          }
          else
          {
              Session[ConstantsManager.SESSION_ERR_MESSAGE_INFO] = strMessageInfo;
              Response.Redirect(ConstantsManager.WEBSITE_VIRTUAL_ROOT_DIR + "/ErrorPage/CommonErrorPage.aspx");
              Response.End();
          }
      }
      catch (Exception)
      {
          throw;
      }
  }

  protected void btnAdd_Click(object sender, EventArgs e)
  {
      try
      {
          AddRecordInfo();
      }
      catch (Exception)
      {
          throw;
      }
  }

  private Boolean ValidateAddInputParameter()
  {
      try
      {
          Boolean boolReturn = true;
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:if test="IsUse = 'true'">
    <xsl:if test="IsNull = 'true'">
            if (<xsl:value-of select="DataValidateMethod"/> == false)
            {
                 if (DataValidateManager.<xsl:value-of select="FieldName"/> == false)
                 {
                     strMessageParam[0] = "<xsl:value-of select="FieldRemark"/>";
                     strMessageParam[1] = "<xsl:value-of select="DataValidateParameterOne"/>";
                     strMessageParam[2] = "<xsl:value-of select="DataValidateParameterTwo"/>";
                     strMessageInfo = MessageManager.GetMessageInfo(MessageManager.<xsl:value-of select="FieldName"/>, strMessageParam, strMessageInfo);
                     boolReturn = false;
                 }
            }
            else
            {
                 htInputParameter.Remove("<xsl:value-of select="FieldName"/>");
            }
    </xsl:if>
    <xsl:if test="IsNull = 'false'">
            if (<xsl:value-of select="DataValidateMethod"/> == false)
            {
                 if (DataValidateManager.<xsl:value-of select="FieldName"/> == false)
                 {
                     strMessageParam[0] = "<xsl:value-of select="FieldRemark"/>";
                     strMessageParam[1] = "<xsl:value-of select="DataValidateParameterOne"/>";
                     strMessageParam[2] = "<xsl:value-of select="DataValidateParameterTwo"/>";
                     strMessageInfo = MessageManager.GetMessageInfo(MessageManager.<xsl:value-of select="DataValidateFaildMessage"/>, strMessageParam, strMessageInfo);
                     boolReturn = false;
                 }
            }
            else
            {
                 strMessageParam[0] = "<xsl:value-of select="FieldRemark"/>";
                 strMessageInfo = MessageManager.GetMessageInfo(MessageManager.HINT_MSGID_0002, strMessageParam, strMessageInfo);
                 boolReturn = false;"
            }
    </xsl:if>
    <xsl:if test="IsNull = ''">
            if (<xsl:value-of select="DataValidateMethod"/> == false)
            {
                 if (DataValidateManager.<xsl:value-of select="FieldName"/> == false)
                 {
                     strMessageParam[0] = "<xsl:value-of select="FieldRemark"/>";
                     strMessageParam[1] = "<xsl:value-of select="DataValidateParameterOne"/>";
                     strMessageParam[2] = "<xsl:value-of select="DataValidateParameterTwo"/>";
                     strMessageInfo = MessageManager.GetMessageInfo(MessageManager.<xsl:value-of select="FieldName"/>, strMessageParam, strMessageInfo);
                     boolReturn = false;
                 }
            }
            else
            {
                 strMessageParam[0] = "<xsl:value-of select="FieldRemark"/>";
                 strMessageInfo = MessageManager.GetMessageInfo(MessageManager.HINT_MSGID_0002, strMessageParam, strMessageInfo);
                 boolReturn = false;"
            }
    </xsl:if>
  </xsl:if>
</xsl:for-each>
          return boolReturn;
      }
      catch (Exception)
      {
          throw;
      }
  }
}
</xsl:template>
</xsl:stylesheet>
