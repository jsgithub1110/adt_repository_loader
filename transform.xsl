<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sdk="http://schemas.android.com/sdk/android/repository/8">

<xsl:template match="/">
<html>
<head>
<style>
td, th {
	padding: 5px 10px;
	text-align:center;
}
</style>
</head>
<body>
<xsl:apply-templates />
</body>
</html>
</xsl:template>

<xsl:template match="sdk:sdk-repository">
	<h2>Platform tools</h2>
	<table border="1">
		<tr>
			<th>Revision</th>
			<th>URL(macosx)</th>
			<th>Size</th>
		</tr>
		<xsl:apply-templates select="sdk:platform-tool" />
	</table>
	<h2>Build tools</h2>
	<table border="1">
		<tr>
			<th>Revision</th>
			<th>URL(macosx)</th>
			<th>Size</th>
		</tr>
		<xsl:apply-templates select="sdk:build-tool" />
	</table>
	<h2>Tool</h2>
	<table border="1">
		<tr>
			<th>Revision</th>
			<th>Min. Platform Tools Rev.</th>
			<th>URL(macosx)</th>
			<th>Size</th>
		</tr>
		<xsl:apply-templates select="sdk:tool" />
	</table>
	<h2>Platforms</h2>
	<table border="1">
		<tr>
			<th>Version</th>
			<th>API Level</th>
			<th>Revision</th>
			<th>URL(macosx)</th>
			<th>Size</th>
			<th>Obsolete</th>
		</tr>
		<xsl:apply-templates select="sdk:platform" />
	</table>
	<h2>System Images</h2>
	<table border="1">
		<tr>
			<th>API Level</th>
			<th>Description</th>
			<th>Revision</th>
			<th>URL(macosx)</th>
			<th>Size</th>
		</tr>
		<xsl:apply-templates select="sdk:system-image" />
	</table>
	<h2>Samples</h2>
	<table border="1">
		<tr>
			<th>API Level</th>
			<th>Description</th>
			<th>Revision</th>
			<th>URL(macosx)</th>
			<th>Size</th>
		</tr>
		<xsl:apply-templates select="sdk:sample" />
	</table>
	<h2>Documentation</h2>
	<table border="1">
		<tr>
			<th>API Level</th>
			<th>Revision</th>
			<th>URL(macosx)</th>
			<th>Size</th>
		</tr>
		<xsl:apply-templates select="sdk:doc" />
	</table>
	<h2>Sources</h2>
	<table border="1">
		<tr>
			<th>API Level</th>
			<th>Revision</th>
			<th>URL(macosx)</th>
			<th>Size</th>
		</tr>
		<xsl:apply-templates select="sdk:source" />
	</table>
</xsl:template>

<xsl:template match="sdk:platform">
	<tr>
		<td>Android <xsl:value-of select="sdk:version"/></td>
		<td><xsl:value-of select="sdk:api-level"/></td>
		<td><xsl:value-of select="sdk:revision"/></td>
		<td>http://dl-ssl.google.com/android/repository/<xsl:value-of select="sdk:archives/sdk:archive[@os='macosx']/sdk:url|sdk:archives/sdk:archive[@os='any']/sdk:url" /></td>
		<td><xsl:value-of select="format-number(sdk:archives/sdk:archive[@os='macosx']/sdk:size|sdk:archives/sdk:archive[@os='any']/sdk:size  div 1048576, '###,###,##0.00')" />MB</td>
		<xsl:choose>
			<xsl:when test="sdk:obsolete"><td>Yes</td></xsl:when>
			<xsl:otherwise><td></td></xsl:otherwise>
		</xsl:choose>
	</tr>
</xsl:template>

<xsl:template match="sdk:system-image">
	<tr>
		<td><xsl:value-of select="sdk:api-level"/></td>
		<td><xsl:value-of select="sdk:description"/></td>
		<td><xsl:value-of select="sdk:revision"/></td>
		<td>http://dl-ssl.google.com/android/repository/<xsl:value-of select="sdk:archives/sdk:archive[@os='macosx']/sdk:url|sdk:archives/sdk:archive[@os='any']/sdk:url" /></td>
		<td><xsl:value-of select="format-number(sdk:archives/sdk:archive[@os='macosx']/sdk:size|sdk:archives/sdk:archive[@os='any']/sdk:size  div 1048576, '###,###,##0.00')" />MB</td>
	</tr>
</xsl:template>

