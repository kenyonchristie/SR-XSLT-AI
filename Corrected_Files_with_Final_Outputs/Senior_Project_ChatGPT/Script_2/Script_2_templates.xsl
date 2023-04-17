<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
    <xsl:include href="Script_2_attributes.xsl"/>

    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="simple"
                    xsl:use-attribute-sets="page-size page-geometry">
                    <!--DEVELOPER INTERVENTION TO REPLACE INCORR ATTRIBUTES WITH XSL:ATTRIBUTE SET-->
                    <fo:region-body margin-top="0.25in" margin-bottom="0.25in"/>
                    <fo:region-before extent="0.25in"/>
                    <fo:region-after extent="0.25in"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="simple">
                <!--DEVELOPER INTERVENTION TO MOVE HERE FROM DUPLICATE CONTENT | DESCRIPTION TEMPLATE (REMOVED)-->
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block/>
                    <!--DEVELOPER INTERVENTION REMOVE ATTRIBUTE SET FOR HEADER-->
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block/>
                    <!--DEVELOPER INTERVENTION REMOVE ATTRIBUTE SET FOR FOOTER-->
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block>
                        <xsl:apply-templates/>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="content | description | captionLine">
        <!--DEVELOPER INTERVENTION REMOVE LEVELLEDPARA, CAPTION, TITLE, TGROUP, COLSPE, TBODY, ROW, ENTRY, FIGURE, GRAPHIC-->
        <fo:block>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="figure">
        <!--DEVELOPER INTERVENTION TO ADD SEPARATE FIGURE/GRAPHIC W/REQ'D ATTRIBUTES-->
        <xsl:for-each select="child::graphic">
            <fo:block xsl:use-attribute-sets="box">
                <fo:external-graphic xsl:use-attribute-sets="graphic">
                    <xsl:attribute name="src">
                        <xsl:text>url("</xsl:text>
                        <xsl:value-of select="@infoEntityIdent"/>
                        <xsl:text>")</xsl:text>
                    </xsl:attribute>
                </fo:external-graphic>
            </fo:block>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="emphasis">
        <fo:inline font-family="Helvetica" font-size="11pt" font-weight="bold">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <xsl:template match="emphasis[@emphasisType = 'em01']">
        <!--DEVELOPER INTERVENTION TO ADD MISSING FO:INLINE AND FONT-WEIGHT-->
        <fo:inline font-weight="bold">
            <xsl:attribute name="font-style">italic</xsl:attribute>
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <xsl:template match="emphasis[@emphasisType = 'em02']">
        <!--DEVELOPER INTERVENTION TO ADD MISSING FO:INLINE AND FONT-WEIGHT-->
        <fo:inline font-weight="bold">
            <xsl:attribute name="color">blue</xsl:attribute>
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <xsl:template match="randomList">
        <!--DEVELOPER INTERVENTION TO CHANGE LISTITEM TO RANDOMLIST, THEN OTHER LISTITEM LABEL, INDENTS, ETC, MOVE ALL FO:TAGS TO LISTITEM-->
            <xsl:apply-templates/>        
    </xsl:template>

    <xsl:template match="randomList[@listItemPrefix = 'pf07']/listItem">
        <fo:list-block margin-bottom="6pt">
        <fo:list-item start-indent="5mm">
            <fo:list-item-label>
                <fo:block>
                    <fo:inline>&#9679;</fo:inline>
                </fo:block>
            </fo:list-item-label>
            <fo:list-item-body start-indent="10mm">
                <xsl:apply-templates/>
            </fo:list-item-body>
        </fo:list-item>
        </fo:list-block>
    </xsl:template>

    <xsl:template match="para">
        <fo:block xsl:use-attribute-sets="para">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="title[count(ancestor::levelledPara) = 1]">
        <fo:block xsl:use-attribute-sets="title-1">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="title[count(ancestor::levelledPara) = 2]">
        <fo:block xsl:use-attribute-sets="title-2">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="caption">
        <fo:block xsl:use-attribute-sets="caption">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="table">
        <!---DEVELOPER INTERVENTION TO REFACTOR-->
        <fo:table keep-together.within-page="always" space-before="0.5pc">
            <fo:table-body>
                <xsl:apply-templates/>
            </fo:table-body>
        </fo:table>
    </xsl:template>

    <xsl:template match="row">
        <!--DEVELOPER INTERVENTION TO MOVE FROM ANOTHER TEMPLATE WITH FO:BLOCK CHILD-->
        <fo:table-row>
            <xsl:apply-templates/>
        </fo:table-row>
    </xsl:template>

    <xsl:template match="entry">
        <!--DEVELOPER INTERVENTION TO MOVE FROM ANOTHER TEMPLATE WITH FO:BLOCK CHILD-->
        <fo:table-cell>
            <xsl:choose>
                <xsl:when test="count(preceding-sibling::entry) = 0">
                    <xsl:attribute name="width"
                        select="ancestor::tbody/preceding-sibling::colspec[1]/@colwidth"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="width"
                        select="ancestor::tbody/preceding-sibling::colspec[2]/@colwidth"/>
                </xsl:otherwise>
            </xsl:choose>
            <fo:block>
                <xsl:apply-templates/>
            </fo:block>
        </fo:table-cell>
    </xsl:template>

    <xsl:template match="levelledPara">
        <fo:block>
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <!--DEVELOPER INTERVENTION REMOVE CONTENT, DESCRIPTION-->
</xsl:stylesheet>
