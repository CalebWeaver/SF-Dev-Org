public with sharing class BusScheduleCache {
	private Cache.OrgPartition part;

	public BusScheduleCache() {
		part = Cache.Org.getPartition('local.BusSchedule');
	}

	public void putSchedule(String busLine, Time[] schedule) {
		part.put(busLine, schedule);
	}

	public Time[] getSchedule(String busLine) {
		Object schedule = part.get(busLine);

		if (schedule == null) {
			return new Time[] {Time.newInstance(8, 0, 0, 0), Time.newInstance(17, 0, 0, 0)};
		} else {
			return (Time[]) schedule;
		}
	}
}