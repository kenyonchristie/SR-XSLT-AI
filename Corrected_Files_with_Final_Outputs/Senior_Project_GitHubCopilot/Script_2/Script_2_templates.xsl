<?xml version="1.0" encoding="utf-8"?>
<!--<content xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:noNamespaceSchemaLocation="Script_2.xsd">
    <description>
        <levelledPara id="lp-0001">
<title>CASSINI MISSION</title>
<figure id="fig-0001">
	<graphic id="gra-0001" infoEntityIdent="cassini_image.jpg"/>
</figure>
<caption>
	<captionLine>
		This still is from a short computer-animated film that highlights
		Cassini's accomplishments at Saturn and reveals the science-packed final
		orbits.
	</captionLine>
</caption>
<levelledPara id="lp-0002">
	<title>OVERVIEW</title>
	<para>
		The team made a major effort to summarize the mission. <emphasis
                        emphasisType="em01">Volume 1 contains the science component:</emphasis>
		<emphasis emphasisType="em02">
			Mission Overview, Science Objectives and
			Results
		</emphasis> while technical information is contained in additional
		volumes archived at the Jet Propulsion Lab.
	</para>
	<para>
		Mission Science Highlights and Science Objectives Assessment provides a brief
		overview of the mission
	</para>
	<para>
		<emphasis emphasisType="em01">Look for data in a variety of ways:</emphasis>
	</para>
	<para>
		<randomList listItemPrefix="pf07">
			<listItem>
				<para>By mission science area below</para>
			</listItem>
			<listItem>
				<para>
					By instrument below, or start with the <emphasis
                                    emphasisType="em01">Instrument Comparison</emphasis>
				</para>
			</listItem>
			<listItem>
				<para>
					If you know what you are looking for, use the <emphasis
                                    emphasisType="em01">Commonly Used Resources and Tools</emphasis>
					list <emphasis emphasisType="em01">
						An Explanation of Cassini
						C-Kernels
					</emphasis>
				</para>
			</listItem>
			<listItem>
				<para>
					To help interpret data, use the <emphasis emphasisType="em01"
                                    >Spacecraft Events and Configuration Information</emphasis> page
					to find sources of noise and other ancillary information
				</para>
			</listItem>
		</randomList>
	</para>
</levelledPara>
<levelledPara id="lp-0003">
	<title>MISSION SCIENCE AREAS</title>
	<table id="tbl-0001" frame="none">
		<tgroup cols="2" colsep="0">
			<colspec colnum="1" colname="col1" colwidth="2.5in"/>
			<colspec colnum="2" colname="col2" colwidth="3.5in"/>
			<tbody>
				<row rowsep="0">
					<entry>
						<emphasis emphasisType="em01">
							Saturn Planet and
							Atmosphere
						</emphasis>
					</entry>
					<entry>
						Science includes Saturn's formation and evolution, interior
						fundamentals, atmospheric properties, global circulation and
						dynamics, auroral observations, ionosphere and magnetic
						fields.
					</entry>
				</row>
				<row rowsep="0">
					<entry>
						<emphasis emphasisType="em01">
							Saturn's
							Rings
						</emphasis>
					</entry>
					<entry>
						Science includes the configuration and process responsible
						for ring structure, composition, relationships with satellites,
						and interactions with Saturn's magnetosphere, ionosphere and
						atmosphere.
					</entry>
				</row>
				<row rowsep="0">
					<entry>
						<emphasis emphasisType="em01"
                                    >Magnetospheric</emphasis>
					</entry>
					<entry>
						Science includes the configuration of Saturn's magnetic
						field, distribution of charged particles in the magnetosphere,
						Saturn's aurorae, and Titan's interaction with the
						magnetospheric plasma.
					</entry>
				</row>
				<row rowsep="0">
					<entry>
						<emphasis emphasisType="em01">
							Icy Satellites, Enceladus, and
							Other Moons
						</emphasis>
					</entry>
					<entry>
						Science includes the study of Enceladus, other icy satellites
						such as Dione, small moons such as Phoebe, and the ring-moon
						relationships.
					</entry>
				</row>
				<row rowsep="0">
					<entry>
						<emphasis emphasisType="em01">Jupiter</emphasis>
					</entry>
					<entry>
						Science includes atmosphere, rings and moons data collected
						during the Cassini flyby of Jupiter.
					</entry>
				</row>
			</tbody>
		</tgroup>
	</table>
</levelledPara>
</levelledPara>
</description>
</content>

