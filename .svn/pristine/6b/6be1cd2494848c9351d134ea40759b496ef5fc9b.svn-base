<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" />
<xsl:template match="/ejb-jar">
<ejbext:EJBJarExtension xmi:version="2.0"
	xmlns:xmi="http://www.omg.org/XMI" 
	xmlns:ejbext="ejbext.xmi"
	xmlns:ejb="ejb.xmi"
	xmlns:commonext.localtran="commonext.localtran.xmi"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:attribute name="id" namespace="http://www.omg.org/XMI">ejbjarext_<xsl:value-of select="@id"/></xsl:attribute>
	<ejbJar>
		<xsl:attribute name="href">META-INF/ejb-jar.xml#<xsl:value-of select="@id"/></xsl:attribute>
	</ejbJar>
	<xsl:apply-templates select="enterprise-beans/session"/>
	<xsl:apply-templates select="enterprise-beans/entity"/>
	<xsl:apply-templates select="assembly-descriptor/container-transaction"/>
</ejbext:EJBJarExtension>
</xsl:template>

<xsl:template match="enterprise-beans/session">
	<ejbExtensions>
		<xsl:attribute name="id" namespace="http://www.omg.org/XMI">ejbext_<xsl:value-of select="ejb-name"/></xsl:attribute>
		<xsl:attribute name="type" namespace="http://www.omg.org/XMI">ejbext:SessionExtension</xsl:attribute>
		<xsl:call-template name="ext-enterprise-bean">
			<xsl:with-param	name="bean">session</xsl:with-param>
			<xsl:with-param	name="ejbname"><xsl:value-of select="ejb-name"/></xsl:with-param>
		</xsl:call-template>
	</ejbExtensions>
</xsl:template>

<xsl:template match="enterprise-beans/entity">
	<ejbExtensions>
		<xsl:attribute name="id" namespace="http://www.omg.org/XMI">ejbext_<xsl:value-of select="ejb-name"/></xsl:attribute>
		<xsl:attribute name="type" namespace="http://www.omg.org/XMI">ejbext:ContainerManagedEntityExtension</xsl:attribute>
		<xsl:call-template name="ext-enterprise-bean">
			<xsl:with-param	name="bean">entity</xsl:with-param>
			<xsl:with-param	name="ejbname"><xsl:value-of select="ejb-name"/></xsl:with-param>
		</xsl:call-template>
		<dataCache>
			<xsl:attribute name="id" namespace="http://www.omg.org/XMI">datacache_<xsl:value-of select="ejb-name"/></xsl:attribute>
			<xsl:attribute name="lifetimeInCache">0</xsl:attribute>
			<xsl:attribute name="lifetimeInCacheUsage">OFF</xsl:attribute>
		</dataCache>
	</ejbExtensions>
</xsl:template>

<xsl:template name="ext-enterprise-bean">
	<xsl:param name="bean" />
	<xsl:param name="ejbname" />
	<enterpriseBean>
		<xsl:choose>
			<xsl:when test="$bean = 'entity'">
				<xsl:attribute name="type" namespace="http://www.omg.org/XMI">ejb:ContainerManagedEntity</xsl:attribute>
			</xsl:when>
			<xsl:when test="$bean = 'session'">
				<xsl:attribute name="type" namespace="http://www.omg.org/XMI">ejb:Session</xsl:attribute>
			</xsl:when>
		</xsl:choose>
		<xsl:attribute name="href">META-INF/ejb-jar.xml#<xsl:value-of select="$bean"/>_<xsl:value-of select="$ejbname"/></xsl:attribute>
	</enterpriseBean>
	<structure>
		<xsl:attribute name="id" namespace="http://www.omg.org/XMI">structure_<xsl:value-of select="$ejbname"/></xsl:attribute>
		<xsl:attribute name="inheritenceRoot">false</xsl:attribute>
	</structure>
	<beanCache>
		<xsl:attribute name="id" namespace="http://www.omg.org/XMI">beancache_<xsl:value-of select="$ejbname"/></xsl:attribute>
		<xsl:choose>
			<xsl:when test="$bean = 'entity'">
				<xsl:attribute name="activateAt">TRANSACTION</xsl:attribute>
			</xsl:when>
			<xsl:when test="$bean = 'session'">
				<xsl:attribute name="activateAt">ONCE</xsl:attribute>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="$bean = 'entity'">
			<xsl:attribute name="loadAt">TRANSACTION</xsl:attribute>
		</xsl:if>
	</beanCache>
	<localTransaction>
		<xsl:attribute name="id" namespace="http://www.omg.org/XMI">localtrx_<xsl:value-of select="$ejbname"/></xsl:attribute>
		<xsl:choose>
			<xsl:when test="$bean = 'entity'">
				<xsl:attribute name="resolver">ContainerAtBoundary</xsl:attribute>
			</xsl:when>
			<xsl:when test="$bean = 'session'">
				<xsl:attribute name="resolver">Application</xsl:attribute>
			</xsl:when>
		</xsl:choose>
	</localTransaction>
	<xsl:if test="resource-ref">
		<resourceRefExtensions>
			<xsl:attribute name="id" namespace="http://www.omg.org/XMI">resrefext_<xsl:value-of select="$ejbname"/></xsl:attribute>
			<xsl:attribute name="isolationLevel">TRANSACTION_NONE</xsl:attribute>
			<resourceRef>
				<xsl:attribute name="href">META-INF/ejb-jar.xml#<xsl:value-of select="resource-ref/@id"/></xsl:attribute>
			</resourceRef>
		</resourceRefExtensions>
	</xsl:if>
</xsl:template>

<xsl:template match="assembly-descriptor/container-transaction">
	<appliedAccessIntents>
		<xsl:attribute name="id" namespace="http://www.omg.org/XMI">accessintents_<xsl:value-of select="../../@id"/></xsl:attribute>
		<xsl:attribute name="accessIntentName">wsPessimisticUpdate-NoCollision</xsl:attribute>
		<name>
			<xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">true</xsl:attribute>
		</name>
    	<description>
    		<xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">true</xsl:attribute>
    	</description>
		<xsl:apply-templates select="method"/>
	</appliedAccessIntents>
</xsl:template>

<xsl:template match="method">
	<xsl:if test="starts-with(./ejb-name, 'EB')">
		<xsl:variable name="ejbname"><xsl:value-of select="ejb-name"/></xsl:variable>
		<methodElements>
			<xsl:attribute name="id" namespace="http://www.omg.org/XMI">methodelements_<xsl:value-of select="$ejbname"/></xsl:attribute>
			<xsl:attribute name="name"><xsl:value-of select="method-name"/></xsl:attribute>
			<xsl:attribute name="type">Unspecified</xsl:attribute>
			<enterpriseBean>
				<xsl:attribute name="type" namespace="http://www.omg.org/XMI">ejb:ContainerManagedEntity</xsl:attribute>
				<xsl:attribute name="href">META-INF/ejb-jar.xml#<xsl:value-of select="/ejb-jar/enterprise-beans/entity[ejb-name=$ejbname]/@id" /></xsl:attribute>
			</enterpriseBean>
		</methodElements>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>