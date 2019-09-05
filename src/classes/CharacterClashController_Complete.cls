public with sharing class CharacterClashController_Complete {

	@AuraEnabled
	public static String getScienceCharacter() {
		ScienceCharacter_Complete scienceChar = (ScienceCharacter_Complete) new CharacterFactory_Complete().getCharacter('Science');
		scienceChar.Name = 'Richard Sanchez';
		scienceChar.Strength = Integer.valueOf(Math.random() * 5 + 1);
		scienceChar.Stamina = Integer.valueOf(Math.random() * 20 + 1);
		scienceChar.Science = Integer.valueOf(Math.random() * 30 + 1);
		return JSON.serialize(scienceChar);

	}

	@AuraEnabled
	public static String getSpellsCharacter() {
		SpellsCharacter_Complete spellsChar = (SpellsCharacter_Complete) new CharacterFactory_Complete().getCharacter('Spells');
		spellsChar.Name = 'Gandalf the White';
		spellsChar.Strength = Integer.valueOf(Math.random() * 15 + 1);
		spellsChar.Stamina = Integer.valueOf(Math.random() * 20 + 1);
		spellsChar.Spells = Integer.valueOf(Math.random() * 20 + 1);
		return JSON.serialize(spellsChar);
	}

	@AuraEnabled
	public static String clash(Character character1, Character character2) {

		String arenaType;
		if (Math.random() < .5) {
			arenaType = 'Ooze';
		} else {
			arenaType = 'Mana';
		}

		Arena_Complete arena = new ArenaBuilder_Complete()
			.setArenaType(arenaType)
			.build();

		Integer rounds = Integer.valueOf(Math.random() * 4 + 1);
		return new CharacterClashComparator_Complete(arena).compareCharacters(character1, character2, rounds);
	}
}