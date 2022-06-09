<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"  
  xmlns:req="http://www.armatiek.com/xslweb/request"
  xmlns:pipeline="http://www.armatiek.com/xslweb/pipeline"
  xmlns:config="http://www.armatiek.com/xslweb/configuration"
  exclude-result-prefixes="#all"
  version="3.0">
  
  <xsl:template match="/">
    <pipeline:pipeline>
      <xsl:apply-templates/>
    </pipeline:pipeline>
  </xsl:template>
  
  <xsl:template match="/req:request[req:path eq '/']">
    <pipeline:transformer name="main-styleheet" xsl-path="main-stylesheet.xslt"/>
  </xsl:template>

  <xsl:template match="/req:request[starts-with(req:path, '/html/')]">
    <pipeline:transformer name="html" xsl-path="show-html.xslt"/>
  </xsl:template>
  
  <xsl:template match="/req:request[matches(req:path, '/xslt/.*\.xslt$')]">
    <pipeline:transformer name="html" xsl-path="show-xslt.xslt"/>
  </xsl:template>
  
  <xsl:template match="/req:request[matches(req:path, '.*\.sef\.json$')]">   
    <pipeline:pipeline>
      <pipeline:stylesheet-export-file name="sef" xsl-path="workshop/{replace(req:path, '^(.*)\.sef\.json$', '$1.xslt')}"/>
    </pipeline:pipeline>
  </xsl:template>
  
</xsl:stylesheet>