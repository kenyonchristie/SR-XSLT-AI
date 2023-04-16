<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:include href="Script_3_attributes.xsl"/>

    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="body-page"
                    xsl:use-attribute-sets="page-size page-geometry">
                    <fo:region-body region-name="body"/>
                    <fo:region-before region-name="header" extent="0.25in"/>
                    <fo:region-after region-name="footer" extent="0.25in"/>
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
        <fo:block id="{generate-id(.)}">
            <xsl:for-each select=".[parent::description]">
                <xsl:apply-templates select="child::title"/>
                <xsl:apply-templates select="child::para"/>
            </xsl:for-each>
        </fo:block>
    </xsl:template>

    <xsl:template match="title">
        <fo:block xsl:use-attribute-sets="title">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="para">
        <fo:block xsl:use-attribute-sets="para">
            <xsl:if test="count(child::sequentialList)>0">
                <xsl:attribute name="space-after">1pc</xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="sequentialList">
        <fo:block space-before="1pc">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="listItem">
        <fo:list-block margin-bottom="6pt" border="1pt solid black" background-color="#C5C5C5" padding-right=".15in">
            <fo:list-item start-indent="5mm">
                <fo:list-item-label>
                    <fo:block>
                        <fo:inline>
                            <xsl:number from="sequentialList" count="listItem" level="any"
                                format="1. "/>
                        </fo:inline>
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
