<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <ns uri="urn:iso:std:iso:30042:ed:3.0" prefix="tbx" />
    <pattern id="coreEnforecement">
        <rule context="tbx:termNote">
<assert test="parent::tbx:termSec or parent::tbx:termNoteGrp/parent::tbx:termSec">Any termNote is only allowed at the termSec level.</assert>
        </rule>
        <rule context="tbx:*[@type]">
            <assert test="@type != ''">Data category must be declared.  If no permitted data categories are listed in the grammar schema, blank values are also not allowed.</assert>
        </rule>
    </pattern>
    
    <pattern id="dialectEnforcement">
        <rule context="tbx:tbx">
<assert test="attribute::type='TBX-Linguist'">The name of this dialect should be TBX-Linguist</assert>
<assert test="attribute::style='dca'">The style of this dialect should be declared as 'dca'</assert>
        </rule>
    </pattern>
    
    <!-- Min Module Rules -->
    <pattern id="module.min.admin">
        <rule context="tbx:admin[@type='customerSubset']">
<assert test="parent::tbx:termSec or parent::tbx:adminGrp/parent::tbx:termSec">Customer Subset may only appear at the termSec level</assert>
        </rule>
    </pattern>
    <pattern id="module.min.descrip">
        <rule context="tbx:descrip[@type='subjectField']" >
<assert test="parent::tbx:conceptEntry or parent::tbx:descripGrp/parent::tbx:conceptEntry">Subject Field can only appear at conceptEntry level.</assert>
        </rule>
    </pattern>
    <pattern id="module.min.termNote">
        <rule context="tbx:termNote[@type='administrativeStatus']">
<assert test=".='admitted' or .='notRecommended' or .='obsolete' or .='preferred'">The termType must be either 'admitted', 'notRecommended', 'obsolete', or 'preferred'</assert>
        </rule>
        <rule context="tbx:termNote[@type='partOfSpeech']">
<assert test=".='adjective' or .='noun' or .='other' or .='verb' or .='adverb'">Permitted values of /partOfSpeech/ are 'noun', 'other', 'verb', 'adverb', or 'adjective'</assert>
        </rule>
    </pattern>
    
    <!-- Basic Module Rules -->
    <pattern id="module.basic.admin">
        <rule context="tbx:admin[@type='projectSubset']">
<assert test="parent::tbx:termSec or parent::tbx:adminGrp/parent::tbx:termSec">Project may only appear at the termSec level</assert>
        </rule>
    </pattern>
    <pattern id="module.basic.descrip">
        <rule context="tbx:descrip[@type='context']">
<assert test="parent::tbx:termSec or parent::tbx:descripGrp/parent::tbx:termSec">Context appears at the termSec level</assert>
        </rule>
        <rule context="tbx:descrip[@type='definition']">
<assert test="parent::tbx:conceptEtnry or parent::tbx:descripGrp/parent::tbx:conceptEntry or 
parent::tbx:langSec or parent::tbx:descripGrp/parent::tbx:langSec">
    Definition may appear at the conceptEntry or langSec levels.
</assert>
        </rule>
        <rule context="tbx:descrip[@type='subjectField']">
<assert test="parent::tbx:conceptEntry or parent::tbx:descripGrp/parent::tbx:conceptEntry">Subject Field may appear only at the conceptEntry level</assert>
        </rule>
    </pattern>
    <pattern id="module.basic.termNote">
        <rule context="tbx:termNote[@type='gender']">
<assert test=".='masculine' or .='feminine' or .='neuter' or .='other'">Permitted values of Gender are 'masculine', 'feminine', 'neuter', or 'other'</assert>
        </rule>
        <rule context="tbx:termNote[@type='termLocation']">
            <assert test=".='checkBox' or .='comboBox' or .='comboBoxElement' or .='dialogBox' or .='groupBox' or .='informativeMessage' or .='interactiveMessage' or .='menuItem' or
               .='progressBar' or .='pushButton' or .='radioButton' or .='slider' or .='spinBox' or .='tab' or .='tableText' or .='textBox' or .='toolTip' or .='user-definedType'">
               Permitted values are: 	checkBox, comboBox, comboBoxElement, dialogBox, groupBox, informativeMessage, interactiveMessage, menuItem, progressBar, pushButton, radioButton, slider, spinBox, tab, tableText, textBox, toolTip, user-definedType
            </assert>
        </rule>
        <rule context="tbx:termNote[@type='termType']">
<assert test=".='fullForm' or .='acronym' or .='abbreviation' or .='shortForm' or .='variant' or .='phrase'">Permitted values of Term Type are 'fullForm', 'acronym', 'abbreviation', 'shortForm', 'variant', or 'phrase'</assert>
        </rule>
    </pattern>
    <pattern id="module.basic.transac">
        <rule context="tbx:transac[@type='transactionType']">
<assert test=".='origination' or .='modification'">Transaction type may be either 'origination' or 'modification'.</assert>
        </rule>
    </pattern>
    <pattern id="module.basic.ref">
        <rule context="tbx:ref[@type='crossReference']">
<assert test="parent::tbx:conceptEntry or parent::tbx:termSec">Cross References must only be found at the conceptEntry or termSec levels.</assert>
        </rule>
    </pattern>
    <pattern id="module.basic.xref">
        <rule context="tbx:xref[@type='externalCrossReference']">
<assert test="parent::tbx:termSec">External Cross Reference may be used at the termSec level.</assert>
        </rule>
        <rule context="tbx:xref[@type='xGraphic']">
<assert test="parent::tbx:conceptEntry">Image must only be found at the conceptEntry level.</assert>
        </rule>
    </pattern>
    
    <!-- Linguist Module Rules -->
    <pattern id="module.linguist.admin">
        <rule context="tbx:admin[@type='reading']">
            <assert test="parent::tbx:termSec or parent::tbx:adminGrp/parent::tbx:termSec">Reading must be at the term level.</assert>
        </rule>
        <rule context="tbx:admin[@type='transferComment']">
            <assert test="parent::tbx:langSec or parent::tbx:adminGrp/parent::tbx:langSec">transferComment may only be found at the langSec level.</assert>
        </rule>
    </pattern>
    
    <pattern id="module.linguist.adminNote">
        <rule context="tbx:adminNote[@type='readingNote']">
            <assert test="parent::tbx:adminGrp/parent::tbx:termSec">readingNote may only be found at the termSec level inside an adminGrp.</assert>
        </rule>
    </pattern>
    
    <pattern id="module.linguist.termNote">
        <rule context="tbx:termNote[@type='grammaticalNumber']">
            <assert test=".='singular' or .='plural' or .='dual' or .='mass' or .='otherNumber'">Permitted values of grammaticalNumber are: singular, plural, dual, mass, or otherNumber.</assert>
        </rule>
        <rule context="tbx:termNote[@type='register']">
            <assert test=".='colloquialRegister' or .='neutralRegister' or .='technicalRegister' or .='in-houseRegister' or .='bench-levelRegister' or .='slangRegister' or .='vulgarRegister'">Permitted values of register are: 
                colloquialRegister, neutralRegister, technicalRegister, in-houseRegister, bench-levelRegister, slangRegister, or vulgarRegister</assert>
        </rule>
    </pattern>
</schema>