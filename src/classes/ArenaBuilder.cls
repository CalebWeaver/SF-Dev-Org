public with sharing class ArenaBuilder {

	private Arena clashArena = new Arena();

	public ArenaBuilder() {
		clashArena.ArenaOccupancy = 2;
		clashArena.CrowdSize = 500;
	}

	public ArenaBuilder setArenaType(String arenaType) {
		if (arenaType == 'Ooze') {
			clashArena.Concessions.add('Pudding');
		} else if (arenaType == 'Mana') {
			clashArena.Concessions.add('Popsicles');
		}
		this.clashArena.ArenaType = arenaType;

		return this;
	}

	public ArenaBuilder setArenaSize(String arenaSize) {
		if (arenaSize == 'Small') {
			clashArena.ArenaOccupancy = 2;
			clashArena.CrowdSize = 100;
		} else if (arenaSize == 'Large') {
			clashArena.ArenaOccupancy = 4;
			clashArena.CrowdSize = 1000;
		}

		return this;
	}

	public ArenaBuilder setSpecialConcessions(String specialConcessions) {
		clashArena.Concessions.add(specialConcessions);
		return this;
	}

	public Arena build() {
		return clashArena;
	}
}