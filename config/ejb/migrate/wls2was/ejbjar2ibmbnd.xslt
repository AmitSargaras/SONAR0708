<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" />
<xsl:template match="/ejb-jar">
<ejbbnd:EJBJarBinding 
	xmlns:xmi="http://www.omg.org/XMI"
	xmlns:ejbbnd="ejbbnd.xmi" 
	xmlns:ejb="ejb.xmi" 
	xmlns:common="common.xmi" 
	xmi:version="2.0">
	<xsl:attribute name="id" namespace="http://www.omg.org/XMI">ejbjarbnd_<xsl:value-of select="@id"/></xsl:attribute>
	<ejbJar>
		<xsl:attribute name="href">META-INF/ejb-jar.xml#<xsl:value-of select="@id"/></xsl:attribute>
	</ejbJar>
	<xsl:apply-templates select="enterprise-beans/session"/>
	<xsl:apply-templates select="enterprise-beans/entity"/>
	<defaultCMPConnectionFactory>
		<xsl:attribute name="id" namespace="http://www.omg.org/XMI">cmpconnectionfactorybinding_<xsl:value-of select="@id"/></xsl:attribute>
		<xsl:attribute name="jndiName">eis/CMSPool_CMP</xsl:attribute>
		<xsl:attribute name="resAuth">Container</xsl:attribute>
	</defaultCMPConnectionFactory>
</ejbbnd:EJBJarBinding>
</xsl:template>

<xsl:template match="enterprise-beans/session">
	<xsl:variable name="ejbname"><xsl:value-of select="ejb-name"/></xsl:variable>
	<ejbBindings>
		<xsl:attribute name="id" namespace="http://www.omg.org/XMI">ejbbnd_session_<xsl:value-of select="$ejbname"/></xsl:attribute>
		<xsl:attribute name="jndiName"><xsl:value-of select="document('weblogic-ejb-jar.xml')/weblogic-ejb-jar/weblogic-enterprise-bean[ejb-name=$ejbname]/jndi-name"/></xsl:attribute>
		<enterpriseBean>
			<xsl:attribute name="type" namespace="http://www.omg.org/XMI">ejb:Session</xsl:attribute>		
			<xsl:attribute name="href">META-INF/ejb-jar.xml#<xsl:value-of select="@id"/></xsl:attribute>
		</enterpriseBean>
		<xsl:if test="ejb-local-ref">
			<xsl:apply-templates select="ejb-local-ref"/>
		</xsl:if>
		<xsl:if test="resource-ref">
			<xsl:apply-templates select="resource-ref">
				<xsl:with-param name="ejbname"><xsl:value-of select="$ejbname"/></xsl:with-param>
			</xsl:apply-templates>
		</xsl:if>
	</ejbBindings>
</xsl:template>

<xsl:template match="enterprise-beans/entity">
	<xsl:variable name="ejbname"><xsl:value-of select="ejb-name"/></xsl:variable>
	<ejbBindings>
		<xsl:attribute name="id" namespace="http://www.omg.org/XMI">ejbbnd_entity_<xsl:value-of select="ejb-name"/></xsl:attribute>
		<xsl:choose>
			<xsl:when test="document('weblogic-ejb-jar.xml')/weblogic-ejb-jar/weblogic-enterprise-bean[ejb-name=$ejbname]/jndi-name">
				<xsl:attribute name="jndiName"><xsl:value-of select="document('weblogic-ejb-jar.xml')/weblogic-ejb-jar/weblogic-enterprise-bean[ejb-name=$ejbname]/jndi-name"/></xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
				<xsl:attribute name="jndiName"><xsl:value-of select="$ejbname"/>Home</xsl:attribute>
			</xsl:otherwise>
		</xsl:choose>
		<enterpriseBean>
			<xsl:attribute name="type" namespace="http://www.omg.org/XMI">ejb:ContainerManagedEntity</xsl:attribute>		
			<xsl:attribute name="href">META-INF/ejb-jar.xml#<xsl:value-of select="@id"/></xsl:attribute>
		</enterpriseBean>
		<xsl:if test="ejb-local-ref">
			<xsl:apply-templates select="ejb-local-ref"/>
		</xsl:if>
		<xsl:if test="resource-ref">
			<xsl:apply-templates select="resource-ref">
				<xsl:with-param name="ejbname"><xsl:value-of select="$ejbname"/></xsl:with-param>
			</xsl:apply-templates>
		</xsl:if>
		<cmpConnectionFactory>
			<xsl:attribute name="id" namespace="http://www.omg.org/XMI">cmpconnectionfactory_<xsl:value-of select="ejb-name"/></xsl:attribute>
			<xsl:attribute name="jndiName">eis/CMSPool_CMP</xsl:attribute>
			<xsl:attribute name="resAuth">Container</xsl:attribute>
		</cmpConnectionFactory>
	</ejbBindings>
</xsl:template>


<xsl:template match="ejb-local-ref">

	<xsl:variable name="ejbname"><xsl:value-of select="ejb-link"/></xsl:variable>
	<ejbRefBindings>
	<xsl:attribute name="id" namespace="http://www.omg.org/XMI">resrefbindings_<xsl:value-of select="@id"/></xsl:attribute>
	<xsl:choose>
		<xsl:when test="document('weblogic-ejb-jar.xml')/weblogic-ejb-jar/weblogic-enterprise-bean[ejb-name=$ejbname]/jndi-name">
			<xsl:attribute name="jndiName"><xsl:value-of select="document('weblogic-ejb-jar.xml')/weblogic-ejb-jar/weblogic-enterprise-bean[ejb-name=$ejbname]/jndi-name"/></xsl:attribute>
		</xsl:when>
		<xsl:otherwise>
			<xsl:attribute name="jndiName"><xsl:value-of select="$ejbname"/>Home</xsl:attribute>
		</xsl:otherwise>
	</xsl:choose>
		<bindingEjbRef>
			<xsl:attribute name="type" namespace="http://www.omg.org/XMI">common:EJBLocalRef</xsl:attribute>
			<xsl:attribute name="href">META-INF/ejb-jar.xml#<xsl:value-of select="@id"/></xsl:attribute>
		</bindingEjbRef>
	</ejbRefBindings>
</xsl:template>

<xsl:template match="resource-ref">
	<xsl:param name="ejbname" />
	<xsl:variable name="resrefname"><xsl:value-of select="res-ref-name"/></xsl:variable>
	<resRefBindings>
	<xsl:attribute name="id" namespace="http://www.omg.org/XMI">resRefBindings_<xsl:value-of select="@id"/></xsl:attribute>
	<xsl:attribute name="jndiName"><xsl:value-of select="document('weblogic-ejb-jar.xml')/weblogic-ejb-jar/weblogic-enterprise-bean[ejb-name=$ejbname]/reference-descriptor/resource-description[res-ref-name=$resrefname]/jndi-name"/></xsl:attribute>
		<bindingResourceRef>
			<xsl:attribute name="href">META-INF/ejb-jar.xml#<xsl:value-of select="@id"/></xsl:attribute>
		</bindingResourceRef>
	</resRefBindings>
</xsl:template>

</xsl:stylesheet>