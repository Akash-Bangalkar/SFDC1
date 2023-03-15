var template;

export function showFirstName(temp) {
    alert(template.querySelector('.fName').value);
}

export function assignTemplate(temp)
{
    template = temp;
}

const showLastName = (temp) => {
     alert(template.querySelector('.lName').value);
};


export { showLastName };