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
  
  <xsl:template match="button[@data-type eq 'tabbutton']" mode="ixsl:onclick">
    <xsl:variable name="button-number" as="xs:integer" select="count(preceding-sibling::button)"/>
    <xsl:for-each select="//div[@data-type eq 'tabcontent']">
      <ixsl:set-attribute name="class"
        select="if (count(preceding-sibling::div[@data-type eq 'tabcontent']) eq $button-number)
                then 'd-block'
                else 'd-none'"
      />
    </xsl:for-each>
  </xsl:template>
  
</xsl:transform>	
