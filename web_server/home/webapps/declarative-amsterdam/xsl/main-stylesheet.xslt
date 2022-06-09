<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"  
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  xmlns:req="http://www.armatiek.com/xslweb/request"
  xmlns:resp="http://www.armatiek.com/xslweb/response"   
  exclude-result-prefixes="#all"
  version="3.0">
  
  <xsl:output method="xhtml" indent="yes" omit-xml-declaration="yes"/>
  
  <xsl:template match="/">
    <resp:response status="200">
      <resp:body>
        <xsl:call-template name="body"/>
      </resp:body>
    </resp:response>          
  </xsl:template>
  
  <xsl:template name="body">
    <html>
      <head>
        <title>Declarative Amsterdam Saxon-JS web application</title>
        <link rel="stylesheet" href="/declarative-amsterdam/css/workshop-saxonjs.css"/>
      </head>
      <body>        
        <h1>Declarative Amsterdam Saxon-JS web application</h1>
        <p>These are the samples we are going to work with:</p>
        <xsl:apply-templates select="doc('workshop/xml/workshop.xml')" mode="exercises"/>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="exercises" mode="exercises">
    <ol><xsl:apply-templates mode="exercises"/></ol>
  </xsl:template>
  
  <xsl:template match="exercise" mode="exercises">
    <li><a href="/declarative-amsterdam/html/{@file}"><xsl:apply-templates mode="exercises"/></a></li>
  </xsl:template>
  
</xsl:stylesheet>