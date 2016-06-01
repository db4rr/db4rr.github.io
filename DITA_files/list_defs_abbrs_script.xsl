<?xml version="1.0" encoding="UTF-8"?>
<!-- created by wbara --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" encoding="utf-8" indent="no" doctype-public="-//OASIS//DTD DITA Concept//EN" doctype-system="concept.dtd" name="concept"/>

    <!--   <xsl:template match="/">
        <xsl:call-template name="keys" />
    </xsl:template>  -->

    <xsl:variable name="search_files" select="collection(iri-to-uri('./?select=*.(xml|ditamap)'))"/>
    <xsl:variable name="glossary_terms" select="collection(iri-to-uri('./Glossary/?select=*.xml;recurse=yes'))"/>
    <xsl:variable name="first_Search" select="distinct-values($search_files//abbreviated-form/@keyref|$search_files//term/@keyref)"/>
 <!--   <xsl:variable name="gloss_Term" select="../source/glossary/$first_Search/glossentry/glossterm"/> -->


    <xsl:template match="/">
        <xsl:result-document method="xml" href="c_definitions.xml" indent="yes" doctype-public="-//OASIS//DTD DITA Concept//EN" doctype-system="concept.dtd">
            <concept id="c_definitions" xml:lang="en-GB">
                <title>
                    <ph>Definitions</ph>
                </title>
                <conbody>
                    <p>The following terms are used within this document:</p>
                    <dl>
                        <xsl:for-each select="$first_Search">
                            <xsl:sort/>
                            <xsl:variable name="term_name" select="concat('./Glossary/', (.), '.xml')"/>
                                <xsl:element name="dlentry">
                                    <xsl:element name="dt">
                                        <xsl:value-of select="document($term_name)/glossentry/glossterm"/>
                                    </xsl:element>
                                    <xsl:element name="dd">
                                        <xsl:value-of select="document($term_name)/glossentry/glossdef"/>
                                    </xsl:element>
                                </xsl:element>
                        </xsl:for-each>
                    </dl>
                </conbody>
            </concept>
        </xsl:result-document>

        <xsl:result-document method="xml" href="c_abbreviations.xml" indent="yes" doctype-public="-//OASIS//DTD DITA Concept//EN" doctype-system="concept.dtd">
            <concept id="c_abbreviations" xml:lang="en-GB">
                <title>
                    <ph>Acronyms and Abbreviation</ph>
                </title>
                <conbody>
                    <p>The following acronyms and abbreviations are used within this document.</p>
                    <dl>
                        <xsl:for-each select="$first_Search">
                            <xsl:sort/>
                            <xsl:variable name="term_name" select="concat('./Glossary/', (.), '.xml')"/>
                            <xsl:if test="document($term_name)/glossentry/glossBody/glossAlt/glossAcronym">
                                <xsl:element name="dlentry">
                                    <xsl:element name="dt">
                                         <xsl:value-of select="document($term_name)/glossentry/glossBody/glossAlt/glossAcronym"/>
                                    </xsl:element>
                                    <xsl:element name="dd">
                                        <xsl:value-of select="document($term_name)/glossentry/glossterm"/>
                                     </xsl:element>
                                 </xsl:element>
                            </xsl:if>    
                        </xsl:for-each>
                    </dl>
                </conbody>
            </concept>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>