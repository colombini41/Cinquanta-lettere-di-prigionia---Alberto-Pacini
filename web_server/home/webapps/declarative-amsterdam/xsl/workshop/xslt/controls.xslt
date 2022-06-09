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
  
  <xsl:template match="*[@id eq 'cb']" mode="ixsl:onchange">
    <xsl:result-document href="#cb-text" method="ixsl:replace-content">Checkbox checkedness is now <span class="standout">{ixsl:get(.,'checked')}</span></xsl:result-document>
  </xsl:template>
  
  <xsl:template match="*[@name eq 'rad']" mode="ixsl:onchange">
    <xsl:result-document href="#rad-text" method="ixsl:replace-content">Radio value is now  <span class="standout">{ixsl:get(., 'value')}</span></xsl:result-document>
  </xsl:template>
  
  <xsl:function name="da:get-selected-values" as="xs:string*">
    <xsl:param name="sel" as="element(select)"/>
    <xsl:sequence select="for $o in $sel/option[ixsl:get(., 'selected')] return $o/@value"/>
  </xsl:function>
  
  <xsl:template match="*[@id eq 'sel1']" mode="ixsl:onchange">
    <xsl:result-document href="#sel1-text" method="ixsl:replace-content">Value of single select is now <span class="standout">{ixsl:get(., 'value')}</span></xsl:result-document>
  </xsl:template>
  
  <xsl:template match="*[@id eq 'sel2']" mode="ixsl:onchange">
    <xsl:result-document href="#sel2-text" method="ixsl:replace-content">Value of multiple select is now <span class="standout">[{string-join(da:get-selected-values(.), ', ')}]</span></xsl:result-document>
  </xsl:template>
  
</xsl:transform>	
