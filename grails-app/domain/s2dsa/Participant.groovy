package s2dsa

class Participant {
	static hasMany = [unlockedPlayers: UnlockedPlayer]
	
	String username
	String password
	
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
		password blank:false
    }
}
