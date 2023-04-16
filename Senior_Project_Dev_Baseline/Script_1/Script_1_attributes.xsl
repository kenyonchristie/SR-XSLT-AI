<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:attribute-set name="page-size">
        <xsl:attribute name="page-width">8.5in</xsl:attribute>
        <xsl:attribute name="page-height">11in</xsl:attribute>
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
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="border-color">black</xsl:attribute>
        <xsl:attribute name="border-top-style">solid</xsl:attribute>  
        <xsl:attribute name="border-top-width">1pt</xsl:attribute>
         <xsl:attribute name="border-bottom-style">solid</xsl:attribute>   
         <xsl:attribute name="border-bottom-width">1pt</xsl:attribute> 
         <xsl:attribute name="keep-with-next">always</xsl:attribute>
         <xsl:attribute name="background-color">#C5C5C5</xsl:attribute>
         <xsl:attribute name="display-align">center</xsl:attribute>         
         <xsl:attribute name="space-after">1.5pc</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="title-2">
        <xsl:attribute name="font-family">Century Gothic</xsl:attribute>  
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size">16pt</xsl:attribute>  
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="space-before">1.5pc</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="title-3">
        <xsl:attribute name="font-family">Century Gothic</xsl:attribute>  
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size">14pt</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="space-before">1.5pc</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>
    
     <xsl:attribute-set name="para">
        <xsl:attribute name="font-family">Century Schoolbook</xsl:attribute>  
        <xsl:attribute name="font-size">12pt</xsl:attribute>
        <xsl:attribute name="space-before">1pc</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
    </xsl:attribute-set>
    
</xsl:stylesheet>