<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
   <fieldUpdates>
      <fullName>Field_Update_Asset</fullName>
      <field>Asset_Available__c</field>
      <literalValue>1</literalValue>
      <name>Field Update - Asset</name>
      <notifyAssignee>false</notifyAssignee>
      <operation>Literal</operation>
      <protected>false</protected>
      <reevaluateOnChange>false</reevaluateOnChange>
   </fieldUpdates>
   <rules>
      <fullName>Rule1</fullName>
      <actions>
         <name>Field_Update_Asset</name>
         <type>FieldUpdate</type>
      </actions>
      <active>true</active>
      <criteriaItems>
         <field>Asset__c.Asset_Type__c</field>
         <operation>equals</operation>
         <value>Fix Deposit</value>
      </criteriaItems>
      <triggerType>onCreateOnly</triggerType>
   </rules>
</Workflow>
