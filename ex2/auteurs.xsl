<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>XHTML Auteurs</title>

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
                            <div class="form-group col-12">
                                <label for="auteur">Recherche par auteur</label>
                                <input type="text" class="form-control" id="auteur"
                                    placeholder="Auteur"/>
                            </div>
                        </div>
                        <button type="button" onclick="refreshTable()" class="btn btn-primary"
                            >Soumettre</button>
                        <button type="button" onclick="resetTable()" class="btn btn-danger"
                            >Reset</button>
                    </form>
                    <div id="toolbar"> </div>
                    <table data-toggle="table" data-detail-view="true"
                        data-detail-formatter="detailFormatter" class="table">
                        <thead>
                            <tr>
                                <th scope="col">Auteur</th>
                                <th scope="col">Livre</th>
                                <th scope="col">Prix</th>
                                <th scope="col" data-visible="false">Annee</th>
                                <th scope="col" data-visible="false">Commentaire</th>
                                <th scope="col" data-visible="false">Couverture</th>
                                <th scope="col" data-visible="false">Adresse</th>
                                <th scope="col" data-visible="false">Commentaire</th>
                                <th scope="col" data-visible="false">Email</th>
                                <th scope="col" data-visible="false">ID</th>
                                <th scope="col" data-visible="false">Langue</th>
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
                        for (let j = 0; j &lt; init.length; j++) {
                            init[j].className = "visible";
                        }
                        
                        let elements = document.getElementsByClassName('auteur');
                        let auteur = document.getElementById('auteur').value;
                        for (let i = 0; i &lt; elements.length; i++) {
                        if (!(elements[i].innerHTML.toLowerCase().includes(auteur.toLowerCase()))) {
                                elements[i].parentElement.classList.toggle('d-none');
                                if (elements[i].parentElement.nextSibling.classList.contains("detail-view")) {
                                    elements[i].parentElement.nextSibling.toggle('d-none');
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
                        html.push('&lt;p&gt;&lt;b&gt; Langue du livre: &lt;/b&gt; ' + row[10] + '&lt;/p&gt;');
                        html.push('&lt;p&gt;&lt;b&gt; Prix: &lt;/b&gt; ' + row[2] + '&lt;/p&gt;');
                        html.push('&lt;p&gt;&lt;b&gt; Annee: &lt;/b&gt; ' + row[3] + '&lt;/p&gt;');
                        html.push('&lt;p&gt;&lt;b&gt; Commentaire livre: &lt;/b&gt; ' + row[4] + '&lt;/p&gt;');
                        html.push('&lt;p&gt;&lt;b&gt; Couverture: &lt;/b&gt; ' + row[5] + '&lt;/p&gt;');
                        html.push('&lt;p&gt;&lt;b&gt; Adresse: &lt;/b&gt; ' + row[6] + '&lt;/p&gt;');
                        html.push('&lt;p&gt;&lt;b&gt; Commentaire auteur: &lt;/b&gt; ' + row[7] + '&lt;/p&gt;');
                        html.push('&lt;p&gt;&lt;b&gt; Email: &lt;/b&gt; ' + row[8] + '&lt;/p&gt;');
                        html.push('&lt;p&gt;&lt;b&gt; ID: &lt;/b&gt; ' + row[9] + '&lt;/p&gt;');
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

    <xsl:template name="livreDetail"> </xsl:template>

    <xsl:template match="auteurs">
        <xsl:apply-templates>
            <xsl:sort select="nom"/>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="auteur">
        <xsl:variable name="nom" select="nom"/>
        <xsl:variable name="prenom" select="prenom"/>
        <xsl:variable name="adresse0" select="adresse/numero"/>
        <xsl:variable name="adresse1" select="adresse/rue"/>
        <xsl:variable name="adresse2" select="adresse/ville"/>
        <xsl:variable name="adresse3" select="adresse/cp"/>
        <xsl:variable name="adresse"
            select="concat($adresse0, ' ', $adresse1, ' ', $adresse2, ' ', $adresse3)"/>
        <xsl:variable name="commentaireA" select="commentaire"/>
        <xsl:variable name="email" select="email"/>
        <xsl:variable name="ident" select="@ident"/>
        <xsl:for-each select="//livre">
            <xsl:sort select="prix" data-type="number" order="descending"/>
            <xsl:variable name="langue" select="@langue"/>
            <xsl:variable name="annee" select="annee"/>
            <xsl:variable name="titre" select="titre"/>
            <xsl:variable name="prix" select="prix"/>
            <xsl:variable name="commentaire" select="commentaire"/>
            <xsl:variable name="couverture" select="couverture"/>
            <xsl:variable name="auteurs" select="tokenize(@auteurs, '\s+')"/>
            <xsl:for-each select="$auteurs">
                <xsl:if test=". = $ident">
                    <tr>
                        <td class="auteur">
                            <xsl:value-of select="concat($nom, ', ', $prenom)"/>
                        </td>
                        <td>
                            <xsl:value-of select="$titre"/>
                        </td>
                        <td class="prix">
                            <xsl:value-of select="$prix"/>
                        </td>
                        <td class="annee">
                            <xsl:value-of select="$annee"/>
                        </td>
                        <td class="commentaire">
                            <xsl:value-of select="$commentaire"/>
                        </td>
                        <td class="couverture">
                            <xsl:value-of select="$couverture"/>
                        </td>
                        <td class="adresse">
                            <xsl:value-of select="$adresse"/>
                        </td>
                        <td class="commentaireA">
                            <xsl:value-of select="$commentaireA"/>
                        </td>
                        <td class="email">
                            <xsl:value-of select="$email"/>
                        </td>
                        <td class="ident">
                            <xsl:value-of select="$ident"/>
                        </td>
                        <td>
                            <xsl:value-of select="$langue"/>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
