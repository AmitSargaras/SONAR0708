<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" 
	doctype-public="-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 2.0//EN" 
	doctype-system="c://ejb-jar_2_0.dtd"
	cdata-section-elements="ejb-ql" />
<xsl:template match="/ejb-jar">
<ejb-jar>
	<xsl:attribute name="id">ejb_<xsl:value-of select="translate(display-name,' ', '_')"/></xsl:attribute>
	<xsl:copy-of select="display-name" />
	<xsl:apply-templates select="enterprise-beans"/>
	<xsl:apply-templates select="relationships"/>
	<xsl:apply-templates select="assembly-descriptor"/>
</ejb-jar>
</xsl:template>

<xsl:template match="enterprise-beans">
<enterprise-beans>
	<xsl:apply-templates select="session"/>
	<xsl:apply-templates select="entity"/>
</enterprise-beans>
</xsl:template>

<xsl:template match="session">
<session>
	<xsl:attribute name="id">session_<xsl:value-of select="ejb-name"/></xsl:attribute>
	<xsl:copy-of select="ejb-name" />
	<xsl:copy-of select="home" />
	<xsl:copy-of select="remote" />
	<xsl:copy-of select="ejb-class" />
	<xsl:copy-of select="session-type" />
	<xsl:copy-of select="transaction-type" />
	<xsl:apply-templates select="ejb-local-ref"/>
	<xsl:apply-templates select="resource-ref"/>
</session>
</xsl:template>

<xsl:template match="entity">
<entity>
	<xsl:attribute name="id">entity_<xsl:value-of select="ejb-name"/></xsl:attribute>
	<xsl:copy-of select="ejb-name" />
	<xsl:copy-of select="home" />
	<xsl:copy-of select="remote" />
	<xsl:if test="local-home">
		<xsl:copy-of select="local-home" />
	</xsl:if>
	<xsl:if test="local">
		<xsl:copy-of select="local" />
	</xsl:if>
	<xsl:copy-of select="ejb-class" />
	<xsl:copy-of select="persistence-type" />
	<xsl:copy-of select="prim-key-class" />
	<xsl:copy-of select="reentrant" />
	<xsl:copy-of select="cmp-version" />
	<xsl:copy-of select="abstract-schema-name" />
	<xsl:apply-templates select="cmp-field"/>
	<xsl:copy-of select="primkey-field" />
	<xsl:apply-templates select="ejb-local-ref"/>
	<xsl:apply-templates select="resource-ref"/>
	<xsl:apply-templates select="query"/>
</entity>
</xsl:template>

<xsl:template match="cmp-field">
<cmp-field>
	<xsl:attribute name="id">cmpfield_<xsl:value-of select="../ejb-name"/>_<xsl:value-of select="field-name"/></xsl:attribute>
	<xsl:copy-of select="field-name" />
</cmp-field>
</xsl:template>

<xsl:template match="query">
<query>
	<xsl:copy-of select="query-method" />
	<xsl:element name="ejb-ql">
		<xsl:if test="contains(ejb-ql, 'ORDERBY')">
			<xsl:value-of select="substring-before(ejb-ql, 'ORDERBY')"/>ORDER BY<xsl:value-of select="substring-after(ejb-ql, 'ORDERBY')"/>
		</xsl:if>
		<xsl:if test="not(contains(ejb-ql, 'ORDERBY'))">
		<xsl:value-of select="ejb-ql"/>
		</xsl:if>
	</xsl:element>
</query>
</xsl:template>	

<xsl:template match="resource-ref">
<resource-ref>
	<xsl:attribute name="id">resourceref_<xsl:value-of select="substring-before(res-ref-name, '/')"/>_<xsl:value-of select="../ejb-name"/></xsl:attribute>
	<xsl:copy-of select="child::*" />
</resource-ref>
</xsl:template>

<xsl:template match="ejb-local-ref">
<ejb-local-ref>
	<xsl:attribute name="id">ejblocalref_<xsl:value-of select="../ejb-name"/>_<xsl:value-of select="ejb-link" /></xsl:attribute>
	<xsl:copy-of select="child::*" />
</ejb-local-ref>
</xsl:template>

<xsl:template match="relationships">
<relationships>
	<xsl:apply-templates select="ejb-relation"/>
</relationships>
</xsl:template>

<xsl:template match="ejb-relation">
<ejb-relation>
	<xsl:attribute name="id">relation_<xsl:value-of select="ejb-relation-name"/></xsl:attribute>
	<xsl:element name="ejb-relation-name"><xsl:value-of select="ejb-relation-name"/></xsl:element>
	<xsl:apply-templates select="ejb-relationship-role"/>
</ejb-relation>
</xsl:template>

<xsl:template match="ejb-relationship-role">
<ejb-relationship-role>
	<xsl:attribute name="id">relationshiprole_<xsl:value-of select="ejb-relationship-role-name"/></xsl:attribute>
	<xsl:copy-of select="child::*" />
</ejb-relationship-role>
</xsl:template>

<xsl:template match="assembly-descriptor">
<assembly-descriptor>
	<xsl:copy-of select="child::*" />
</assembly-descriptor>
</xsl:template>

</xsl:stylesheet>