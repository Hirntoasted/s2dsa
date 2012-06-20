package s2dsa

class LoginTagLib {

	def loginControl = {
		out << render(template: "/shared/loginControl")
	}
}
