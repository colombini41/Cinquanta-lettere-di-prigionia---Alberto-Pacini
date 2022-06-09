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
  
  <xsl:param name="NUM-IMAGES" as="xs:integer" select="3"/>
  <xsl:param name="WAIT-TIME" as="xs:integer" select="200"/>
  <xsl:param name="MAX-ITERATIONS" as="xs:integer" select="75"/>
  <xsl:param name="DELTA-X" as="xs:integer" select="5"/>
  
  <xsl:template name="xsl:initial-template">
    <xsl:variable name="the-image" as="element(img)" select="id('image', ixsl:page())"/>
    <ixsl:schedule-action wait="$WAIT-TIME">
      <xsl:call-template name="move-image">
        <xsl:with-param name="iteration" as="xs:integer" select="0"/>
        <xsl:with-param name="the-image" as="element(img)" select="$the-image"/>
      </xsl:call-template>
    </ixsl:schedule-action>
  </xsl:template>
  
  <xsl:template name="move-image">
    <xsl:param name="iteration" as="xs:integer" required="yes"/>
    <xsl:param name="the-image" as="element(img)" required="yes"/>
    
    <xsl:variable name="new-iteration" as="xs:integer" select="$iteration + 1"/>
    <xsl:variable name="new-imagenum" as="xs:integer" select="($new-iteration mod $NUM-IMAGES) + 1"/>
    
    <xsl:variable name="new-image-src" as="xs:string" select="replace($the-image/@src, '^(.*)\d+(\.png)$', '$1' || $new-imagenum || '$2')"/>
    
    <ixsl:set-attribute name="src" select="$new-image-src" object="$the-image"/>
    <ixsl:set-style name="left" select="$new-iteration * $DELTA-X || 'px'" object="$the-image"/>
    
    <xsl:if test="$new-iteration le $MAX-ITERATIONS">
      <ixsl:schedule-action wait="$WAIT-TIME">
        <xsl:call-template name="move-image">
          <xsl:with-param name="iteration" as="xs:integer" select="$new-iteration"/>
          <xsl:with-param name="the-image" as="element(img)" select="$the-image"/>
        </xsl:call-template>
      </ixsl:schedule-action>
    </xsl:if>
  </xsl:template>
  
</xsl:transform>	
