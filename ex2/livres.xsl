<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>XHTML Livres</title>

                <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

                <link rel="stylesheet" href="style.css"/>
                <link rel="stylesheet"
                    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                    crossorigin="anonymous"/>
                <link rel="stylesheet"
                    href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
                    integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
                    crossorigin="anonymous"/>
                <link rel="stylesheet"
                    href="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.css"/>
            </head>
            <body>
                <div class="container-fluid">
                    <form>
                        <div class="form-row">
                            <div class="form-group col-6">
                                <label for="min">Min</label>
                                <input type="text" class="form-control" id="min" placeholder="Min"/>
                            </div>
                            <div class="form-group col-6">
                                <label for="max">Max</label>
                                <input type="text" class="form-control" id="max" placeholder="Max"/>
                            </div>
                        </div>
                        <button type="button" onclick="refreshTable()" class="btn btn-primary"
                            >Soumettre</button>
                        <button type="button" onclick="resetTable()" class="btn btn-danger"
                            >Reset</button>
                    </form>
                    <table id="table" data-toggle="table" data-detail-view="true"
                        data-detail-formatter="detailFormatter" class="table">
                        <thead>
                            <tr>
                                <th scope="col">Auteur</th>
                                <th scope="col">Livre</th>
                                <th scope="col" data-visible="false">Langue</th>
                                <th scope="col">Annee</th>
                                <th scope="col">Prix</th>
                                <th scope="col" data-visible="false">Devise</th>
                                <th scope="col" data-visible="false">Couverture</th>
                                <th scope="col" data-visible="false">Commentaire</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:apply-templates select="bibliotheque/auteurs"/>
                        </tbody>
                    </table>
                </div>

                <script>
                    function refreshTable() {
                    
                        let init = document.getElementsByTagName('tr');
                        if (document.getElementsByClassName('detail-view').length > 0) {
                            alert('Close detailed views!')
                        } else {
                        for (let j = 0; j &lt; init.length; j++) {
                        init[j].className = "visible";                   
                        }
                        
                        let elements = document.getElementsByClassName('prix');
                        let min = document.getElementById('min').value;
                        let max = document.getElementById('max').value;
                        
                        if (min == '') min = '0';
                        if (max == '') max = '100';
                        
                        for (let i = 0; i &lt; elements.length; i++) {
                            if (!(parseFloat(min) &lt;= parseFloat(elements[i].innerHTML)
                            &amp;&amp; parseFloat(elements[i].innerHTML) &lt;= parseFloat(max))) {
                                    elements[i].parentElement.classList.toggle('d-none');
                                    if (elements[i].parentElement.nextSibling.classList.contains("detail-view")) {
                                        elements[i].parentElement.nextSibling.toggle('d-none');
                                    }
                                }
                            }                     
                        }
                    }
                    
                    function resetTable() {
                        let init = document.getElementsByTagName('tr');
                        for (let j = 0; j &lt; init.length; j++) {
                        init[j].className = "visible";
                        }
                    }
                    
                    function detailFormatter(index, row) {
                        let html = [];
                        html.push('&lt;p&gt;&lt;b&gt; Auteur: &lt;/b&gt; ' + row[0] + '&lt;/p&gt;');
                        html.push('&lt;p&gt;&lt;b&gt; Livre: &lt;/b&gt; ' + row[1] + '&lt;/p&gt;');
                        html.push('&lt;p&gt;&lt;b&gt; Langue du livre: &lt;/b&gt; ' + row[2] + '&lt;/p&gt;');
                        html.push('&lt;p&gt;&lt;b&gt; Annee: &lt;/b&gt; ' + row[3] + '&lt;/p&gt;');
                        html.push('&lt;p&gt;&lt;b&gt; Prix: &lt;/b&gt; ' + row[4] + '&lt;/p&gt;');
                        html.push('&lt;p&gt;&lt;b&gt; Devise: &lt;/b&gt; ' + row[5] + '&lt;/p&gt;');
                        html.push('&lt;p&gt;&lt;b&gt; Couverture: &lt;/b&gt; ' + row[6] + '&lt;/p&gt;');
                        html.push('&lt;p&gt;&lt;b&gt; Commentaire: &lt;/b&gt; ' + row[7] + '&lt;/p&gt;');
                        return html.join('');
                    }
                </script>

                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"/>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"/>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"/>
                <script src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.js"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="auteurs">
        <xsl:apply-templates>
            <xsl:sort select="nom"/>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="auteur">
        <xsl:variable name="ident" select="@ident"/>
        <xsl:variable name="nom" select="nom"/>
        <xsl:variable name="prenom" select="prenom"/>
        <xsl:for-each select="//livre">
            <xsl:variable name="langue" select="@langue"/>
            <xsl:variable name="annee" select="annee"/>
            <xsl:variable name="titre" select="titre"/>
            <xsl:variable name="prix" select="prix"/>
            <xsl:variable name="commentaire" select="commentaire"/>
            <xsl:variable name="couverture" select="couverture"/>
            <xsl:variable name="auteurs" select="tokenize(@auteurs, '\s+')"/>
            <xsl:if test="contains($auteurs[1], $ident)">
                <tr class="visible">
                    <td>
                        <xsl:value-of select="concat($nom, ', ', $prenom)"/>
                    </td>
                    <td>
                        <xsl:value-of select="$titre"/>
                    </td>
                    <td>
                        <xsl:value-of select="$langue"/>
                    </td>
                    <td class="annee">
                        <xsl:value-of select="$annee"/>
                    </td>
                    <td class="prix">
                        <xsl:value-of select="$prix"/>
                    </td>
                    <td class="devise">
                        <xsl:value-of select="$prix/@devise"/>
                    </td>
                    <td class="couverture">
                        <xsl:value-of select="$couverture"/>
                    </td>
                    <td class="commentaire">
                        <xsl:value-of select="$commentaire"/>
                    </td>
                </tr>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
