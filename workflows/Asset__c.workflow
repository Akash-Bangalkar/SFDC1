<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
   <alerts>
      <fullName>New_Email_Alert</fullName>
      <description>New Email Alert</description>
      <protected>false</protected>
      <recipients>
         <recipient>Project_Manager</recipient>
         <type>role</type>
      </recipients>
      <recipients>
         <recipient>akash12@flexagon.devorg</recipient>
         <type>user</type>
      </recipients>
      <senderType>CurrentUser</senderType>
      <template>unfiled$public/SupportCaseResponse</template>
   </alerts>
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
   <outboundMessages>
      <fullName>MessageAction</fullName>
      <apiVersion>57.0</apiVersion>
      <endpointUrl>https://flexagon.com/</endpointUrl>
      <fields>Asset_Available__c</fields>
      <fields>Asset_Type__c</fields>
      <fields>Id</fields>
      <fields>Lead__c</fields>
      <includeSessionId>false</includeSessionId>
      <integrationUser>akash12@flexagon.devorg</integrationUser>
      <name>MessageAction</name>
      <protected>false</protected>
      <useDeadLetterQueue>false</useDeadLetterQueue>
   </outboundMessages>
   <rules>
      <fullName>Rule1</fullName>
      <actions>
         <name>New_Email_Alert</name>
         <type>Alert</type>
      </actions>
      <actions>
         <name>MessageAction</name>
         <type>OutboundMessage</type>
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
      <assignedTo>akash12@flexagon.devorg</assignedTo>
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
