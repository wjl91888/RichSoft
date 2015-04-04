<?xml version="1.0" encoding="GB2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="GB2312"/>
<xsl:template match="/">
USE [<xsl:value-of select="/NewDataSet/DataBaseName"/>]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--表<xsl:value-of select="/NewDataSet/TableName"/>的插入存储过程
CREATE   PROCEDURE [dbo].[SP_Insert<xsl:value-of select="/NewDataSet/TableName"/>] 
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:choose>
    <xsl:when test="position() = 1">
      <xsl:choose>
        <xsl:when test="IsNull = 'true'">
@<xsl:value-of select="FieldName"/><xsl:value-of select="' '"/><xsl:value-of select="DBType"/><xsl:value-of select="' '"/><xsl:value-of select="SPDataSize"/>  = NULL
        </xsl:when>
        <xsl:otherwise>
,@<xsl:value-of select="FieldName"/><xsl:value-of select="' '"/><xsl:value-of select="DBType"/><xsl:value-of select="' '"/><xsl:value-of select="SPDataSize"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="IsNull = 'true'">
,@<xsl:value-of select="FieldName"/><xsl:value-of select="' '"/><xsl:value-of select="DBType"/><xsl:value-of select="' '"/><xsl:value-of select="SPDataSize"/>  = NULL
      </xsl:when>
      <xsl:otherwise>
,@<xsl:value-of select="FieldName"/><xsl:value-of select="' '"/><xsl:value-of select="DBType"/><xsl:value-of select="' '"/><xsl:value-of select="SPDataSize"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:for-each>
AS
<xsl:for-each select="/NewDataSet/RecordInfo">
IF @<xsl:value-of select="FieldName"/> IS NULL
    SET @<xsl:value-of select="FieldName"/> = <xsl:value-of select="SPDefaultValue"/>
</xsl:for-each>
INSERT INTO [<xsl:value-of select="/NewDataSet/DataBaseName"/>].[dbo].[<xsl:value-of select="/NewDataSet/TableName"/>]
(
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:choose>
    <xsl:when test="position() = 1">
<xsl:value-of select="FieldName"/>
    </xsl:when>
    <xsl:otherwise>
,<xsl:value-of select="FieldName"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:for-each>
)
VALUES
(
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:choose>
    <xsl:when test="position() = 1">
@<xsl:value-of select="FieldName"/>
    </xsl:when>
    <xsl:otherwise>
,@<xsl:value-of select="FieldName"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:for-each>
)

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--表<xsl:value-of select="/NewDataSet/TableName"/>的更新存储过程
CREATE   PROCEDURE [dbo].[SP_Update<xsl:value-of select="/NewDataSet/TableName"/>] 
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:choose>
    <xsl:when test="position() = 1">
@<xsl:value-of select="FieldName"/><xsl:value-of select="' '"/><xsl:value-of select="SPUpdateDataType"/> = NULL
  </xsl:when>
  <xsl:otherwise>
,@<xsl:value-of select="FieldName"/><xsl:value-of select="' '"/><xsl:value-of select="SPUpdateDataType"/> = NULL
    </xsl:otherwise>
  </xsl:choose>
</xsl:for-each>
AS
SET XACT_ABORT ON
BEGIN TRANSACTION
<xsl:for-each select="/NewDataSet/RecordInfo">
  IF @<xsl:value-of select="FieldName"/> IS NOT NULL
  BEGIN
  UPDATE [<xsl:value-of select="/NewDataSet/DataBaseName"/>].[dbo].[<xsl:value-of select="/NewDataSet/TableName"/>]
  SET <xsl:value-of select="FieldName"/> = @<xsl:value-of select="FieldName"/> WHERE ObjectID = @ObjectID
  END
</xsl:for-each>
COMMIT TRANSACTION

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--表<xsl:value-of select="/NewDataSet/TableName"/>的删除存储过程
CREATE   PROCEDURE [dbo].[SP_Delete<xsl:value-of select="/NewDataSet/TableName"/>] 
@ObjectID uniqueidentifier
AS
BEGIN TRANSACTION
DELETE [<xsl:value-of select="/NewDataSet/DataBaseName"/>].[dbo].[<xsl:value-of select="/NewDataSet/TableName"/>]
WHERE ObjectID = @ObjectID
COMMIT TRANSACTION

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--表<xsl:value-of select="/NewDataSet/TableName"/>的查询存储过程
CREATE   PROCEDURE [dbo].[SP_Select<xsl:value-of select="/NewDataSet/TableName"/>] 
<xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:choose>
    <xsl:when test="position() = 1">
