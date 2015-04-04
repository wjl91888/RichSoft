<?xml version="1.0" encoding="GB2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="GB2312"/>
<xsl:template match="/">
using System;
using System.Data;
using System.Data.Common;
using System.Configuration;
using System.Collections;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using Rocky.Common;

namespace <xsl:value-of select="/NewDataSet/NameSpace"/>
{
   public class <xsl:value-of select="/NewDataSet/TableName"/>Library
   {
       public <xsl:value-of select="/NewDataSet/TableName"/>Library()
       {
       }

       public void InsertRecordInfo(Hashtable htInputParameter)
       {
           try
           {
               Database db = DatabaseFactory.CreateDatabase("strConnManager");
               string strProcName = "SP_Insert<xsl:value-of select="/NewDataSet/TableName"/>";
               DbCommand cmdProc = db.GetStoredProcCommand(strProcName);
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:if test="IsUse = 'true'">
               db.AddInParameter(cmdProc, "@<xsl:value-of select="FieldName"/>", DbType.<xsl:value-of select="FieldType"/>);
  </xsl:if>
</xsl:for-each>
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:if test="IsUse = 'true'">
    <xsl:choose>
      <xsl:when test="IsString = 'true'">
               db.SetParameterValue(cmdProc, "@<xsl:value-of select="FieldName"/>", (string)htInputParameter["<xsl:value-of select="FieldName"/>"]);
      </xsl:when>
      <xsl:otherwise>
               if (htInputParameter["<xsl:value-of select="FieldName"/>"] != null)
               {
                   db.SetParameterValue(cmdProc, "@<xsl:value-of select="FieldName"/>", (string)htInputParameter["<xsl:value-of select="FieldName"/>"]);
               }
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
</xsl:for-each>
               db.ExecuteNonQuery(cmdProc);
           }
           catch (Exception)
           {
               throw;
           }
       }

       public void UpdateRecordInfo(Hashtable htInputParameter)
       {
           try
           {
               Database db = DatabaseFactory.CreateDatabase("strConnManager");
               string strProcName = "SP_Update<xsl:value-of select="/NewDataSet/TableName"/>";
               DbCommand cmdProc = db.GetStoredProcCommand(strProcName);
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:if test="IsUse = 'true'">
               db.AddInParameter(cmdProc, "@<xsl:value-of select="FieldName"/>", DbType.<xsl:value-of select="FieldType"/>);
  </xsl:if>
</xsl:for-each>
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:if test="IsUse = 'true'">
    <xsl:choose>
      <xsl:when test="IsString = 'true'">
               db.SetParameterValue(cmdProc, "@<xsl:value-of select="FieldName"/>", (string)htInputParameter["<xsl:value-of select="FieldName"/>"]);
      </xsl:when>
      <xsl:otherwise>
               if (htInputParameter["<xsl:value-of select="FieldName"/>"] != null)
               {
                   db.SetParameterValue(cmdProc, "@<xsl:value-of select="FieldName"/>", (string)htInputParameter["<xsl:value-of select="FieldName"/>"]);
               }
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
</xsl:for-each>
               db.ExecuteNonQuery(cmdProc);
           }
           catch (Exception)
           {
               throw;
           }
       }

       public void DeleteRecordInfo(Hashtable htInputParameter)
       {
           try
           {
               Database db = DatabaseFactory.CreateDatabase("strConnManager");
               string strProcName = "SP_Delete<xsl:value-of select="/NewDataSet/TableName"/>";
               DbCommand cmdProc = db.GetStoredProcCommand(strProcName);
               db.AddInParameter(cmdProc, "@ObjectID", DbType.String);
               db.SetParameterValue(cmdProc, "@ObjectID", htInputParameter["ObjectID"]);
               db.ExecuteNonQuery(cmdProc);
           }
           catch (Exception)
           {
               throw;
           }
       }

       public Hashtable SelectRecordInfo(Hashtable htInputParameter)
       {
           try
           {
               Database db = DatabaseFactory.CreateDatabase("strConnManager");
               string strProcName = "SP_Select<xsl:value-of select="/NewDataSet/TableName"/>";
               DbCommand cmdProc = db.GetStoredProcCommand(strProcName);
               db.AddInParameter(cmdProc, "@Sort", DbType.Boolean);
               db.AddInParameter(cmdProc, "@SortField", DbType.String);
               db.AddInParameter(cmdProc, "@PageSize", DbType.String);
               db.AddInParameter(cmdProc, "@CurrentPage", DbType.String);
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:if test="IsUse = 'true'">
               db.AddInParameter(cmdProc, "@<xsl:value-of select="FieldName"/>", DbType.<xsl:value-of select="FieldType"/>);
  </xsl:if>
</xsl:for-each>
               db.AddOutParameter(cmdProc, "@RecordCount", DbType.Int32, 4);
               if (htInputParameter["Sort"] != null)
               {
                   db.SetParameterValue(cmdProc, "@Sort", Boolean.Parse((string)htInputParameter["Sort"]));
               }
               db.SetParameterValue(cmdProc, "@SortField", (string)htInputParameter["SortField"]);
               if (htInputParameter["PageSize"] != null)
               {
                   db.SetParameterValue(cmdProc, "@PageSize", Int32.Parse((string)htInputParameter["PageSize"]));
               }
               if (htInputParameter["CurrentPage"] != null)
               {
                   db.SetParameterValue(cmdProc, "@CurrentPage", Int32.Parse((string)htInputParameter["CurrentPage"]));
               }
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:if test="IsUse = 'true'">
    <xsl:choose>
      <xsl:when test="IsString = 'true'">
               db.SetParameterValue(cmdProc, "@<xsl:value-of select="FieldName"/>", (string)htInputParameter["<xsl:value-of select="FieldName"/>"]);
      </xsl:when>
      <xsl:otherwise>
               if (htInputParameter["<xsl:value-of select="FieldName"/>"] != null)
               {
                   db.SetParameterValue(cmdProc, "@<xsl:value-of select="FieldName"/>", (string)htInputParameter["<xsl:value-of select="FieldName"/>"]);
               }
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
</xsl:for-each>
               htInputParameter[ConstantsManager.QUERY_DATASET_NAME] = db.ExecuteDataSet(cmdProc);
               htInputParameter[ConstantsManager.RECORD_COUNT] = db.GetParameterValue(cmdProc, "@RecordCount");
               return htInputParameter;
           }
           catch (Exception)
           {
               throw;
           }
       }
   }
}
</xsl:template>
</xsl:stylesheet>