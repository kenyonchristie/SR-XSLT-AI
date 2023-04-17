<?xml version="1.0" encoding="utf-8"?>
<!--<<?xml version="1.0" encoding="UTF-8"?>
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
      <xs:sequence>
        <xs:element ref="title"/>
        <xs:element maxOccurs="unbounded" ref="para"/>
      </xs:sequence>
      <xs:attribute name="id" use="required" type="xs:NCName"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="title" type="xs:string"/>
  <xs:element name="para">
    <xs:complexType mixed="true">
      <xs:sequence>
        <xs:element minOccurs="0" maxOccurs="unbounded" ref="sequentialList"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="sequentialList">
    <xs:complexType>
      <xs:sequence>
        <xs:element maxOccurs="unbounded" ref="listItem"/>
      </xs:sequence>
      <xs:attribute name="id" use="required" type="xs:NCName"/>
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


1) include for xsl stylesheet "Script_3_attributes.xsl"
2) header and footer extents are 0.25in
3) all templates except description and listItem wrap template output in fo:block tags
4) listItem template will be an fo:list-block with margin-bottom of 6pt, label indent of 5mm, body indent of 10mm, and numbered labels that start with 1 and are sequential within a sequentialList block but restart numbering for each sequentialList parent
5) listItem template has 1pt solid black border with background color #C5C5C5 and .15in right padding
6) para element use attribute-set "para" and has space-after of 1pc whenever it has a sequentialList child
7) title uses attribute-set "title"
8) sequentialList blocks have a space-before of 1pc
9) simple page master uses attribute sets page-size and page-geometry
10) levelledPara should generate a unique-id-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:import href="Script_3_attributes.xsl"/>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="content">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="simple"
                    xsl:use-attribute-sets="page-size page-geometry">
                    <!---DEV INTERVENTION REPLACE PAGE ATTRIBUTES WITH REQUESTED ATTRIBUTE-SETS AND REMOVE INCORRECT MARGIN ATTRIBUTES-->
                    <fo:region-body/>
                    <fo:region-before extent="0.25in"/>
                    <fo:region-after extent="0.25in"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="simple">
                <xsl:apply-templates select="description"/>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="description">
        <fo:flow flow-name="xsl-region-body">
            <xsl:apply-templates select="levelledPara"/>
        </fo:flow>
    </xsl:template>

    <xsl:template match="levelledPara">
        <fo:block id="{@id}">
            <xsl:apply-templates select="title"/>
            <xsl:apply-templates select="para"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="title">
        <fo:block xsl:use-attribute-sets="title">
            <xsl:value-of select="."/>
        </fo:block>
    </xsl:template>

    <xsl:template match="para">
        <fo:block xsl:use-attribute-sets="para">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="sequentialList">
        <fo:block space-before="1pc">
            <xsl:apply-templates/>
        </fo:block>
        <!--DEV INTERVENTION RMV INVALID ATTRIBUTE-SET AND FO:BLOCK-->
    </xsl:template>

    <!--DEV INTERVENTION RMV INVALID ATTRIBUTE-SET AND REFACTOR TO BUILD OUT LIST-BLOCK WITH STYLING-->
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

    <!--DEV INTERVENTION REMOVE 7 INVALID/DUPLICATE/UNNECESSARY TEMPLATES-->
    <!--had to hit enter twice to break repetition and prompt close of stylesheet-->
</xsl:stylesheet>
