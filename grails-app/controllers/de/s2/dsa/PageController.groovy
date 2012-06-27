package de.s2.dsa

import s2dsa.Player;
import s2dsa.Participant
import s2dsa.UnlockedPlayer;

class PageController {

	def welcome() {
		if (session.participant) {
			return redirect(action: "index")
		}
	}
	
    def index() {
		if (!session.participant) {
			return redirect(uri: "/")
		}
		def players = Player.findAll()
		def participant = Participant.get(session.participant.id)
		def topList = Participant.findAll("from Participant as p order by p.unlockedPlayerCount desc, p.lastUpdate asc", [max: 3, offset: 0])
		def activeTab = params.activeTab ? params.activeTab : 'transfer'
		def mockedUnlockedPlayerList = buildMockedUnlockedPlayerList(participant.unlockedPlayers)
		def uwin = checkUwin(participant, participant.unlockedPlayers.size(), players.size(), topList)
		def ulose = checkUlose(participant, participant.unlockedPlayers.size(), players.size(), topList)
		[
			participant: participant,
			unlockedPlayerList: mockedUnlockedPlayerList,
			unlockedPlayerCount: participant.unlockedPlayers.size(),
			playerCount: players.size(),
			topList: topList,
			activeTab: activeTab,
			uwin: uwin,
			ulose : ulose
		]
	}
	
	def checkUwin (participant, playerCount, unlockedPlayerCount, topList) {
		unlockedPlayerCount == playerCount && participant == topList.get(0)
	}
	
	def checkUlose (participant, playerCount, unlockedPlayerCount, topList) {
		unlockedPlayerCount == playerCount && participant != topList.get(0)
	}
	
	def buildMockedUnlockedPlayerList(unlockedPlayerList) {
		def mock = []
		if (unlockedPlayerList.size() > 0) {
			while (mock.size() < 4) {
				unlockedPlayerList.each {
					mock.add(it);
				}
			}
		}
		mock;
	}
	
	def unlock() {
		if (session.participant) {
			def player = Player.findBySecret(params.secret);
			def part = Participant.get(session.participant.id)
			if (player) {
				for (UnlockedPlayer unlockedPlayer : part.unlockedPlayers) {
					if (unlockedPlayer.player == player) {
						flash.message = "Diesen Spieler hast du schon"
						return redirect(action: "index")
					}
				}
				part.addToUnlockedPlayers(new UnlockedPlayer(unlockedBy: session.participant, player: player))
				part.setUnlockedPlayerCount(part.getUnlockedPlayerCount()+1)
				part.setLastUpdate(new Date())
				if (part.save()) {
					flash.message = "Spieler erfolgreich freigeschaltet"
					return redirect(action: "index", params: [activeTab: 'players'])
				} else {
					flash.message = session.participant.errors
				}
			} else {
				flash.message = "Kein Spieler mit diesem Codewort gefunden"
			}
		} else {
		flash.message = "Melden Sie sich erstmal an..."
		}
		redirect(action: "index")
	}
	
}
