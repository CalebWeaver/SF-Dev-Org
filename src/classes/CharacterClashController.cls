public with sharing class CharacterClashController {

	@AuraEnabled
	public static String getScienceCharacter() {
		Character richard = new Character();
		richard.Name = 'Richard Sanchez';
		richard.Strength = Integer.valueOf(Math.random() * 5 + 1);
		richard.Stamina = Integer.valueOf(Math.random() * 20 + 1);
		richard.Science = Integer.valueOf(Math.random() * 30 + 1);
		if (richard.Science >= richard.Spells) {
			richard.IsSciency = true;
		} else {
			richard.IsSciency = false;
		}
		return JSON.serialize(richard);

	}

	@AuraEnabled
	public static String getSpellsCharacter() {
		Character gandalf = new Character();
		gandalf.Name = 'Gandalf the White';
		gandalf.Strength = Integer.valueOf(Math.random() * 15 + 1);
		gandalf.Stamina = Integer.valueOf(Math.random() * 20 + 1);
		gandalf.Spells = Integer.valueOf(Math.random() * 20 + 1);
		if (gandalf.Science >= gandalf.Spells) {
			gandalf.IsSciency = true;
		} else {
			gandalf.IsSciency = false;
		}
		return JSON.serialize(gandalf);
	}

	@AuraEnabled
	public static String clash(Character character1, Character character2) {

		String arenaType;
		if (Math.random() < .5) {
			arenaType = 'Ooze';
		} else {
			arenaType = 'Mana';
		}

		Integer rounds = Integer.valueOf(Math.random() * 4 + 1);
		Arena clashArena = new ArenaBuilder().setArenaType(arenaType).build();
		return new CharacterClashUtility(clashArena).compareCharacters(character1, character2, rounds);
	}
}