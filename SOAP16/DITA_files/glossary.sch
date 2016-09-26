<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

    <sch:pattern>
        <sch:rule id="key_001" context="text()">
            <sch:report xmlns:sqf="http://www.schematron-quickfix.com/validator/process" test="contains(., 'Aleppo')" sqf:fix="replaceAleppo" role="warning">key_001: Aleppo has a key.</sch:report>
            <sqf:fix xmlns:sqf="http://www.schematron-quickfix.com/validator/process" id="replaceAleppo">
                <sqf:description>
                    <sqf:title>Replace with the Aleppo term?</sqf:title>
                </sqf:description>
                <sqf:stringReplace regex="Aleppo"><term keyref="g_aleppo"/></sqf:stringReplace>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern>
        <sch:rule id="key_002" context="text()">
            <sch:report xmlns:sqf="http://www.schematron-quickfix.com/validator/process" test="matches(., '(^|\W)([bB]iały [jJ]eleń|BJ)(\W|$)')" sqf:fix="replaceBJ" role="warning">key_002:
               Biały Jeleń has a key.</sch:report>
            <sqf:fix xmlns:sqf="http://www.schematron-quickfix.com/validator/process" id="replaceBJ">
                <sqf:description>
                    <sqf:title>Replace with the Biały Jeleń term?</sqf:title>
                </sqf:description>
                <sqf:stringReplace regex="(^|\W)([bB]iały [jJ]eleń|BJ)(\W|$)"><term keyref="g_bialyjelen"/></sqf:stringReplace>
            </sqf:fix>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern>
        <sch:rule id="key_003" context="text()|//term/attribute::conkeyref">
            <sch:report xmlns:sqf="http://www.schematron-quickfix.com/validator/process" test="contains(., 'SOAP')" sqf:fix="replaceSOAP" role="warning">key_003: Soap has a key.</sch:report>
            <sqf:fix xmlns:sqf="http://www.schematron-quickfix.com/validator/process" id="replaceSOAP">
                <sqf:description>
                    <sqf:title>Replace with the Soap term?</sqf:title>
                </sqf:description>
                <sqf:replace><term keyref="g_widget"/></sqf:replace>
            </sqf:fix> 
        </sch:rule>
    </sch:pattern>
    
</sch:schema>