@<xsl:value-of select="FieldName"/><xsl:value-of select="' '"/><xsl:value-of select="SPSelectDataType"/> = NULL
  </xsl:when>
  <xsl:otherwise>
,@<xsl:value-of select="FieldName"/><xsl:value-of select="' '"/><xsl:value-of select="SPSelectDataType"/> = NULL
    </xsl:otherwise>
  </xsl:choose>
</xsl:for-each>
, @Sort bit = 0
, @SortField nvarchar(50) = 'ObjectID'
, @PageSize int = 500
, @CurrentPage int = 1
, @RecordCount int Output
AS
DECLARE @SqlText nvarchar(4000) 
DECLARE @ConditionText nvarchar(2000) 
DECLARE @SortText nvarchar(255)
IF @Sort IS NULL 
    SET @Sort = 0
IF @SortField IS NULL 
    SET @SortField = 'ObjectID'
IF @PageSize IS NULL 
    SET @PageSize = 500
IF @CurrentPage IS NULL 
    SET @CurrentPage = 1
SET @SortText = ' ORDER BY ' + @SortField + ' '
IF @Sort = 0
    SET @SortText = @SortText + ' DESC '
ELSE IF @Sort = 1
    SET @SortText = @SortText + ' ASC '
SET @ConditionText = ' ObjectID IS NOT NULL '
<xsl:for-each select="/NewDataSet/RecordInfo">
IF @<xsl:value-of select="FieldName"/> IS NOT NULL
  SET @ConditionText = @ConditionText + ' AND <xsl:value-of select="FieldName"/> = '''+CAST(@<xsl:value-of select="FieldName"/> AS nvarchar(100))+''' '
</xsl:for-each>
SET @SqlText = 'SELECT @RecordCount=COUNT(*) FROM [<xsl:value-of select="/NewDataSet/DataBaseName"/>].[dbo].[<xsl:value-of select="/NewDataSet/TableName"/>] WHERE ' + @ConditionText
EXEC sp_executesql @SqlText,N'@RecordCount int OUTPUT',@RecordCount OUTPUT   --返回@RecordCount
SET @SqlText = 'SELECT TOP ' + CAST(@PageSize AS VARCHAR(10)) + '
  <xsl:for-each select="/NewDataSet/RecordInfo">
  <xsl:choose>
    <xsl:when test="position() = 1">
      <xsl:value-of select="FieldName"/>
    </xsl:when>
    <xsl:otherwise>
      , <xsl:value-of select="FieldName"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:for-each>
FROM [<xsl:value-of select="/NewDataSet/DataBaseName"/>].[dbo].[<xsl:value-of select="/NewDataSet/TableName"/>]
WHERE [ObjectID] NOT IN
( 
SELECT TOP ' + CAST(@PageSize*(@CurrentPage-1) AS VARCHAR(10)) + '
[ObjectID]
FROM [<xsl:value-of select="/NewDataSet/DataBaseName"/>].[dbo].[<xsl:value-of select="/NewDataSet/TableName"/>]
WHERE ' + @ConditionText + ' ' + @SortText + '
)
AND ' + @ConditionText + ' ' + @SortText
PRINT @SqlText
EXECUTE(@SqlText)
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--表[<xsl:value-of select="/NewDataSet/TableName"/>]的判断记录是否存在的存储过程
CREATE   PROCEDURE [dbo].[SP_IsExist<xsl:value-of select="/NewDataSet/TableName"/>] 
@ObjectID nvarchar(50) = NULL,
@IsExist bit OUTPUT
AS
DECLARE @RecordCount int
SELECT @RecordCount = Count(*) 
FROM [<xsl:value-of select="/NewDataSet/DataBaseName"/>].[dbo].[<xsl:value-of select="/NewDataSet/TableName"/>]
WHERE ObjectID = @ObjectID
<![CDATA[
IF @RecordCount > 0
    SET @IsExist = 1
ELSE IF @RecordCount <= 0
    SET @IsExist = 0
]]>
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
</xsl:template>
</xsl:stylesheet>