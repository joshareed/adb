package org.andrill.adb

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

@Secured(['ROLE_USER','ROLE_ADMIN'])
class HomeController {

    def index = { 
		if (SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')) {
			render view: 'admin'
		} else {
			render view: 'user'
		}
	}
}
