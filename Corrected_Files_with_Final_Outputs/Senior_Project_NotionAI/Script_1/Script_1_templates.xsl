<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <!--DEVELOPER INTERVENTION TO FIX SYNTAX CHARACTERS FOR NAMESPACES-->
    <xsl:import href="Script_1_attributes.xsl"/>
    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <!--DEVELOPER INTERVENTION TO REMOVE FONT-FAMILY ERRONEOUSLY PLACED HERE O N FO:ROOT-->
            <fo:layout-master-set>
                <fo:simple-page-master master-name="simple" xsl:use-attribute-sets="page-size page-geometry">
                    <!--DEVELOPER INTERVENTION TO REPLACE ERRONEOUS ATTRIBUTES WITH MISSING XSL:ATTRIBUTE-SETS REQUESTED-->
                    <fo:region-body margin-top="0.5in" margin-bottom="0.5in"/>
                    <fo:region-before extent="0.5in"/>
                    <fo:region-after extent="0.5in"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="simple">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="center"/>
                    <!--DEVELOPER INTERVENTION TO REMOVE HEADER NOT REQUESTED-->
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="center"/>
                    <!--DEVELOPER INTERVENTION TO REMOVE FOOTER NOT REQUESTED-->
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block>
                        <!--DEVELOPER INTERVENTION TO ADD MISSING FO:BLOCK CHILD-->
                        <xsl:apply-templates/>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="description | randomList">
        <xsl:apply-templates/>
    </xsl:template>
    <!--DEVELOPER INTERVENTION TO ADD MISSING APPLY-TEMPLATES AND REMOVE LISTITEM BCZ IS ITS OWN TEMPLAGE-->

    <xsl:template match="levelledPara">
        <fo:block id="{@id}">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="title"><!--DEVELOPER INTERVENTION TO ADD CHOOSE CONDITION TO APPLY ALL 3 ATTRIBUTE-SETS AS APPROPRIATE-->
        <xsl:choose>
            <xsl:when test="count(ancestor::levelledPara) = 1">
                <fo:block xsl:use-attribute-sets="title-1">
                    <xsl:apply-templates/>
                </fo:block>
            </xsl:when>
            <xsl:when test="count(ancestor::levelledPara) = 2">
                <fo:block xsl:use-attribute-sets="title-2">
                    <xsl:apply-templates/>
                </fo:block>
            </xsl:when>
            <xsl:otherwise>
                <fo:block xsl:use-attribute-sets="title-3">
                    <xsl:apply-templates/>
                </fo:block>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="para">
        <fo:block xsl:use-attribute-sets="para">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="emphasis">
        <fo:inline>
            <xsl:choose>
                <xsl:when test="@emphasisType = 'em01'">
                    <fo:block font-family="Century Gothic" font-weight="bold" font-size="12pt"
                        color="blue" space-before="0.5pc">
                        <xsl:apply-templates/>
                    </fo:block>
                </xsl:when>
                <xsl:otherwise>
                    <fo:block font-family="Century Gothic" font-weight="bold" font-size="12pt"
                        space-before="0.5pc">
                        <xsl:apply-templates/>
                    </fo:block>
                </xsl:otherwise>
            </xsl:choose>
        </fo:inline>
    </xsl:template>
    
    <xsl:template match="listItem[parent::randomList[@listItemPrefix = 'pf07']]"><!--DEVELOPER INTERVENTION TO ADD xpath axis INFO SO TEMPLATE IS HIT TO OUTPUT LABELING-->
        <fo:list-block margin-bottom="6pt" provisional-distance-between-starts="5mm">
            <fo:list-item>
                <!--DEVELOPER INTERVENTION ADD MISSING FO:LIST-ITEM, REMOVE INVALID APPLY-TEMPLATES-->
                <fo:list-item-label>
                    <!--DEVELOPER INTERVENTION REMOVE INVALID END-INDENT-->
                    <fo:block>
                        <fo:inline>&#9679;</fo:inline>
                        <!--DEVELOPER INTERVENTION TO FIX SYNTAX OF FO:BLOCK ENTRY, ADD FO:INLINE WITH BULLET ENTITY AND REMOVE INVALID ATTRIBUTE-->
                    </fo:block>
                </fo:list-item-label>
                <fo:list-item-body start-indent="10mm">
                    <xsl:apply-templates/>
                </fo:list-item-body>
            </fo:list-item>
        </fo:list-block>
    </xsl:template>
</xsl:stylesheet>
