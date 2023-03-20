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
      <actions>
         <name>WF_Testing</name>
         <type>Task</type>
      </actions>
      <active>true</active>
      <criteriaItems>
         <field>Asset__c.Asset_Type__c</field>
         <operation>equals</operation>
         <value>Fix Deposit</value>
      </criteriaItems>
      <triggerType>onCreateOnly</triggerType>
   </rules>
   <tasks>
      <fullName>WF_Testing</fullName>
      <assignedTo>akash@flexagon.devorg</assignedTo>
      <assignedToType>user</assignedToType>
      <description>Workflow Testing by AkashFlex</description>
      <dueDateOffset>10</dueDateOffset>
      <notifyAssignee>false</notifyAssignee>
      <offsetFromField>Asset__c.CreatedDate</offsetFromField>
      <priority>Low</priority>
      <protected>false</protected>
      <status>Not Started</status>
      <subject>WF Testing</subject>
   </tasks>
</Workflow>