Create an XSL stylesheet for the templates and page-sequence of the above XML document, with the following additional conditions:

1) include for xsl stylesheet "Script_2_attributes.xsl"
2) header and footer extents are 0.25in
3) region-body margin-top and margin-bottom are 0.25in
4) all templates except description, emphasis, table/row/entry, and randomList/listItem wrap template output in fo:block tags
5) emphasis template wraps template output in fo:inline tags
6) emphasis has the following attributes on fo:block: bolded font, Helvetica, font size="11pt">
7) for emphasis with emphasisType "em01" the font style is italic and with emphasisType "em02" the font color is blue
8) listItem template will be for listItemPrefix="pf07" and will be an fo:list-block with margin-bottom of 6pt, label indent of 5mm, body indent of 10mm, and bullets for the label
9) para element uses attribute-set "para"
10) titles with one levelledPara ancestor use attribute-set "title-1"
11) titles with two levelledPara ancestors use attribute-set "title-2"
12) caption element uses attribute-set "caption"
13) table elements must be kept intact within a page and have space before of 0.5pc
14) simple page master uses attribute sets page-size and page-geometry
15) levelledPara has an id attribute on its fo:block that takes the value of the id attribute in the XML-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:import href="Script_2_attributes.xsl"/>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <!--DEV INTERVENTION TO CORR TO ROOT TAG AND ADD TEMPLATE FOR DESCRIPTION-->
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <!--DEV INTERVENTION RMV PAGE-GEOMETRY AS APPLY-TEMPLATES AND CREATE XSL:USE-ATTRIBUTE-SETS-->
                <fo:simple-page-master master-name="all"
                    xsl:use-attribute-sets="page-size page-geometry">
                    <fo:region-body margin-top="0.25in" margin-bottom="0.25in"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="all">
                <fo:flow flow-name="xsl-region-body">
                    <xsl:apply-templates/>
                    <!--DEV INTERVENTION RMV UNNEC APPLY TEMPLATE LEVELLEDPARA, ALMOST ALL CONTENT DROPPING-->                    
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="description">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="levelledPara">
        <fo:block id="{@id}">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="emphasis">
        <fo:inline font-family="Helvetica" font-size="11pt" font-weight="bold">
            <!--DEV INTERVENTION ADD FONT-WEIGHT, DEV OMITTED FROM PROMPT-->
            <xsl:choose>
                <xsl:when test="@emphasisType = 'em01'">
                    <fo:inline font-style="italic">
                        <xsl:apply-templates/>
                    </fo:inline>
                </xsl:when>
                <xsl:when test="@emphasisType = 'em02'">
                    <fo:inline color="blue">
                        <xsl:apply-templates/>
                    </fo:inline>
                </xsl:when>
            </xsl:choose>
        </fo:inline>
    </xsl:template>

    <xsl:template match="para">
        <fo:block xsl:use-attribute-sets="para"><!--DEV INTERVENTION MISSING ATTRIBUTE-SET-->
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <!--DEV INTERVENTION ADD MISSING FIGURE/GRAPHIC TEMPLATE-->
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

    <!--DEV INTERVENTION REFACTOR TITLE TO ACCT FOR ATTRIBUTE SETS FOR 2 DIFF LEVELS OF TITLES-->
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
        <fo:block>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

<!--DEV INTERVENTION ON TABLE, ROW, ENTRY TEMPLATES-->
    <xsl:template match="table">
        <fo:table keep-together.within-page="always" space-before="0.5pc">
            <fo:table-body>
                <xsl:apply-templates/>
            </fo:table-body>
        </fo:table>
    </xsl:template>

    <xsl:template match="randomList">
        <xsl:apply-templates/>
    </xsl:template>

    <!--DEV INTERVENTION ADD MISSING FO:LIST-ITEM AND REMOVE FO:BLOCK FROM RANDOMLIST ABOVE-->
    <xsl:template match="listItem">
        <fo:list-block margin-bottom="6pt">
            <fo:list-item>
                <fo:list-item-label start-indent="5mm">
                    <fo:block>
                        <fo:inline>&#9679;</fo:inline><!--DEV INTERVENTION REMOVE INVALID LIST-ITEM-LABEL-END AND ADD BULLET ENTITY-->
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

    <!--DEV INTERVENTION TO REMOVE DUPLICATE ATTRIBUTE SETS (2)-->

    <!---manually had to force it to end because began recreating attribute sets existing in another file-->
</xsl:stylesheet>
