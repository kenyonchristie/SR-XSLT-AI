<?xml version="1.0" encoding="utf-8"?>
<!--<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified">
  <xs:element name="content">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="description"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="description">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="levelledPara"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="levelledPara">
    <xs:complexType>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:element ref="levelledPara"/>
        <xs:element ref="para"/>
        <xs:element ref="title"/>
      </xs:choice>
      <xs:attribute name="id" use="required" type="xs:NCName"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="title" type="xs:string"/>
  <xs:element name="para">
    <xs:complexType mixed="true">
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:element ref="emphasis"/>
        <xs:element ref="randomList"/>
      </xs:choice>
    </xs:complexType>
  </xs:element>
  <xs:element name="emphasis">
    <xs:complexType mixed="true">
      <xs:attribute name="emphasisType" use="required" type="xs:NCName"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="randomList">
    <xs:complexType>
      <xs:sequence>
        <xs:element maxOccurs="unbounded" ref="listItem"/>
      </xs:sequence>
      <xs:attribute name="listItemPrefix" use="required" type="xs:NCName"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="listItem">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="para"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>

Create an XSL stylesheet for the templates and page-sequence of the above XML document, with the following additional conditions:


1) include for xsl stylesheet "Script_1_attributes.xsl"
2) header and footer extents are 0.5in
3) region-body margin-top and margin-bottom are 0.5in
4) all templates except description, emphasis, and randomList/listItem wrap template output in fo:block tags
5) emphasis template wraps template output in fo:inline tags
6) emphasis has the following attributes on fo:block: bolded font, Century Gothic, a space before of 0.5pc>
7) for emphasis with emphasisType "em01" the font color is blue
8) listItem template will be for listItemPrefix attribute with value "pf07" and will be an fo:list-block with margin-bottom of 6pt, label indent of 5mm, body indent of 10mm, and bullets for the label
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:include href="Script_1_attributes.xsl"/>
    <xsl:output method="xml" indent="yes"/>

    <!--DEV INTERVENTION TO ADD ALL MISSING XSL:USE-ATTRIBUTE-SETS-->
    <xsl:template match="content">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="simple"
                    xsl:use-attribute-sets="page-size page-geometry">
                    <fo:region-body margin-top="0.5in" margin-bottom="0.5in"/>
                    <fo:region-before extent="0.5in"/>
                    <fo:region-after extent="0.5in"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="simple">
                <fo:flow flow-name="xsl-region-body">
                    <xsl:apply-templates select="description"/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="description">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="levelledPara">
        <fo:block>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="para">
        <fo:block xsl:use-attribute-sets="para">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <!--DEV INTERVENTION REFACTOR TITLE TO ACCOUNT FOR 3 LEVELS PLUS THEIR ATTRIBUTE-SETS-->
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

    <xsl:template match="emphasis">
        <fo:block font-family="Century Gothic" space-before="0.5pc">
            <fo:inline font-weight="bold">
                <xsl:apply-templates/>
            </fo:inline>
        </fo:block>
    </xsl:template>

    <xsl:template match="emphasis[@emphasisType = 'em01']">
        <fo:block font-family="Century Gothic" space-before="0.5pc">
            <fo:inline font-weight="bold" color="blue">
                <xsl:apply-templates/>
            </fo:inline>
        </fo:block>
    </xsl:template>

    <!--DEV INTERVENTION REFACTOR RANDOMLIST AND LISTITEM DUE TO TRANSFORMATION ERROR-->
    <xsl:template match="randomList">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="listItem">
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
