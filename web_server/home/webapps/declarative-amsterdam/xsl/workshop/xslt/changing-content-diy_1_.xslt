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
  <xsl:mode name="html" on-no-match="shallow-copy"/>
  
  <xsl:template name="xsl:initial-template">
    <!-- Nothing yet; we need this template because we do not pass sourceLocation to the call of SaxonJS.transform() in the calling HTML file. -->
  </xsl:template>
  
  <xsl:template match="button[@name eq 'add-message']" mode="ixsl:onclick">
    <xsl:variable name="textarea" as="element(textarea)" select="id('message')"/>
    
   <xsl:result-document href="#messages" method="ixsl:replace-content">
     <xsl:variable name="text" as="xs:string" select="ixsl:get($textarea, 'value')"/>
         <p>{$text}</p>
   </xsl:result-document>
 </xsl:template>
  
</xsl:transform>	
