<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xmi="http://www.omg.org/XMI"
	xmlns:OracleModel="http:///com/ibm/db/models/oracle/oracle.ecore" 
	xmlns:ejbrdbmapping="ejbrdbmapping.xmi"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xmlns:SQLSchema="http:///org/eclipse/datatools/modelbase/sql/schema.ecore" >

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
				<xsl:variable name="href-of-first-columns">META-INF/backends/ORACLE_V11_1/TopDown1.dbm#<xsl:value-of select="columns[1]/@xmi:id"/></xsl:variable>
				<xsl:variable name="firstcmpid"><xsl:value-of select="substring-after(document('Map.mapxmi')/ejbrdbmapping:EjbRdbDocumentRoot/nested/nested[outputs/@href=$href-of-first-columns]/inputs/@href, '#')"/></xsl:variable>
				<xsl:variable name="ejbname"><xsl:value-of select="document('ejb-jar.xml')/ejb-jar/enterprise-beans/entity[cmp-field/@id=$firstcmpid]/ejb-name"/></xsl:variable>
				<xsl:attribute name="id" namespace="http://www.omg.org/XMI"><xsl:value-of select="@xmi:id" /></xsl:attribute>
				<xsl:attribute name="name"><xsl:value-of select="document('weblogic-cmp-rdbms-jar.xml')/weblogic-rdbms-jar/weblogic-rdbms-bean[ejb-name=$ejbname]/table-map/table-name" /></xsl:attribute>
				<xsl:attribute name="schema"><xsl:value-of select="@schema" /></xsl:attribute>
				<xsl:for-each select="columns">
					<xsl:variable name="columnhref">META-INF/backends/ORACLE_V11_1/TopDown1.dbm#<xsl:value-of select="@xmi:id"/></xsl:variable>
					<xsl:variable name="cmpid"><xsl:value-of select="substring-after(document('Map.mapxmi')/ejbrdbmapping:EjbRdbDocumentRoot/nested/nested[outputs/@href=$columnhref]/inputs/@href, '#')"/></xsl:variable>
					<xsl:variable name="cmpfield"><xsl:value-of select="document('ejb-jar.xml')/ejb-jar/enterprise-beans/entity/cmp-field[@id=$cmpid]/field-name"/></xsl:variable>
					<!--<xsl:variable name="ejbname"><xsl:value-of select="document('ejb-jar.xml')/ejb-jar/enterprise-beans/entity[cmp-field/@id=$cmpid]/ejb-name"/></xsl:variable>-->
					<xsl:variable name="colname"><xsl:value-of select="document('weblogic-cmp-rdbms-jar.xml')/weblogic-rdbms-jar/weblogic-rdbms-bean[ejb-name=$ejbname]/table-map/field-map[cmp-field=$cmpfield]/dbms-column" /></xsl:variable>					
					<xsl:if test="string-length($colname) &gt; 0">
						<columns>
							<xsl:attribute name="id" namespace="http://www.omg.org/XMI"><xsl:value-of select="@xmi:id" /></xsl:attribute>
							<xsl:attribute name="name"><xsl:value-of select="$colname" /></xsl:attribute>
							<xsl:copy-of select="child::*" />
						</columns>
					</xsl:if>
					<xsl:if test="$colname = ''">
						<xsl:variable name="xmi-id"><xsl:value-of select="@xmi:id"/></xsl:variable>	
						<xsl:variable name="fk-constraints-xmi-id"><xsl:value-of select="../constraints[@xsi:type='SQLConstraints:ForeignKey'][@members=$xmi-id]/@xmi:id" /></xsl:variable>	
						<xsl:variable name="fk-constraitns-map-href">META-INF/backends/ORACLE_V11_1/TopDown1.dbm#<xsl:value-of select="$fk-constraints-xmi-id"/></xsl:variable>
						<xsl:variable name="relationship-role-id-1"><xsl:value-of select="substring-after(document('Map.mapxmi')/ejbrdbmapping:EjbRdbDocumentRoot/nested/nested[outputs/@href=$fk-constraitns-map-href]/inputs[1]/@href, '#')"/></xsl:variable>
						<xsl:variable name="relationship-role-id-2"><xsl:value-of select="substring-after(document('Map.mapxmi')/ejbrdbmapping:EjbRdbDocumentRoot/nested/nested[outputs/@href=$fk-constraitns-map-href]/inputs[2]/@href, '#')"/></xsl:variable>
						<xsl:variable name="multiplicity-1"><xsl:value-of select="document('ejb-jar.xml')/ejb-jar/relationships/ejb-relation/ejb-relationship-role[@id=$relationship-role-id-1]/multiplicity" /></xsl:variable>
						<xsl:variable name="multiplicity-2"><xsl:value-of select="document('ejb-jar.xml')/ejb-jar/relationships/ejb-relation/ejb-relationship-role[@id=$relationship-role-id-2]/multiplicity" /></xsl:variable>
						<xsl:choose>
							<xsl:when test="$multiplicity-1 = 'Many'">	
								<xsl:variable name="relationship-role-name"><xsl:value-of select="document('ejb-jar.xml')/ejb-jar/relationships/ejb-relation/ejb-relationship-role[@id=$relationship-role-id-1]/ejb-relationship-role-name" /></xsl:variable>
								<xsl:variable name="foreign-key-column-name"><xsl:value-of select="document('weblogic-cmp-rdbms-jar.xml')/weblogic-rdbms-jar/weblogic-rdbms-relation/weblogic-relationship-role[relationship-role-name=$relationship-role-name]/relationship-role-map/column-map/foreign-key-column" /></xsl:variable>
								<xsl:variable name="foreign-key-column-cmp-field"><xsl:value-of select="document('weblogic-cmp-rdbms-jar.xml')/weblogic-rdbms-jar/weblogic-rdbms-bean[ejb-name=$ejbname]/table-map/field-map[dbms-column=$foreign-key-column-name]/cmp-field" /></xsl:variable>
								<xsl:if test="$foreign-key-column-cmp-field = ''">
									<columns>
										<xsl:attribute name="id" namespace="http://www.omg.org/XMI"><xsl:value-of select="@xmi:id" /></xsl:attribute>
										<xsl:attribute name="name"><xsl:value-of select="$foreign-key-column-name" /></xsl:attribute>
										<xsl:copy-of select="child::*" />
									</columns>
								</xsl:if>
							</xsl:when>
							<xsl:when test="$multiplicity-2 = 'Many'">	
								<xsl:variable name="relationship-role-name"><xsl:value-of select="document('ejb-jar.xml')/ejb-jar/relationships/ejb-relation/ejb-relationship-role[@id=$relationship-role-id-2]/ejb-relationship-role-name" /></xsl:variable>
								<xsl:variable name="foreign-key-column-name"><xsl:value-of select="document('weblogic-cmp-rdbms-jar.xml')/weblogic-rdbms-jar/weblogic-rdbms-relation/weblogic-relationship-role[relationship-role-name=$relationship-role-name]/relationship-role-map/column-map/foreign-key-column" /></xsl:variable>
								<xsl:variable name="foreign-key-column-cmp-field"><xsl:value-of select="document('weblogic-cmp-rdbms-jar.xml')/weblogic-rdbms-jar/weblogic-rdbms-bean[ejb-name=$ejbname]/table-map/field-map[dbms-column=$foreign-key-column-name]/cmp-field" /></xsl:variable>
									<xsl:if test="$foreign-key-column-cmp-field = ''">
									<columns>
										<xsl:attribute name="id" namespace="http://www.omg.org/XMI"><xsl:value-of select="@xmi:id" /></xsl:attribute>
										<xsl:attribute name="name"><xsl:value-of select="$foreign-key-column-name" /></xsl:attribute>
										<xsl:copy-of select="child::*" />
									</columns>
								</xsl:if>
							</xsl:when>
						</xsl:choose>
					</xsl:if>
				</xsl:for-each>
				<xsl:copy-of select="constraints" />
			</OracleModel:OracleTable>
		</xsl:for-each>
	</xmi:XMI>
</xsl:template>

</xsl:stylesheet>