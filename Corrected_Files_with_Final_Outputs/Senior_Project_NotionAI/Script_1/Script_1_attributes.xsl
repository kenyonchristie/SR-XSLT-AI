<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><!--DEVELOPER INTERVENTION TO ADD REQ'D XSL:STYLESHEET ROOT TAGS-->
    <xsl:attribute-set name="page-size">
        <xsl:attribute name="width">8.5in</xsl:attribute>
        <xsl:attribute name="height">11in</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="page-geometry">
        <xsl:attribute name="margin-top">1in</xsl:attribute>
        <xsl:attribute name="margin-bottom">1in</xsl:attribute>
        <xsl:attribute name="margin-left">1in</xsl:attribute>
        <xsl:attribute name="margin-right">1in</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="title-1">
        <xsl:attribute name="font-family">Century Gothic</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <xsl:attribute name="background-color">#C5C5C5</xsl:attribute>
        <xsl:attribute name="border-top-style">solid</xsl:attribute>
        <xsl:attribute name="border-top-width">1pt</xsl:attribute>
        <xsl:attribute name="border-top-color">black</xsl:attribute>
        <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
        <xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
        <xsl:attribute name="border-bottom-color">black</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
        <xsl:attribute name="vertical-align">middle</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="title-2">
        <xsl:attribute name="font-family">Century Gothic</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size">16pt</xsl:attribute>
        <xsl:attribute name="space-before">1.5pc</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="title-3">
        <xsl:attribute name="font-family">Century Gothic</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size">14pt</xsl:attribute>
        <xsl:attribute name="space-before">1.5pc</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="para">
        <xsl:attribute name="font-family">Century Schoolbook</xsl:attribute>
        <xsl:attribute name="font-size">12pt</xsl:attribute>
        <xsl:attribute name="space-before">1pc</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
    </xsl:attribute-set>
    
</xsl:stylesheet>