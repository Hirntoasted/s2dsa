package s2dsa

import java.util.Date;

class Participant {
	static hasMany = [unlockedPlayers: UnlockedPlayer]
	
	String username
	Integer unlockedPlayerCount
	Date lastUpdate
	
	def hasUnlockedPlayer(Player player) {
		def found = false
		unlockedPlayers.each { unlockedPlayer ->
			if(unlockedPlayer.player == player) {
				found = true
			}
		}
		found
	}
	
    static constraints = {
		username unique: true, blank: false
    }
}
