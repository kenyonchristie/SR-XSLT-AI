<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0"><!--DEVELOPER INTERVENTION TO CORRECT SYNTAX-->
    
    <!-- Include Script_2_attributes.xsl -->
    <xsl:include href="Script_2_attributes.xsl"/>
    
    <!-- Define header and footer extents -->
    <xsl:variable name="headerExtent" select="'0.25in'"/><!--DEVELOPER INTERVENTION CLOSE STRINGS IN SINGLE QUOTES (MULTIPLE)-->
    <xsl:variable name="footerExtent" select="'0.25in'"/>
    
    <!-- Define templates for various elements -->
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <!-- Define simple-page-master with header and footer extents -->
                <fo:simple-page-master master-name="page" xsl:use-attribute-sets="page-size page-geometry" margin-top="{$headerExtent}" margin-bottom="{$footerExtent}" margin-left="0.5in" margin-right="0.5in">
                    <fo:region-body region-name="body" margin-top="0.25in" margin-bottom="0.25in" margin-left="0.5in" margin-right="0.5in"/>
                    <fo:region-before extent="{$headerExtent}"/>
                    <fo:region-after extent="{$footerExtent}"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="page"><!--DEVELOPER INTERVENTION TO ADD PAGE-SEQUENCE/FO:FLOW OMITTED IN ERROR; CREATED REGION-NAME BODY (above and on flow)-->
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
    
    <!--DEVELOPER INTERVENTION TO REMOVE MULTIPLE INVALID USE-ATTRIBUTE-SETS-->
    <xsl:template match="levelledPara">
        <fo:block id="{@id}">            
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>    
    
    <!--DEVELOPER INTERVENTION ADD FIGURE/GRAPHIC TEMPLATE-->
    <xsl:template match="figure">
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
    
    <xsl:template match="title">
        <xsl:choose>
            <xsl:when test="count(ancestor::levelledPara) = 1">
                <fo:block xsl:use-attribute-sets="title-1">
                    <xsl:apply-templates/>
                </fo:block>
            </xsl:when>
            <xsl:otherwise>
                <fo:block xsl:use-attribute-sets="title-2">
                    <xsl:apply-templates/>
                </fo:block>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="caption">
        <fo:block xsl:use-attribute-sets="caption">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="para">
        <fo:block xsl:use-attribute-sets="para">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="emphasis">
        <fo:inline font-family="Helvetica" font-weight="bold" font-size="11pt">
            <xsl:choose>
                <xsl:when test="@emphasisType='em01'">
                    <fo:inline font-style="italic">
                        <xsl:apply-templates/>
                    </fo:inline>
                </xsl:when>
                <xsl:when test="@emphasisType='em02'">
                    <fo:inline color="blue">
                        <xsl:apply-templates/>
                    </fo:inline>
                </xsl:when>
                <xsl:otherwise>
                    <fo:inline/>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </fo:inline>
    </xsl:template>
    
    <xsl:template match="randomList"><!--DEVELOPER INTERVENTION TO ADD MISSING TEMPLATE AND MOVE LISTITEM ATTRIBUTES HERE & RMV INVALID ATTRIBUTE-->
        <fo:list-block margin-bottom="6pt">
            <xsl:apply-templates/>
        </fo:list-block>
    </xsl:template>
    
    <xsl:template match="listItem[parent::randomList[@listItemPrefix='pf07']]"><!--DEVELOPER INTERVENTION CORRECT XPATH AXIS AND REFACTOR TO FORMAT LIST AND OUTPUT BULLET-->
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
    </xsl:template>

<!--DEVELOPER INTERVENTION TO REFACTOR TABLE TEMPLATE AND ADD NECESSARY ROW AND ENTRY TEMPLATES SO TABLE FORMATS PROPERLY-->
    <xsl:template match="table">
        <fo:table keep-together.within-page="always" space-before="0.5pc">
            <fo:table-body>
                <xsl:apply-templates/>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    <xsl:template match="row">
        <fo:table-row>
            <xsl:apply-templates/>
        </fo:table-row>
    </xsl:template>
    
    <xsl:template match="entry">
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
    
    <!-- Wraps template output in fo:block tags --><!--DEVELOPER INTERVENTION REMOVE UNNECESSARY TEMPLATE-->
    <!--<xsl:template match="*[not(self::description or self::emphasis or self::table or self::row or self::entry or self::randomList or self::listItem)]">
        <fo:block>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>-->
        
    <!--DEVELOPER INTERVENTION TO REMOVE DUPLICATE EMPHASIS TEMPLATE-->
    
</xsl:stylesheet>