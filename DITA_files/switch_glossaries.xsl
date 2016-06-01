<?xml version="1.0" encoding="UTF-8"?>
<!-- created by wbara --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <xsl:variable name="r_IntGloss" select="doc('./r_IntGloss.xml')"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="term/@conkeyref">
        <xsl:variable name="id" select="tokenize(.,'/')[last()]"/>
        <xsl:attribute name="keyref">
            <xsl:value-of select="$r_IntGloss//term[@id=$id]/@keyref"/>
        </xsl:attribute>  
    </xsl:template>
    
    <xsl:template match="./@class"/>
    
</xsl:stylesheet>