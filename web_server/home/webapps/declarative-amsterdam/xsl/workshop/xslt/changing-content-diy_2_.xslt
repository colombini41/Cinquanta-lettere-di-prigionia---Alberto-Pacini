<xsl:transform
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:err="http://www.w3.org/2005/xqt-errors"
  exclude-result-prefixes="xs"
  extension-element-prefixes="ixsl"
  expand-text="yes"
  version="3.0"
  >
  
  <!-- If we are parsing html and we want to limit supported elements, this declaration filters all unsupported elements. --> 
  <xsl:mode name="html" on-no-match="text-only-copy"/>
  
  <xsl:template name="xsl:initial-template">
    <!-- Nothing yet; we need this template because we do not pass sourceLocation to the call of SaxonJS.transform() in the calling HTML file. -->
  </xsl:template>
  
  <xsl:template match="button[@name eq 'add-message']" mode="ixsl:onclick">
    <xsl:variable name="textarea" as="element(textarea)" select="id('message')"/>
    
    <!-- If you go for the parsing option, here is how to retrieve a checkbox's value: -->
    <xsl:variable name="allow-html" as="xs:boolean?" select="ixsl:get(id('allow-html'), 'checked')"/>
    
    <xsl:result-document href="#messages" method="ixsl:replace-content">
      <xsl:variable name="text" as="xs:string" select="ixsl:get($textarea, 'value')"/>
      <xsl:choose>
        <xsl:when test="not($allow-html)">
          <!-- This situation is if you don't want to parse html, of if the checkbox is off: -->
          <p>{$text}</p>
        </xsl:when>
        <xsl:otherwise>
          <!-- If you want to parse html, here is how you might do it. We use <xsl:try> for feedback in case things go wrong: -->
          <xsl:try>
            <xsl:apply-templates select="parse-xml-fragment($text)" mode="html"/>
            <xsl:catch>
              <p>Parsing the input failed (error message is "{$err:description}")/></p>
            </xsl:catch>
          </xsl:try>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:result-document>
  </xsl:template>
  
  <!-- This template makes sure we only support a limited set of inline elements. -->
  <xsl:template match="b | i | u | sup | sub | text()" mode="html">
    <xsl:copy><xsl:apply-templates mode="html"/></xsl:copy>
  </xsl:template>
  
</xsl:transform>	
