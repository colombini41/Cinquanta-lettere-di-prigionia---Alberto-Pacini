<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"  
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  xmlns:req="http://www.armatiek.com/xslweb/request"
  xmlns:resp="http://www.armatiek.com/xslweb/response"   
  exclude-result-prefixes="#all"
  expand-text="yes"
  version="3.0">
  
  <xsl:output method="html" indent="yes" omit-xml-declaration="yes"/>
  
  <xsl:mode name="html" on-no-match="shallow-copy"/>
  
  <xsl:template match="/">
    <resp:response status="200">
      <resp:headers>
        <resp:header name="Content-Type">text/xml</resp:header>
      </resp:headers>
      <resp:body>
        <xsl:call-template name="file"/>
      </resp:body>
    </resp:response>          
  </xsl:template>
  
  <xsl:template name="file">
    <xsl:variable name="path" as="xs:string" select="/req:request/req:path"/>
    <xsl:copy-of select="doc('workshop' || $path)"/>
  </xsl:template>
  
</xsl:stylesheet>