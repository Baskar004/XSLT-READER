<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/library">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>Library</title>
        <style>
          body { font-family: Arial, sans-serif; margin: 1.5rem; }
          table { border-collapse: collapse; width: 100%; }
          th, td { border: 1px solid #ccc; padding: 6px 10px; text-align: left; }
          th { background: #f0f0f0; }
          td.num { text-align: right; }
        </style>
      </head>
      <body>
        <h1>Library (<xsl:value-of select="count(book)"/> books)</h1>
        <table>
          <tr><th>ID</th><th>Title</th><th>Author</th><th>Year</th><th>Price</th></tr>
          <xsl:for-each select="book">
            <xsl:sort select="year" data-type="number" order="descending"/>
            <tr>
              <td><xsl:value-of select="@id"/></td>
              <td><xsl:value-of select="title"/></td>
              <td><xsl:value-of select="author"/></td>
              <td class="num"><xsl:value-of select="year"/></td>
              <td class="num"><xsl:value-of select="format-number(price, '#,##0.00')"/></td>
            </tr>
          </xsl:for-each>
        </table>
        <p>Total price: <b><xsl:value-of select="format-number(sum(book/price), '#,##0.00')"/></b></p>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
