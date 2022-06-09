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
  
  <xsl:template match="div[@id eq 'mousehouse']" mode="ixsl:onmousemove">
    <xsl:variable name="mouse-image" as="element(img)" select="//img[@id eq 'mouse']"/>
    
    <xsl:variable name="ev" select="ixsl:event()" as="item()"/>    
    <xsl:variable name="x" select="ixsl:get($ev, 'clientX')" as="xs:double"/>
    <xsl:variable name="y" select="ixsl:get($ev, 'clientY')" as="xs:double"/>
    
    <ixsl:set-style name="left" select="$x || 'px'" object="$mouse-image"/>
    <ixsl:set-style name="top" select="$y  || 'px'" object="$mouse-image"/>
  </xsl:template>
  
</xsl:transform>	
