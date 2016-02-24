angular.module('formApp', [])
  .controller('FormController', function() {
    var form = this;
    
    form.formDefinition = [
    	{
    	  id: 'studentinfo',
    	  fields: [
    	      {name: 'firstName', value: '', type: 'text', trim: true, placeholder: 'First Name'},
	          {name: 'lastName', value: '', type: 'text', trim: true, placeholder: 'Last Name'}
    	    ]
      },
      {
        id: 'contactinfo',
        fields: [
            {name: 'email', value: '', type: 'email', trim: true, placeholder: 'Email'},
            {name: 'phone', value: '', type: 'tel', trim: true, placeholder: 'Phone Number'},
            {name: 'okayToCall', value: '', type: 'boolean', trim: false, placeholder: 'Okay To Call?'}
          ]
      }
    ];
  });