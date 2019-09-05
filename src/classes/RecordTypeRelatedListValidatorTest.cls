@isTest
public with sharing class RecordTypeRelatedListValidatorTest {

	@isTest
	static void validate_isValidRequest_shouldReturnTrue() {
		RecordTypeRelatedListValidator validator = new RecordTypeRelatedListValidator();
		validator.SObjectName = 'Account';
		validator.RecordType = 'Master';
		validator.Fields = new List<String> {'Name'};

		System.assert(validator.validate(), 'Should have validated successfully');
	}

	@isTest
	static void validate_invalidSObject_shouldReturnFalse() {
		RecordTypeRelatedListValidator validator = new RecordTypeRelatedListValidator();
		validator.SObjectName = '';
		validator.RecordType = 'Master';
		validator.Fields = new List<String> {'Name'};

		System.assert(!validator.validate(), 'Should have been invalidated');
	}

	@isTest
	static void validate_invalidRecordType_shouldReturnFalse() {
		RecordTypeRelatedListValidator validator = new RecordTypeRelatedListValidator();
		validator.SObjectName = 'Account';
		validator.RecordType = '';
		validator.Fields = new List<String> {'Name'};

		System.assert(!validator.validate(), 'Should have been invalidated');
	}

	@isTest
	static void validate_invalidFields_shouldReturnFalse() {
		RecordTypeRelatedListValidator validator = new RecordTypeRelatedListValidator();
		validator.SObjectName = 'Account';
		validator.RecordType = 'Master';
		validator.Fields = new List<String> {'Name', 'BadField'};

		System.assert(!validator.validate(), 'Should have been invalidated');
	}
}