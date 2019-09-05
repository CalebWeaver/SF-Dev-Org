public with sharing class SpellsCharacter extends Character {
	@AuraEnabled
	public String Catchphrase {get {
		return 'Abracadabra!';
	}}

	@AuraEnabled
	public String Accessory {get {
		return 'Wand';
	}}
}