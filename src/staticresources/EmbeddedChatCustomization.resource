window._snapinsSnippetSettingsFile = (function() {
	embedded_svc.settings.widgetHeight = '500px';
	embedded_svc.settings.widgetWidth = '500px';
	console.log('HERE Now!');

	embedded_svc.settings.extraPrechatInfo = [{
		"entityName": "Contact",
		"entityFieldMaps": [{
			"isExactMatch": false,
			"fieldName": "FirstName",
			"doCreate": true,
			"doFind": false,
			"label": "First Name"
		}, {
			"isExactMatch": false,
			"fieldName": "LastName",
			"doCreate": true,
			"doFind": false,
			"label": "Last Name"
		}, {
			"isExactMatch": false,
			"fieldName": "Email",
			"doCreate": true,
			"doFind": false,
			"label": "Email"
		}]
	}, {
		"entityName": "Case",
		"entityFieldMaps": [{
			"isExactMatch": false,
			"fieldName": "Subject",
			"doCreate": true,
			"doFind": false,
			"label": "issue"
		}]
	// }, {
	// 	"entityName": "Account",
	// 	"entityFieldMaps": [{
	// 		"isExactMatch": true,
	// 		"fieldName": "Name",
	// 		"doCreate": true,
	// 		"doFind": false,
	// 		"label": "Last Name"
	// 	},{
	// 		"isExactMatch": false,
	// 		"fieldName": "RecordTypeId",
	// 		"doCreate": false,
	// 		"doFind": false,
	// 		"label": "recordTypeId"
	// 	}]
	}];
	embedded_svc.settings.extraPrechatFormDetails = [
	{
		"label": "Email",
		"value": "john.doe@salesforce.com",
		"displayToAgent": true
	}, {
		"label": "issue",
		"value": "Do the work",
		"displayToAgent": true
	}, {
		"label": "recordTypeId",
		"value": "0121U0000007nZFQAY",
		"displayToAgent": false
	}];
})();