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
    <xsl:message>Coming to life again...</xsl:message>
  </xsl:template>
  
  <xsl:template match="button" mode="ixsl:onclick">
    <xsl:message>Hello again, Saxon-JS!</xsl:message>
  </xsl:template>

</xsl:transform>	
