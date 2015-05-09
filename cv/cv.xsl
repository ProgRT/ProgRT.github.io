<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<head>
				<meta charsset="utf-8"/>
				<link rel="stylesheet" href="style.css" />
				<link rel="stylesheet" href="print.css" media="print" />
			</head>
			<body>
				<div id="page">
					<xsl:apply-templates select="cv/Nom"/>
					<xsl:apply-templates select="cv/Experiences"/>
					<xsl:apply-templates select="cv/Formations"/>
					<xsl:apply-templates select="cv/Publications"/>
					<xsl:apply-templates select="cv/Informatique"/>
					<xsl:apply-templates select="cv/Langues"/>
					<xsl:apply-templates select="cv/Coordonnees"/>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="cv/Nom">
		<h1><xsl:value-of select="current()"/></h1>
	</xsl:template>

<!---
                  Experience professionnelle                            
-->

	<xsl:template match="cv/Experiences">
		<h2>Expériences proffessionnelles</h2>
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

<!---
                          Formation accademique                            
-->

	<xsl:template match="cv/Formations">
		<h2>Formation accadémique</h2>
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

<!---
                          competences linguistiques                            
-->

	<xsl:template match="cv/Langues">
		<h2>Compétences linguistiques</h2>
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

<!---
                          Informatique                                         
-->

	<xsl:template match="cv/Informatique">
		<h2>Compétences informatiques</h2>
		<table>				
			<xsl:apply-templates select="Logiciel[Domaine='Bureautique']"/>	
		</table>
	</xsl:template>

	<xsl:template match="Logiciel[Domaine='Bureautique']">
		<tr>
			<th>Bureautique</th>
			<td>
				<xsl:apply-templates select="Nom"/>	
			</td>
		</tr>
	</xsl:template>

<!---
			  Coordonnees                                         
-->

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

	<!---   Publications -->

<!---
			  Coordonnees                                         
-->

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
					numéro <xsl:value-of select="Numerot"/>.
				</p>
			</td>
		</tr>
	</xsl:template>

</xsl:stylesheet> 
