<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0"><!--DEVELOPER INTERVENTION CORR SYNTAX-->
    <xsl:include href="Script_3_attributes.xsl"/>
    
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="simpleA" xsl:use-attribute-sets ="page-geometry page-size"><!--DEVELOPER INTERVENTION CORR ATTRIBUTE SET CREATION TO USE; REFACTORED REST OF THIS TEMPLATE DUE TO TRANSFORMATION ERRORS-->
                    <fo:region-body region-name="body"/>
                    <fo:region-before region-name="header" extent="0.25in"/>
                    <fo:region-after region-name="footer" extent="0.25in"/>
                </fo:simple-page-master>
                <fo:page-sequence-master master-name="voyager">
                    <fo:repeatable-page-master-reference master-reference="simpleA"/>
                </fo:page-sequence-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="voyager">
                <fo:static-content flow-name="footer">
                    <fo:block text-align="center" font-weight="bold">
                        <fo:page-number/>
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="body">
                    <fo:block>
                        <xsl:apply-templates/>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
    
    <xsl:template match="para">
        <fo:block font-size="14pt" font-family="Century Gothic, sans-serif" text-align="justify" space-before="1pc" space-after="0.25pc" xsl:use-attribute-sets="para">
            <xsl:if test="child::sequentialList"><!---DEVELOPER INTERVENTION TO MOVE THIS TO BEFORE APPLY-TEMPLATES AND TO ADD AXIS-->
                <xsl:attribute name="space-after">1pc</xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="node()"/>
        </fo:block>
    </xsl:template>
    
    <!--DEVELOPER INTERVENTION ADD MISSING TITLE TEMPLATE W/ATTRIBUTE-SET-->
    <xsl:template match="title">
        <fo:block xsl:use-attribute-sets="title">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="listItem">
        <fo:list-block margin-bottom="6pt" background-color="#C5C5C5" padding-right="0.15in" border="1pt solid black"><!--DEVELOPER INTERVENTION REMOVE START ATTRIBUTE BCZ ALREADY ON SET AND MOVE BORDERING ATTRIBUTES FROM LABEL, CORR BORDER-RIGHT TO BORDER-->
           <fo:list-item start-indent="5mm">
            <xsl:attribute name="id">
                <xsl:value-of select="generate-id()"/>
            </xsl:attribute>
            <fo:list-item-label end-indent="label-end()"><!--DEVELOPER INTERVENTION REMOVE ANOTHER DUPLICATE ATTRIBUTE ENTRY AND ADD REQ'D FO:LIST-ITEM-->
                <fo:block>
                    <xsl:number from="sequentialList" level="any" count="listItem" format="1. "/><!--DEVELOPER INTERVENTION TO FIX FORMAT (DEV ERROR) AND ADD NUMBER FROM BCZ START WASN'T WORKING-->
                </fo:block>
            </fo:list-item-label>
            <fo:list-item-body start-indent="10mm">
                <xsl:apply-templates select="para"/>
            </fo:list-item-body>
           </fo:list-item>
        </fo:list-block>
    </xsl:template>
    
    <xsl:template match="sequentialList">
        <fo:block space-before="1pc">
            <xsl:apply-templates select="listItem"/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="levelledPara">
        <fo:block id="{generate-id()}"><!--DEVELOPER INTERVENTION REMOVE USE-ATTRIBUTE-SET FOR LEVELLEDPARA BCZ ATTRIBUTE-SET WAS DELETED, WAS DUPLICATION OF ATTRIBUTE ON BLOCK HERE-->
            <xsl:apply-templates select="title"/>
            <xsl:apply-templates select="para"/>
        </fo:block>
    </xsl:template>
    
    
  <!--DEVELOPER INTERVENTION REMOVE DUPLICATE ATTRIBUTE-SETS-->
    
</xsl:stylesheet>
