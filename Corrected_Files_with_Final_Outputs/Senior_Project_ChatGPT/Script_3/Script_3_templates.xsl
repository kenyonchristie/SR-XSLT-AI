<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">
    
    <!-- Include for xsl stylesheet "Script_3_attributes.xsl" -->
    <xsl:include href="Script_3_attributes.xsl"/>
    
    <!-- Template for content -->
    <xsl:template match="content">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="content-page"
                    xsl:use-attribute-sets = "page-size page-geometry"><!--DEVELOPER INTERVENTION TO CORRECT FROM ATTRIBUTE VALUES OF PAGE-WIDTH, PAGE-HEIGHT-->
                    <fo:region-body margin-top="0.25in" margin-bottom="0.25in"/>
                    <fo:region-before extent="0.25in"/>
                    <fo:region-after extent="0.25in"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="content-page">
                <fo:flow flow-name="xsl-region-body">
                    <xsl:apply-templates/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
    
    <!-- Template for description -->
    <xsl:template match="description">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Template for levelledPara -->
    <xsl:template match="levelledPara">
        <fo:block id="{generate-id()}">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    <!-- Template for title -->
    <xsl:template match="title">
        <fo:block xsl:use-attribute-sets="title">
            <xsl:value-of select="."/>
        </fo:block>
    </xsl:template>
    
    <!-- Template for para -->
    <xsl:template match="para">        
        <fo:block xsl:use-attribute-sets="para"><!---DEVELOPER INTERVENTION TO REFACTOR, AI DESIGN RESULTED IN TRANSFORMATION ERROR-->
            <xsl:if test="count(child::sequentialList)>0">
                <xsl:attribute name="space-after">1pc</xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </fo:block>        
    </xsl:template>
    
    <!-- Template for sequentialList -->
    <xsl:template match="sequentialList">
        <fo:block space-before="1pc">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    <!-- Template for listItem -->
    <xsl:template match="listItem">
        <fo:list-block  space-after="6pt"
            start-indent="1"
            border="1pt solid black" background-color="#C5C5C5" padding-right=".15in"> <!---DEVELOPER INTERVENTION TO REMOVE PROVISIONAL SPACING ATTRIBUTES AND MAKE THEM START-INDENTS ON FO:LISTITEM AND FO:LIST-ITEM-BODY BCZ OUTPUTTING INCORR INDENTS-->
            <fo:list-item start-indent="5mm">
                <fo:list-item-label end-indent="label-end()">
                    <fo:block>
                        <xsl:number from="sequentialList" level="any" count="listItem" format="1. "/><!--DEVELOPER INTERVENTION TO ADD FORMAT, OMITTED FROM PROMPT SO NO PENALTY BUT ALSO HAD TO ADD FROM TO CREATE RENUMBERING FOR EACH SEQ LIST, WHICH WAS ON PROMPT, SO PENALTY APPLIES-->
                    </fo:block>
                </fo:list-item-label>
                <fo:list-item-body start-indent="10mm">
                    <xsl:apply-templates/>
                </fo:list-item-body>
            </fo:list-item>
        </fo:list-block>
    </xsl:template>
</xsl:stylesheet>