<xsl:template match="sdk:sample">
	<tr>
		<td><xsl:value-of select="sdk:api-level"/></td>
		<td><xsl:value-of select="sdk:description"/></td>
		<td><xsl:value-of select="sdk:revision"/></td>
		<td>http://dl-ssl.google.com/android/repository/<xsl:value-of select="sdk:archives/sdk:archive[@os='macosx']/sdk:url|sdk:archives/sdk:archive[@os='any']/sdk:url" /></td>
		<td><xsl:value-of select="format-number(sdk:archives/sdk:archive[@os='macosx']/sdk:size|sdk:archives/sdk:archive[@os='any']/sdk:size  div 1048576, '###,###,##0.00')" />MB</td>
	</tr>
</xsl:template>

<xsl:template match="sdk:platform-tool">
	<tr>
		<td><xsl:value-of select="sdk:revision/sdk:major"/>.<xsl:value-of select="sdk:revision/sdk:minor"/>.<xsl:value-of select="sdk:revision/sdk:micro"/></td>
		<td>http://dl-ssl.google.com/android/repository/<xsl:value-of select="sdk:archives/sdk:archive[@os='macosx']/sdk:url|sdk:archives/sdk:archive[@os='any']/sdk:url" /></td>
		<td><xsl:value-of select="format-number(sdk:archives/sdk:archive[@os='macosx']/sdk:size|sdk:archives/sdk:archive[@os='any']/sdk:size  div 1048576, '###,###,##0.00')" />MB</td>
	</tr>
</xsl:template>

<xsl:template match="sdk:build-tool">
	<tr>
		<td><xsl:value-of select="sdk:revision/sdk:major"/>.<xsl:value-of select="sdk:revision/sdk:minor"/>.<xsl:value-of select="sdk:revision/sdk:micro"/></td>
		<td>http://dl-ssl.google.com/android/repository/<xsl:value-of select="sdk:archives/sdk:archive[@os='macosx']/sdk:url|sdk:archives/sdk:archive[@os='any']/sdk:url" /></td>
		<td><xsl:value-of select="format-number(sdk:archives/sdk:archive[@os='macosx']/sdk:size|sdk:archives/sdk:archive[@os='any']/sdk:size  div 1048576, '###,###,##0.00')" />MB</td>
	</tr>
</xsl:template>

<xsl:template match="sdk:tool">
	<tr>
		<td><xsl:value-of select="sdk:revision/sdk:major"/>.<xsl:value-of select="sdk:revision/sdk:minor"/>.<xsl:value-of select="sdk:revision/sdk:micro"/></td>
		<td><xsl:value-of select="sdk:min-platform-tools-rev/sdk:major"/></td>
		<td>http://dl-ssl.google.com/android/repository/<xsl:value-of select="sdk:archives/sdk:archive[@os='macosx']/sdk:url|sdk:archives/sdk:archive[@os='any']/sdk:url" /></td>
		<td><xsl:value-of select="format-number(sdk:archives/sdk:archive[@os='macosx']/sdk:size|sdk:archives/sdk:archive[@os='any']/sdk:size  div 1048576, '###,###,##0.00')" />MB</td>
	</tr>
</xsl:template>

<xsl:template match="sdk:doc">
	<tr>
		<td><xsl:value-of select="sdk:api-level"/></td>
		<td><xsl:value-of select="sdk:revision"/></td>
		<td>http://dl-ssl.google.com/android/repository/<xsl:value-of select="sdk:archives/sdk:archive[@os='macosx']/sdk:url|sdk:archives/sdk:archive[@os='any']/sdk:url" /></td>
		<td><xsl:value-of select="format-number(sdk:archives/sdk:archive[@os='macosx']/sdk:size|sdk:archives/sdk:archive[@os='any']/sdk:size  div 1048576, '###,###,##0.00')" />MB</td>
	</tr>
</xsl:template>

<xsl:template match="sdk:source">
	<tr>
		<td><xsl:value-of select="sdk:api-level"/></td>
		<td><xsl:value-of select="sdk:revision"/></td>
		<td>http://dl-ssl.google.com/android/repository/<xsl:value-of select="sdk:archives/sdk:archive[@os='macosx']/sdk:url|sdk:archives/sdk:archive[@os='any']/sdk:url" /></td>
		<td><xsl:value-of select="format-number(sdk:archives/sdk:archive[@os='macosx']/sdk:size|sdk:archives/sdk:archive[@os='any']/sdk:size  div 1048576, '###,###,##0.00')" />MB</td>
	</tr>
</xsl:template>

</xsl:stylesheet>