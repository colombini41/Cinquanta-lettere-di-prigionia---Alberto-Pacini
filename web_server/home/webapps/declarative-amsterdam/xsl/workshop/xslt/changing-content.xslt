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
  
  <xsl:template match="button[@name eq 'add-message']" mode="ixsl:onclick">
    <!-- Get a the text field: -->
    <xsl:variable name="input" as="element(input)" select="id('message')"/>
    
    <!-- Determine if the checkbox is checked or not: -->
    <xsl:variable name="append-content" as="xs:boolean?" select="ixsl:get(id('append-content'), 'checked')"/>
   
   <!-- The method attribute of <xsl:result-document> can have two special values in SaxonJS: ixsl:append-content or ixsl:replace-content.
        The href attribute can be an id referring to some element. Alternatively, you can use href="?." in order to create output below
        the context element.
   -->
   <xsl:result-document href="#messages" method="{if ($append-content) then 'ixsl:append-content' else 'ixsl:replace-content'}">
     <p>{ixsl:get($input, 'value')}</p>
   </xsl:result-document>
    
    <!-- Erase the message -->
    <ixsl:set-property name="value" select="''" object="$input"/>
 </xsl:template>
  
</xsl:transform>	
