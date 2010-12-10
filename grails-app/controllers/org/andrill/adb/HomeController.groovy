package org.andrill.adb

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

@Secured(['ROLE_USER','ROLE_ADMIN'])
class HomeController {
	static allowedMethods = [update: "POST"]

	def springSecurityService

	def index = {
		if (SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')) {
			render view: 'admin'
		} else {
			render view: 'user'
		}
	}

	def profile = {
		def userInstance = User.get(springSecurityService.principal.id)
		return [userInstance: userInstance]
	}

	def update = {
		def principal = springSecurityService.principal
		if ((params.id as Long) != (principal.id as Long)) {
			// should never happen unless someone tampers with the form
			flash.message = "You must be logged in as ${User.get(params.id).username} to edit their profile"
			redirect(uri: "/home")
		}

		// get our user
		def userInstance = User.get(principal.id)

		// check the version to ensure the admin hadn't simultaneously edited the user
		if (params.version) {
			def version = params.version.toLong()
			if (userInstance.version > version) {
				userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this User while you were editing")
				render(view: "profile", model: [userInstance: userInstance])
				return
			}
		}

		// set the new user properties
		userInstance.properties = params

		// handle password change
		boolean passwordMismatch = false
		if (params.newPass1 && params.newPass2) {
			if (params.newPass1 == params.newPass2) {
				userInstance.password = springSecurityService.encodePassword(params.newPass1)
			} else {
				flash.message = "Passwords did not match"
				render(view: "profile", model: [userInstance: userInstance])
			}
		}

		if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
			flash.message = "Your profile has been successfully updated"
			redirect(uri: "/home")
		} else {
			render(view: "profile", model: [userInstance: userInstance])
		}
	}
}
