<xsl:transform
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  extension-element-prefixes="ixsl"
  expand-text="yes"
  version="3.0"
  >
  
  <xsl:template name="xsl:initial-template">
    <!-- Nothing yet; we need this template because we do not pass sourceLocation to the call of SaxonJS.transform() in the calling HTML file. -->
  </xsl:template>
  
  <!-- Toggle the value of the class attribute of the context element to d-none or d-block -->
  <xsl:template name="hide-or-show">
    <ixsl:set-attribute name="class"
      select="if (@class eq 'd-none')
      then 'd-block'
      else 'd-none'"/>
  </xsl:template>
  
  <xsl:template match="button[@name eq 'toggle-clickbait1']" mode="ixsl:onclick">
    <xsl:for-each select="id('clickbait1')">
      <xsl:call-template name="hide-or-show"/>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template match="button[@name eq 'toggle-clickbait2']" mode="ixsl:onclick">
    <xsl:for-each select="//*[matches(@id, 'clickbait\d+')]">
      <xsl:call-template name="hide-or-show"/>
    </xsl:for-each>
  </xsl:template>
  
</xsl:transform>	
