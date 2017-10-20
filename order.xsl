<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><!-- <xsl:decimal-format name="Europe" decimal-separator="," grouping-separator="."/>
 -->
	<xsl:template match="/">
		<html>
			<body><!-- Init Summary Information Template -->
				<xsl:apply-templates select="child::customers/child::customer"/>
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
						<xsl:value-of select="phone"/>
					</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<table border="3" width="600">
			<tbody>
				<tr>
					<th>Date</th>
					<th>Item</th>
					<th>Description</th>
					<th>Qty</th>
					<th>Price</th>
					<th>Total</th>
				</tr>
				<xsl:apply-templates select="orders"/>
				<tr>
				<td colspan="3">
					Grand total
				</td>
				<td>
					1
				</td>
				<td>
					2
				</td>
				<td>
					3
				</td>
			</tr>
			</tbody>
		</table>
		<br/>
	</xsl:template>
	
	
	<xsl:template match="orders/order">
		<xsl:apply-templates select="items"/>
		<tr>
			<td colspan="3">
				Sub total
			</td>
			<td>
				-
			</td>
			<td>
				-
			</td>
			<td>
				
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="items/item">
		<tr>
			<td>
				<xsl:if test="position()=2" >
				  	<xsl:value-of select="../../attribute::date"/>
				</xsl:if>
			</td>
			<td>
				<xsl:value-of select="position()"/>)
			</td>
			<td>
				<xsl:value-of select="."/>
			</td>
			<td>
				<xsl:value-of select="attribute::qty"/>
			</td>
			<td>
				<xsl:value-of select="attribute::price"/>
			</td>
			<td>
				<xsl:value-of select="attribute::price * attribute::qty"/>
			</td>
		</tr>
	</xsl:template>
	
</xsl:stylesheet>
