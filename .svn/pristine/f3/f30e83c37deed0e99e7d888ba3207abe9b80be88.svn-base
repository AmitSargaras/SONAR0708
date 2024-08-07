<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xmi="http://www.omg.org/XMI"
	xmlns:OracleModel="http:///com/ibm/db/models/oracle/oracle.ecore" 
	xmlns:ejbrdbmapping="ejbrdbmapping.xmi"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:SQLConstraints="http:///org/eclipse/datatools/modelbase/sql/constraints.ecore" >

<xsl:output method="xml" indent="yes" />
<xsl:template match="/xmi:XMI">
	<xmi:XMI xmi:version="2.0" 
		xmlns:xmi="http://www.omg.org/XMI" 
		xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
		xmlns:OracleModel="http:///com/ibm/db/models/oracle/oracle.ecore" 
		xmlns:SQLConstraints="http:///org/eclipse/wst/rdb/models/sql/constraints.ecore"
		xmlns:SQLSchema="http:///org/eclipse/datatools/modelbase/sql/schema.ecore"
		xmlns:SQLDataTypes="http:///org/eclipse/datatools/modelbase/sql/datatypes.ecore" >
		<xsl:copy-of select="OracleModel:OracleDatabase" />
		<xsl:copy-of select="SQLSchema:Schema" />
		<xsl:for-each select="OracleModel:OracleTable">
			<OracleModel:OracleTable>
				<xsl:copy-of select="attribute::*" />
				<xsl:copy-of select="columns" />
				<xsl:copy-of select="constraints[@xsi:type='SQLConstraints:PrimaryKey']" />
				<xsl:apply-templates select="constraints[@xsi:type='SQLConstraints:ForeignKey']" />
			</OracleModel:OracleTable>
		</xsl:for-each>
	</xmi:XMI>
</xsl:template>

<xsl:template match="constraints">
		<xsl:variable name="members"><xsl:value-of select="@members"/></xsl:variable>
		<xsl:variable name="member-xmi-id"><xsl:value-of select="../columns[@xmi:id=$members]/@xmi:id"/></xsl:variable>
		<xsl:if test="$member-xmi-id = ''">
			<xsl:variable name="fk-constraints-href">META-INF/backends/ORACLE_V11_1/TopDown1.dbm#<xsl:value-of select="@xmi:id"/></xsl:variable>
			<xsl:variable name="relationship-role-id-1"><xsl:value-of select="substring-after(document('Map.mapxmi')/ejbrdbmapping:EjbRdbDocumentRoot/nested/nested[outputs/@href=$fk-constraints-href]/inputs[1]/@href, '#')"/></xsl:variable>
			<xsl:variable name="relationship-role-id-2"><xsl:value-of select="substring-after(document('Map.mapxmi')/ejbrdbmapping:EjbRdbDocumentRoot/nested/nested[outputs/@href=$fk-constraints-href]/inputs[2]/@href, '#')"/></xsl:variable>
			<xsl:variable name="multiplicity-1"><xsl:value-of select="document('ejb-jar.xml')/ejb-jar/relationships/ejb-relation/ejb-relationship-role[@id=$relationship-role-id-1]/multiplicity" /></xsl:variable>
			<xsl:variable name="multiplicity-2"><xsl:value-of select="document('ejb-jar.xml')/ejb-jar/relationships/ejb-relation/ejb-relationship-role[@id=$relationship-role-id-2]/multiplicity" /></xsl:variable>
			<xsl:choose>
				<xsl:when test="$multiplicity-1 = 'Many'">	
					<constraints>
						<xsl:variable name="relationship-role-name"><xsl:value-of select="document('ejb-jar.xml')/ejb-jar/relationships/ejb-relation/ejb-relationship-role[@id=$relationship-role-id-1]/ejb-relationship-role-name" /></xsl:variable>
						<xsl:variable name="key-column-name"><xsl:value-of select="document('weblogic-cmp-rdbms-jar.xml')/weblogic-rdbms-jar/weblogic-rdbms-relation/weblogic-relationship-role[relationship-role-name=$relationship-role-name]/relationship-role-map/column-map/foreign-key-column" /></xsl:variable>
						<xsl:variable name="col-xmi-id"><xsl:value-of select="../columns[@name=$key-column-name]/@xmi:id"/></xsl:variable>
						<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="@xsi:type" /></xsl:attribute>
						<xsl:attribute name="id" namespace="http://www.omg.org/XMI"><xsl:value-of select="@xmi:id" /></xsl:attribute>
						<xsl:attribute name="name"><xsl:value-of select="@name" /></xsl:attribute>
						<xsl:attribute name="members"><xsl:value-of select="$col-xmi-id" /></xsl:attribute>
						<xsl:attribute name="uniqueConstraint"><xsl:value-of select="@uniqueConstraint" /></xsl:attribute>
					</constraints>
				</xsl:when>
				<xsl:when test="$multiplicity-2 = 'Many'">
					<constraints>
						<xsl:variable name="relationship-role-name"><xsl:value-of select="document('ejb-jar.xml')/ejb-jar/relationships/ejb-relation/ejb-relationship-role[@id=$relationship-role-id-2]/ejb-relationship-role-name" /></xsl:variable>
						<xsl:variable name="key-column-name"><xsl:value-of select="document('weblogic-cmp-rdbms-jar.xml')/weblogic-rdbms-jar/weblogic-rdbms-relation/weblogic-relationship-role[relationship-role-name=$relationship-role-name]/relationship-role-map/column-map/foreign-key-column" /></xsl:variable>
						<xsl:variable name="col-xmi-id"><xsl:value-of select="../columns[@name=$key-column-name]/@xmi:id"/></xsl:variable>
						<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="@xsi:type" /></xsl:attribute>
						<xsl:attribute name="id" namespace="http://www.omg.org/XMI"><xsl:value-of select="@xmi:id" /></xsl:attribute>
						<xsl:attribute name="name"><xsl:value-of select="@name" /></xsl:attribute>
						<xsl:attribute name="members"><xsl:value-of select="$col-xmi-id" /></xsl:attribute>
						<xsl:attribute name="uniqueConstraint"><xsl:value-of select="@uniqueConstraint" /></xsl:attribute>	
					</constraints>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="string-length($member-xmi-id) &gt; 0">
			<constraints>
				<xsl:copy-of select="attribute::*" />
			</constraints>
		</xsl:if>
</xsl:template>

</xsl:stylesheet>