<xsl:transform
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:da="http://declarative.amsterdam/saxonjs"
  xmlns:svg="http://www.w3.org/2000/svg"
  exclude-result-prefixes="xs"
  extension-element-prefixes="ixsl"
  expand-text="yes"
  version="3.0"
  >
  
  <xsl:variable name="DEBUGGING" select="false()" static="yes"/>
  
  <!-- The lower the value, the faster the rectangles will move. You may even give each rectangle its own speed. -->
  <xsl:param name="WAIT-TIME-RECT1" as="xs:integer" select="50"/>
  <xsl:param name="WAIT-TIME-RECT2" as="xs:integer" select="$WAIT-TIME-RECT1"/>
  
  <!-- Make sure to define delta in such a way that the initial x coordinates of the rectangles is reached.
       Otherwise, movement will stop before reaching the exact position.
       In our example since the svg values for x are 0 and 1750, delta values like 10, 50 and 175 will do.
  -->
  <xsl:param name="DELTA-X-RECT1" as="xs:integer" select="10"/>
  <xsl:param name="DELTA-X-RECT2" as="xs:integer" select="-1 * $DELTA-X-RECT1"/>
  
  <xsl:template name="xsl:initial-template">
    <xsl:variable name="rect1" as="element(svg:rect)" select="id('rect1', ixsl:page())"/>
    <xsl:variable name="rect2" as="element(svg:rect)" select="id('rect2', ixsl:page())"/>
    
    <ixsl:schedule-action wait="$WAIT-TIME-RECT1">
      <xsl:call-template name="move-rect">
        <xsl:with-param name="wait-time" as="xs:integer" select="$WAIT-TIME-RECT1"></xsl:with-param>
        <xsl:with-param name="delta-x" as="xs:integer" select="$DELTA-X-RECT1"/>
        <xsl:with-param name="target-x" as="xs:integer" select="$rect2/@x"/>
        <xsl:with-param name="rect" as="element(svg:rect)" select="$rect1"/>
      </xsl:call-template>
    </ixsl:schedule-action>
    
    <ixsl:schedule-action wait="$WAIT-TIME-RECT2">
      <xsl:call-template name="move-rect">
        <xsl:with-param name="wait-time" as="xs:integer" select="$WAIT-TIME-RECT2"></xsl:with-param>
        <xsl:with-param name="delta-x" as="xs:integer" select="$DELTA-X-RECT2"/>
        <xsl:with-param name="target-x" as="xs:integer" select="$rect1/@x"/>
        <xsl:with-param name="rect" as="element(svg:rect)" select="$rect2"/>
      </xsl:call-template>
    </ixsl:schedule-action>
  </xsl:template>
  
  <xsl:template name="move-rect">
    <xsl:param name="wait-time" as="xs:integer" required="yes"/>
    <xsl:param name="delta-x" as="xs:integer" required="yes"/>
    <xsl:param name="target-x" as="xs:integer" required="yes"/>
    <xsl:param name="rect" as="element(svg:rect)" required="yes"/>
    
    <xsl:variable name="old-x" as="xs:integer" select="$rect/@x"/>
    <xsl:variable name="new-x" as="xs:integer" select="$old-x + $delta-x"/>    
    <xsl:variable name="go-on" as="xs:boolean" select="if ($delta-x gt 0) then ($target-x - $new-x) ge 0 else ($new-x - $target-x) ge 0"/>
    
    <xsl:message use-when="$DEBUGGING">id={$rect/@id}, target-x={$target-x}, new-x={$new-x}, go-on={$go-on}</xsl:message>
    
    <xsl:if test="$go-on">
      <ixsl:set-attribute name="x" select="string($new-x)" object="$rect"/>
      
      <ixsl:schedule-action wait="$wait-time">
        <xsl:call-template name="move-rect">
          <xsl:with-param name="wait-time" as="xs:integer" select="$wait-time"></xsl:with-param>
          <xsl:with-param name="delta-x" as="xs:integer" select="$delta-x"/>
          <xsl:with-param name="target-x" as="xs:integer" select="$target-x"/>
          <xsl:with-param name="rect" as="element(svg:rect)" select="$rect"/>
        </xsl:call-template>
      </ixsl:schedule-action>
    </xsl:if>
  </xsl:template>
  
</xsl:transform>	
