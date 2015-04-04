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

public partial class Administrator_<xsl:value-of select="/NewDataSet/TableName"/>Detail : System.Web.UI.Page
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
  private Int32 intRecordCount;
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
              txtObjectID.Value = Request.QueryString["ObjectID"];
              InitialPage();
              QueryRecordInfo();
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

  private void QueryRecordInfo()
  {
      try
      {
          htInputParameter = new Hashtable();
          dsRecordInfo = new DataSet();
          htInputParameter.Add(ConstantsManager.QUERY_DATASET_NAME, dsRecordInfo);
          htInputParameter.Add(ConstantsManager.MESSAGE_ID, "");
          htInputParameter.Add("ObjectID", Request["ObjectID"]);
          if (DataValidateManager.ValidateIsNull(htInputParameter["ObjectID"]) == false)
          {
              <xsl:value-of select="/NewDataSet/TableName"/>Library instance<xsl:value-of select="/NewDataSet/TableName"/>Library = new <xsl:value-of select="/NewDataSet/TableName"/>Library();
              htOutputParameter = instance<xsl:value-of select="/NewDataSet/TableName"/>Library.SelectRecordInfo(htInputParameter);
              if ((Int32)htOutputParameter[ConstantsManager.RECORD_COUNT] > 0)
              {
                  dsRecordInfo = (DataSet)htOutputParameter[ConstantsManager.QUERY_DATASET_NAME];
                  //对控件进行赋值
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:if test="IsUse = 'true'">
                  lbl<xsl:value-of select="FieldName"/>.Text = dsRecordInfo.Tables[0].Rows[0]["<xsl:value-of select="FieldName"/>"].ToString();
  </xsl:if>
</xsl:for-each>

              }
          }
          else
          {
              //对错误消息进行处理
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
}

</xsl:template>
</xsl:stylesheet>