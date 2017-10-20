<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- <xsl:decimal-format name="Europe" decimal-separator="," grouping-separator="."/> -->
<xsl:variable name="grandTotalQty" select="12" />

	<xsl:template match="/">
		<html>
			<body><!-- Init Summary Information Template -->
			
			
				<xsl:apply-templates select="child::customers/child::customer"/>
			
			</body>
		</html>
	</xsl:template><!-- customer template #1 -->
	<xsl:template match="customer">
		<table border="3" cellpadding="2">
			<tbody>
				<tr>
					<th colspan="2" bgcolor="a4d6f9">Summary Information</th>
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
				<tr bgcolor="a4d6f9">
					<th>Date</th>
					<th>Item</th>
					<th>Description</th>
					<th>Qty</th>
					<th>Price</th>
					<th>Total</th>
				</tr>
				<xsl:apply-templates select="orders"/>
				<tr bgcolor="#53b034">
					<td colspan="3">
						Grand total
					</td>
					<td>
						<xsl:value-of select="$grandTotalQty"/>
					</td>
					<td>
						
					</td>
					<td>
						
					</td>
				</tr>
			</tbody>
		</table>
		<br/>
	</xsl:template><!-- End customer template #1 --><!-- Order template #2 -->
	<xsl:template match="orders/order">
		<xsl:apply-templates select="items"/>
		<tr bgcolor="#f7db99">
			<td colspan="3">
				Sub total
			</td>
			<td>
				<xsl:value-of select="sum(items/item/attribute::qty)"/>
				<xsl:with-param name="grandTotalQty" select="sum(items/item/attribute::qty)"/>
			</td>
			<td>
				<xsl:value-of select="format-number(sum(items/item/attribute::price), '#.00')"/>
			</td>
			<td>
				<xsl:value-of select="format-number(sum(items/item/attribute::qty) * sum(items/item/attribute::price), '#.00')"/>
			</td>
		</tr>
	</xsl:template><!-- End order template #2 --><!-- Item template #3 -->
	<xsl:template match="items/item">
		<tr>
			<td>
				<xsl:if test="position()=2">
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
	</xsl:template><!-- End item template #3 -->
</xsl:stylesheet>
