<xsl:transform
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:da="http://declarative.amsterdam/saxonjs"
  exclude-result-prefixes="xs"
  extension-element-prefixes="ixsl"
  expand-text="yes"
  version="3.0"
  >
  
  <xsl:template name="xsl:initial-template">
    <!-- Nothing yet; we need this template because we do not pass sourceLocation to the call of SaxonJS.transform() in the calling HTML file. -->
  </xsl:template>
  
  <xsl:template match="*[@data-ttref]" mode="ixsl:onmouseover">
    <xsl:variable name="ev" select="ixsl:event()" as="item()"/>    
    <xsl:variable name="x" select="ixsl:get($ev, 'clientX')" as="xs:double"/>
    <xsl:variable name="y" select="ixsl:get($ev, 'clientY')" as="xs:double"/>

    <xsl:variable name="tooltip" as="element()" select="id(@data-ttref)"/>

    <ixsl:set-style name="left" select="$x + 15 || 'px'" object="$tooltip"/>
    <ixsl:set-style name="top" select="$y + 15 || 'px'" object="$tooltip"/>
    <ixsl:set-style name="visibility" select="'visible'" object="$tooltip"/>
  </xsl:template>
  
  <xsl:template match="*[@data-ttref]" mode="ixsl:onmouseout">
    <xsl:variable name="tooltip" as="element()" select="id(@data-ttref)"/>
    <ixsl:set-style name="visibility" select="'hidden'" object="$tooltip"/>
  </xsl:template>
  
</xsl:transform>	
