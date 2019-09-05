import {LightningElement, track} from 'lwc';
import getSpellsCharacter from '@salesforce/apex/CharacterClashController.getSpellsCharacter';
import getScienceCharacter from '@salesforce/apex/CharacterClashController.getScienceCharacter';
import clash from '@salesforce/apex/CharacterClashController.clash';

export default class CharacterClash extends LightningElement {

	@track SpellsCharacter;
	@track ScienceCharacter;
	@track ClashOutcome;

	connectedCallback() {
		this.getCharacters();
	}

	handleClashClick() {
		clash({
			character1: JSON.parse(JSON.stringify(this.ScienceCharacter)),
			character2: JSON.parse(JSON.stringify(this.SpellsCharacter))
		})
			.then(result => this.ClashOutcome = result)
			.catch(err => console.log(err));
	}

	handleRerollClick() {
		this.getCharacters();
	}

	getCharacters() {
		getSpellsCharacter()
			.then(result => this.SpellsCharacter = JSON.parse(result))
			.catch(err => console.log(err));
		getScienceCharacter()
			.then(result => this.ScienceCharacter = JSON.parse(result))
			.catch(err => console.log(err));
	}
}