import { LightningElement, track, api, wire } from 'lwc';
import AccList from '@salesforce/apex/AccountData.AccList';

export default class AccountDataTable extends LightningElement {
    @track col = [
        {label:'Account Name', fieldName:'Name', type:'text'},
        {label:'Rating', fieldName:'Rating', type:'text'},
        {label:'Account Code', fieldName:'Code__c', type:'text'}
    ];

    @track acData;
    @track acError;

    @wire(AccList)
    wiredAcData(result)
    {
        const {data, error} = result;
        if(data)
        {
            let tempVar = JSON.parse(JSON.stringify(data));
            this.acData = tempVar;
            this.acError = undefined;
        }
        else if(error)
        {
            this.acError = error;
            this.acData = undefined;
        }
    }
}