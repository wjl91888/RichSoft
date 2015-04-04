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

public partial class Administrator_<xsl:value-of select="/NewDataSet/TableName"/>Search : System.Web.UI.Page
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

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            //判断字段是否在列表中显示
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:if test="IsUse = 'true'">
            gvRecordList.Columns["<xsl:value-of select="FieldName"/>"].Visible = chkShow<xsl:value-of select="FieldName"/>.Checked;
  </xsl:if>
</xsl:for-each>
            searchCase.Visible = false;
            searchResult.Visible = true;
            searchPrint.Visible = false;
            ViewState.Clear();
            ViewState["CurrentPage"] = 1;
            QueryRecordInfo();
            ViewState["RecordCount"] = intRecordCount;
            ViewState["PageSize"] = int.Parse(DEFAULT_PAGE_SIZE);
            ViewState["PageCount"] = FunctionManager.RoundInt(((int)ViewState["RecordCount"] / (float)(int)ViewState["PageSize"]));
            InitPageInfo();
        }
        catch (Exception)
        {
            throw;
        }
    }

  private void InitPageInfo()
  {
      try
      {
          if ((int)ViewState["PageCount"] == 1)
          {
              btnFirstPage.Visible = false;
              btnPrePage.Visible = false;
              btnNextPage.Visible = false;
              btnLastPage.Visible = false;
          }
          else if ((int)ViewState["CurrentPage"] == (int)ViewState["PageCount"])
          {
              btnFirstPage.Visible = true;
              btnPrePage.Visible = true;
              btnNextPage.Visible = false;
              btnLastPage.Visible = false;
          }
          else if ((int)ViewState["CurrentPage"] == (int)ViewState["PageCount"] - 1)
          {
              btnFirstPage.Visible = true;
              btnPrePage.Visible = true;
              btnNextPage.Visible = true;
              btnLastPage.Visible = false;
          }
          else if ((int)ViewState["PageCount"] == 0)
          {
              btnFirstPage.Visible = false;
              btnPrePage.Visible = false;
              btnNextPage.Visible = false;
              btnLastPage.Visible = false;
          }
          else if ((int)ViewState["CurrentPage"] == 0)
          {
              btnFirstPage.Visible = false;
              btnPrePage.Visible = false;
              btnNextPage.Visible = false;
              btnLastPage.Visible = false;
          }
          else if ((int)ViewState["CurrentPage"] == 1)
          {
              btnFirstPage.Visible = false;
              btnPrePage.Visible = false;
              btnNextPage.Visible = true;
              btnLastPage.Visible = true;
          }
          else if ((int)ViewState["CurrentPage"] == 2)
          {
              btnFirstPage.Visible = false;
              btnPrePage.Visible = true;
              btnNextPage.Visible = true;
              btnLastPage.Visible = true;
          }
          else
          {
              btnFirstPage.Visible = true;
              btnPrePage.Visible = true;
              btnNextPage.Visible = true;
              btnLastPage.Visible = true;
          }
          ddlPageSize.Items.Clear();
<![CDATA[
          for (int i = 1; i <= (int)ViewState["PageCount"]; i++)
          {
              ddlPageSize.Items.Add(new ListItem(i.ToString(), i.ToString()));
          }
          ddlPageSize.SelectedValue = ViewState["CurrentPage"].ToString();
          lblPageInfo.Text = "每页{0}条记录，当前在<b><span class=tx>{1}</span>/{2}</b>，共<b><span id=recordcount>{3}</span></b>条记录。";
          lblPageInfo.Text = string.Format(lblPageInfo.Text, ViewState["PageSize"], ViewState["CurrentPage"], ViewState["PageCount"], ViewState["RecordCount"]);
]]>
      }
      catch (Exception)
      {
          throw;
      }
  }

  protected void btnFirstPage_Click(object sender, EventArgs e)
  {
      ViewState["CurrentPage"] = 1;
      ViewState["PageSize"] = int.Parse(DEFAULT_PAGE_SIZE);
      QueryRecordInfo();
      ViewState["RecordCount"] = intRecordCount;
      ViewState["PageCount"] = FunctionManager.RoundInt(((int)ViewState["RecordCount"] / (float)(int)ViewState["PageSize"]));
      InitPageInfo();
  }

  protected void btnPrePage_Click(object sender, EventArgs e)
  {
      ViewState["CurrentPage"] = (int)ViewState["CurrentPage"] - 1;
      QueryRecordInfo();
      ViewState["RecordCount"] = intRecordCount;
      ViewState["PageCount"] = FunctionManager.RoundInt(((int)ViewState["RecordCount"] / (float)(int)ViewState["PageSize"]));
      InitPageInfo();
  }
  
  protected void btnNextPage_Click(object sender, EventArgs e)
  {
      ViewState["CurrentPage"] = (int)ViewState["CurrentPage"] + 1;
      QueryRecordInfo();
      ViewState["RecordCount"] = intRecordCount;
      ViewState["PageCount"] = FunctionManager.RoundInt(((int)ViewState["RecordCount"] / (float)(int)ViewState["PageSize"]));
      InitPageInfo();
  }
  
  protected void btnLastPage_Click(object sender, EventArgs e)
  {
      ViewState["CurrentPage"] = ViewState["PageCount"];
      QueryRecordInfo();
      ViewState["RecordCount"] = intRecordCount;
      ViewState["PageCount"] = FunctionManager.RoundInt(((int)ViewState["RecordCount"] / (float)(int)ViewState["PageSize"]));
      InitPageInfo();
  }
  
  protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
  {
      ViewState["CurrentPage"] = int.Parse(ddlPageSize.SelectedValue);
      QueryRecordInfo();
      ViewState["RecordCount"] = intRecordCount;
      ViewState["PageCount"] = FunctionManager.RoundInt(((int)ViewState["RecordCount"] / (float)(int)ViewState["PageSize"]));
      InitPageInfo();
  }
  
  protected void btnSearch_Click(object sender, EventArgs e)
  {
      ViewState[ddlKeyWordField.SelectedValue] = txtKeyWord.Text.ToString();
      ViewState["CurrentPage"] = 1;
      ViewState["PageSize"] = int.Parse(DEFAULT_PAGE_SIZE);
      QueryRecordInfo();
      ViewState["RecordCount"] = intRecordCount;
      ViewState["PageCount"] = FunctionManager.RoundInt(((int)ViewState["RecordCount"] / (float)(int)ViewState["PageSize"]));
      InitPageInfo();
  }

  protected void btnShowAll_Click(object sender, EventArgs e)
  {
      ViewState.Clear();
      ViewState["CurrentPage"] = 1;
      ViewState["PageSize"] = int.Parse(DEFAULT_PAGE_SIZE);
      QueryRecordInfo();
      ViewState["RecordCount"] = intRecordCount;
      ViewState["PageCount"] = FunctionManager.RoundInt(((int)ViewState["RecordCount"] / (float)(int)ViewState["PageSize"]));
      InitPageInfo();
  }

  private Boolean ValidateQueryInputParameter()
  {
      try
      {
          Boolean boolReturn = true;
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:if test="IsUse = 'true'">
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
                 htInputParameter.Remove("<xsl:value-of select="FieldName"/>");
            }
  </xsl:if>
</xsl:for-each>

          return boolReturn;
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
          if (DataValidateManager.ValidateIsNull(Request["Sort"]) == true)
          {
              htInputParameter.Add("Sort", DEFAULT_SORT);
          }
          else
          {
              htInputParameter.Add("Sort", Request["Sort"]);
          }
          if (DataValidateManager.ValidateIsNull(Request["SortField"]) == true)
          {
              htInputParameter.Add("SortField", DEFAULT_SORT_FIELD);
          }
          else
          {
              htInputParameter.Add("SortField", Request["SortField"]);
          }
          if (DataValidateManager.ValidateIsNull(ViewState["PageSize"]) == true)
          {
              htInputParameter.Add("PageSize", DEFAULT_PAGE_SIZE);
          }
          else
          {
              htInputParameter.Add("PageSize", ViewState["PageSize"].ToString());
          }
          if (DataValidateManager.ValidateIsNull(ViewState["CurrentPage"]) == true)
          {
              htInputParameter.Add("CurrentPage", DEFAULT_CURRENT_PAGE);
          }
          else
          {
              htInputParameter.Add("CurrentPage", ViewState["CurrentPage"].ToString());
          }
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:if test="IsUse = 'true'">
          htInputParameter.Add("<xsl:value-of select="FieldName"/>", <xsl:value-of select="ControlTypePrefix"/><xsl:value-of select="FieldName"/>.<xsl:value-of select="ControlTypeValueSuffix"/>);
  </xsl:if>
</xsl:for-each>
          if (ValidateQueryInputParameter() == true)
          {
              <xsl:value-of select="/NewDataSet/TableName"/>Library instance<xsl:value-of select="/NewDataSet/TableName"/>Library = new <xsl:value-of select="/NewDataSet/TableName"/>Library();
              htOutputParameter = instance<xsl:value-of select="/NewDataSet/TableName"/>Library.SelectRecordInfo(htInputParameter);
              dsRecordInfo = (DataSet)htOutputParameter[ConstantsManager.QUERY_DATASET_NAME];
              intRecordCount = (int)htOutputParameter[ConstantsManager.RECORD_COUNT];
              gvRecordList.DataSource = dsRecordInfo;
              gvRecordList.DataBind();
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

    protected void gvRecordList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            //首先判断是否是数据行
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //当鼠标停留时更改背景色
                e.Row.Attributes.Add("onmouseover", "overColor(this);");
                //当鼠标移开时还原背景色
                e.Row.Attributes.Add("onmouseout", "outColor(this);");
            }
        }
        catch (Exception)
        {
            throw;
        }
    }

    protected void btnDel_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton btnTemp = new LinkButton();
            btnTemp = (LinkButton)sender;
            htInputParameter = new Hashtable();
            htInputParameter.Add(ConstantsManager.MESSAGE_ID, "");
            htInputParameter.Add("ObjectID", btnTemp.CommandArgument.ToString());

            //记录日志开始
            string strLogTypeID = "";
            strMessageParam[0] = (string)Session[ConstantsManager.SESSION_USER_LOGIN_NAME];
            strMessageParam[1] = "";
            strMessageParam[2] = "";
            strMessageParam[3] = "删除";
            string strLogContent = MessageManager.GetMessageInfo(MessageManager.LOG_MSGID_0003, strMessageParam);
            LogLibrary.LogWrite(strLogTypeID, strLogContent, (string)htInputParameter["ObjectID"], null, null);
            //记录日志结束
              <xsl:value-of select="/NewDataSet/TableName"/>Library instance<xsl:value-of select="/NewDataSet/TableName"/>Library = new <xsl:value-of select="/NewDataSet/TableName"/>Library();
              instance<xsl:value-of select="/NewDataSet/TableName"/>Library.DeleteRecordInfo(htInputParameter);

            QueryRecordInfo();
        }
        catch (Exception)
        {
            //对失败消息进行处理
            Session[ConstantsManager.SESSION_ERR_MESSAGE_INFO] = "删除失败。";
            Response.Redirect(ConstantsManager.WEBSITE_VIRTUAL_ROOT_DIR + "/ErrorPage/CommonErrorPage.aspx");
            Response.End();
        }
    }

    protected void btnShowCurrentCase_Click(object sender, EventArgs e)
    {
        try
        {
            searchCase.Visible = true;
            searchResult.Visible = false;
            searchPrint.Visible = false; 
        }
        catch (Exception)
        {
            throw;
        }
    }

    protected void btnShowNewCase_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect(CURRENT_PAGE);
        }
        catch (Exception)
        {
            throw;
        }
    }

    protected void btnSearchResult_Click(object sender, EventArgs e)
    {
        try
        {
            searchCase.Visible = false;
            searchResult.Visible = true;
            searchPrint.Visible = false;
        }
        catch (Exception)
        {
            throw;
        }
    }

    protected void btnShowPrint_Click(object sender, EventArgs e)
    {
        try
        {
            //判断字段是否在列表中显示
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:if test="IsUse = 'true'">
            gvResultPrint.Columns["<xsl:value-of select="FieldName"/>"].Visible = chkShow<xsl:value-of select="FieldName"/>.Checked;
  </xsl:if>
</xsl:for-each>
            searchCase.Visible = false;
            searchResult.Visible = false;
            searchPrint.Visible = true;
            ViewState.Clear();
            ViewState["CurrentPage"] = 1;
            ViewState["PageSize"] = 10000;
            PrintRecordInfo();
            ViewState["RecordCount"] = intRecordCount;
        }
        catch (Exception)
        {
            throw;
        }
    }

    private void PrintRecordInfo()
    {
      try
      {
          htInputParameter = new Hashtable();
          dsRecordInfo = new DataSet();
          htInputParameter.Add(ConstantsManager.QUERY_DATASET_NAME, dsRecordInfo);
          htInputParameter.Add(ConstantsManager.MESSAGE_ID, "");
          if (DataValidateManager.ValidateIsNull(Request["Sort"]) == true)
          {
              htInputParameter.Add("Sort", DEFAULT_SORT);
          }
          else
          {
              htInputParameter.Add("Sort", Request["Sort"]);
          }
          if (DataValidateManager.ValidateIsNull(Request["SortField"]) == true)
          {
              htInputParameter.Add("SortField", DEFAULT_SORT_FIELD);
          }
          else
          {
              htInputParameter.Add("SortField", Request["SortField"]);
          }
          if (DataValidateManager.ValidateIsNull(ViewState["PageSize"]) == true)
          {
              htInputParameter.Add("PageSize", DEFAULT_PAGE_SIZE);
          }
          else
          {
              htInputParameter.Add("PageSize", ViewState["PageSize"].ToString());
          }
          if (DataValidateManager.ValidateIsNull(ViewState["CurrentPage"]) == true)
          {
              htInputParameter.Add("CurrentPage", DEFAULT_CURRENT_PAGE);
          }
          else
          {
              htInputParameter.Add("CurrentPage", ViewState["CurrentPage"].ToString());
          }
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:if test="IsUse = 'true'">
          htInputParameter.Add("<xsl:value-of select="FieldName"/>", <xsl:value-of select="ControlTypePrefix"/><xsl:value-of select="FieldName"/>.<xsl:value-of select="ControlTypeValueSuffix"/>);
  </xsl:if>
</xsl:for-each>
          if (ValidateQueryInputParameter() == true)
          {
              <xsl:value-of select="/NewDataSet/TableName"/>Library instance<xsl:value-of select="/NewDataSet/TableName"/>Library = new <xsl:value-of select="/NewDataSet/TableName"/>Library();
              htOutputParameter = instance<xsl:value-of select="/NewDataSet/TableName"/>Library.SelectRecordInfo(htInputParameter);
              dsRecordInfo = (DataSet)htOutputParameter[ConstantsManager.QUERY_DATASET_NAME];
              intRecordCount = (int)htOutputParameter[ConstantsManager.RECORD_COUNT];
              gvResultPrint.DataSource = dsRecordInfo;
              gvResultPrint.DataBind();
              lblStatistic.Text = "有" + intRecordCount + "条符合条件的记录";
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

    protected void btnExportToExcelFile_Click(object sender, EventArgs e)
    {
        try
        {
            FileLibrary.ExportToExcelFile(gvResultPrint, "Result");
        }
        catch (Exception)
        {
            throw;
        }
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        //base.VerifyRenderingInServerForm(control);
    }
}
</xsl:template>
</xsl:stylesheet>