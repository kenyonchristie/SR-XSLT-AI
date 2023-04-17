<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:include href="Script_1_attributes.xsl"/>

    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="body-page"
                    xsl:use-attribute-sets="page-size page-geometry">
                    <fo:region-body region-name="body" margin-top="0.5in" margin-bottom="0.5in"/>
                    <fo:region-before region-name="header" extent="0.5in"/>
                    <fo:region-after region-name="footer" extent="0.5in"/>
                </fo:simple-page-master>
                <fo:page-sequence-master master-name="voyager">
                    <fo:repeatable-page-master-reference master-reference="body-page"/>
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

    <xsl:template match="description">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="levelledPara">
        <fo:block>
            <xsl:for-each select=".[parent::description]">
                <xsl:apply-templates select="child::title"/>
                <xsl:choose>
                    <xsl:when test="string-length(child::para/text()[1]) > 0">
                        <xsl:apply-templates select="child::para"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="descendant::emphasis"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:for-each select="child::levelledPara">
                    <xsl:apply-templates select="child::title"/>
                    <xsl:apply-templates select="child::para"/>
                    <xsl:apply-templates select="descendant::emphasis"/>
                    <xsl:for-each select="child::levelledPara">
                        <xsl:apply-templates select="child::title"/>
                        <xsl:apply-templates select="child::para"/>
                        <xsl:apply-templates select="descendant::emphasis"/>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </fo:block>
    </xsl:template>

    <xsl:template match="title">
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
        <fo:inline font-weight="bold" font-family="Century Gothic" space-before="0.5pc">
            <xsl:if test="@emphasisType = 'em01'">
                <xsl:attribute name="color">blue</xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <xsl:template match="randomList">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="listItem[parent::randomList[@listItemPrefix = 'pf07']]">
        <fo:list-block margin-bottom="6pt">
            <fo:list-item start-indent="5mm">
                <fo:list-item-label>
                    <fo:block>
                        <fo:inline>&#9679;</fo:inline>
                    </fo:block>
                </fo:list-item-label>
                <fo:list-item-body start-indent="10mm">
                    <fo:block>
                        <xsl:apply-templates/>
                    </fo:block>
                </fo:list-item-body>
            </fo:list-item>
        </fo:list-block>
    </xsl:template>

</xsl:stylesheet>
