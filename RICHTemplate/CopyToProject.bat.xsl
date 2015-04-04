<?xml version="1.0" encoding="gb2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="GB2312"/>
<xsl:variable name="FileName" select="'WebUIAdd.aspx.xsl'"/>
<xsl:template match="/">
@ECHO ON
cd %cd%\<xsl:value-of select="/NewDataSet/TableName"/>
@ECHO ��ʼ����<xsl:value-of select="/NewDataSet/TableName"/>
@ECHO ��ʼ����<xsl:value-of select="/NewDataSet/TableName"/>ҳ���ļ�
copy <xsl:value-of select="/NewDataSet/TableName"/>WebUIAdd.aspx <xsl:value-of select="/NewDataSet/ProjectPath"/>\wwwroot\Administrator\A_BM\
copy <xsl:value-of select="/NewDataSet/TableName"/>WebUIAdd.aspx.cs <xsl:value-of select="/NewDataSet/ProjectPath"/>\wwwroot\Administrator\A_BM\
copy <xsl:value-of select="/NewDataSet/TableName"/>WebUIDetail.aspx <xsl:value-of select="/NewDataSet/ProjectPath"/>\wwwroot\Administrator\A_BM\
copy <xsl:value-of select="/NewDataSet/TableName"/>WebUIDetail.aspx.cs <xsl:value-of select="/NewDataSet/ProjectPath"/>\wwwroot\Administrator\A_BM\
copy <xsl:value-of select="/NewDataSet/TableName"/>WebUIImage.aspx <xsl:value-of select="/NewDataSet/ProjectPath"/>\wwwroot\Administrator\A_BM\
copy <xsl:value-of select="/NewDataSet/TableName"/>WebUIImage.aspx.cs <xsl:value-of select="/NewDataSet/ProjectPath"/>\wwwroot\Administrator\A_BM\
copy <xsl:value-of select="/NewDataSet/TableName"/>WebUISearch.aspx <xsl:value-of select="/NewDataSet/ProjectPath"/>\wwwroot\Administrator\A_BM\
copy <xsl:value-of select="/NewDataSet/TableName"/>WebUISearch.aspx.cs <xsl:value-of select="/NewDataSet/ProjectPath"/>\wwwroot\Administrator\A_BM\
copy <xsl:value-of select="/NewDataSet/TableName"/>WebUIStatistic.aspx <xsl:value-of select="/NewDataSet/ProjectPath"/>\wwwroot\Administrator\A_BM\
copy <xsl:value-of select="/NewDataSet/TableName"/>WebUIStatistic.aspx.cs <xsl:value-of select="/NewDataSet/ProjectPath"/>\wwwroot\Administrator\A_BM\
copy <xsl:value-of select="/NewDataSet/TableName"/>WebUITreeSearch.aspx <xsl:value-of select="/NewDataSet/ProjectPath"/>\wwwroot\Administrator\A_BM\
copy <xsl:value-of select="/NewDataSet/TableName"/>WebUITreeSearch.aspx.cs <xsl:value-of select="/NewDataSet/ProjectPath"/>\wwwroot\Administrator\A_BM\
copy <xsl:value-of select="/NewDataSet/TableName"/>WebUIListAJAX.aspx <xsl:value-of select="/NewDataSet/ProjectPath"/>\wwwroot\Administrator\A_BM\
copy <xsl:value-of select="/NewDataSet/TableName"/>WebUIListAJAX.aspx.cs <xsl:value-of select="/NewDataSet/ProjectPath"/>\wwwroot\Administrator\A_BM\
copy <xsl:value-of select="/NewDataSet/TableName"/>Contants.cs <xsl:value-of select="/NewDataSet/ProjectPath"/>\wwwroot\App_Code\
IF NOT EXIST <xsl:value-of select="/NewDataSet/ProjectPath"/>\wwwroot\Administrator\A_BM\<xsl:value-of select="/NewDataSet/TableName"/>WebUIList.aspx copy <xsl:value-of select="/NewDataSet/TableName"/>WebUIList.aspx <xsl:value-of select="/NewDataSet/ProjectPath"/>\wwwroot\Administrator\A_BM\
IF NOT EXIST <xsl:value-of select="/NewDataSet/ProjectPath"/>\wwwroot\Administrator\A_BM\<xsl:value-of select="/NewDataSet/TableName"/>WebUIList.aspx.cs copy <xsl:value-of select="/NewDataSet/TableName"/>WebUIList.aspx.cs <xsl:value-of select="/NewDataSet/ProjectPath"/>\wwwroot\Administrator\A_BM\
@ECHO ��ʼ����<xsl:value-of select="/NewDataSet/TableName"/>���ļ�
IF NOT EXIST <xsl:value-of select="/NewDataSet/ProjectPath"/>\DataLibrary\<xsl:value-of select="/NewDataSet/TableName"/> MD <xsl:value-of select="/NewDataSet/ProjectPath"/>\DataLibrary\<xsl:value-of select="/NewDataSet/TableName"/>
copy <xsl:value-of select="/NewDataSet/TableName"/>ApplicationData.cs <xsl:value-of select="/NewDataSet/ProjectPath"/>\DataLibrary\<xsl:value-of select="/NewDataSet/TableName"/>\
IF NOT EXIST <xsl:value-of select="/NewDataSet/ProjectPath"/>\DataLibrary\<xsl:value-of select="/NewDataSet/TableName"/>\<xsl:value-of select="/NewDataSet/TableName"/>ApplicationLogic.cs copy <xsl:value-of select="/NewDataSet/TableName"/>ApplicationLogic.cs <xsl:value-of select="/NewDataSet/ProjectPath"/>\DataLibrary\<xsl:value-of select="/NewDataSet/TableName"/>\
copy <xsl:value-of select="/NewDataSet/TableName"/>ApplicationLogicBase.cs <xsl:value-of select="/NewDataSet/ProjectPath"/>\DataLibrary\<xsl:value-of select="/NewDataSet/TableName"/>\
IF NOT EXIST <xsl:value-of select="/NewDataSet/ProjectPath"/>\DataLibrary\<xsl:value-of select="/NewDataSet/TableName"/>\<xsl:value-of select="/NewDataSet/TableName"/>BusinessEntity.cs copy <xsl:value-of select="/NewDataSet/TableName"/>BusinessEntity.cs <xsl:value-of select="/NewDataSet/ProjectPath"/>\DataLibrary\<xsl:value-of select="/NewDataSet/TableName"/>\
copy <xsl:value-of select="/NewDataSet/TableName"/>BusinessEntityBase.cs <xsl:value-of select="/NewDataSet/ProjectPath"/>\DataLibrary\<xsl:value-of select="/NewDataSet/TableName"/>\
IF NOT EXIST <xsl:value-of select="/NewDataSet/ProjectPath"/>\DataLibrary\<xsl:value-of select="/NewDataSet/TableName"/>\<xsl:value-of select="/NewDataSet/TableName"/>WebUI.cs copy <xsl:value-of select="/NewDataSet/TableName"/>WebUI.cs <xsl:value-of select="/NewDataSet/ProjectPath"/>\DataLibrary\<xsl:value-of select="/NewDataSet/TableName"/>\
copy <xsl:value-of select="/NewDataSet/TableName"/>WebUIBase.cs <xsl:value-of select="/NewDataSet/ProjectPath"/>\DataLibrary\<xsl:value-of select="/NewDataSet/TableName"/>\
@ECHO ��ʼ��װ<xsl:value-of select="/NewDataSet/TableName"/>���ݿ�ű�
echo Begin > log.log
for /f "delims=" %%a in ('dir <xsl:value-of select="/NewDataSet/TableName"/>StoreProcedureSQLScriptByOnlyDatabase.sql /s /b') do (sqlcmd -d <xsl:value-of select="/NewDataSet/DataBaseName"/> -i %%a >> log.log)
echo End >> log.log
@ECHO ��ɰ�װ<xsl:value-of select="/NewDataSet/TableName"/>���ݿ�ű�
@ECHO ��ɲ���<xsl:value-of select="/NewDataSet/TableName"/>
exit
</xsl:template>
</xsl:stylesheet>