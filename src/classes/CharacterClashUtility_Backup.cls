public with sharing class CharacterClashUtility_Backup {

	public String ArenaType {get;set;}
	public Integer CrowdSize {get;set;}
	public Integer ArenaOccupancy {get;set;}
	public List<String> Concessions {get;set;}

	public CharacterClashUtility_Backup(String arenaType) {

		Concessions = new List<String>();

		if (arenaType == 'Ooze') {
			Concessions.add('Pudding');
		} else if (arenaType == 'Mana') {
			Concessions.add('Popsicles');
		}
		this.ArenaType = arenaType;

		ArenaOccupancy = 2;
		CrowdSize = 500;
	}

	public CharacterClashUtility_Backup(String arenaType, String arenaSize) {

		Concessions = new List<String>();

		if (arenaType == 'Ooze') {
			Concessions.add('Pudding');
		} else if (arenaType == 'Mana') {
			Concessions.add('Popsicles');
		}
		this.ArenaType = arenaType;

		if (arenaSize == 'Small') {
			ArenaOccupancy = 2;
			CrowdSize = 100;
		} else if (arenaSize == 'Large') {
			ArenaOccupancy = 4;
			CrowdSize = 1000;
		}
	}

	public CharacterClashUtility_Backup(String arenaType, String arenaSize, String specialConcession) {

		Concessions = new List<String>();

		Concessions.add(specialConcession);
		if (arenaType == 'Ooze') {
			Concessions.add('Pudding');
		} else if (arenaType == 'Mana') {
			Concessions.add('Popsicles');
		}
		this.ArenaType = arenaType;

		if (arenaSize == 'Small') {
			ArenaOccupancy = 2;
			CrowdSize = 100;
		} else if (arenaSize == 'Large') {
			ArenaOccupancy = 4;
			CrowdSize = 1000;
		}
	}

	public String compareCharacters(Character_Backup character1, Character_Backup character2, Integer rounds) {

		Integer score1 = 0;
		Integer score2 = 0;

		if (ArenaType == 'Ooze'
			&& character1.Science > character2.Science) {
			character1.Science += 2;
		} else if (ArenaType == 'Ooze'
			&& character2.Science > character1.Science) {
			character2.Science += 2;
		}

		if (ArenaType == 'Mana'
			&& character1.Spells > character2.Spells) {
			character1.Spells += 2;
		} else if (ArenaType == 'Mana'
			&& character2.Spells > character1.Spells) {
			character2.Spells += 2;
		}

		if (character1.IsSciency) {
			character1.Accessory = 'Ray Gun';
		} else {
			character1.Accessory = 'Wand';
		}

		if (character2.IsSciency) {
			character2.Accessory = 'Ray Gun';
		} else {
			character2.Accessory = 'Wand';
		}

		for (Integer round = 0; round < rounds; round++) {
			if (character1.Strength > character2.Strength) {
				score1 += round + character1.Strength;
			} else if (character2.Strength > character1.Strength) {
				score2 += round + character2.Strength;
			}

			if (character1.Stamina > character2.Stamina) {
				score1 += round + character1.Stamina;
			} else if (character2.Stamina > character1.Stamina) {
				score2 += round + character2.Stamina;
			}

			if (character1.Spells > character2.Spells) {
				score1 += round * character1.Spells;
			} else if (character2.Spells > character1.Spells) {
				score2 += round * character2.Spells;
			}

			if (character1.Science > character2.Science) {
				score1 += round * character1.Science;
			} else if (character2.Science > character1.Science) {
				score2 += round * character2.Science;
			}
		}

		if (score1 > score2) {
			return character1.Name + ' is the best character, with the ' + character1.Accessory + ' in the ' + ArenaType
				+ ' arena! The final score was ' + score1 + ' to ' + score2 + '! '
				+ character1.Catchphrase;
		} else if (score2 > score1) {
			return character2.Name + ' is the best character, with the ' + character2.Accessory + ' in the ' + ArenaType
				+ ' arena! The final score was ' + score1 + ' to ' + score2 + '! '
				+ character2.Catchphrase;
		} else {
			return 'The clash is a draw';
		}
	}
}