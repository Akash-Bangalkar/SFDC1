import {LightningElement} from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class ShowNotification extends LightningElement
{
    title;
    message;
    variant;
    plOptions = [
        { label: 'Error', value: 'error' },
        { label: 'Warning', value: 'warning' },
        { label: 'Success', value: 'success' },
        { label: 'Info', value: 'info' }
    ];
    
    handleTitle(event)
    {
        this.title = event.target.value;
    }
    
    handleMessage(event)
    {
        this.message = event.target.value;
    }
    
    handleVariant(event)
    {
        this.variant = event.target.value;
    }
    
    showNotification()
    {
        const event = new ShowToastEvent({
            title: this.title,
            message: this.message,
            variant: this.variant
        });
        
        this.dispatchEvent(event);
    }
}