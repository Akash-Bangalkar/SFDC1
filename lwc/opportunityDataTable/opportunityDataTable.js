import { LightningElement, track, api, wire } from 'lwc';
import OppData from '@salesforce/apex/OpportunityData.OppData';

export default class OpportunityDataTable extends LightningElement {
    @track col = [
        {label:'Opp Name', fieldName:'Name', type:'text'},
        {label:'Ac Name', fieldName:'AccountName', type:'text'},
        {label:'Close Date', fieldName:'CloseDate', type:'date'},
        {label:'Amount', fieldName:'Amount', type:'currency'}
    ];
    @track oppResult;
    @track oppError;

    @wire(OppData)
    wiredOpp(result)
    {
        const {data, error} = result;
        if(data)
        {
            this.oppResult = data.map(row=>{
                return {...row, AccountName:row.Account.Name};
            }
            );
            this.oppError = undefined;
        }
        else if(error)
        {
            this.oppError = error;
            this.oppResult = undefined;
        }
    }
}