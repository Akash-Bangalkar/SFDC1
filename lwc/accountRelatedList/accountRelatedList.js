import { LightningElement, api, track, wire } from 'lwc';
import {getRelatedListRecords} from 'lightning/uiRelatedListApi';

export default class AccountRelatedList extends LightningElement {
    @api recordId;

    //Contact Related Records
    @track contactData;
    @track contactError;
    @wire(getRelatedListRecords, {
        parentRecordId:'$recordId',
        relatedListId:'Contacts',
        fields:['Contact.Id','Contact.Name','Contact.Title']
    })
    WiredContact(result)
    {
        const {data,error} = result;
        if(data)
        {
            this.contactData = data.records;
            this.contactError = undefined;
        }
        else if(error)
        {
            this.contactError = error;
            this.contactData = undefined;
        }
    }

    //Opportunity Related Records
    @track oppData;
    @track oppError;

    @wire(getRelatedListRecords, {
        parentRecordId:'$recordId',
        relatedListId:'Opportunities',
        fields:['Opportunity.Id','Opportunity.Name','Opportunity.StageName']
    })
    WiredOpp(result)
    {
        const {data, error} = result;
        if(data)
        {
            this.oppData = data.records;
            this.oppError = undefined;
        }
        else if(error)
        {
            this.oppError = error;
            this.oppData = undefined;
        }
    }

    //Case Related Records
    @track caseData;
    @track caseError;

    @wire(getRelatedListRecords, {
        parentRecordId:'$recordId',
        relatedListId:'Cases',
        fields:['Case.Id','Case.CaseNumber','Case.Subject']
    })
    WiredCase(result)
    {
        const {error,data} = result;
        if(data)
        {
            this.caseData = data.records;
            this.caseError = undefined;
        }
        else if(error)
        {
            this.caseError = error;
            this.caseData = undefined;
        }
    }
}