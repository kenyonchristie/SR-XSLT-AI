<?xml version="1.0" encoding="utf-8"?>
<!--Create an XSL stylesheet that contains the following attribute sets:

page-size 
page-geometry
title-1
title-2
para
box
graphic
caption

The attribute sets contain attributes to accomplish the following:
page-size:  8.5in x 11in
page-geometry: 0.75in for top margin and 0.5in for the rest of the margins


font-family values are Helvetica for titles, Arial for caption, and Times New Roman for para
font-weight is bold for titles and caption
font-size is 12pt for para, 8pt for caption, 16pt for title-2, and 18pt for title-1
space-before is 1pc for para, 0.25pc for caption, and 1.5pc for title-2
space-after is 1.5pc for title-1
text-align is justify for para, center for title-1 and box and graphic and caption, and left for title-2
all titles have keep-with-next value of always
title-1 has a bottom border that is solid 1pt black
box has padding before and after of 0.25in
graphic has width of 6.5in, height of 3.5in and alignment adjustment of central-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" indent="yes" encoding="utf-8"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:attribute-set name="page-size">
        <!--manual prompt to get correct output-->
        <xsl:attribute name="page-width">8.5in</xsl:attribute>
        <xsl:attribute name="page-height">11in</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="page-geometry">
        <xsl:attribute name="margin-top">0.75in</xsl:attribute>
        <xsl:attribute name="margin-bottom">0.5in</xsl:attribute>
        <xsl:attribute name="margin-left">0.5in</xsl:attribute>
        <xsl:attribute name="margin-right">0.5in</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="title-1">
        <xsl:attribute name="font-family">Helvetica</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <xsl:attribute name="space-before">1.5pc</xsl:attribute>
        <xsl:attribute name="space-after">1.5pc</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
        <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
        <xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
        <xsl:attribute name="border-bottom-color">black</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="title-2">
        <xsl:attribute name="font-family">Helvetica</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size">16pt</xsl:attribute>
        <xsl:attribute name="space-before">1.5pc</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="para">
        <xsl:attribute name="font-family">Times New Roman</xsl:attribute>
        <xsl:attribute name="font-size">12pt</xsl:attribute>
        <xsl:attribute name="space-before">1pc</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="box">
        <xsl:attribute name="padding-top">0.25in</xsl:attribute>
        <xsl:attribute name="padding-bottom">0.25in</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="graphic">
        <xsl:attribute name="content-width">6.5in</xsl:attribute><!--DEV INTERVENTION CORRECT WIDTH AND HEIGHT TO ADD CONTENT- PREFIX-->
        <xsl:attribute name="content-height">3.5in</xsl:attribute>
        <xsl:attribute name="alignment-adjust">central</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="caption">
        <xsl:attribute name="font-family">Arial</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size">8pt</xsl:attribute>
        <xsl:attribute name="space-before">0.25pc</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
    </xsl:attribute-set>
</xsl:stylesheet><!--manuall prompt after this part-->