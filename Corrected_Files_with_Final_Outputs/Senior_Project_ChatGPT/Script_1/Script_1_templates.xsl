<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
    <xsl:include href="Script_1_attributes.xsl"/>

    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="main"
                    xsl:use-attribute-sets="page-size page-geometry">
                    <fo:region-body margin-top="0.5in" margin-bottom="0.5in"/>
                    <fo:region-before extent="0.5in"/>
                    <fo:region-after extent="0.5in"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="main">
                <fo:flow flow-name="xsl-region-body">
                    <xsl:apply-templates/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="content | levelledPara">
        <fo:block>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="description">
        <xsl:apply-templates/>
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

    <xsl:template match="title[count(ancestor::levelledPara) = 3]">
        <fo:block xsl:use-attribute-sets="title-3">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="emphasis">
        <fo:inline font-family="Century Gothic" font-weight="bold" space-before="0.5pc">
            <xsl:if test="@emphasisType = 'em01'">
                <xsl:attribute name="color">blue</xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <xsl:template match="randomList[@listItemPrefix = 'pf07']">
        <!--DEVELOPER INTERVENTION TO REMOVE PROVISIONAL ATTRIBUTES AND MARGIN-BOTTOM ATTRIBUTE NOT RESULTING IN CORRECT OUTPUT-->
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="listItem">
        <!--DEVELOPER INTERVENTION TO ADD FO:LIST-BLOCK WITH MARGIN-BOTTOM, LABEL & BODY START-INDENTS, FIX BULLET ENTITY CODE-->
        <fo:list-block margin-bottom="6pt">
            <fo:list-item start-indent="5mm">
                <fo:list-item-label>
                    <fo:block>&#9679;</fo:block>
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
