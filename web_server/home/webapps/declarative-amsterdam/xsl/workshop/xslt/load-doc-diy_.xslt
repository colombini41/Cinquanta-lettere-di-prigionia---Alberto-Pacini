<xsl:transform
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:da="http://declarative.amsterdam/saxonjs"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="xs"
  extension-element-prefixes="ixsl"
  expand-text="yes"
  version="3.0"
  >
  
  <xsl:param name="external-doc" as="xs:string" select="'/declarative-amsterdam/xml/marsman.xml'"/>
  
  <xsl:template name="xsl:initial-template">
    <!-- Nothing yet; we need this template because we do not pass sourceLocation to the call of SaxonJS.transform() in the calling HTML file. -->
  </xsl:template>
  
  <xsl:template match="button[@id eq 'load']" mode="ixsl:onclick">
    <ixsl:schedule-action document="{$external-doc}"><xsl:call-template name="load-document"/></ixsl:schedule-action>
  </xsl:template>
  
  <xsl:template name="load-document">
    <xsl:result-document href="#external-doc" method="ixsl:replace-content">
      <xsl:apply-templates select="doc($external-doc)"/>
    </xsl:result-document>
  </xsl:template>
  
  <!-- Templates for rendering the TEI document: -->
  
  <xsl:template match="tei:TEI">
    <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
    <xsl:apply-templates select="tei:text/tei:body"/>
  </xsl:template>
  
  <xsl:template match="tei:title">
    <h2><xsl:apply-templates/></h2>
  </xsl:template>
  
  <xsl:template match="tei:body">
    <div class="tei-body" style="font-family: roman, 'times new roman', times, serif"><xsl:apply-templates/></div>
    <div style="clear: both"/>
  </xsl:template>
  
  <xsl:template match="tei:div">
    <div class="tei-div" style="float: left; width: 30%"><xsl:apply-templates/></div>
  </xsl:template>
  
  <xsl:template match="tei:head">
    <h3 class="tei-head"><xsl:apply-templates/></h3>
  </xsl:template>
  
  <xsl:template match="tei:lg">
    <div class="tei-lg" style="margin-bottom: 2em;"><xsl:apply-templates/></div>
  </xsl:template>

  <xsl:template match="tei:l">
    <p class="tei-l" style="margin-top: 0; margin-bottom: 0;"><xsl:apply-templates/></p>
  </xsl:template>
  
  <xsl:template match="tei:byline">
    <p class="tei-byline" style="font-style: italic"><xsl:apply-templates/></p>
  </xsl:template>
  
  <xsl:template match="tei:docAuthor/tei:name">
    <span class="tei-docauthor-name" style="font-weight: bold"><xsl:apply-templates/></span>
  </xsl:template>
</xsl:transform>	


