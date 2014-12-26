<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<head>
				<meta charsset="utf-8"/>
			</head>
			<link rel="stylesheet" href="style.css" />
			<body>
				<div id="page">
					<xsl:apply-templates select="cv/Nom"/>
					<xsl:apply-templates select="cv/Experiences"/>
					<xsl:apply-templates select="cv/Formations"/>
					<xsl:apply-templates select="cv/Publications"/>
					<xsl:apply-templates select="cv/Langues"/>
					<xsl:apply-templates select="cv/Coordonnees"/>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="cv/Nom">
		<h1><xsl:value-of select="current()"/></h1>
	</xsl:template>

	<xsl:template match="cv/Experiences">
		<h2>Experiences proffessionnelles</h2>
		<table>				
			<xsl:apply-templates select="Emploi"/>	
		</table>
	</xsl:template>
	<xsl:template match="Emploi">
		<tr>
			<th><xsl:value-of select="Moment"/></th>
			<td>
				<p><xsl:value-of select="Titre"/></p>
				<p class="institution"><xsl:value-of select="Institution"/></p>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="cv/Formations">
		<h2>Formation accademique</h2>
		<table>				
			<xsl:apply-templates select="Formation"/>	
		</table>
	</xsl:template>

	<xsl:template match="Formation">
		<tr>
			<th><xsl:value-of select="Moment"/></th>
			<td>
				<p><xsl:value-of select="Titre"/></p>
				<p class="institution"><xsl:value-of select="Institution"/></p>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="cv/Langues">
		<h2>Competences linguistiques</h2>
		<table>				
			<xsl:apply-templates select="Langue"/>	
		</table>
	</xsl:template>

	<xsl:template match="Langue">
		<tr>
			<th><xsl:value-of select="NomLangue"/></th>
			<td>
				<xsl:apply-templates select="Competence"/>	
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="Competence">
			<p>
				<xsl:value-of select="current()"/>	
			</p>
	</xsl:template>
	<xsl:template match="cv/Coordonnees">
		<div id="Coordonnees">
			<xsl:apply-templates select="Courriel"/>	
			<xsl:apply-templates select="Telephone"/>
		</div>
	</xsl:template>

	<xsl:template match="Courriel">
		<a href="mailto:{.}"><xsl:value-of select="current()"/></a>
	</xsl:template>
	<xsl:template match="Telephone">
		<a href="tel:{.}"><xsl:value-of select="current()"/></a>
	</xsl:template>

	<xsl:template match="cv/Publications">
		<h2>Publications</h2>
		<table>
			<xsl:apply-templates select="Publication"/>	
		</table>
	</xsl:template>

	<xsl:template match="Publication">
		<tr>
			<th><xsl:value-of select="Date"/></th>
			<td>
				<p><xsl:value-of select="Titre"/></p>
				<p class="institution">
					<xsl:value-of select="Revue"/>,
					volume <xsl:value-of select="Volume"/>,
					numero <xsl:value-of select="Numerot"/>.
					</p>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet> 
