<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- <xsl:decimal-format name="Europe" decimal-separator="," grouping-separator="."/>
 -->
	<xsl:template match="/">
		<html>
			<body>
				<xsl:apply-templates select="child::customers/child::customer"/>
				<br/>
				
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="customer">
		<table border="3" cellpadding="2">
			<tbody>
				<tr>
					<th colspan="2">Summary Information</th>
				</tr>
				<tr>
					<th>Customer</th>
					<td>
						<xsl:value-of select="cName/fName"/>
						<xsl:value-of select="cName/lName"/>
					</td>
				</tr>
				<tr>
					<th>Customer ID</th>
					<td>C101</td>
				</tr>
				<tr>
					<th>Address</th>
					<td>
						<xsl:value-of select="street"/>
						<xsl:value-of select="city"/>
						<xsl:value-of select="state"/>
						<xsl:value-of select="postalCode"/>
					</td>
				</tr>
				<tr>
					<th>Phone Number</th>
					<td>
						<xsl:value-of select="customers/customer/phone"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="orders/order">
		<tr>
			<td>
				<xsl:value-of select="./attribute::date"/>
			</td>
			<td>
				<xsl:value-of select="position()"/>)
					</td>
			<td>
				<xsl:value-of select="./items/item"/>
			</td>
			<td>
				<xsl:value-of select="./items/item/attribute::qty"/>
			</td>
			<td>
				<xsl:value-of select="./items/item/attribute::price"/>
			</td>
			<td>
				<xsl:value-of select="./items/item/attribute::price"/>*<xsl:value-of select="./items/item/attribute::qty"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="order"/>
</xsl:stylesheet>
